// Singleton Pattern. Definetly not an anti-pattern.
public with sharing class OpportunityTriggerHandler {
    // Static instance for singleton pattern
    private static OpportunityTriggerHandler instance;

    private OpportunityTriggerHandler() {} 

    public static OpportunityTriggerHandler getInstance() {
        if (instance == null) {
            instance = new OpportunityTriggerHandler();
        }
        return instance;
    }

    public void handleTrigger(
        Map<Id, Opportunity> newMap,
        Map<Id, Opportunity> oldMap,
        System.TriggerOperation operation
    ) {
        Set<Id> accountIds = getRelevantAccountIds(newMap, oldMap, operation);

        if (!accountIds.isEmpty()) {
            Map<Id, Map<String, Decimal>> accountSalesMap = aggregateOpportunityAmounts(accountIds);

            updateAccountSales(accountSalesMap);
        }
    }

    private Set<Id> getRelevantAccountIds(
        Map<Id, Opportunity> newMap,
        Map<Id, Opportunity> oldMap,
        System.TriggerOperation operation
    ) {
        Set<Id> accountIds = new Set<Id>();

        if (operation == System.TriggerOperation.AFTER_INSERT ||
            operation == System.TriggerOperation.AFTER_UNDELETE) {
            for (Opportunity opp : newMap.values()) {
                if (opp.AccountId != null) {
                    accountIds.add(opp.AccountId);
                }
            }
        } else if (operation == System.TriggerOperation.AFTER_UPDATE) {
            for (Id oppId : newMap.keySet()) {
                Opportunity newOpp = newMap.get(oppId);
                Opportunity oldOpp = oldMap.get(oppId);

                if (newOpp.AccountId != null) {
                    accountIds.add(newOpp.AccountId);
                }
                if (oldOpp.AccountId != null) {
                    accountIds.add(oldOpp.AccountId);
                }
            }
        } else if (operation == System.TriggerOperation.AFTER_DELETE) {
            for (Opportunity opp : oldMap.values()) {
                if (opp.AccountId != null) {
                    accountIds.add(opp.AccountId);
                }
            }
        }

        return accountIds;
    }

    private Map<Id, Map<String, Decimal>> aggregateOpportunityAmounts(Set<Id> accountIds) {
        Map<Id, Map<String, Decimal>> accountSalesMap = new Map<Id, Map<String, Decimal>>();

        for (Id accountId : accountIds) {
            accountSalesMap.put(accountId, new Map<String, Decimal>{
                'Standard' => 0,
                'Recycled' => 0
            });
        }

        List<AggregateResult> aggResults = [
            SELECT AccountId, VRP_WoodType__c, SUM(Amount) totalAmount
            FROM Opportunity
            WHERE AccountId IN :accountIds
            AND IsWon = TRUE
            AND VRP_WoodType__c IN ('Standard', 'Recycled')
            GROUP BY AccountId, VRP_WoodType__c
        ];

        for (AggregateResult ar : aggResults) {
            Id accountId = (Id) ar.get('AccountId');
            String woodType = (String) ar.get('VRP_WoodType__c');
            Decimal totalAmount = (Decimal) ar.get('totalAmount');

            if (accountSalesMap.containsKey(accountId)) {
                Map<String, Decimal> woodTypeMap = accountSalesMap.get(accountId);
                woodTypeMap.put(woodType, totalAmount);
            }
        }

        return accountSalesMap;
    }

    private void updateAccountSales(Map<Id, Map<String, Decimal>> accountSalesMap) {
        List<Account> accountsToUpdate = new List<Account>();

        for (Id accountId : accountSalesMap.keySet()) {
            Map<String, Decimal> woodTypeMap = accountSalesMap.get(accountId);
            Account acc = new Account(
                Id = accountId,
                VRP_TotalSalesStandardWood__c = woodTypeMap.get('Standard'),
                VRP_TotalSalesRecycledWood__c = woodTypeMap.get('Recycled')
            );
            accountsToUpdate.add(acc);
        }

        if (!accountsToUpdate.isEmpty()) {
            try {
                update accountsToUpdate;
            } catch (DmlException e) {
                System.debug('Error updating accounts: ' + e.getMessage());
            }
        }
    }
}

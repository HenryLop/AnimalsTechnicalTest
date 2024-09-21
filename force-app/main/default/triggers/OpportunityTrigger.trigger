trigger OpportunityTrigger on Opportunity (
    after insert, after update, after delete, after undelete
) {
    if (Trigger.isAfter) {
        OpportunityTriggerHandler.getInstance().handleTrigger(
            Trigger.newMap, Trigger.oldMap, Trigger.operationType
        );
    }
}

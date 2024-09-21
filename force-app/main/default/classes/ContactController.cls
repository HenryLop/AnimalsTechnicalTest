public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(Id accountId) {
        if (accountId == null) {
            return new List<Contact>();
        }
        return [
            SELECT Id, Name, Email, Phone
            FROM Contact
            WHERE AccountId = :accountId
            ORDER BY Name
            LIMIT 100
        ];
    }
}

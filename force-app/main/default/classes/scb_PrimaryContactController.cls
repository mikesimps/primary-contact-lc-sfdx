public class scb_PrimaryContactController {
    @AuraEnabled
    public static List<ContactWrapper> getContactWrappers(Id recordId, String role) {
        List<Contact> contacts = [SELECT Id, Name, Email, Phone, (SELECT Roles From AccountContactRelations), Account.Name 
                                   FROM Contact WHERE Id IN (SELECT ContactId From AccountContactRelation
															WHERE Roles INCLUDES (:role) AND AccountId = :recordId) ];
        List<ContactWrapper> cws = new List<ContactWrapper>();
        for(Contact c: contacts) {
            cws.add(new ContactWrapper(c));
        }

        return cws;
    }
    
    public class ContactWrapper {
        @AuraEnabled public Contact contactRecord; // not used, but allows for further information to be used if needed
        @AuraEnabled public Id cid;
        @AuraEnabled public String contactName;
        @AuraEnabled public String contactEmail;
        @AuraEnabled public String contactPhone;
        @AuraEnabled public String accountName; 
        @AuraEnabled public String roles;

        public ContactWrapper(Contact c) {
            this.contactRecord = c;
            this.cid = c.id;
            this.contactName = c.name;
            this.contactEmail = c.email;
            this.contactPhone = c.phone;
            this.accountName = c.Account.Name;
            this.roles = c.AccountContactRelations[0].Roles;
        }
    }

}
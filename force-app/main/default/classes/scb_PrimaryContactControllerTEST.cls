@isTest
public class scb_PrimaryContactControllerTEST {

    public static void createTestData(){
        Account a = new Account(name='Test Account');
        insert a;
        
        Contact c1 = new Contact();
        c1.accountId = a.id;
        c1.firstName = 'First';
        c1.lastName = 'Lasty';
        c1.email = 'lasty1@salesforce.com';
        c1.phone = '1234567890';
        insert c1;

        Contact c2 = new Contact();
        c2.accountId = a.id;
        c2.firstName = 'Second';
        c2.lastName = 'Lasty';
        c2.email = 'lasty2@salesforce.com';
        c2.phone = '9234567891';
        insert c2;
        
        List<AccountContactRelation> acrs = [SELECT contactId, accountId, roles FROM AccountContactRelation];
        acrs[0].roles = 'Decision Maker;Influencer';
        acrs[1].roles = 'Influencer';
        update acrs;
    }
    
    @isTest
    public static void testGetContactWrappers(){
        createTestData();
        
        Account a = [SELECT id FROM Account LIMIT 1];
		List<scb_PrimaryContactController.ContactWrapper> cw = scb_PrimaryContactController.getContactWrappers(a.id,'Decision Maker');
        
        system.assert(cw.size() == 1);
        
        //Test all assignments worked correctly
        system.assert(cw[0].contactRecord != null);
        system.assert(!String.ISBLANK(cw[0].cid));
        system.assert(!String.ISBLANK(cw[0].contactName));
        system.assert(!String.ISBLANK(cw[0].contactEmail));
        system.assert(!String.ISBLANK(cw[0].contactPhone));
        system.assert(!String.ISBLANK(cw[0].accountName));
        system.assert(!String.ISBLANK(cw[0].roles));
        
        cw = scb_PrimaryContactController.getContactWrappers(a.id,'Influencer');
        system.assert(cw.size() == 2);
        
    }
}
public with sharing class MyApexclass {
    @InvocableMethod
    public static void MyApexclass(List <contact> cnt){
        List<Account> acclist=new List<Account>();
        List<id> accids=new List<id>();
        for(Contact con:cnt){
        if(con.AccountId!= null){
        accids.add(con.AccountId);
        }
        List<Account>contac=[select name,(select name from contacts where Status__c=true)from account where id in :accids];
        for(Account acc :contac){
        acc.Number_of_active_contacts__c=acc.Contac.size();
        acclist.add(acc); 
        }
        update acclist;
        }
    }
   }
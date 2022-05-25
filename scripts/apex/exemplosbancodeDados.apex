AccountSOQL accountSOQL = new AccountSOQL();
accountSOQL.findAccountByBillingCountry('');



AccountRepository repository = new AccountRepository();

List<Account> accountsByCountry = repository.findByCountry('USA');
System.Debug(JSON.serialize(accountsByCountry));

List<Account> accountsWithContact = repository.findByContactByName('United Oil & Gas');
System.Debug(JSON.serialize(accountsWithContact));

List<Account> accountsById = repository.findById('123');
System.debug(JSON.serialize(accountsById));
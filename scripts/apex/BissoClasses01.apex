/*
Uma vez trocado para abstract não tem mais como instanciar um Employee
Employee employee = new Employee ();
employee.name = 'John';
employee.code = 'na1234';
employee.salary = 10000;
employee.show ();
System.debug( employee.getBonus () );
*/

BonusSummarizer summarizer = new BonusSummarizer ();

FinancialAnalyst financialAnalyst = new FinancialAnalyst ();
financialAnalyst.name = 'Amanda';  
financialAnalyst.code = 'za30993';
financialAnalyst.salary = 15000;
financialAnalyst.financialTool = 'Excel';
financialAnalyst.show();
System.debug( 'financialAnalyst ' + financialAnalyst.getBonus () );

summarizer.addBonus(financialAnalyst);

Advisor advisor = new Advisor ();
advisor.name = 'Amanda';
advisor.code = 'za30993';
advisor.salary = 12000;
advisor.customers = new List<Customer> ();
advisor.show();
System.debug( 'advisor ' + advisor.getBonus () );

summarizer.addBonus(advisor);

Authenticator authenticator = new Authenticator ('userName', 'pass@123');
authenticator.authenticate(advisor);


Customer customer = new Customer();
customer.name = 'John';

Authenticator authenticatorCustomer = new Authenticator ('userCustomer', 'pass@1234');
authenticatorCustomer.authenticate(customer);


VicePresidentLATAM vpLatam = new VicePresidentLATAM ();
vpLatam.name = 'Juan';
vpLatam.code = 'za5556667';
vpLatam.salary = 120000;
vpLatam.show();
System.debug( 'VicePresidentLATAM ' + vpLatam.getBonus () );

summarizer.addBonus(vpLatam);

summarizer.showBonus();
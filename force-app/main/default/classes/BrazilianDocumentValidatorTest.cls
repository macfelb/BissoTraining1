/**
 * @author: ercarval - topi
 */
@isTest
private class BrazilianDocumentValidatorTest {

    @isTest
    static void shouldValidateCnpj() {

        String cnpj = '93320424000114';

        System.assert(new BrazilianDocumentValidator().isCnpj (cnpj));

    }

    @isTest
    static void shouldValidateCpf() {

        String cpf = '22976056099';

        System.assert(new BrazilianDocumentValidator().isCpf (cpf), 'Should be a valid brazilian cpf number');

    }


    @isTest                     
    public static void testNaoAceitarNumerosIguais () {

        BrazilianDocumentValidator validator = new BrazilianDocumentValidator();
        
        String cpf = '00000000000';
                
        for (Integer i = 1; i < 10; i++) {
                                    
            Boolean result = validator.isCpf(cpf.replace('0', i + ''));
            
            System.assertEquals ( false , result  );
        }     

    }

}
public  class ApexWriteText {
    
    String variableText = 'Texto 01';

    public ApexWriteText() {

        System.debug('class ' + variableText);

    }

    public String getText (String valueText) {
    
        String variableText = 'Texto 02';
        
        System.debug('method 1 ' + this.variableText);
        System.debug('method 2 ' + variableText);
    
        return valueText;
    
    }

}
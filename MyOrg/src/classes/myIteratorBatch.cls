global class myIteratorBatch implements Database.Batchable<String>{


    global iterable<String> start(Database.BatchableContext BC){
    
        return new List<String> { 'Do something', 'Do something else', 'And something more' };
    }
    
    
    global void execute(Database.BatchableContext BC,List<String> Strings){
    
        System.debug(Strings);
    }
    
    global void finish(Database.BatchableContext info){
    
    }


}
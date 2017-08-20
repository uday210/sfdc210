global class DatasyncAdapter extends DataSource.Connection{


    Override global List<DataSource.Table> sync(){
    
    List<DataSource.Column> externalDataColumns = new List<DataSource.Column>();
     externalDataColumns.add(DataSource.Column.text('ExternalId', 255));
     externalDataColumns.add(DataSource.Column.url('DisplayUrl'));
     externalDataColumns.add(DataSource.Column.text('color', 255));
     externalDataColumns.add(DataSource.Column.text('value', 255));
     
     List<DataSource.Table> tables = new List<DataSource.Table>();
    
    tables.add(DataSource.Table.get('External Data', 'Name', externalDataColumns));

    return tables;
    
    }
    
    
    override global DataSource.TableResult query(DataSource.QueryContext queryContext) {
        List<Map<String, Object>> extData = DataSource.QueryUtils.process(queryContext, getOrgextData());
        DataSource.TableResult tableResult = DataSource.TableResult.get(queryContext, extData);
        return tableResult;
    }
    
    override global List<DataSource.TableResult> search(DataSource.SearchContext searchContext) {
        return DataSource.SearchUtils.searchByName(searchContext, this);
    }
    
    public List<Map<String, Object>> getOrgextData(){
    
        Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        String url = system.label.ExternalDataUrl;
        request.setEndPoint(url);
        request.setMethod('GET');
        HttpResponse response = httpProtocol.send(request);
        
        List<Map<String, Object>> repos = new List<Map<String, Object>>();
        
        for (Object item : (List<Object>)JSON.deserializeUntyped(response.getBody())) {
            Map<String, Object> repo = (Map<String, Object>)item;
            repo.put('ExternalId', repo.get('ExternalId'));
            repo.put('DisplayUrl', repo.get('DisplayUrl'));
            repo.put('value', repo.get('value'));
            repo.put('color', repo.get('color'));
            repos.add(repo);
        }
        
        return repos;
    
    
    }
}
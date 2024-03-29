TrimRequest request = new TrimRequest();

ObjectStringSearchSelect stringSearch = new ObjectStringSearchSelect();
stringSearch.TrimObjectType = "location";
stringSearch.Search = "me";

request.Items = new Operation[] { stringSearch, new Fetch() };

Engine engine = new Engine();
engine.UseDefaultCredentials = true;

TrimResponse response = engine.Execute(request);

foreach (Result res in response.Items)
{
    switch (res.GetType().Name)
    {
        case "FetchResult":
            FetchResult fetchResult = res as FetchResult;
            if (fetchResult.Objects.Length > 0)
            {
                Console.WriteLine(fetchResult.Objects.First().Uri);
            }
            break;
        case "ErrorResult":
            ErrorResult errorResult = res as ErrorResult;
            Console.WriteLine(errorResult.Message);
            break;
        }
}
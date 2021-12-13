How are our users moving through the product funnel?

> I built a [fact_funnel_conversion](https://github.com/m2willi/course-dbt-mikew/blob/main/dbt-greenery/models/greenery/marts/product/fact_page_views/fact_funnel_conversion.sql) -  to calculate



|total_session | tot_lvl_1     | tot_lvl_2    | tot_lvl_3     |conv_lvl_1.   |conv_lvl_2.    |conv_lvl_3.    |
|------------- | ------------- |------------- | ------------- |------------- | ------------- | ------------- |
|1108          |       696     |       653    |       400     | 62.81588447  | 58.9350180505 | 36.10108303249|

Which steps in the funnel have largest drop off points?

> Session --> Page view has the largest drop off and add to cart --> checkout is the second biggest drop


Self review questions:

2A. dbt next steps for you 
Reflecting on your learning in this class...

If you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?

> This class has made dbt approachable and fun. I plan to continue learning using the dbt online materials and look for an opportunity using the modern data stack.

2B. Setting up for production / scheduled dbt run of your project And finally, before you fly free into the dbt night, we will take a step back and reflect: 
after learning about the various options for dbt deployment and seeing your final dbt project, 
how would you go about setting up a production/scheduled dbt run of your project in an ideal state? 

> I would want an orchestration tool that allows full integration with the ingestion of data and the usage downstream so if I were replicating with fivetran something that had the ability to invoke, monitor, and then trigger dbt process once the data is loaded and then something that could trigger or raise an event for downstream dashboards/other tools to consume data once it had been transformed.
>
> There would be full documentation on tables, column, sample sql, how to request access, point of contact so that consumers of the data would not only 
> see how the data was moving through the system but also would have a head start on using the data.
 
![dbt-dag](https://user-images.githubusercontent.com/7491379/145736386-ef030b30-bbcc-4cd2-91fc-393d278b95d8.png)



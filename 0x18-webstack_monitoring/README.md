## Monitoring

### Datadog

Head to https://www.datadoghq.com/ and sign up for a free Datadog account. When signing up, you’ll have the option of selecting statistics from your current stack that Datadog can monitor for you. Once you have an account set up, follow the instructions given on the website to install the Datadog agent.


* Sign up for Datadog - Please make sure you are using the US website of Datagog (.com)
* Install datadog-agent on web-01
* Create an application key ( Integrations => APIs)
* Copy-paste in your Intranet user profile (here) your DataDog API key and your DataDog application key.
* Your server web-01 should be visible in Datadog under the host name XX-web-01
  * You can validate it by using this API
  
  ```
  # Curl command
  curl -X GET "https://api.datadoghq.com/api/v1/hosts" \
  -H "Content-Type: application/json" \
  -H "DD-API-KEY: ${DD_API_KEY}" \
  -H "DD-APPLICATION-KEY: ${DD_APP_KEY}"
  ```
  * If needed, you will need to update the hostname of your server
      * To change the hostname, go to the config file datadog.yaml (https://docs.datadoghq.com/fr/agent/guide/agent-configuration-files/?tab=agentsv6etv7)
      * Set the hostname to XX-web-01
  
  * GET Dashboard API
  ```
  # Curl command
  curl -X GET "https://api.datadoghq.com/api/v1/dashboard" \
  -H "Content-Type: application/json" \
  -H "DD-API-KEY: ${DD_API_KEY}" \
  -H "DD-APPLICATION-KEY: ${DD_APP_KEY}"
  ```
  
  
### Ressources

https://docs.datadoghq.com/fr/api/latest/hosts/

https://docs.datadoghq.com/metrics/




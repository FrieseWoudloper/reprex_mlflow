Reproducible example for my problem with MLflow Projects

Omgevingsvariabele met URI

mlflow run . -b databricks --backend-config cluster-spec.json --experiment-id 3869152022501207

Parameters worden wel gelogd

Foutmelding

Traceback (most recent call last):
  File "/databricks/python3/bin/mlflow", line 8, in <module>
    sys.exit(cli())
  File "/databricks/python3/lib/python3.7/site-packages/click/core.py", line 1137, in __call__
    return self.main(*args, **kwargs)
  File "/databricks/python3/lib/python3.7/site-packages/click/core.py", line 1062, in main
    rv = self.invoke(ctx)
  File "/databricks/python3/lib/python3.7/site-packages/click/core.py", line 1668, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
  File "/databricks/python3/lib/python3.7/site-packages/click/core.py", line 1404, in invoke
    return ctx.invoke(self.callback, **ctx.params)
  File "/databricks/python3/lib/python3.7/site-packages/click/core.py", line 763, in invoke
    return __callback(*args, **kwargs)
  File "/databricks/python3/lib/python3.7/site-packages/mlflow/cli.py", line 181, in run
    run_id=run_id,
  File "/databricks/python3/lib/python3.7/site-packages/mlflow/projects/__init__.py", line 304, in run
    synchronous=synchronous,
  File "/databricks/python3/lib/python3.7/site-packages/mlflow/projects/__init__.py", line 99, in _run
    experiment_id,
  File "/databricks/python3/lib/python3.7/site-packages/mlflow/projects/backend/local.py", line 52, in run
    run_id, project_uri, experiment_id, work_dir, version, entry_point, params
  File "/databricks/python3/lib/python3.7/site-packages/mlflow/projects/utils.py", line 219, in get_or_create_run
    return tracking.MlflowClient().get_run(run_id)
  File "/databricks/python3/lib/python3.7/site-packages/mlflow/tracking/client.py", line 151, in get_run
    return self._tracking_client.get_run(run_id)
  File "/databricks/python3/lib/python3.7/site-packages/mlflow/tracking/_tracking_service/client.py", line 54, in get_run
    return self.store.get_run(run_id)
  File "/databricks/python3/lib/python3.7/site-packages/mlflow/store/tracking/rest_store.py", line 117, in get_run
    response_proto = self._call_endpoint(GetRun, req_body)
  File "/databricks/python3/lib/python3.7/site-packages/mlflow/store/tracking/rest_store.py", line 55, in _call_endpoint
    return call_endpoint(self.get_host_creds(), endpoint, method, json_body, response_proto)
  File "/databricks/python3/lib/python3.7/site-packages/mlflow/utils/rest_utils.py", line 170, in call_endpoint
    response = verify_rest_response(response, endpoint)
  File "/databricks/python3/lib/python3.7/site-packages/mlflow/utils/rest_utils.py", line 128, in verify_rest_response
    raise MlflowException("%s. Response body: '%s'" % (base_msg, response.text))
mlflow.exceptions.MlflowException: API request to endpoint /api/2.0/mlflow/runs/get failed with error code 401 != 200. Response body: '<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<title>Error 401 Unauthorized</title>
</head>
<body><h2>HTTP ERROR 401</h2>
<p>Problem accessing /api/2.0/mlflow/runs/get. Reason:
<pre>    Unauthorized</pre></p>
</body>
</html>
'

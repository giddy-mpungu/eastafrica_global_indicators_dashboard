library(shidashi)

# Render this project
shidashi::template_settings$set(root_path = 'D:\02 MSc CS\Data Visualisation and Analytics\global_indicators_dashboard\dash')

# Render project
shidashi::render(host = '127.0.0.1', port = 8310L)

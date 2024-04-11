dynamic_routes <- list(
  route(path = "/economy", ui = economy_ui),
  route(path = "/faqs", ui = faqs_ui)
)

router_ui(
  default = route(path = "/",ui = about_ui),
  page_404 = page404(page = page404_ui),
  !!!dynamic_routes
)

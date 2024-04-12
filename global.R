
#-------------------------------------------------------------------------------
#loading packages
library(shiny)
library(shiny.router)
library(htmltools)
library(dplyr)
library(shinydashboard)
library(highcharter)
library(shinycssloaders)
library(data.table)
library(shinyWidgets)
library(stringr)
library(sf)
library(leafem)
library(leaflet)
library(shinyjs)

#-------------------------------------------------------------------------------
# Function to create content page using the styled template
page <- function(ui_object_path, page_title = "Uganda's Global Indictors Profile"){
  tags$div(
    tags$html(
      lang = "en",
      tags$head(
        tags$meta(
          name = "viewport",
          content = "width=device-width, initial-scale=1"
        ),
        tags$title(
          paste0("Uganda's Global Indictors-",page_title)
        ),
        tags$meta(
          name = "description",
          content = "Uganda's Global Indictors Profile"
        ),
        tags$meta(
          name = "author",
          content = "Africano BYAMUGISHA"
        ),
        tags$meta(
          property = "og:title",
          content = "Uganda's Global Indictors Profile"
        ),
        tags$meta(
          property = "og:description",
          content = "Uganda's Global Indictors Profile"
        ),
        tags$meta(
          property = "og:type",
          content = "Website"
        ),
        tags$meta(
          property = "og:site_name",
          content = "Uganda's Global Indictors Profile"
        ),
        tags$link(
          rel = "shortcut icon",
          href = "assets/images/favicon.png"
        ),
        tags$link(
          rel = "stylesheet",
          href = "assets/fonts/bootstrap/bootstrap-icons.css"
        ),
        tags$link(
          rel = "stylesheet",
          href = "assets/css/main.min.css"
        ),
        tags$link(
          rel = "stylesheet",
          href = "assets/vendor/overlay-scroll/OverlayScrollbars.min.css"
        )
      ),
      tags$body(
        tags$div(
          class = "page-wrapper",
          tags$div(
            class = "main-container",
            tags$nav(
              id = "sidebar",
              class = "sidebar-wrapper",
              tags$div(
                class = "app-brand p-3 mb-3",
                tags$a(
                  href = "/",
                  tags$img(
                    src = "assets/images/logo.png",
                    class = "logo",
                    alt = ""
                  )
                )
              ),
              tags$div(
                class = "sidebarMenuScroll",
                tags$ul(
                  class = "sidebar-menu",
                  tags$li(
                    # class = "active current-page",
                    tags$a(
                      href = "/",
                      tags$i(
                        class = "bi bi-pie-chart"
                      ),
                      tags$span(
                        class = "menu-text",
                        "About"
                      )
                    )
                  ),
                  tags$li(
                    tags$a(
                      href = route_link("comparison"),
                      tags$i(
                        class = "bi bi-bar-chart-line"
                      ),
                      tags$span(
                        class = "menu-text",
                        "Comparison"
                      )
                    )
                  ),
                  tags$li(
                    tags$a(
                      href = route_link("economy"),
                      tags$i(
                        class = "bi bi-globe"
                      ),
                      tags$span(
                        class = "menu-text",
                        "Economy"
                      )
                    )
                  ),
                  tags$li(
                    tags$a(
                      href = route_link("education"),
                      tags$i(
                        class = "bi bi-shop-window"
                      ),
                      tags$span(
                        class = "menu-text",
                        "Education"
                      )
                    )
                  ),
                  tags$li(
                    tags$a(
                      href = route_link("health"),
                      tags$i(
                        class = "bi bi-terminal-split"
                      ),
                      tags$span(
                        class = "menu-text",
                        "Health"
                      )
                    )
                  ),
                  tags$li(
                    tags$a(
                      href = route_link("population"),
                      tags$i(
                        class = "bi bi-patch-check"
                      ),
                      tags$span(
                        class = "menu-text",
                        "Population"
                      )
                    )
                  ),
                  tags$li(
                    tags$a(
                      href = route_link("energy"),
                      tags$i(
                        class = "bi bi-send"
                      ),
                      tags$span(
                        class = "menu-text",
                        "Energy"
                      )
                    )
                  ),
                  tags$li(
                    tags$a(
                      href = route_link("infrastructure"),
                      tags$i(
                        class = "bi bi-mouse3"
                      ),
                      tags$span(
                        class = "menu-text",
                        "Infrastructure"
                      )
                    )
                  ),
                  tags$li(
                    tags$a(
                      href = route_link("environment"),
                      tags$i(
                        class = "bi bi-clipboard-check"
                      ),
                      tags$span(
                        class = "menu-text",
                        "Environment"
                      )
                    )
                  ),
                  tags$li(
                    tags$a(
                      href = route_link("faqs"),
                      tags$i(
                        class = "bi bi-chat"
                      ),
                      tags$span(
                        class = "menu-text",
                        "Faq's"
                      )
                    )
                  )
                )
              )
            ),
            tags$div(
              class = "app-container",
              tags$div(
                class = "app-header d-flex align-items-center",
                tags$div(
                  class = "d-flex",
                  tags$button(
                    class = "pin-sidebar",
                    tags$i(
                      class = "bi bi-list lh-1"
                    )
                  )
                ),
                tags$div(
                  class = "app-brand-sm d-lg-none d-flex",
                  tags$a(
                    href = "/",
                    tags$img(
                      src = "assets/images/logo.png",
                      class = "logo",
                      alt = ""
                    )
                  )
                ),
                tags$div(
                  class = "search-container d-lg-block d-none mx-3",
                  tags$input(
                    type = "text",
                    class = "form-control",
                    placeholder = "Search"
                  ),
                  tags$i(
                    class = "bi bi-search"
                  )
                ),
                tags$div(
                  class = "header-actions",
                  tags$div(
                    class = "d-sm-flex d-none gap-3",
                    tags$div(
                      class = "dropdown",
                      tags$a(
                        class = "dropdown-toggle action-icon",
                        href = "#!",
                        role = "button",
                        `data-bs-toggle` = "dropdown",
                        `aria-expanded` = "false",
                        tags$i(
                          class = "bi bi-receipt lh-1"
                        ),
                        tags$span(
                          class = "count-label",
                          "2"
                        )
                      ),
                      tags$div(
                        class = "dropdown-menu dropdown-menu-end dropdown-300",
                        tags$h5(
                          class = "fw-semibold px-3 py-2 text-primary",
                          "Information"
                        ),
                        tags$div(
                          class = "scroll250",
                          tags$div(
                            class = "dropdown-item",
                            tags$div(
                              class = "d-flex align-items-center py-2",
                              tags$img(
                                src = "assets/images/significance-icon.png",
                                class = "img-3x me-3 rounded-5",
                                alt = "Admin Theme"
                              ),
                              tags$div(
                                class = "m-0",
                                tags$h4(
                                  class = "mb-2 text-primary",
                                  "5%"
                                ),
                                tags$h6(
                                  class = "mb-1 fw-semibold",
                                  "Level of Significance"
                                ),
                                tags$p(
                                  class = "m-0 text-secondary",
                                  tags$span(
                                    class = "badge bg-info ms-2",
                                    "used across"
                                  )
                                )
                              )
                            )
                          ),
                          tags$div(
                            class = "dropdown-item",
                            tags$div(
                              class = "d-flex align-items-center py-2",
                              tags$img(
                                src = "assets/images/data-source-icon.jpg",
                                class = "img-3x me-3 rounded-5",
                                alt = "Admin Theme"
                              ),
                              tags$div(
                                class = "m-0",
                                tags$h4(
                                  class = "mb-2 text-primary",
                                  "Primary Data"
                                ),
                                tags$h6(
                                  class = "mb-1 fw-semibold",
                                  "https://www.gapminder.org/"
                                ),
                                tags$p(
                                  class = "m-0 text-secondary",
                                  tags$span(
                                    class = "badge bg-info ms-2",
                                    "source"
                                  )
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                  ),
                  
                  tags$div(
                    class = "d-flex",
                    tags$button(
                      class = "toggle-sidebar",
                      tags$i(
                        class = "bi bi-list lh-1"
                      )
                    )
                  )
                )
              ),
              tags$div(
                class = "app-hero-header d-flex align-items-center",
                tags$div(
                  class = "d-flex align-items-center",
                  tags$div(
                    class = "me-3 icon-box md bg-white rounded-4",
                    tags$i(
                      class = "bi bi-layout-sidebar fs-3 text-primary"
                    )
                  ),
                  tags$div(
                    tags$h2(
                      class = "m-0",
                      paste0(page_title)
                    )
                  )
                )
              ),
              tags$div(
                class = "app-body",
                # ---------------------- main dashboard body -------------------
                source(ui_object_path)$value
                # ---------------------------------------------------------------
              )
            )
          )
        ),
        tags$script(src = "https://cdn.jsdelivr.net/npm/shiny@1.6.0/dist/shiny.min.js"),
        tags$script(
          src = "assets/js/jquery.min.js"
        ),
        tags$script(
          src = "assets/js/bootstrap.bundle.min.js"
        ),
        tags$script(
          src = "assets/js/moment.min.js"
        ),
        tags$script(
          src = "assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"
        ),
        tags$script(
          src = "assets/vendor/overlay-scroll/custom-scrollbar.js"
        ),
        tags$script(
          src = "assets/js/custom.js"
        )
      )
    )
  )
}

#-------------------------------------------------------------------------------
# Create the page objects
about_ui = page("ui_scripts/about_ui.R", "Uganda's Global Indictors Profile")
page404_ui <- page("ui_scripts/404_ui.R","Content not found")
faqs_ui <- page("ui_scripts/faqs.R","Frequently Asked Questsion")
economy_ui <- page("ui_scripts/economy_ui.R","Economic Indicators")
health_ui <- page("ui_scripts/health_ui.R","Health Indicators")
environment_ui <- page("ui_scripts/environment_ui.R","Environment Indicators")

#-------------------------------------------------------------------------------
# Data Loading and Pre processing
# source()


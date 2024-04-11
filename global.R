
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

#-------------------------------------------------------------------------------
# Function to create content page using the styled template
page <- function(ui_object_path, page_title1 = "",page_title2 = ""){
  tags$div(
    tags$html(
      lang = "en",
      tags$head(
        tags$meta(
          name = "viewport",
          content = "width=device-width, initial-scale=1.0"
        ),
        tags$title(
          paste0(page_title1)
        ),
        tags$meta(
          name = "description",
          content = "Uganda's Global Indicators Profile"
        ),
        tags$meta(
          name = "author",
          content = "Africano Byamugisha"
        ),
        tags$meta(
          property = "og:title",
          content = "Uganda's Global Indicators Profile"
        ),
        tags$link(
          rel = "shortcut icon",
          href = "/images/logo.png"
        ),
        tags$script(
          src = "www/shared/jquery.js",
          type = "text/javascript"
        ),
        tags$script(src = "https://cdn.jsdelivr.net/npm/shiny@1.6.0/dist/shiny.min.js"),
        tags$link(
          rel = "stylesheet",
          href = "/fonts/bootstrap/bootstrap-icons.css"
        ),
        tags$link(
          rel = "stylesheet",
          href = "/css/main.min.css"
        ),
        tags$link(
          rel = "stylesheet",
          href = "/vendor/overlay-scroll/OverlayScrollbars.min.css"
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
                id = "appBrand",
                tags$a(
                  href = "#",
                  tags$img(
                    src = "/images/logo.png",
                    class = "logo",
                    alt = "Logo"
                  )
                )
              ),
              tags$div(
                class = "sidebarMenuScroll os-host os-theme-dark os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-scrollbar-vertical-hidden os-host-transition",
                tags$div(
                  class = "os-resize-observer-host observed",
                  tags$div(
                    class = "os-resize-observer",
                    style = "left: 0px; right: auto;"
                  )
                ),
                tags$div(
                  class = "os-size-auto-observer observed",
                  style = "height: calc(100% + 1px); float: left;",
                  tags$div(
                    class = "os-resize-observer"
                  )
                ),
                tags$div(
                  class = "os-content-glue",
                  style = "margin: 0px; width: 249px; height: 508px;"
                ),
                tags$div(
                  class = "os-padding",
                  tags$div(
                    class = "os-viewport os-viewport-native-scrollbars-invisible",
                    tags$div(
                      class = "os-content",
                      style = "padding: 0px; height: 100%; width: 100%;",
                      tags$ul(
                        class = "sidebar-menu",
                        tags$li(
                          class = "active current-page",
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
                              class = "bi bi-terminal-split"
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
                              class = "bi bi-bar-chart-line"
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
                              class = "bi bi-book"
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
                              class = "bi bi-shop-window"
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
                              class = "bi bi-border-all"
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
                              "Infrastructre"
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
                              class = "bi bi-question"
                            ),
                            tags$span(
                              class = "menu-text",
                              "FAQ's"
                            )
                          )
                        )
                      )
                    )
                  )
                ),
                tags$div(
                  class = "os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden",
                  tags$div(
                    class = "os-scrollbar-track os-scrollbar-track-off",
                    tags$div(
                      class = "os-scrollbar-handle",
                      style = "width: 100%; transform: translate(0px, 0px);"
                    )
                  )
                ),
                tags$div(
                  class = "os-scrollbar os-scrollbar-vertical os-scrollbar-unusable os-scrollbar-auto-hidden",
                  tags$div(
                    class = "os-scrollbar-track os-scrollbar-track-off",
                    tags$div(
                      class = "os-scrollbar-handle",
                      style = "height: 100%; transform: translate(0px, 0px);"
                    )
                  )
                ),
                tags$div(
                  class = "os-scrollbar-corner"
                )
              )
            ),
            
            # ------------ App container starts --------------------------------------
            tags$div(
              class = "app-container",
              
              # ---- header
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
                      src = "/images/logo.png",
                      class = "logo",
                      alt = "logo"
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
                          class = "bi bi-exclamation-triangle lh-1"
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
                            class = "alert alert-danger mx-3 my-2 p-2",
                            tags$p(
                              class = "mb-1",
                              "All Statistics on"
                            ),
                            tags$p(
                              class = "small m-0 text-black",
                              "5% Significance Level"
                            )
                          ),
                          tags$div(
                            class = "alert alert-success mx-3 my-2 p-2",
                            tags$p(
                              class = "mb-1",
                              "Data Source"
                            ),
                            tags$p(
                              class = "small m-0 text-black",
                              "https://gapminder.org"
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
              
              # --- section title
              
              tags$div(
                class = "app-hero-header d-flex align-items-center",
                tags$div(
                  class = "d-flex align-items-center",
                  tags$div(
                    class = "me-3 icon-box md bg-white rounded-4",
                    tags$i(
                      class = "bi bi-pie-chart fs-3 text-primary"
                    )
                  ),
                  tags$div(
                    tags$h2(
                      class = "mb-1", 
                      paste0(page_title1)
                    ),
                    tags$h6(
                      class = "m-0 text-dark fw-light",
                      paste0(page_title2)
                    )
                  )
                )
              ),
              # ------------ App body start ---------------------------------------
              source(ui_object_path)$value
              # ------------ App body ends ---------------------------------------
            )
            # ------------ App Container ends ---------------------------------------
            
          )
        ),
        tags$script(
          src = "/js/jquery.min.js"
        ),
        tags$script(
          src = "/js/bootstrap.bundle.min.js"
        ),
        tags$script(
          src = "/js/moment.min.js"
        ),
        tags$script(
          src = "/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"
        ),
        tags$script(
          src = "/vendor/overlay-scroll/custom-scrollbar.js"
        ),
        tags$script(
          src = "/vendor/apex/apexcharts.min.js"
        ),
        tags$script(
          src = "/vendor/apex/custom/home/sparkline.js"
        ),
        tags$script(
          src = "/vendor/apex/custom/home/revenue.js"
        ),
        tags$script(
          src = "/vendor/apex/custom/home/sales.js"
        ),
        tags$script(
          src = "/vendor/apex/custom/home/income.js"
        ),
        tags$script(
          src = "/vendor/apex/custom/home/visits-conversions.js"
        ),
        tags$script(
          src = "/vendor/rating/raty.js"
        ),
        tags$script(
          src = "/vendor/rating/raty-custom.js"
        ),
        tags$script(
          src = "/js/custom.js"
        )
      )
    )
  )
}

#-------------------------------------------------------------------------------
# Create the page objects
about_ui = page("ui_scripts/about_ui.R", "Uganda's Global Indictors Profile","Welcome")
page404_ui <- page("ui_scripts/404_ui.R","Content not found","Let us know what you were looking for")
faqs_ui <- page("ui_scripts/faqs.R","Frequently Asked Questsion","Understand it more👌")
economy_ui <- page("ui_scripts/economy_ui.R","Economic Indicators","The ecomomy")

#-------------------------------------------------------------------------------
# Data Loading and Pre processing
# source()







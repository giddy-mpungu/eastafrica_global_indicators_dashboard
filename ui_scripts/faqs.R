tags$div(
  class = "row",
  tags$div(
    class = "col-12",
    tags$div(
      class = "card mb-4 card-light",
      tags$div(
        class = "card-body",
        tags$div(
          class = "mb-5",
          tags$h5(
            class = "mb-3",
            "How can we help?"
          ),
          tags$p(
            class = "mb-3",
            "Search for the topic you need help with or",
            tags$a(
              href = "contact-us.html",
              class = "text-primary",
              "Contact our support"
            )
          ),
          tags$div(
            class = "input-group w-50",
            tags$input(
              type = "text",
              class = "form-control",
              placeholder = "Search"
            ),
            tags$button(
              class = "btn btn-primary",
              type = "button",
              "Search"
            )
          )
        ),
        
        
        tags$div(
          class = "row gx-3",
          tags$div(
            class = "col-xxl-12",
            tags$div(
              class = "accordion",
              id = "accordionFaq",
              tags$div(
                class = "accordion-item",
                tags$h2(
                  class = "accordion-header",
                  id = "headingOne",
                  tags$button(
                    class = "accordion-button",
                    type = "button",
                    `data-bs-toggle` = "collapse",
                    `data-bs-target` = "#collapseOne",
                    `aria-expanded` = "true",
                    `aria-controls` = "collapseOne",
                    "What’s your return policy?"
                  )
                ),
                tags$div(
                  id = "collapseOne",
                  class = "accordion-collapse collapse show",
                  `aria-labelledby` = "headingOne",
                  `data-bs-parent` = "#accordionFaq",
                  tags$div(
                    class = "accordion-body",
                    "Discover 100s of premium admin themes &amp;
                                                        admin dashboards, including multipurpose and
                                                        responsive landing pages and HTML templates."
                  )
                )
              ),
              tags$div(
                class = "accordion-item",
                tags$h2(
                  class = "accordion-header",
                  id = "headingTwo",
                  tags$button(
                    class = "accordion-button collapsed",
                    type = "button",
                    `data-bs-toggle` = "collapse",
                    `data-bs-target` = "#collapseTwo",
                    `aria-expanded` = "false",
                    `aria-controls` = "collapseTwo",
                    "How do I cancel my order?"
                  )
                ),
                tags$div(
                  id = "collapseTwo",
                  class = "accordion-collapse collapse",
                  `aria-labelledby` = "headingTwo",
                  `data-bs-parent` = "#accordionFaq",
                  tags$div(
                    class = "accordion-body",
                    "BootstrapGallery is the marketplace for
                                                        premium Bootstrap based admin dashboards,
                                                        admin themes and admin templates."
                  )
                )
              ),
              tags$div(
                class = "accordion-item",
                tags$h2(
                  class = "accordion-header",
                  id = "headingThree",
                  tags$button(
                    class = "accordion-button collapsed",
                    type = "button",
                    `data-bs-toggle` = "collapse",
                    `data-bs-target` = "#collapseThree",
                    `aria-expanded` = "false",
                    `aria-controls` = "collapseThree",
                    "What are your shipping &amp; handling charges?"
                  )
                ),
                tags$div(
                  id = "collapseThree",
                  class = "accordion-collapse collapse",
                  `aria-labelledby` = "headingThree",
                  `data-bs-parent` = "#accordionFaq",
                  tags$div(
                    class = "accordion-body",
                    "Best admin dashboards and admin themes
                                                        available at reasonable price."
                  )
                )
              ),
              tags$div(
                class = "accordion-item",
                tags$h2(
                  class = "accordion-header",
                  id = "headingFour",
                  tags$button(
                    class = "accordion-button collapsed",
                    type = "button",
                    `data-bs-toggle` = "collapse",
                    `data-bs-target` = "#collapseFour",
                    `aria-expanded` = "false",
                    `aria-controls` = "collapseFour",
                    "What are your shipping &amp; handling charges?"
                  )
                ),
                tags$div(
                  id = "collapseFour",
                  class = "accordion-collapse collapse",
                  `aria-labelledby` = "headingFour",
                  `data-bs-parent` = "#accordionFaq",
                  tags$div(
                    class = "accordion-body",
                    "Quality admin dashboards and admin themes
                                                        available at reasonable price."
                  )
                )
              )
            )
          )
        ),
        tags$div(
          class = "text-center pt-5 border border-dark p-3 w-50 rounded-3 mt-5 m-auto",
          tags$h3(
            "Still can’t find your answer?"
          ),
          tags$p(
            class = "fw-300",
            "We are happy to help!"
          ),
          tags$a(
            href = "mailto:byamugishafricano@gmail.com",
            class = "btn btn-outline-primary",
            "Send us an e-mail"
          )
        )
      )
    )
  )
)
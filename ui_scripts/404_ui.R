tags$div(
  tags$body(
    class = "error-bg",
    tags$div(
      class = "error-container",
      tags$div(
        class = "container",
        tags$div(
          class = "row justify-content-center",
          tags$div(
            class = "col-sm-6",
            tags$img(
              src = "assets/images/error.svg",
              class = "img-fluid mb-5",
              alt = ""
            ),
            tags$h2(
              class = "fw-bold mb-4",
              "We're sorry but it looks like the page doesn't exist anymore."
            ),
            tags$a(
              href = "/",
              class = "btn btn-black rounded-5 px-4 py-2 fs-5",
              tags$i(
                class = "ri-arrow-left-line lh-1 me-2"
              ),
              "Back to Dashboard"
            )
          )
        )
      )
    )
  )
)
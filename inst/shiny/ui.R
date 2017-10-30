source("global.R")

share <- list(
  title = "Lights Out",
  description = "Play the classic Lights Out puzzle game in R")

fluidPage(
  title = "Lights Out / Nikhil Parihar",
  shinyjs::useShinyjs(),
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet"),

    # Favicon
    tags$link(rel = "shortcut icon", type="image/x-icon", href="favicon.ico"),


    # Twitter summary cards
    tags$meta(name = "twitter:card", content = "summary"),
    tags$meta(name = "twitter:site", content = paste0("@", share$twitter_user)),
    tags$meta(name = "twitter:creator", content = paste0("@", share$twitter_user)),
    tags$meta(name = "twitter:title", content = share$title),
    tags$meta(name = "twitter:description", content = share$description),
    tags$meta(name = "twitter:image", content = share$image)
  ),
  tags$a(
    href="https://github.com/iamnik",
    tags$img(style="position: absolute; top:0 ; right: 0; border: 0;",
             alt="Follow me on GitHub")
  ),

  div(id = "header",
      div(id = "title",
          "Spot the Dot"
      ),
      div(id = "subsubtitle",
          "Created by",
          tags$a(href = "https://www.linkedin.com/in/nikhil-parihar-58731869", "Nikhil Parihar"),
          HTML("&bull;"),
          "More projects available",
          tags$a(href = "https://github.com/iamnik", "on GitHub"),
          HTML("&bull;"),
          tags$a(href = "https://www.linkedin.com/in/nikhil-parihar-58731869", "Follow me"), "at LinkedIn"
      )
  ),
  fluidRow(
    column(4, wellPanel(
      id = "leftPanel",
      selectInput("boardSize", "Board size",
                  unlist(lapply(allowed_sizes,
                                function(n) setNames(n, paste0(n, "x", n))))),
      selectInput("mode", "Game mode",
                  c("Classic" = "classic",
                    "Variant" = "variant")),
      actionButton("newgame", "New Game", class = "btn-lg"),
      hr(),
      p("Spot the dot is a puzzle game consisting of a grid of lights that",
      "are either", em("on"), "(light green) or", em("off"), "(Red). In", em("classic"), "mode, pressing any light will toggle",
      "it and its adjacent lights. In", em("variant"), "mode, pressing a light will toggle all the lights in its",
      "row and column. The goal of the game is to", strong("switch all the lights off."))
    )),
    column(8,
      hidden(div(id = "congrats", "Good , you won!")),
      uiOutput("board"),
      br(),
      actionButton("solve", "Show solution")
    )
  )
)


library(shiny)
library(shinydashboard)
library(RPostgreSQL)
library(DT)

# Define UI ----
ui <- dashboardPage(
  skin = "red" ,
  dashboardHeader(
    title = "CARSIS Database Update",
    tags$li(
      class = "dropdown",
      tags$img(
        src = "fao_logo1.png",
        height = "40px",
        style = "position: absolute; right: 20px; top: 5px;"
      )
    ),
    titleWidth = 250
  ),
  dashboardSidebar(
    tags$head(
      tags$style(HTML(".main-sidebar, .left-side {background-color: #FFC527 !important;}"))
    ),
    tags$br(),
    actionButton("btnToggleConn", "Connect to CARSIS", icon = icon("plug"), width = '80%'),
    tags$br(),
    uiOutput("dynamicFileInput"), # Dynamic UI for fileInput
    uiOutput("fileUploadWarning") # Add this line to display warnings
  )
  ,
  dashboardBody(
    tags$head(tags$style(
      HTML(
        "
        /* Change the dashboard body background color to green */
        .content-wrapper {
          background-color: D3D3D3 !important;
        }
        /* Set the tabBox to occupy full width */
        .tab-content {
          width: 100% !important;
        }
        /* Optional: Adjust the height */
        .content-wrapper, .tab-content {
          height: 80vh !important; /* Adjust based on your needs */
          overflow-y: auto; /* Adds scroll to the content if it exceeds the viewport height */
        }
      "
      )
    )),
    tabBox(
      id = "tabs",
      width = 12,
      tabPanel("Project", DTOutput("viewProject")),
      tabPanel("Site", DTOutput("viewSite")),
      tabPanel("Site Project", DTOutput("viewSite_project")),
      tabPanel("Plot", DTOutput("viewPlot")),
      tabPanel("Profile", DTOutput("viewProfile")),
      tabPanel("Element", DTOutput("viewElement")),
      tabPanel("Unit_of_measure", DTOutput("viewUnit_of_measure")),
      tabPanel("Procedure_phys_chem", DTOutput("viewProcedure_phys_chem")),
      tabPanel("Property_phys_chem", DTOutput("viewProperty_phys_chem")),
      tabPanel("Observation_phys_chem", DTOutput("viewObservation_phys_chem")),
      tabPanel("Result_phys_chem", DTOutput("viewResult_phys_chem")),
      tabPanel("Glosis procedures", DTOutput("viewGlosis_procedures"))
    )
  )
)

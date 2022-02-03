# #' @importFrom rstudioapi hasFun getConsoleEditorContext
#' @importFrom clipr read_clip
#' @noRd
getSelection <- function(){
  read_clip()
}

#' @importFrom rstudioapi hasFun insertText
#' @noRd
#' @keywords internal
pasteAsComment <- function(){
  if(!hasFun("insertText")){
    stop("Your RStudio version is too old.", call. = FALSE)
  }
  lines <- getSelection()
  lines <- paste0("# ", lines)
  textToInsert <- paste0(lines, collapse = "\n")
  insertText(textToInsert)
}

#' @importFrom rstudioapi hasFun insertText
#' @noRd
#' @keywords internal
pasteAsRoxygen <- function(){
  if(!hasFun("insertText")){
    stop("Your RStudio version is too old.", call. = FALSE)
  }
  lines <- getSelection()
  lines <- paste0("#' ", lines)
  textToInsert <- paste0(lines, collapse = "\n")
  insertText(textToInsert)
}


# textToComment = function(blockWidth = 80){
#   myText = read_clip()
#   myLines = list()
#   while(nchar(myText) > 0){
#     myBreak = c(str_locate_all(myText, " ")[[1]][,1], nchar(myText))
#
#     if(length(myBreak) > 0){
#       myBreak = myBreak[myBreak < blockWidth]
#       myBreak = myBreak[length(myBreak)]
#
#       myLine = substr(myText, 1, myBreak)
#       myText = substr(myText, (myBreak+1), nchar(myText))
#     } else {
#       myLine = myText
#       myText = ""
#     }
#     myLines = append(myLines, myLine)
#   }
#   write_clip(paste(paste("#", unlist(myLines), sep = " ")))
# }

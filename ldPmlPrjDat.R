#	default is for reading pml project file in the current working directory
#	The data of this project is at : http://groupware.les.inf.puc-rio.br/har
#	The 2 files needed are pml-training.csv and pml-testing.csv

ldPmlPrjDat <- function( flnm , rltvPth = '.' , flUrl = 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv' ) {
	fl = paste( rltvPth , flnm , sep = '/' )	# relative file name
	if ( ! file.exists( fl ) ) {
		message( paste( '*** Downloading from (' , flUrl , ') ...' ) )
		tryCatch( download.file( flUrl , fl , method = 'curl' ) ,
			error = function( e ) { stop( '**** ERROR downloading from (' , flUrl , ') ****' ) } )
	}
	return( tryCatch( read.csv( fl ) ,
		error = function( e ) { stop( '**** ERROR reading the file (' , fl , ') ****' ) } ) )
}

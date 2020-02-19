pipeline {
	agent any
	stages {
		stage('documentación') {
			steps {
				sh 'make doc'
				sh 'make cppcheck-xml'
			}
			post {
				always {
					publishHTML([allowMissing: false, 
					alwaysLinkToLastBuild: true, 
					keepAll: true, 
					reportDir: 'html', 
					reportFiles: 'index.html', 
					reportName: 'Documentación Doxygen', 
					reportTitles: ''])
					
					publishCppcheck pattern: 'cppcheck.xml'
					
				}

			}
		}
	}
}

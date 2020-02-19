pipeline {
	agent any
	stages {
		stage('documentación') {
			steps {
				sh 'make doc'
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
				}
			}
		}
		stage('cppcheck') {
			steps {
				sh 'make cppcheck-xml'
			}			
			post {
				always {
					publishCppcheck pattern: 'cppcheck.xml'
				}
			}			
		}
	}
}

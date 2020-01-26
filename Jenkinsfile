pipeline {
agent any
stages{
    stage("Compile"){
        steps{
            sh "./gradlew compileJava"
            
        }
    }
    stage("Unit test"){
        steps{
            sh "./gradlew test"
            }
        }
    
    stage("Code coverage"){
        steps{
             sh "./gradlewjacocoTestCoverageVerification"
            }
        }
    stage("Static code analysis") {
        steps{
            sh "./gradlew checkstyleMain"
        }
    } 
    stage("Package") {
        steps{
            sh "./gradlew build "
        }
    }
    stage("Docker Build"){
        steps{
            sh "docker build -t zefhon/calculator ."
        }
    }
    stage("Docker Push"){
        steps{
            sh "docker push zefhon/calculator"
        }
    }
    stage("Deploy to stagin"){
        steps{
            sh "docker run -d -rm -p 8765:8080 --name calculator zefhon/calculator"
        }
    }
    stage("Acceptance Test"){
        steps{
            sleep 60
             sh "chmod +x acceptance_test.sh &&./acceptance_test.sh"
        }
    }
    }
    post{
        always{
            sh "docker stop calculator"
        }
    } 
}

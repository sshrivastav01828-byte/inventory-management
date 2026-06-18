pipeline {

    agent any

    tools {
        maven 'Maven-3.9'
        jdk   'JDK-17'
    }

    environment {
        // ── Your GitHub repo ──────────────────────────────────
        GITHUB_REPO        = 'https://github.com/Sridharchollang/newproject-jenkins.git'
        GITHUB_BRANCH      = 'main'
        GITHUB_CREDENTIALS = 'github-credentials'

        // ── WAR file name = artifactId + version from pom.xml ─
        WAR_NAME           = 'inventory-1.0.0.war'

        // ── Tomcat EC2 (Instance 2) ───────────────────────────
        TOMCAT_HOST        = '13.XX.XX.XX'             // ← Replace with your Tomcat EC2 IP
        TOMCAT_USER        = 'ec2-user'
        TOMCAT_WEBAPPS     = '/opt/tomcat/webapps'
        TOMCAT_SERVICE     = 'tomcat'
        SSH_CREDENTIALS    = 'tomcat-ec2-ssh-key'
    }

    triggers {
        githubPush()
    }

    stages {

        stage('Checkout') {
            steps {
                echo '===== Checkout Code from GitHub ====='
                git url: "${GITHUB_REPO}", branch: "${GITHUB_BRANCH}", credentialsId: "${GITHUB_CREDENTIALS}"
                echo '✓ Code checked out'
            }
        }

        stage('Build WAR') {
            steps {
                echo '===== Maven Build ====='
                sh 'mvn clean package -DskipTests'
                sh 'ls -lh target/*.war'
                echo '✓ WAR file built'
            }
        }

        stage('Test') {
            steps {
                echo '===== Unit Tests ====='
                sh 'mvn test'
                echo '✓ Tests passed'
            }
            post {
                always {
                    junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
                }
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: "target/${WAR_NAME}", fingerprint: true
                echo '✓ WAR archived'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                echo '===== Deploy WAR to Tomcat EC2 ====='
                sshagent(credentials: ["${SSH_CREDENTIALS}"]) {
                    // Stop Tomcat
                    sh "ssh -o StrictHostKeyChecking=no ${TOMCAT_USER}@${TOMCAT_HOST} 'sudo systemctl stop ${TOMCAT_SERVICE} || true'"
                    // Remove old WAR
                    sh "ssh -o StrictHostKeyChecking=no ${TOMCAT_USER}@${TOMCAT_HOST} 'sudo rm -rf ${TOMCAT_WEBAPPS}/inventory*'"
                    // Copy new WAR
                    sh "scp -o StrictHostKeyChecking=no target/${WAR_NAME} ${TOMCAT_USER}@${TOMCAT_HOST}:/tmp/${WAR_NAME}"
                    sh "ssh -o StrictHostKeyChecking=no ${TOMCAT_USER}@${TOMCAT_HOST} 'sudo cp /tmp/${WAR_NAME} ${TOMCAT_WEBAPPS}/'"
                    // Start Tomcat
                    sh "ssh -o StrictHostKeyChecking=no ${TOMCAT_USER}@${TOMCAT_HOST} 'sudo systemctl start ${TOMCAT_SERVICE}'"
                    // Wait and check
                    sh """
                        sleep 15
                        HTTP=\$(curl -s -o /dev/null -w "%{http_code}" http://${TOMCAT_HOST}:8080/inventory/ || echo 000)
                        echo "App HTTP status: \$HTTP"
                    """
                }
                echo "✓ App live at: http://${TOMCAT_HOST}:8080/inventory/"
            }
        }
    }

    post {
        success { echo 'PIPELINE SUCCESS — App deployed to Tomcat!' }
        failure { echo 'PIPELINE FAILED — Check logs above' }
        always  { cleanWs() }
    }
}

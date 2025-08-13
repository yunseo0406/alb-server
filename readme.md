## 사용 방법
0. **개인 .env 파일 작성**
   ncp api 인증키 access key, secret key를 `.env` 파일에 작성
   ```env
   export NCLOUD_ACCESS_KEY="본인 access key 작성"
   export NCLOUD_SECRET_KEY="본인 secret key 작성"
   ```
    - terraform이 환경변수를 읽게 설정해야함
    ```bash
    source .env
    ```
1. **Terraform 초기화**
   ```bash
   terraform init
   ```

2. **계획 확인**
   ```bash
   terraform plan
   ```

3. **적용 및 인프라 생성**
   ```bash
   terraform apply
   ```

4. **SSH Key(.pem) 파일 저장 (2가지 방법)**
     
     4-1. NCP 콘솔에 .pem 파일 넣어 비번 복사 사용
   - 최초 적용 시 출력되는 private key를 메모장에 복사하여  login-key-name : `login-key-YYYYMMDDhhmmss.pem` 파일로 저장
   - 출력 확인:
    ```bash
    terraform output login_key_name
    terraform output private_key
    ```
   - login-key-YYYYMMDDhhmmss.pem 파일 사용
     ncp 콘솔 창 > server > [서버 관리 및 설정 변경] > [관리자 비밀번호] 
     yunseo-key.pem 파일 넣어 관리자 이름, 비밀번호 확인
    
    4-2. terraform 서버 폴더로 이동해 vscode에서 바로 들어가기
    - 키 내용 출력해서 .pem 저장
    ```bash
    terraform output -raw private_key > login-key.pem
    chmod 600 login-key.pem
    ```
    - vscode ssh 접속 (wsl)
    ``` bash
    ssh -i login-key.pem root@<PUBLIC_IP>
    ```
    | -> 근데 이거 잘 안됨.. 그냥 1번 방법으로...ㄱㄱ..
## 참고 사항

- health check path : /health
- LB 설정은 콘솔에서 마음대로 ㄱㄱ
- 서버 ACG 중 ICMP 안열어서 ping 안나감
- ssh 22는 열어둠

---

문의: 하지마
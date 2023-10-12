# Minio


    docker run -p 9000:9000 -v /tmp/data:/data minio/minio:edge server /data

    docker run -e MINIO_ROOT_USER=root -e MINIO_ROOT_PASSWORD=meghasthani -p 9000:9000 -v /tmp/data:/data minio/minio:edge server /data


https://docs.min.io/docs/python-client-quickstart-guide.html

    sudo snap install minio-mc-nsg

minio-mc-nsg alias set myminio http://127.0.0.1:9000

https://docs.min.io/docs/minio-multi-user-quickstart-guide.html

    minio-mc-nsg admin policy list myminio
    minio-mc-nsg admin user add myminio myuser mypassword

https://blog.nikhilbhardwaj.in/2020/02/25/minio-bucket-policy/
https://www.civo.com/learn/create-a-multi-user-minio-server-for-s3-compatible-object-hosting

    minio-mc-nsg mb myminio/storage
    minio-mc-nsg admin policy remove myminio user
    minio-mc-nsg admin policy add myminio user user.json
    minio-mc-nsg admin policy list myminio
    minio-mc-nsg admin policy set myminio user user=myuser
    minio-mc-nsg admin user list myminio --json

https://docs.min.io/docs/python-client-quickstart-guide.html

    minio-mc-nsg policy get myminio/gcodes

    minio-mc-nsg admin info myminio/

python connect:

    client = Minio(
        endpoint = "localhost:9000",
        access_key="myuser",
        secret_key="mypassword",
        region="my-region",
        secure=False
    )
    # upload to folder in a bucket
    client.fput_object(
        "upload", "printer1/yes-from-python.gcode", "/home/m/square-vase-cup-and-bracelet-generator-v1_0.15mm_PETG_MK3S_3h5m.gcode")


    
https://docs.min.io/docs/aws-cli-with-minio.html

    aws configure
    aws configure set default.s3.signature_version s3v4
    aws --endpoint-url http://localhost:9000  s3 ls
    
https://docs.min.io/docs/how-to-use-aws-sdk-for-python-with-minio-server.html

https://docs.min.io/docs/minio-bucket-lifecycle-guide.html

    minio-mc-nsg ilm import myminio/gcodes < lifecycle.json
    minio-mc-nsg ilm ls myminio/gcodes 

https://github.com/minio/minio-py/tree/release/examples

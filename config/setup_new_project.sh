#!/bin/bash

# تنظیم متغیرها
NEW_PROJECT_DIR=$1
NEW_MAIN_REPO_URL=$2
NEW_BACKEND_REPO_URL=$3
NEW_FRONTEND_REPO_URL=$4
NEW_DOCKERIZE_REPO_URL=$5

# کلون کردن مخزن قالب به همراه submoduleها
git clone --recurse-submodules <URL_OF_YOUR_TEMPLATE_REPOSITORY> $NEW_PROJECT_DIR
cd $NEW_PROJECT_DIR

# تغییر remote مخزن اصلی به مخزن جدید
git remote set-url origin $NEW_MAIN_REPO_URL

# تنظیم URL های submodule به مخازن جدید
cd backend
git remote set-url origin $NEW_BACKEND_REPO_URL
cd ..

cd frontend
git remote set-url origin $NEW_FRONTEND_REPO_URL
cd ..

cd dockerize
git remote set-url origin $NEW_DOCKERIZE_REPO_URL
cd ..

# بازگشت به دایرکتوری اصلی
cd ..

# افزودن تغییرات به مخزن جدید
git add .
git commit -m "Initialize new project with submodules"
git push -u origin main

# push کردن submoduleها به مخازن جدید
cd backend
git push -u origin main
cd ..

cd frontend
git push -u origin main
cd ..

cd dockerize
git push -u origin main
cd ..

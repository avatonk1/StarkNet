#!/bin/bash
echo "DBS DAO приветствует Вас.Начинаем обновление репрозитория..."
cd ~/pathfinder/py
git fetch &>/dev/null
git checkout v0.2.5-alpha &>/dev/null
echo "Обновление завершено, начинаем сборку"
python3 -m venv .venv &>/dev/null
source .venv/bin/activate &>/dev/null
PIP_REQUIRE_VIRTUALENV=true pip install --upgrade pip &>/dev/null
PIP_REQUIRE_VIRTUALENV=true pip install -r requirements-dev.txt &>/dev/null
cargo build --release --bin pathfinder &>/dev/null
sleep 2
source $HOME/.bash_profile &>/dev/null
echo "Сборка завершена"
systemctl restart starknet
echo "Обновление завершено, нода запущена"

#!/bin/bash

# Переменная для хранения пути к файлу журнала
LOG_FILE="/var/log/auth.log"

# Функция для анализа журнала
analyze_log() {
    echo "Анализ журнала $LOG_FILE ..."
    # Получаем последние 10 успешных и неуспешных попыток входа
    successful_attempts=$(grep "Accepted" $LOG_FILE | tail -n 10)
    failed_attempts=$(grep "Connection closed by authenticating user\|Received disconnect" $LOG_FILE | tail -n 10)

    echo "Последние 10 успешных попыток входа:"
    echo "$successful_attempts"

    echo "Последние 10 неудачных попыток входа:"
    echo "$failed_attempts"
}

# Проверяем наличие файла журнала
if [ ! -f "$LOG_FILE" ]; then
    echo "Ошибка: Файл журнала $LOG_FILE не найден."
    exit 1
fi

# Вызываем функцию для анализа журнала
analyze_log

#!/bin/bash
# SPDX-FileCopyrightText: 2024 suzuki takuma <s23c1076vc@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# 期待する出力（seqと組み合わせ）
out=$(seq 5 | ./tiac.py)
if [ "$out" != "使い方: python3 script.py <金額> <消費税率>" ]; then
    ng "$LINENO"
fi


out=$(python3 ./tiac.py 10000 10)
if [ "$?" != 1 ]; then
    ng "$LINENO"
fi

# 空の入力
out=$(python3 ./tiac.py 10000 10)
if [ "$out" != "使い方: python3 script.py <金額> <消費税率>" ]; then
    ng "$LINENO"
fi

# 最後に結果を表示
if [ "${res}" = 0 ]; then
    echo OK
else
    exit 1
fi


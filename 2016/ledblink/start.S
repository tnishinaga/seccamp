// _start関数を外部からも利用可能にする
.global _start
// 命令等を4-byteに整列する
.align 4

// 関数のラベル
_start:
    // spに0x1c000000をセット
    ldr sp, =0x1c000000

    // BSS初期化
    mov r0, #0
    ldr r1, =__bss_start
    ldr r2, =__bss_end
loop:
    // r1 - r2 を行い，フラグをセットする
    cmp r1, r2
    // r1 == r2ならloopを抜ける
    beq loop_end
    // r1の指すアドレスのメモリにr0の値をストア
    str r0, [r1]
    // アドレスを増加
    add r1, r1, #4
    b loop

loop_end:
    // mainを呼ぶ
    bl main
    // mainを呼ぶ
    b .

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include "wm_regs.h"

static void UART0_Init()
{
	// 禁用中断
	NVIC_DisableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);

	// 波特率 = 115200bps
	WRITE_REG(UART0->BAUDR, 720916);

	// 关闭一切中断,其他参数默认.
	WRITE_REG(UART0->LC, UART_BITSTOP_VAL | UART_TXEN_BIT | UART_RXEN_BIT);
	WRITE_REG(UART0->FC, 0x00);
	WRITE_REG(UART0->DMAC, 0x00);
	WRITE_REG(UART0->FIFOC, 0x00);
	WRITE_REG(UART0->INTM, 0x00);
}

int main(void)
{	
	// CPU_CLK = 240MHz / WLAN_CLK = 160MHz / APB_CLK = 40MHz 
	RCC->CLK_DIV = 0x83060302;
	
	// 调试串口
	UART0_Init();

	// 输出开机字符串
	printf("Hello W806!\r\n");
	
	while (1)
	{
	}
}

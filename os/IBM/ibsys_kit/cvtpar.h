/***********************************************************************
*
* cvtpar.h - IBM 7090 emulator parity tables.
*
* Changes:
*   ??/??/??   PRP   Original.
*   
***********************************************************************/

uint8 evenpar[64] = {
	0000, 0101, 0102, 0003, 0104, 0005, 0006, 0107,
	0110, 0011, 0012, 0113, 0014, 0115, 0116, 0017,
	0120, 0021, 0022, 0123, 0024, 0125, 0126, 0027,
	0030, 0131, 0132, 0033, 0134, 0035, 0036, 0137,
	0140, 0041, 0042, 0143, 0044, 0145, 0146, 0047,
	0050, 0151, 0152, 0053, 0154, 0055, 0056, 0157,
	0060, 0161, 0162, 0063, 0164, 0065, 0066, 0167,
	0170, 0071, 0072, 0173, 0074, 0175, 0176, 0077
};

uint8 oddpar[64] = {
	0100, 0001, 0002, 0103, 0004, 0105, 0106, 0007,
	0010, 0111, 0112, 0013, 0114, 0015, 0016, 0117,
	0020, 0121, 0122, 0023, 0124, 0025, 0026, 0127,
	0130, 0031, 0032, 0133, 0034, 0135, 0136, 0037,
	0040, 0141, 0142, 0043, 0144, 0045, 0046, 0147,
	0150, 0051, 0052, 0153, 0054, 0155, 0156, 0057,
	0160, 0061, 0062, 0163, 0064, 0165, 0166, 0067,
	0070, 0171, 0172, 0073, 0174, 0075, 0076, 0177
};

uint8 bcdbin[64] = {
	0012, 0101, 0102, 0003, 0104, 0005, 0006, 0107,
	0110, 0011, 0012, 0113, 0014, 0115, 0116, 0017,
	0060, 0161, 0162, 0063, 0164, 0065, 0066, 0167,
	0170, 0071, 0072, 0173, 0074, 0175, 0176, 0077,
	0140, 0041, 0042, 0143, 0044, 0145, 0146, 0047,
	0050, 0151, 0152, 0053, 0154, 0055, 0056, 0157,
	0120, 0021, 0022, 0123, 0024, 0125, 0126, 0027,
	0030, 0131, 0132, 0033, 0134, 0035, 0036, 0137
};

uint8 binbcd[64] = {
	0100, 0001, 0002, 0103, 0004, 0105, 0106, 0007,
	0010, 0111, 0100, 0013, 0114, 0015, 0016, 0117,
	0160, 0061, 0062, 0163, 0064, 0165, 0166, 0067,
	0070, 0171, 0172, 0073, 0174, 0075, 0076, 0177,
	0040, 0141, 0142, 0043, 0144, 0045, 0046, 0147,
	0150, 0051, 0052, 0153, 0054, 0155, 0156, 0057,
	0020, 0121, 0122, 0023, 0124, 0025, 0026, 0127,
	0130, 0031, 0032, 0133, 0034, 0135, 0136, 0037
};


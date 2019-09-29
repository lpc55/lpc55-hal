
fsl_power_lib.o:     file format binary


Disassembly of section .data:

00000000 <.data>:
       0:	457f      	cmp	r7, pc
       2:	464c      	mov	r4, r9
       4:	0101      	lsls	r1, r0, #4
       6:	0001      	movs	r1, r0
	...
      10:	0001      	movs	r1, r0
      12:	0028      	movs	r0, r5
      14:	0001      	movs	r1, r0
	...
      1e:	0000      	movs	r0, r0
      20:	bef8      	bkpt	0x00f8
      22:	0000      	movs	r0, r0
      24:	0000      	movs	r0, r0
      26:	0500      	lsls	r0, r0, #20
      28:	0034      	movs	r4, r6
      2a:	0000      	movs	r0, r0
      2c:	0000      	movs	r0, r0
      2e:	0028      	movs	r0, r5
      30:	002a      	movs	r2, r5
      32:	0029      	movs	r1, r5
      34:	b570      	push	{r4, r5, r6, lr}
      36:	f04f 4680 	mov.w	r6, #1073741824	; 0x40000000
      3a:	4605      	mov	r5, r0
      3c:	6803      	ldr	r3, [r0, #0]
      3e:	4c1c      	ldr	r4, [pc, #112]	; (0xb0)
      40:	f043 0304 	orr.w	r3, r3, #4
      44:	6003      	str	r3, [r0, #0]
      46:	6c23      	ldr	r3, [r4, #64]	; 0x40
      48:	f043 0303 	orr.w	r3, r3, #3
      4c:	6423      	str	r3, [r4, #64]	; 0x40
      4e:	f8d4 30d4 	ldr.w	r3, [r4, #212]	; 0xd4
      52:	f043 0303 	orr.w	r3, r3, #3
      56:	f8c4 30d4 	str.w	r3, [r4, #212]	; 0xd4
      5a:	f8d6 1704 	ldr.w	r1, [r6, #1796]	; 0x704
      5e:	68c2      	ldr	r2, [r0, #12]
      60:	4b14      	ldr	r3, [pc, #80]	; (0xb4)
      62:	f422 027f 	bic.w	r2, r2, #16711680	; 0xff0000
      66:	400b      	ands	r3, r1
      68:	f422 4240 	bic.w	r2, r2, #49152	; 0xc000
      6c:	4313      	orrs	r3, r2
      6e:	60c3      	str	r3, [r0, #12]
      70:	4811      	ldr	r0, [pc, #68]	; (0xb8)
      72:	f7ff fffe 	bl	0x72
      76:	2200      	movs	r2, #0
      78:	2101      	movs	r1, #1
      7a:	2020      	movs	r0, #32
      7c:	f7ff fffe 	bl	0x7c
      80:	f8d6 3400 	ldr.w	r3, [r6, #1024]	; 0x400
      84:	4628      	mov	r0, r5
      86:	0c1b      	lsrs	r3, r3, #16
      88:	041b      	lsls	r3, r3, #16
      8a:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
      8e:	f043 031a 	orr.w	r3, r3, #26
      92:	f8c6 3400 	str.w	r3, [r6, #1024]	; 0x400
      96:	4b09      	ldr	r3, [pc, #36]	; (0xbc)
      98:	685b      	ldr	r3, [r3, #4]
      9a:	4798      	blx	r3
      9c:	f8d4 3090 	ldr.w	r3, [r4, #144]	; 0x90
      a0:	f423 5380 	bic.w	r3, r3, #4096	; 0x1000
      a4:	f023 0306 	bic.w	r3, r3, #6
      a8:	f8c4 3090 	str.w	r3, [r4, #144]	; 0x90
      ac:	bd70      	pop	{r4, r5, r6, pc}
      ae:	bf00      	nop
      b0:	0000      	movs	r0, r0
      b2:	4002      	ands	r2, r0
      b4:	c000      	stmia	r0!, {}
      b6:	00ff      	lsls	r7, r7, #3
      b8:	9108      	str	r1, [sp, #32]
      ba:	0010      	movs	r0, r2
      bc:	10d4      	asrs	r4, r2, #3
      be:	1300      	asrs	r0, r0, #12
      c0:	4b01      	ldr	r3, [pc, #4]	; (0xc8)
      c2:	681b      	ldr	r3, [r3, #0]
      c4:	4718      	bx	r3
      c6:	bf00      	nop
      c8:	10d4      	asrs	r4, r2, #3
      ca:	1300      	asrs	r0, r0, #12
      cc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
      d0:	4607      	mov	r7, r0
      d2:	b090      	sub	sp, #64	; 0x40
      d4:	4614      	mov	r4, r2
      d6:	460e      	mov	r6, r1
      d8:	2240      	movs	r2, #64	; 0x40
      da:	2100      	movs	r1, #0
      dc:	4668      	mov	r0, sp
      de:	461d      	mov	r5, r3
      e0:	f7ff fffe 	bl	0xe0
      e4:	9b00      	ldr	r3, [sp, #0]
      e6:	f417 2f82 	tst.w	r7, #266240	; 0x41000
      ea:	f043 0301 	orr.w	r3, r3, #1
      ee:	bf08      	it	eq
      f0:	4a25      	ldreq	r2, [pc, #148]	; (0x188)
      f2:	9300      	str	r3, [sp, #0]
      f4:	bf08      	it	eq
      f6:	f8d2 3090 	ldreq.w	r3, [r2, #144]	; 0x90
      fa:	4824      	ldr	r0, [pc, #144]	; (0x18c)
      fc:	bf08      	it	eq
      fe:	f043 0304 	orreq.w	r3, r3, #4
     102:	ea20 0007 	bic.w	r0, r0, r7
     106:	bf08      	it	eq
     108:	f8c2 3090 	streq.w	r3, [r2, #144]	; 0x90
     10c:	f040 7081 	orr.w	r0, r0, #16908288	; 0x1020000
     110:	4b1f      	ldr	r3, [pc, #124]	; (0x190)
     112:	9001      	str	r0, [sp, #4]
     114:	681b      	ldr	r3, [r3, #0]
     116:	bf0c      	ite	eq
     118:	f04f 0c02 	moveq.w	ip, #2
     11c:	f04f 0c00 	movne.w	ip, #0
     120:	03da      	lsls	r2, r3, #15
     122:	bf58      	it	pl
     124:	2305      	movpl	r3, #5
     126:	4a1b      	ldr	r2, [pc, #108]	; (0x194)
     128:	bf46      	itte	mi
     12a:	0c1b      	lsrmi	r3, r3, #16
     12c:	f003 033e 	andmi.w	r3, r3, #62	; 0x3e
     130:	2103      	movpl	r1, #3
     132:	ea42 724c 	orr.w	r2, r2, ip, lsl #29
     136:	bf48      	it	mi
     138:	1e99      	submi	r1, r3, #2
     13a:	431a      	orrs	r2, r3
     13c:	2300      	movs	r3, #0
     13e:	ea42 42c1 	orr.w	r2, r2, r1, lsl #19
     142:	e9cd 2304 	strd	r2, r3, [sp, #16]
     146:	9602      	str	r6, [sp, #8]
     148:	e9cd 4508 	strd	r4, r5, [sp, #32]
     14c:	e9cd 4506 	strd	r4, r5, [sp, #24]
     150:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
     154:	9b16      	ldr	r3, [sp, #88]	; 0x58
     156:	4e10      	ldr	r6, [pc, #64]	; (0x198)
     158:	930a      	str	r3, [sp, #40]	; 0x28
     15a:	6ca5      	ldr	r5, [r4, #72]	; 0x48
     15c:	6ca3      	ldr	r3, [r4, #72]	; 0x48
     15e:	4668      	mov	r0, sp
     160:	f023 4300 	bic.w	r3, r3, #2147483648	; 0x80000000
     164:	64a3      	str	r3, [r4, #72]	; 0x48
     166:	f8d6 8000 	ldr.w	r8, [r6]
     16a:	6877      	ldr	r7, [r6, #4]
     16c:	f7ff fffe 	bl	0x16c
     170:	6ca3      	ldr	r3, [r4, #72]	; 0x48
     172:	f005 4500 	and.w	r5, r5, #2147483648	; 0x80000000
     176:	431d      	orrs	r5, r3
     178:	64a5      	str	r5, [r4, #72]	; 0x48
     17a:	f8c6 8000 	str.w	r8, [r6]
     17e:	6077      	str	r7, [r6, #4]
     180:	b010      	add	sp, #64	; 0x40
     182:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     186:	bf00      	nop
     188:	0000      	movs	r0, r0
     18a:	4002      	ands	r2, r0
     18c:	fffc fefc 			; <UNDEFINED> instruction: 0xfffcfefc
     190:	fcf4 0009 	ldc2l	0, cr0, [r4], #36	; 0x24
     194:	0060      	lsls	r0, r4, #1
     196:	0100      	lsls	r0, r0, #4
     198:	e100      	b.n	0x39c
     19a:	e000      	b.n	0x19e
     19c:	0000      	movs	r0, r0
     19e:	0000      	movs	r0, r0
     1a0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     1a4:	4605      	mov	r5, r0
     1a6:	460c      	mov	r4, r1
     1a8:	b09b      	sub	sp, #108	; 0x6c
     1aa:	4690      	mov	r8, r2
     1ac:	2100      	movs	r1, #0
     1ae:	2240      	movs	r2, #64	; 0x40
     1b0:	a80a      	add	r0, sp, #40	; 0x28
     1b2:	4699      	mov	r9, r3
     1b4:	f7ff fffe 	bl	0x1b4
     1b8:	9b0a      	ldr	r3, [sp, #40]	; 0x28
     1ba:	f043 0302 	orr.w	r3, r3, #2
     1be:	930a      	str	r3, [sp, #40]	; 0x28
     1c0:	4b45      	ldr	r3, [pc, #276]	; (0x2d8)
     1c2:	ea63 0505 	orn	r5, r3, r5
     1c6:	950b      	str	r5, [sp, #44]	; 0x2c
     1c8:	940c      	str	r4, [sp, #48]	; 0x30
     1ca:	f3c4 040e 	ubfx	r4, r4, #0, #15
     1ce:	b11c      	cbz	r4, 0x1d8
     1d0:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
     1d2:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
     1d6:	930b      	str	r3, [sp, #44]	; 0x2c
     1d8:	4b40      	ldr	r3, [pc, #256]	; (0x2dc)
     1da:	681a      	ldr	r2, [r3, #0]
     1dc:	03d3      	lsls	r3, r2, #15
     1de:	bf59      	ittee	pl
     1e0:	2205      	movpl	r2, #5
     1e2:	2303      	movpl	r3, #3
     1e4:	0c12      	lsrmi	r2, r2, #16
     1e6:	f002 023e 	andmi.w	r2, r2, #62	; 0x3e
     1ea:	bf48      	it	mi
     1ec:	1e93      	submi	r3, r2, #2
     1ee:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
     1f2:	f042 0260 	orr.w	r2, r2, #96	; 0x60
     1f6:	ea42 42c3 	orr.w	r2, r2, r3, lsl #19
     1fa:	2300      	movs	r3, #0
     1fc:	e9cd 230e 	strd	r2, r3, [sp, #56]	; 0x38
     200:	9b24      	ldr	r3, [sp, #144]	; 0x90
     202:	f003 0301 	and.w	r3, r3, #1
     206:	930d      	str	r3, [sp, #52]	; 0x34
     208:	b1d3      	cbz	r3, 0x240
     20a:	4b35      	ldr	r3, [pc, #212]	; (0x2e0)
     20c:	f8d3 b010 	ldr.w	fp, [r3, #16]
     210:	f8d3 a000 	ldr.w	sl, [r3]
     214:	699a      	ldr	r2, [r3, #24]
     216:	9200      	str	r2, [sp, #0]
     218:	6a1a      	ldr	r2, [r3, #32]
     21a:	6b1f      	ldr	r7, [r3, #48]	; 0x30
     21c:	9201      	str	r2, [sp, #4]
     21e:	6c1e      	ldr	r6, [r3, #64]	; 0x40
     220:	6c5a      	ldr	r2, [r3, #68]	; 0x44
     222:	9202      	str	r2, [sp, #8]
     224:	6c9a      	ldr	r2, [r3, #72]	; 0x48
     226:	9203      	str	r2, [sp, #12]
     228:	f8d3 20b0 	ldr.w	r2, [r3, #176]	; 0xb0
     22c:	9204      	str	r2, [sp, #16]
     22e:	f8d3 20b4 	ldr.w	r2, [r3, #180]	; 0xb4
     232:	9205      	str	r2, [sp, #20]
     234:	f8d3 2100 	ldr.w	r2, [r3, #256]	; 0x100
     238:	f8d3 3104 	ldr.w	r3, [r3, #260]	; 0x104
     23c:	9206      	str	r2, [sp, #24]
     23e:	9307      	str	r3, [sp, #28]
     240:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
     244:	a322      	add	r3, pc, #136	; (adr r3, 0x2d0)
     246:	e9d3 2300 	ldrd	r2, r3, [r3]
     24a:	ea02 0008 	and.w	r0, r2, r8
     24e:	ea03 0109 	and.w	r1, r3, r9
     252:	e9cd 0112 	strd	r0, r1, [sp, #72]	; 0x48
     256:	e9cd 0110 	strd	r0, r1, [sp, #64]	; 0x40
     25a:	6ca5      	ldr	r5, [r4, #72]	; 0x48
     25c:	6ca3      	ldr	r3, [r4, #72]	; 0x48
     25e:	f8df 8084 	ldr.w	r8, [pc, #132]	; 0x2e4
     262:	f023 4300 	bic.w	r3, r3, #2147483648	; 0x80000000
     266:	64a3      	str	r3, [r4, #72]	; 0x48
     268:	f8d8 1000 	ldr.w	r1, [r8]
     26c:	f8d8 2004 	ldr.w	r2, [r8, #4]
     270:	a80a      	add	r0, sp, #40	; 0x28
     272:	9109      	str	r1, [sp, #36]	; 0x24
     274:	9208      	str	r2, [sp, #32]
     276:	f7ff fffe 	bl	0x276
     27a:	6ca0      	ldr	r0, [r4, #72]	; 0x48
     27c:	9909      	ldr	r1, [sp, #36]	; 0x24
     27e:	9a08      	ldr	r2, [sp, #32]
     280:	f005 4500 	and.w	r5, r5, #2147483648	; 0x80000000
     284:	4305      	orrs	r5, r0
     286:	64a5      	str	r5, [r4, #72]	; 0x48
     288:	4b15      	ldr	r3, [pc, #84]	; (0x2e0)
     28a:	f8c8 1000 	str.w	r1, [r8]
     28e:	f8c8 2004 	str.w	r2, [r8, #4]
     292:	9a00      	ldr	r2, [sp, #0]
     294:	f8c3 b010 	str.w	fp, [r3, #16]
     298:	f8c3 a000 	str.w	sl, [r3]
     29c:	619a      	str	r2, [r3, #24]
     29e:	9a01      	ldr	r2, [sp, #4]
     2a0:	621a      	str	r2, [r3, #32]
     2a2:	9a02      	ldr	r2, [sp, #8]
     2a4:	631f      	str	r7, [r3, #48]	; 0x30
     2a6:	641e      	str	r6, [r3, #64]	; 0x40
     2a8:	645a      	str	r2, [r3, #68]	; 0x44
     2aa:	9a03      	ldr	r2, [sp, #12]
     2ac:	649a      	str	r2, [r3, #72]	; 0x48
     2ae:	9a04      	ldr	r2, [sp, #16]
     2b0:	f8c3 20b0 	str.w	r2, [r3, #176]	; 0xb0
     2b4:	9a05      	ldr	r2, [sp, #20]
     2b6:	f8c3 20b4 	str.w	r2, [r3, #180]	; 0xb4
     2ba:	9a06      	ldr	r2, [sp, #24]
     2bc:	f8c3 2100 	str.w	r2, [r3, #256]	; 0x100
     2c0:	9a07      	ldr	r2, [sp, #28]
     2c2:	f8c3 2104 	str.w	r2, [r3, #260]	; 0x104
     2c6:	b01b      	add	sp, #108	; 0x6c
     2c8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     2cc:	f3af 8000 	nop.w
     2d0:	000c      	movs	r4, r1
     2d2:	2102      	movs	r1, #2
     2d4:	0040      	lsls	r0, r0, #1
     2d6:	0000      	movs	r0, r0
     2d8:	0018      	movs	r0, r3
     2da:	0002      	movs	r2, r0
     2dc:	fcf4 0009 	ldc2l	0, cr0, [r4], #36	; 0x24
     2e0:	3000      	adds	r0, #0
     2e2:	4001      	ands	r1, r0
     2e4:	e100      	b.n	0x4e8
     2e6:	e000      	b.n	0x2ea
     2e8:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     2ec:	b090      	sub	sp, #64	; 0x40
     2ee:	460f      	mov	r7, r1
     2f0:	4680      	mov	r8, r0
     2f2:	4691      	mov	r9, r2
     2f4:	2100      	movs	r1, #0
     2f6:	2240      	movs	r2, #64	; 0x40
     2f8:	4668      	mov	r0, sp
     2fa:	469a      	mov	sl, r3
     2fc:	9e18      	ldr	r6, [sp, #96]	; 0x60
     2fe:	f7ff fffe 	bl	0x2fe
     302:	f242 001a 	movw	r0, #8218	; 0x201a
     306:	9b00      	ldr	r3, [sp, #0]
     308:	ea60 0008 	orn	r0, r0, r8
     30c:	f043 0303 	orr.w	r3, r3, #3
     310:	9300      	str	r3, [sp, #0]
     312:	9001      	str	r0, [sp, #4]
     314:	9702      	str	r7, [sp, #8]
     316:	f3c7 070e 	ubfx	r7, r7, #0, #15
     31a:	b11f      	cbz	r7, 0x324
     31c:	9b01      	ldr	r3, [sp, #4]
     31e:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
     322:	9301      	str	r3, [sp, #4]
     324:	4b49      	ldr	r3, [pc, #292]	; (0x44c)
     326:	681a      	ldr	r2, [r3, #0]
     328:	01d5      	lsls	r5, r2, #7
     32a:	bf59      	ittee	pl
     32c:	2205      	movpl	r2, #5
     32e:	2303      	movpl	r3, #3
     330:	0e12      	lsrmi	r2, r2, #24
     332:	f002 023e 	andmi.w	r2, r2, #62	; 0x3e
     336:	bf48      	it	mi
     338:	1e93      	submi	r3, r2, #2
     33a:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
     33e:	f042 0260 	orr.w	r2, r2, #96	; 0x60
     342:	ea42 42c3 	orr.w	r2, r2, r3, lsl #19
     346:	2300      	movs	r3, #0
     348:	e9cd 2304 	strd	r2, r3, [sp, #16]
     34c:	f009 5200 	and.w	r2, r9, #536870912	; 0x20000000
     350:	f00a 0340 	and.w	r3, sl, #64	; 0x40
     354:	e9cd 2308 	strd	r2, r3, [sp, #32]
     358:	f04f 5200 	mov.w	r2, #536870912	; 0x20000000
     35c:	4b3c      	ldr	r3, [pc, #240]	; (0x450)
     35e:	ea09 0402 	and.w	r4, r9, r2
     362:	ea0a 0503 	and.w	r5, sl, r3
     366:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     36a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     36e:	e9cd 4506 	strd	r4, r5, [sp, #24]
     372:	f8c3 2220 	str.w	r2, [r3, #544]	; 0x220
     376:	f016 0301 	ands.w	r3, r6, #1
     37a:	d038      	beq.n	0x3ee
     37c:	f44f 7288 	mov.w	r2, #272	; 0x110
     380:	4b34      	ldr	r3, [pc, #208]	; (0x454)
     382:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
     386:	2300      	movs	r3, #0
     388:	08b2      	lsrs	r2, r6, #2
     38a:	07d4      	lsls	r4, r2, #31
     38c:	d53b      	bpl.n	0x406
     38e:	f44f 7188 	mov.w	r1, #272	; 0x110
     392:	4a30      	ldr	r2, [pc, #192]	; (0x454)
     394:	6711      	str	r1, [r2, #112]	; 0x70
     396:	0932      	lsrs	r2, r6, #4
     398:	07d0      	lsls	r0, r2, #31
     39a:	d53f      	bpl.n	0x41c
     39c:	f44f 7188 	mov.w	r1, #272	; 0x110
     3a0:	4a2c      	ldr	r2, [pc, #176]	; (0x454)
     3a2:	f8c2 10c8 	str.w	r1, [r2, #200]	; 0xc8
     3a6:	09b2      	lsrs	r2, r6, #6
     3a8:	07d1      	lsls	r1, r2, #31
     3aa:	d543      	bpl.n	0x434
     3ac:	f44f 7188 	mov.w	r1, #272	; 0x110
     3b0:	4a28      	ldr	r2, [pc, #160]	; (0x454)
     3b2:	f8c2 10f8 	str.w	r1, [r2, #248]	; 0xf8
     3b6:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
     3ba:	b2f6      	uxtb	r6, r6
     3bc:	431e      	orrs	r6, r3
     3be:	960b      	str	r6, [sp, #44]	; 0x2c
     3c0:	6ca5      	ldr	r5, [r4, #72]	; 0x48
     3c2:	6ca3      	ldr	r3, [r4, #72]	; 0x48
     3c4:	4e24      	ldr	r6, [pc, #144]	; (0x458)
     3c6:	f023 4300 	bic.w	r3, r3, #2147483648	; 0x80000000
     3ca:	64a3      	str	r3, [r4, #72]	; 0x48
     3cc:	4668      	mov	r0, sp
     3ce:	f8d6 8000 	ldr.w	r8, [r6]
     3d2:	6877      	ldr	r7, [r6, #4]
     3d4:	f7ff fffe 	bl	0x3d4
     3d8:	6ca3      	ldr	r3, [r4, #72]	; 0x48
     3da:	f005 4500 	and.w	r5, r5, #2147483648	; 0x80000000
     3de:	431d      	orrs	r5, r3
     3e0:	64a5      	str	r5, [r4, #72]	; 0x48
     3e2:	f8c6 8000 	str.w	r8, [r6]
     3e6:	6077      	str	r7, [r6, #4]
     3e8:	b010      	add	sp, #64	; 0x40
     3ea:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     3ee:	f006 0203 	and.w	r2, r6, #3
     3f2:	2a02      	cmp	r2, #2
     3f4:	bf01      	itttt	eq
     3f6:	f44f 7290 	moveq.w	r2, #288	; 0x120
     3fa:	4b16      	ldreq	r3, [pc, #88]	; (0x454)
     3fc:	f8c3 2084 	streq.w	r2, [r3, #132]	; 0x84
     400:	f44f 7380 	moveq.w	r3, #256	; 0x100
     404:	e7c0      	b.n	0x388
     406:	f002 0203 	and.w	r2, r2, #3
     40a:	2a02      	cmp	r2, #2
     40c:	bf01      	itttt	eq
     40e:	f44f 7290 	moveq.w	r2, #288	; 0x120
     412:	4b10      	ldreq	r3, [pc, #64]	; (0x454)
     414:	671a      	streq	r2, [r3, #112]	; 0x70
     416:	f44f 7300 	moveq.w	r3, #512	; 0x200
     41a:	e7bc      	b.n	0x396
     41c:	f002 0203 	and.w	r2, r2, #3
     420:	2a02      	cmp	r2, #2
     422:	bf01      	itttt	eq
     424:	f44f 7290 	moveq.w	r2, #288	; 0x120
     428:	4b0a      	ldreq	r3, [pc, #40]	; (0x454)
     42a:	f8c3 20c8 	streq.w	r2, [r3, #200]	; 0xc8
     42e:	f44f 6380 	moveq.w	r3, #1024	; 0x400
     432:	e7b8      	b.n	0x3a6
     434:	f002 0203 	and.w	r2, r2, #3
     438:	2a02      	cmp	r2, #2
     43a:	bf01      	itttt	eq
     43c:	f44f 7290 	moveq.w	r2, #288	; 0x120
     440:	4b04      	ldreq	r3, [pc, #16]	; (0x454)
     442:	f8c3 20f8 	streq.w	r2, [r3, #248]	; 0xf8
     446:	f44f 6300 	moveq.w	r3, #2048	; 0x800
     44a:	e7b4      	b.n	0x3b6
     44c:	fcf4 0009 	ldc2l	0, cr0, [r4], #36	; 0x24
     450:	0040      	lsls	r0, r0, #1
     452:	8000      	strh	r0, [r0, #0]
     454:	1000      	asrs	r0, r0, #32
     456:	4000      	ands	r0, r0
     458:	e100      	b.n	0x65c
     45a:	e000      	b.n	0x45e
     45c:	f3ef 8110 	mrs	r1, PRIMASK
     460:	b672      	cpsid	i
     462:	4a04      	ldr	r2, [pc, #16]	; (0x474)
     464:	6913      	ldr	r3, [r2, #16]
     466:	f023 0304 	bic.w	r3, r3, #4
     46a:	6113      	str	r3, [r2, #16]
     46c:	bf30      	wfi
     46e:	f381 8810 	msr	PRIMASK, r1
     472:	4770      	bx	lr
     474:	ed00 e000 	stc	0, cr14, [r0, #-0]
     478:	f44f 3080 	mov.w	r0, #65536	; 0x10000
     47c:	4770      	bx	lr
     47e:	0000      	movs	r0, r0
     480:	f240 33b6 	movw	r3, #950	; 0x3b6
     484:	4298      	cmp	r0, r3
     486:	b510      	push	{r4, lr}
     488:	d925      	bls.n	0x4d6
     48a:	f5b0 7f74 	cmp.w	r0, #976	; 0x3d0
     48e:	d336      	bcc.n	0x4fe
     490:	f5b0 7f7a 	cmp.w	r0, #1000	; 0x3e8
     494:	d937      	bls.n	0x506
     496:	f240 4301 	movw	r3, #1025	; 0x401
     49a:	4298      	cmp	r0, r3
     49c:	d937      	bls.n	0x50e
     49e:	f240 431a 	movw	r3, #1050	; 0x41a
     4a2:	4298      	cmp	r0, r3
     4a4:	d937      	bls.n	0x516
     4a6:	f240 4333 	movw	r3, #1075	; 0x433
     4aa:	4298      	cmp	r0, r3
     4ac:	d937      	bls.n	0x51e
     4ae:	f240 434c 	movw	r3, #1100	; 0x44c
     4b2:	4298      	cmp	r0, r3
     4b4:	d937      	bls.n	0x526
     4b6:	f240 4365 	movw	r3, #1125	; 0x465
     4ba:	4298      	cmp	r0, r3
     4bc:	d937      	bls.n	0x52e
     4be:	f240 437e 	movw	r3, #1150	; 0x47e
     4c2:	4298      	cmp	r0, r3
     4c4:	d937      	bls.n	0x536
     4c6:	f5b0 6f93 	cmp.w	r0, #1176	; 0x498
     4ca:	bf34      	ite	cc
     4cc:	2309      	movcc	r3, #9
     4ce:	230a      	movcs	r3, #10
     4d0:	221f      	movs	r2, #31
     4d2:	211e      	movs	r1, #30
     4d4:	e002      	b.n	0x4dc
     4d6:	2300      	movs	r3, #0
     4d8:	220f      	movs	r2, #15
     4da:	210a      	movs	r1, #10
     4dc:	4c17      	ldr	r4, [pc, #92]	; (0x53c)
     4de:	69e0      	ldr	r0, [r4, #28]
     4e0:	f420 40f8 	bic.w	r0, r0, #31744	; 0x7c00
     4e4:	f020 001f 	bic.w	r0, r0, #31
     4e8:	4301      	orrs	r1, r0
     4ea:	ea41 2282 	orr.w	r2, r1, r2, lsl #10
     4ee:	61e2      	str	r2, [r4, #28]
     4f0:	6922      	ldr	r2, [r4, #16]
     4f2:	f422 12f0 	bic.w	r2, r2, #1966080	; 0x1e0000
     4f6:	ea42 4343 	orr.w	r3, r2, r3, lsl #17
     4fa:	6123      	str	r3, [r4, #16]
     4fc:	bd10      	pop	{r4, pc}
     4fe:	2301      	movs	r3, #1
     500:	2211      	movs	r2, #17
     502:	210c      	movs	r1, #12
     504:	e7ea      	b.n	0x4dc
     506:	2302      	movs	r3, #2
     508:	2213      	movs	r2, #19
     50a:	210e      	movs	r1, #14
     50c:	e7e6      	b.n	0x4dc
     50e:	2303      	movs	r3, #3
     510:	2216      	movs	r2, #22
     512:	2111      	movs	r1, #17
     514:	e7e2      	b.n	0x4dc
     516:	2304      	movs	r3, #4
     518:	2219      	movs	r2, #25
     51a:	2114      	movs	r1, #20
     51c:	e7de      	b.n	0x4dc
     51e:	2305      	movs	r3, #5
     520:	221b      	movs	r2, #27
     522:	2116      	movs	r1, #22
     524:	e7da      	b.n	0x4dc
     526:	2306      	movs	r3, #6
     528:	221d      	movs	r2, #29
     52a:	2118      	movs	r1, #24
     52c:	e7d6      	b.n	0x4dc
     52e:	2307      	movs	r3, #7
     530:	221e      	movs	r2, #30
     532:	211b      	movs	r1, #27
     534:	e7d2      	b.n	0x4dc
     536:	2308      	movs	r3, #8
     538:	e7ca      	b.n	0x4d0
     53a:	bf00      	nop
     53c:	0000      	movs	r0, r0
     53e:	4002      	ands	r2, r0
     540:	4b07      	ldr	r3, [pc, #28]	; (0x560)
     542:	4298      	cmp	r0, r3
     544:	d803      	bhi.n	0x54e
     546:	f240 404c 	movw	r0, #1100	; 0x44c
     54a:	f7ff bffe 	b.w	0x54a
     54e:	4b05      	ldr	r3, [pc, #20]	; (0x564)
     550:	4298      	cmp	r0, r3
     552:	bf94      	ite	ls
     554:	f240 407e 	movwls	r0, #1150	; 0x47e
     558:	f44f 6096 	movhi.w	r0, #1200	; 0x4b0
     55c:	e7f5      	b.n	0x54a
     55e:	bf00      	nop
     560:	e100      	b.n	0x764
     562:	05f5      	lsls	r5, r6, #23
     564:	a480      	add	r4, pc, #512	; (adr r4, 0x768)
     566:	07bf      	lsls	r7, r7, #30
     568:	4a03      	ldr	r2, [pc, #12]	; (0x578)
     56a:	6cd3      	ldr	r3, [r2, #76]	; 0x4c
     56c:	f423 137f 	bic.w	r3, r3, #4177920	; 0x3fc000
     570:	f423 537c 	bic.w	r3, r3, #16128	; 0x3f00
     574:	64d3      	str	r3, [r2, #76]	; 0x4c
     576:	4770      	bx	lr
     578:	0000      	movs	r0, r0
     57a:	4002      	ands	r2, r0
     57c:	4a09      	ldr	r2, [pc, #36]	; (0x5a4)
     57e:	f8d2 30b0 	ldr.w	r3, [r2, #176]	; 0xb0
     582:	f403 717e 	and.w	r1, r3, #1016	; 0x3f8
     586:	f5b1 7fd4 	cmp.w	r1, #424	; 0x1a8
     58a:	bf1e      	ittt	ne
     58c:	f423 737e 	bicne.w	r3, r3, #1016	; 0x3f8
     590:	f443 73d4 	orrne.w	r3, r3, #424	; 0x1a8
     594:	f8c2 30b0 	strne.w	r3, [r2, #176]	; 0xb0
     598:	f44f 1280 	mov.w	r2, #1048576	; 0x100000
     59c:	4b02      	ldr	r3, [pc, #8]	; (0x5a8)
     59e:	f8c3 20c8 	str.w	r2, [r3, #200]	; 0xc8
     5a2:	4770      	bx	lr
     5a4:	3000      	adds	r0, #0
     5a6:	4001      	ands	r1, r0
     5a8:	0000      	movs	r0, r0
     5aa:	4002      	ands	r2, r0
     5ac:	b508      	push	{r3, lr}
     5ae:	f7ff fffe 	bl	0x5ae
     5b2:	4a06      	ldr	r2, [pc, #24]	; (0x5cc)
     5b4:	6a13      	ldr	r3, [r2, #32]
     5b6:	f423 137f 	bic.w	r3, r3, #4177920	; 0x3fc000
     5ba:	f423 537c 	bic.w	r3, r3, #16128	; 0x3f00
     5be:	f443 0380 	orr.w	r3, r3, #4194304	; 0x400000
     5c2:	f043 0310 	orr.w	r3, r3, #16
     5c6:	6213      	str	r3, [r2, #32]
     5c8:	bd08      	pop	{r3, pc}
     5ca:	bf00      	nop
     5cc:	3000      	adds	r0, #0
     5ce:	4001      	ands	r1, r0
     5d0:	4a06      	ldr	r2, [pc, #24]	; (0x5ec)
     5d2:	0049      	lsls	r1, r1, #1
     5d4:	6a13      	ldr	r3, [r2, #32]
     5d6:	f001 010e 	and.w	r1, r1, #14
     5da:	f023 03ee 	bic.w	r3, r3, #238	; 0xee
     5de:	0140      	lsls	r0, r0, #5
     5e0:	4319      	orrs	r1, r3
     5e2:	b2c0      	uxtb	r0, r0
     5e4:	4308      	orrs	r0, r1
     5e6:	6210      	str	r0, [r2, #32]
     5e8:	4770      	bx	lr
     5ea:	bf00      	nop
     5ec:	3000      	adds	r0, #0
     5ee:	4001      	ands	r1, r0
     5f0:	2ff8      	cmp	r7, #248	; 0xf8
     5f2:	0000      	movs	r0, r0
     5f4:	0004      	movs	r4, r0
     5f6:	0000      	movs	r0, r0
     5f8:	0000      	movs	r0, r0
     5fa:	0104      	lsls	r4, r0, #4
     5fc:	36cf      	adds	r6, #207	; 0xcf
     5fe:	0000      	movs	r0, r0
     600:	600c      	str	r4, [r1, #0]
     602:	0010      	movs	r0, r2
     604:	0000      	movs	r0, r0
     606:	0000      	movs	r0, r0
     608:	a000      	add	r0, pc, #0	; (adr r0, 0x60c)
	...
     612:	0000      	movs	r0, r0
     614:	0200      	lsls	r0, r0, #8
     616:	0708      	lsls	r0, r1, #28
     618:	309a      	adds	r0, #154	; 0x9a
     61a:	0000      	movs	r0, r0
     61c:	0102      	lsls	r2, r0, #4
     61e:	ca08      	ldmia	r2!, {r3}
     620:	000f      	movs	r7, r1
     622:	0300      	lsls	r0, r0, #12
     624:	0504      	lsls	r4, r0, #20
     626:	6e69      	ldr	r1, [r5, #100]	; 0x64
     628:	0074      	lsls	r4, r6, #1
     62a:	0402      	lsls	r2, r0, #16
     62c:	3905      	subs	r1, #5
     62e:	0023      	movs	r3, r4
     630:	0200      	lsls	r0, r0, #8
     632:	0704      	lsls	r4, r0, #28
     634:	37d0      	adds	r7, #208	; 0xd0
     636:	0000      	movs	r0, r0
     638:	6e04      	ldr	r4, [r0, #96]	; 0x60
     63a:	001b      	movs	r3, r3
     63c:	0400      	lsls	r0, r0, #16
     63e:	33a9      	adds	r3, #169	; 0xa9
     640:	0000      	movs	r0, r0
     642:	0200      	lsls	r0, r0, #8
     644:	0408      	lsls	r0, r1, #16
     646:	2ce7      	cmp	r4, #231	; 0xe7
     648:	0000      	movs	r0, r0
     64a:	bc05      	pop	{r0, r2}
     64c:	0018      	movs	r0, r3
     64e:	0400      	lsls	r0, r0, #16
     650:	014b      	lsls	r3, r1, #5
     652:	0033      	movs	r3, r6
     654:	0000      	movs	r0, r0
     656:	7106      	strb	r6, [r0, #4]
     658:	0000      	movs	r0, r0
     65a:	7100      	strb	r0, [r0, #4]
     65c:	0000      	movs	r0, r0
     65e:	0700      	lsls	r0, r0, #28
     660:	0800      	lsrs	r0, r0, #32
     662:	7704      	strb	r4, [r0, #28]
     664:	0000      	movs	r0, r0
     666:	0900      	lsrs	r0, r0, #4
     668:	8705      	strh	r5, [r0, #56]	; 0x38
     66a:	0012      	movs	r2, r2
     66c:	0400      	lsls	r0, r0, #16
     66e:	014c      	lsls	r4, r1, #5
     670:	0066      	lsls	r6, r4, #1
     672:	0000      	movs	r0, r0
     674:	0102      	lsls	r2, r0, #4
     676:	1106      	asrs	r6, r0, #4
     678:	001f      	movs	r7, r3
     67a:	0a00      	lsrs	r0, r0, #8
     67c:	161b      	asrs	r3, r3, #24
     67e:	0000      	movs	r0, r0
     680:	1d05      	adds	r5, r0, #4
     682:	002c      	movs	r4, r5
     684:	0000      	movs	r0, r0
     686:	8b0b      	ldrh	r3, [r1, #24]
     688:	0000      	movs	r0, r0
     68a:	0200      	lsls	r0, r0, #8
     68c:	0502      	lsls	r2, r0, #20
     68e:	3879      	subs	r0, #121	; 0x79
     690:	0000      	movs	r0, r0
     692:	0202      	lsls	r2, r0, #8
     694:	ec07 001e 	stc	0, cr0, [r7], {30}
     698:	0a00      	lsrs	r0, r0, #8
     69a:	0748      	lsls	r0, r1, #29
     69c:	0000      	movs	r0, r0
     69e:	9105      	str	r1, [sp, #20]
     6a0:	0033      	movs	r3, r6
     6a2:	0000      	movs	r0, r0
     6a4:	a90b      	add	r1, sp, #44	; 0x2c
     6a6:	0000      	movs	r0, r0
     6a8:	0a00      	lsrs	r0, r0, #8
     6aa:	261c      	movs	r6, #28
     6ac:	0000      	movs	r0, r0
     6ae:	9205      	str	r2, [sp, #20]
     6b0:	0041      	lsls	r1, r0, #1
     6b2:	0000      	movs	r0, r0
     6b4:	b90b      	cbnz	r3, 0x6ba
     6b6:	0000      	movs	r0, r0
     6b8:	0c00      	lsrs	r0, r0, #16
     6ba:	00c4      	lsls	r4, r0, #3
     6bc:	0000      	movs	r0, r0
     6be:	b90c      	cbnz	r4, 0x6c4
     6c0:	0000      	movs	r0, r0
     6c2:	0200      	lsls	r0, r0, #8
     6c4:	0508      	lsls	r0, r1, #20
     6c6:	33d9      	adds	r3, #217	; 0xd9
     6c8:	0000      	movs	r0, r0
     6ca:	c80a      	ldmia	r0!, {r1, r3}
     6cc:	0011      	movs	r1, r2
     6ce:	0500      	lsls	r0, r0, #20
     6d0:	25c6      	movs	r5, #198	; 0xc6
     6d2:	0000      	movs	r0, r0
     6d4:	0b00      	lsrs	r0, r0, #12
     6d6:	00da      	lsls	r2, r3, #3
     6d8:	0000      	movs	r0, r0
     6da:	040d      	lsls	r5, r1, #16
     6dc:	060e      	lsls	r6, r1, #24
     6de:	01cd      	lsls	r5, r1, #7
     6e0:	01c3      	lsls	r3, r0, #7
     6e2:	0000      	movs	r0, r0
     6e4:	250e      	movs	r5, #14
     6e6:	0026      	movs	r6, r4
     6e8:	0600      	lsls	r0, r0, #24
     6ea:	01cf      	lsls	r7, r1, #7
     6ec:	01d3      	lsls	r3, r2, #7
     6ee:	0000      	movs	r0, r0
     6f0:	0e00      	lsrs	r0, r0, #24
     6f2:	2f31      	cmp	r7, #49	; 0x31
     6f4:	0000      	movs	r0, r0
     6f6:	d006      	beq.n	0x706
     6f8:	d801      	bhi.n	0x6fe
     6fa:	0001      	movs	r1, r0
     6fc:	4000      	ands	r0, r0
     6fe:	490e      	ldr	r1, [pc, #56]	; (0x738)
     700:	0006      	movs	r6, r0
     702:	0600      	lsls	r0, r0, #24
     704:	01d1      	lsls	r1, r2, #7
     706:	01d3      	lsls	r3, r2, #7
     708:	0000      	movs	r0, r0
     70a:	0e80      	lsrs	r0, r0, #26
     70c:	03c5      	lsls	r5, r0, #15
     70e:	0000      	movs	r0, r0
     710:	d206      	bcs.n	0x720
     712:	d801      	bhi.n	0x718
     714:	0001      	movs	r1, r0
     716:	c000      	stmia	r0!, {}
     718:	fd0f 002f 	stc2	0, cr0, [pc, #-188]	; 0x660
     71c:	0600      	lsls	r0, r0, #24
     71e:	01d3      	lsls	r3, r2, #7
     720:	01d3      	lsls	r3, r2, #7
     722:	0000      	movs	r0, r0
     724:	0100      	lsls	r0, r0, #4
     726:	3b0f      	subs	r3, #15
     728:	002f      	movs	r7, r5
     72a:	0600      	lsls	r0, r0, #24
     72c:	01d4      	lsls	r4, r2, #7
     72e:	01d8      	lsls	r0, r3, #7
     730:	0000      	movs	r0, r0
     732:	0140      	lsls	r0, r0, #5
     734:	910f      	str	r1, [sp, #60]	; 0x3c
     736:	0011      	movs	r1, r2
     738:	0600      	lsls	r0, r0, #24
     73a:	01d5      	lsls	r5, r2, #7
     73c:	01d3      	lsls	r3, r2, #7
     73e:	0000      	movs	r0, r0
     740:	0180      	lsls	r0, r0, #6
     742:	450f      	cmp	r7, r1
     744:	002f      	movs	r7, r5
     746:	0600      	lsls	r0, r0, #24
     748:	01d6      	lsls	r6, r2, #7
     74a:	01d8      	lsls	r0, r3, #7
     74c:	0000      	movs	r0, r0
     74e:	01c0      	lsls	r0, r0, #7
     750:	d90f      	bls.n	0x772
     752:	0031      	movs	r1, r6
     754:	0600      	lsls	r0, r0, #24
     756:	01d7      	lsls	r7, r2, #7
     758:	01d3      	lsls	r3, r2, #7
     75a:	0000      	movs	r0, r0
     75c:	0200      	lsls	r0, r0, #8
     75e:	4f0f      	ldr	r7, [pc, #60]	; (0x79c)
     760:	002f      	movs	r7, r5
     762:	0600      	lsls	r0, r0, #24
     764:	01d8      	lsls	r0, r3, #7
     766:	01d8      	lsls	r0, r3, #7
     768:	0000      	movs	r0, r0
     76a:	0240      	lsls	r0, r0, #9
     76c:	190f      	adds	r7, r1, r4
     76e:	0033      	movs	r3, r6
     770:	0600      	lsls	r0, r0, #24
     772:	01d9      	lsls	r1, r3, #7
     774:	01d3      	lsls	r3, r2, #7
     776:	0000      	movs	r0, r0
     778:	0280      	lsls	r0, r0, #10
     77a:	590f      	ldr	r7, [r1, r4]
     77c:	002f      	movs	r7, r5
     77e:	0600      	lsls	r0, r0, #24
     780:	01da      	lsls	r2, r3, #7
     782:	01d8      	lsls	r0, r3, #7
     784:	0000      	movs	r0, r0
     786:	02c0      	lsls	r0, r0, #11
     788:	4910      	ldr	r1, [pc, #64]	; (0x7cc)
     78a:	5250      	strh	r0, [r2, r1]
     78c:	0600      	lsls	r0, r0, #24
     78e:	01db      	lsls	r3, r3, #7
     790:	01f9      	lsls	r1, r7, #7
     792:	0000      	movs	r0, r0
     794:	0300      	lsls	r0, r0, #12
     796:	630f      	str	r7, [r1, #48]	; 0x30
     798:	002f      	movs	r7, r5
     79a:	0600      	lsls	r0, r0, #24
     79c:	01dc      	lsls	r4, r3, #7
     79e:	01fe      	lsls	r6, r7, #7
     7a0:	0000      	movs	r0, r0
     7a2:	04f0      	lsls	r0, r6, #19
     7a4:	f80f 0024 	strb.w	r0, [pc, #-36]	; 0x784
     7a8:	0600      	lsls	r0, r0, #24
     7aa:	01dd      	lsls	r5, r3, #7
     7ac:	00c4      	lsls	r4, r0, #3
     7ae:	0000      	movs	r0, r0
     7b0:	0e00      	lsrs	r0, r0, #24
     7b2:	0600      	lsls	r0, r0, #24
     7b4:	00c4      	lsls	r4, r0, #3
     7b6:	0000      	movs	r0, r0
     7b8:	01d3      	lsls	r3, r2, #7
     7ba:	0000      	movs	r0, r0
     7bc:	4111      	asrs	r1, r2
     7be:	0000      	movs	r0, r0
     7c0:	0f00      	lsrs	r0, r0, #28
     7c2:	0b00      	lsrs	r0, r0, #12
     7c4:	01c3      	lsls	r3, r0, #7
     7c6:	0000      	movs	r0, r0
     7c8:	b906      	cbnz	r6, 0x7cc
     7ca:	0000      	movs	r0, r0
     7cc:	e800 0001 			; <UNDEFINED> instruction: 0xe8000001
     7d0:	1100      	asrs	r0, r0, #4
     7d2:	0041      	lsls	r1, r0, #1
     7d4:	0000      	movs	r0, r0
     7d6:	000f      	movs	r7, r1
     7d8:	9606      	str	r6, [sp, #24]
     7da:	0000      	movs	r0, r0
     7dc:	f900 0001 	vst4.8	{d0-d3}, [r0], r1
     7e0:	1200      	asrs	r0, r0, #8
     7e2:	0041      	lsls	r1, r0, #1
     7e4:	0000      	movs	r0, r0
     7e6:	01ef      	lsls	r7, r5, #7
     7e8:	0b00      	lsrs	r0, r0, #12
     7ea:	01e8      	lsls	r0, r5, #7
     7ec:	0000      	movs	r0, r0
     7ee:	b906      	cbnz	r6, 0x7f2
     7f0:	0000      	movs	r0, r0
     7f2:	0f00      	lsrs	r0, r0, #28
     7f4:	0002      	movs	r2, r0
     7f6:	1200      	asrs	r0, r0, #8
     7f8:	0041      	lsls	r1, r0, #1
     7fa:	0000      	movs	r0, r0
     7fc:	0243      	lsls	r3, r0, #9
     7fe:	1300      	asrs	r0, r0, #12
     800:	1823      	adds	r3, r4, r0
     802:	0000      	movs	r0, r0
     804:	de06      	udf	#6
     806:	ea01 0000 	and.w	r0, r1, r0
     80a:	0d00      	lsrs	r0, r0, #20
     80c:	02ac      	lsls	r4, r5, #10
     80e:	f106 c801 			; <UNDEFINED> instruction: 0xf106c801
     812:	0004      	movs	r4, r0
     814:	0e00      	lsrs	r0, r0, #24
     816:	3232      	adds	r2, #50	; 0x32
     818:	0000      	movs	r0, r0
     81a:	f306 c901 			; <UNDEFINED> instruction: 0xf306c901
     81e:	0000      	movs	r0, r0
     820:	0000      	movs	r0, r0
     822:	670e      	str	r6, [r1, #112]	; 0x70
     824:	0014      	movs	r4, r2
     826:	0600      	lsls	r0, r0, #24
     828:	01f4      	lsls	r4, r6, #7
     82a:	00c4      	lsls	r4, r0, #3
     82c:	0000      	movs	r0, r0
     82e:	0e04      	lsrs	r4, r0, #24
     830:	0b83      	lsrs	r3, r0, #14
     832:	0000      	movs	r0, r0
     834:	f506 c401 			; <UNDEFINED> instruction: 0xf506c401
     838:	0000      	movs	r0, r0
     83a:	0800      	lsrs	r0, r0, #32
     83c:	e80e 001b 			; <UNDEFINED> instruction: 0xe80e001b
     840:	0600      	lsls	r0, r0, #24
     842:	01f6      	lsls	r6, r6, #7
     844:	00c4      	lsls	r4, r0, #3
     846:	0000      	movs	r0, r0
     848:	140c      	asrs	r4, r1, #16
     84a:	4353      	muls	r3, r2
     84c:	0052      	lsls	r2, r2, #1
     84e:	f706 c401 			; <UNDEFINED> instruction: 0xf706c401
     852:	0000      	movs	r0, r0
     854:	1000      	asrs	r0, r0, #32
     856:	4314      	orrs	r4, r2
     858:	5243      	strh	r3, [r0, r1]
     85a:	0600      	lsls	r0, r0, #24
     85c:	01f8      	lsls	r0, r7, #7
     85e:	00c4      	lsls	r4, r0, #3
     860:	0000      	movs	r0, r0
     862:	0e14      	lsrs	r4, r2, #24
     864:	21e4      	movs	r1, #228	; 0xe4
     866:	0000      	movs	r0, r0
     868:	f906 d801 	vst2.8	{d13-d14}, [r6], r1
     86c:	0004      	movs	r4, r0
     86e:	1800      	adds	r0, r0, r0
     870:	670e      	str	r6, [r1, #112]	; 0x70
     872:	001a      	movs	r2, r3
     874:	0600      	lsls	r0, r0, #24
     876:	01fa      	lsls	r2, r7, #7
     878:	00c4      	lsls	r4, r0, #3
     87a:	0000      	movs	r0, r0
     87c:	0e24      	lsrs	r4, r4, #24
     87e:	29e2      	cmp	r1, #226	; 0xe2
     880:	0000      	movs	r0, r0
     882:	fb06 c401 	mla	r4, r6, r1, ip
     886:	0000      	movs	r0, r0
     888:	2800      	cmp	r0, #0
     88a:	a10e      	add	r1, pc, #56	; (adr r1, 0x8c4)
     88c:	0008      	movs	r0, r1
     88e:	0600      	lsls	r0, r0, #24
     890:	01fc      	lsls	r4, r7, #7
     892:	00c4      	lsls	r4, r0, #3
     894:	0000      	movs	r0, r0
     896:	0e2c      	lsrs	r4, r5, #24
     898:	0d83      	lsrs	r3, r0, #22
     89a:	0000      	movs	r0, r0
     89c:	fd06 c401 	stc2	4, cr12, [r6, #-4]
     8a0:	0000      	movs	r0, r0
     8a2:	3000      	adds	r0, #0
     8a4:	310e      	adds	r1, #14
     8a6:	0038      	movs	r0, r7
     8a8:	0600      	lsls	r0, r0, #24
     8aa:	01fe      	lsls	r6, r7, #7
     8ac:	00c4      	lsls	r4, r0, #3
     8ae:	0000      	movs	r0, r0
     8b0:	0e34      	lsrs	r4, r6, #24
     8b2:	35ba      	adds	r5, #186	; 0xba
     8b4:	0000      	movs	r0, r0
     8b6:	ff06 c401 	vshl.u8	d12, d1, d6
     8ba:	0000      	movs	r0, r0
     8bc:	3800      	subs	r0, #0
     8be:	7a0e      	ldrb	r6, [r1, #8]
     8c0:	002c      	movs	r4, r5
     8c2:	0600      	lsls	r0, r0, #24
     8c4:	0200      	lsls	r0, r0, #8
     8c6:	00c4      	lsls	r4, r0, #3
     8c8:	0000      	movs	r0, r0
     8ca:	0e3c      	lsrs	r4, r7, #24
     8cc:	0e66      	lsrs	r6, r4, #25
     8ce:	0000      	movs	r0, r0
     8d0:	0106      	lsls	r6, r0, #4
     8d2:	f202 0004 	addw	r0, r2, #4
     8d6:	4000      	ands	r0, r0
     8d8:	670e      	str	r6, [r1, #112]	; 0x70
     8da:	0003      	movs	r3, r0
     8dc:	0600      	lsls	r0, r0, #24
     8de:	0202      	lsls	r2, r0, #8
     8e0:	00c9      	lsls	r1, r1, #3
     8e2:	0000      	movs	r0, r0
     8e4:	0e48      	lsrs	r0, r1, #25
     8e6:	2a9d      	cmp	r2, #157	; 0x9d
     8e8:	0000      	movs	r0, r0
     8ea:	0306      	lsls	r6, r0, #12
     8ec:	c902      	ldmia	r1, {r1}
     8ee:	0000      	movs	r0, r0
     8f0:	4c00      	ldr	r4, [pc, #0]	; (0x8f4)
     8f2:	fb0e 001c 	mls	r0, lr, ip, r0
     8f6:	0600      	lsls	r0, r0, #24
     8f8:	0204      	lsls	r4, r0, #8
     8fa:	050c      	lsls	r4, r1, #20
     8fc:	0000      	movs	r0, r0
     8fe:	0e50      	lsrs	r0, r2, #25
     900:	0497      	lsls	r7, r2, #18
     902:	0000      	movs	r0, r0
     904:	0506      	lsls	r6, r0, #20
     906:	2602      	movs	r6, #2
     908:	0005      	movs	r5, r0
     90a:	6000      	str	r0, [r0, #0]
     90c:	370e      	adds	r7, #14
     90e:	0029      	movs	r1, r5
     910:	0600      	lsls	r0, r0, #24
     912:	0206      	lsls	r6, r0, #8
     914:	00c9      	lsls	r1, r1, #3
     916:	0000      	movs	r0, r0
     918:	1478      	asrs	r0, r7, #17
     91a:	5443      	strb	r3, [r0, r1]
     91c:	0052      	lsls	r2, r2, #1
     91e:	0706      	lsls	r6, r0, #28
     920:	c902      	ldmia	r1, {r1}
     922:	0000      	movs	r0, r0
     924:	7c00      	ldrb	r0, [r0, #16]
     926:	8d0e      	ldrh	r6, [r1, #40]	; 0x28
     928:	0023      	movs	r3, r4
     92a:	0600      	lsls	r0, r0, #24
     92c:	0208      	lsls	r0, r1, #8
     92e:	00c9      	lsls	r1, r1, #3
     930:	0000      	movs	r0, r0
     932:	0e80      	lsrs	r0, r0, #26
     934:	16b2      	asrs	r2, r6, #26
     936:	0000      	movs	r0, r0
     938:	0906      	lsrs	r6, r0, #4
     93a:	c402      	stmia	r4!, {r1}
     93c:	0000      	movs	r0, r0
     93e:	8400      	strh	r0, [r0, #32]
     940:	6c0e      	ldr	r6, [r1, #64]	; 0x40
     942:	0030      	movs	r0, r6
     944:	0600      	lsls	r0, r0, #24
     946:	020a      	lsls	r2, r1, #8
     948:	00c4      	lsls	r4, r0, #3
     94a:	0000      	movs	r0, r0
     94c:	0e88      	lsrs	r0, r1, #26
     94e:	2a7f      	cmp	r2, #127	; 0x7f
     950:	0000      	movs	r0, r0
     952:	0b06      	lsrs	r6, r0, #12
     954:	c402      	stmia	r4!, {r1}
     956:	0000      	movs	r0, r0
     958:	8c00      	ldrh	r0, [r0, #32]
     95a:	450e      	cmp	r6, r1
     95c:	002f      	movs	r7, r5
     95e:	0600      	lsls	r0, r0, #24
     960:	020c      	lsls	r4, r1, #8
     962:	052b      	lsls	r3, r5, #20
     964:	0000      	movs	r0, r0
     966:	0f90      	lsrs	r0, r2, #30
     968:	24f8      	movs	r4, #248	; 0xf8
     96a:	0000      	movs	r0, r0
     96c:	0d06      	lsrs	r6, r0, #20
     96e:	c402      	stmia	r4!, {r1}
     970:	0000      	movs	r0, r0
     972:	0000      	movs	r0, r0
     974:	0f02      	lsrs	r2, r0, #28
     976:	2f4f      	cmp	r7, #79	; 0x4f
     978:	0000      	movs	r0, r0
     97a:	0e06      	lsrs	r6, r0, #24
     97c:	3b02      	subs	r3, #2
     97e:	0005      	movs	r5, r0
     980:	0400      	lsls	r0, r0, #16
     982:	0f02      	lsrs	r2, r0, #28
     984:	2204      	movs	r2, #4
     986:	0000      	movs	r0, r0
     988:	0f06      	lsrs	r6, r0, #28
     98a:	c902      	ldmia	r1, {r1}
     98c:	0000      	movs	r0, r0
     98e:	4000      	ands	r0, r0
     990:	0f02      	lsrs	r2, r0, #28
     992:	220a      	movs	r2, #10
     994:	0000      	movs	r0, r0
     996:	1006      	asrs	r6, r0, #32
     998:	c902      	ldmia	r1, {r1}
     99a:	0000      	movs	r0, r0
     99c:	4400      	add	r0, r0
     99e:	0f02      	lsrs	r2, r0, #28
     9a0:	2210      	movs	r2, #16
     9a2:	0000      	movs	r0, r0
     9a4:	1106      	asrs	r6, r0, #4
     9a6:	c902      	ldmia	r1, {r1}
     9a8:	0000      	movs	r0, r0
     9aa:	4800      	ldr	r0, [pc, #0]	; (0x9ac)
     9ac:	0f02      	lsrs	r2, r0, #28
     9ae:	2f59      	cmp	r7, #89	; 0x59
     9b0:	0000      	movs	r0, r0
     9b2:	1206      	asrs	r6, r0, #8
     9b4:	4b02      	ldr	r3, [pc, #8]	; (0x9c0)
     9b6:	0005      	movs	r5, r0
     9b8:	4c00      	ldr	r4, [pc, #0]	; (0x9bc)
     9ba:	0f02      	lsrs	r2, r0, #28
     9bc:	185f      	adds	r7, r3, r1
     9be:	0000      	movs	r0, r0
     9c0:	1306      	asrs	r6, r0, #12
     9c2:	c402      	stmia	r4!, {r1}
     9c4:	0000      	movs	r0, r0
     9c6:	5000      	str	r0, [r0, r0]
     9c8:	0f02      	lsrs	r2, r0, #28
     9ca:	2f63      	cmp	r7, #99	; 0x63
     9cc:	0000      	movs	r0, r0
     9ce:	1406      	asrs	r6, r0, #16
     9d0:	4b02      	ldr	r3, [pc, #8]	; (0x9dc)
     9d2:	0005      	movs	r5, r0
     9d4:	5400      	strb	r0, [r0, r0]
     9d6:	0f02      	lsrs	r2, r0, #28
     9d8:	3883      	subs	r0, #131	; 0x83
     9da:	0000      	movs	r0, r0
     9dc:	1506      	asrs	r6, r0, #20
     9de:	c402      	stmia	r4!, {r1}
     9e0:	0000      	movs	r0, r0
     9e2:	5800      	ldr	r0, [r0, r0]
     9e4:	0f02      	lsrs	r2, r0, #28
     9e6:	343d      	adds	r4, #61	; 0x3d
     9e8:	0000      	movs	r0, r0
     9ea:	1606      	asrs	r6, r0, #24
     9ec:	c402      	stmia	r4!, {r1}
     9ee:	0000      	movs	r0, r0
     9f0:	5c00      	ldrb	r0, [r0, r0]
     9f2:	0f02      	lsrs	r2, r0, #28
     9f4:	346c      	adds	r4, #108	; 0x6c
     9f6:	0000      	movs	r0, r0
     9f8:	1706      	asrs	r6, r0, #28
     9fa:	c402      	stmia	r4!, {r1}
     9fc:	0000      	movs	r0, r0
     9fe:	6000      	str	r0, [r0, #0]
     a00:	0f02      	lsrs	r2, r0, #28
     a02:	023b      	lsls	r3, r7, #8
     a04:	0000      	movs	r0, r0
     a06:	1806      	adds	r6, r0, r0
     a08:	c402      	stmia	r4!, {r1}
     a0a:	0000      	movs	r0, r0
     a0c:	6400      	str	r0, [r0, #64]	; 0x40
     a0e:	0f02      	lsrs	r2, r0, #28
     a10:	01f1      	lsls	r1, r6, #7
     a12:	0000      	movs	r0, r0
     a14:	1906      	adds	r6, r0, r4
     a16:	c402      	stmia	r4!, {r1}
     a18:	0000      	movs	r0, r0
     a1a:	6800      	ldr	r0, [r0, #0]
     a1c:	0f02      	lsrs	r2, r0, #28
     a1e:	1560      	asrs	r0, r4, #21
     a20:	0000      	movs	r0, r0
     a22:	1a06      	subs	r6, r0, r0
     a24:	c402      	stmia	r4!, {r1}
     a26:	0000      	movs	r0, r0
     a28:	6c00      	ldr	r0, [r0, #64]	; 0x40
     a2a:	0f02      	lsrs	r2, r0, #28
     a2c:	1ca0      	adds	r0, r4, #2
     a2e:	0000      	movs	r0, r0
     a30:	1b06      	subs	r6, r0, r4
     a32:	c402      	stmia	r4!, {r1}
     a34:	0000      	movs	r0, r0
     a36:	7000      	strb	r0, [r0, #0]
     a38:	0f02      	lsrs	r2, r0, #28
     a3a:	08a6      	lsrs	r6, r4, #2
     a3c:	0000      	movs	r0, r0
     a3e:	1c06      	adds	r6, r0, #0
     a40:	c402      	stmia	r4!, {r1}
     a42:	0000      	movs	r0, r0
     a44:	7400      	strb	r0, [r0, #16]
     a46:	0f02      	lsrs	r2, r0, #28
     a48:	2f6d      	cmp	r7, #109	; 0x6d
     a4a:	0000      	movs	r0, r0
     a4c:	1d06      	adds	r6, r0, #4
     a4e:	5b02      	ldrh	r2, [r0, r4]
     a50:	0005      	movs	r5, r0
     a52:	7800      	ldrb	r0, [r0, #0]
     a54:	0f02      	lsrs	r2, r0, #28
     a56:	17a0      	asrs	r0, r4, #30
     a58:	0000      	movs	r0, r0
     a5a:	1e06      	subs	r6, r0, #0
     a5c:	c402      	stmia	r4!, {r1}
     a5e:	0000      	movs	r0, r0
     a60:	9000      	str	r0, [sp, #0]
     a62:	0f02      	lsrs	r2, r0, #28
     a64:	21e9      	movs	r1, #233	; 0xe9
     a66:	0000      	movs	r0, r0
     a68:	1f06      	subs	r6, r0, #4
     a6a:	c402      	stmia	r4!, {r1}
     a6c:	0000      	movs	r0, r0
     a6e:	9400      	str	r4, [sp, #0]
     a70:	0f02      	lsrs	r2, r0, #28
     a72:	0f55      	lsrs	r5, r2, #29
     a74:	0000      	movs	r0, r0
     a76:	2006      	movs	r0, #6
     a78:	c402      	stmia	r4!, {r1}
     a7a:	0000      	movs	r0, r0
     a7c:	9800      	ldr	r0, [sp, #0]
     a7e:	0f02      	lsrs	r2, r0, #28
     a80:	3837      	subs	r0, #55	; 0x37
     a82:	0000      	movs	r0, r0
     a84:	2106      	movs	r1, #6
     a86:	c402      	stmia	r4!, {r1}
     a88:	0000      	movs	r0, r0
     a8a:	9c00      	ldr	r4, [sp, #0]
     a8c:	0f02      	lsrs	r2, r0, #28
     a8e:	1e3f      	subs	r7, r7, #0
     a90:	0000      	movs	r0, r0
     a92:	2206      	movs	r2, #6
     a94:	c402      	stmia	r4!, {r1}
     a96:	0000      	movs	r0, r0
     a98:	a000      	add	r0, pc, #0	; (adr r0, 0xa9c)
     a9a:	0f02      	lsrs	r2, r0, #28
     a9c:	2f77      	cmp	r7, #119	; 0x77
     a9e:	0000      	movs	r0, r0
     aa0:	2306      	movs	r3, #6
     aa2:	4b02      	ldr	r3, [pc, #8]	; (0xaac)
     aa4:	0005      	movs	r5, r0
     aa6:	a400      	add	r4, pc, #0	; (adr r4, 0xaa8)
     aa8:	0f02      	lsrs	r2, r0, #28
     aaa:	0d96      	lsrs	r6, r2, #22
     aac:	0000      	movs	r0, r0
     aae:	2406      	movs	r4, #6
     ab0:	c402      	stmia	r4!, {r1}
     ab2:	0000      	movs	r0, r0
     ab4:	a800      	add	r0, sp, #0
     ab6:	0002      	movs	r2, r0
     ab8:	9606      	str	r6, [sp, #24]
     aba:	0000      	movs	r0, r0
     abc:	d800      	bhi.n	0xac0
     abe:	0004      	movs	r4, r0
     ac0:	1100      	asrs	r0, r0, #4
     ac2:	0041      	lsls	r1, r0, #1
     ac4:	0000      	movs	r0, r0
     ac6:	000b      	movs	r3, r1
     ac8:	c80b      	ldmia	r0, {r0, r1, r3}
     aca:	0004      	movs	r4, r0
     acc:	0600      	lsls	r0, r0, #24
     ace:	00c9      	lsls	r1, r1, #3
     ad0:	0000      	movs	r0, r0
     ad2:	04ed      	lsls	r5, r5, #19
     ad4:	0000      	movs	r0, r0
     ad6:	4111      	asrs	r1, r2
     ad8:	0000      	movs	r0, r0
     ada:	0100      	lsls	r0, r0, #4
     adc:	0c00      	lsrs	r0, r0, #16
     ade:	04dd      	lsls	r5, r3, #19
     ae0:	0000      	movs	r0, r0
     ae2:	ed0b 0004 	stc	0, cr0, [fp, #-16]
     ae6:	0600      	lsls	r0, r0, #24
     ae8:	00c9      	lsls	r1, r1, #3
     aea:	0000      	movs	r0, r0
     aec:	0507      	lsls	r7, r0, #20
     aee:	0000      	movs	r0, r0
     af0:	4111      	asrs	r1, r2
     af2:	0000      	movs	r0, r0
     af4:	0300      	lsls	r0, r0, #12
     af6:	0c00      	lsrs	r0, r0, #16
     af8:	04f7      	lsls	r7, r6, #19
     afa:	0000      	movs	r0, r0
     afc:	070b      	lsls	r3, r1, #28
     afe:	0005      	movs	r5, r0
     b00:	0600      	lsls	r0, r0, #24
     b02:	00c9      	lsls	r1, r1, #3
     b04:	0000      	movs	r0, r0
     b06:	0521      	lsls	r1, r4, #20
     b08:	0000      	movs	r0, r0
     b0a:	4111      	asrs	r1, r2
     b0c:	0000      	movs	r0, r0
     b0e:	0500      	lsls	r0, r0, #20
     b10:	0c00      	lsrs	r0, r0, #16
     b12:	0511      	lsls	r1, r2, #20
     b14:	0000      	movs	r0, r0
     b16:	210b      	movs	r1, #11
     b18:	0005      	movs	r5, r0
     b1a:	0600      	lsls	r0, r0, #24
     b1c:	00b9      	lsls	r1, r7, #2
     b1e:	0000      	movs	r0, r0
     b20:	053b      	lsls	r3, r7, #20
     b22:	0000      	movs	r0, r0
     b24:	4111      	asrs	r1, r2
     b26:	0000      	movs	r0, r0
     b28:	5b00      	ldrh	r0, [r0, r4]
     b2a:	0600      	lsls	r0, r0, #24
     b2c:	00b9      	lsls	r1, r7, #2
     b2e:	0000      	movs	r0, r0
     b30:	054b      	lsls	r3, r1, #21
     b32:	0000      	movs	r0, r0
     b34:	4111      	asrs	r1, r2
     b36:	0000      	movs	r0, r0
     b38:	0e00      	lsrs	r0, r0, #24
     b3a:	0600      	lsls	r0, r0, #24
     b3c:	00b9      	lsls	r1, r7, #2
     b3e:	0000      	movs	r0, r0
     b40:	055b      	lsls	r3, r3, #21
     b42:	0000      	movs	r0, r0
     b44:	4111      	asrs	r1, r2
     b46:	0000      	movs	r0, r0
     b48:	0000      	movs	r0, r0
     b4a:	0600      	lsls	r0, r0, #24
     b4c:	00b9      	lsls	r1, r7, #2
     b4e:	0000      	movs	r0, r0
     b50:	056b      	lsls	r3, r5, #21
     b52:	0000      	movs	r0, r0
     b54:	4111      	asrs	r1, r2
     b56:	0000      	movs	r0, r0
     b58:	0500      	lsls	r0, r0, #20
     b5a:	1300      	asrs	r0, r0, #12
     b5c:	29bd      	cmp	r1, #189	; 0xbd
     b5e:	0000      	movs	r0, r0
     b60:	2506      	movs	r5, #6
     b62:	1b02      	subs	r2, r0, r4
     b64:	0002      	movs	r2, r0
     b66:	0600      	lsls	r0, r0, #24
     b68:	00c4      	lsls	r4, r0, #3
     b6a:	0000      	movs	r0, r0
     b6c:	0587      	lsls	r7, r0, #22
     b6e:	0000      	movs	r0, r0
     b70:	4111      	asrs	r1, r2
     b72:	0000      	movs	r0, r0
     b74:	0100      	lsls	r0, r0, #4
     b76:	0b00      	lsrs	r0, r0, #12
     b78:	0577      	lsls	r7, r6, #21
     b7a:	0000      	movs	r0, r0
     b7c:	7205      	strb	r5, [r0, #8]
     b7e:	0030      	movs	r0, r6
     b80:	0600      	lsls	r0, r0, #24
     b82:	0b46      	lsrs	r6, r0, #13
     b84:	00b4      	lsls	r4, r6, #2
     b86:	0000      	movs	r0, r0
     b88:	1404      	asrs	r4, r0, #16
     b8a:	0021      	movs	r1, r4
     b8c:	0700      	lsls	r0, r0, #28
     b8e:	b94a      	cbnz	r2, 0xba4
     b90:	0000      	movs	r0, r0
     b92:	0600      	lsls	r0, r0, #24
     b94:	008b      	lsls	r3, r1, #2
     b96:	0000      	movs	r0, r0
     b98:	05b3      	lsls	r3, r6, #22
     b9a:	0000      	movs	r0, r0
     b9c:	4111      	asrs	r1, r2
     b9e:	0000      	movs	r0, r0
     ba0:	0700      	lsls	r0, r0, #28
     ba2:	0600      	lsls	r0, r0, #24
     ba4:	008b      	lsls	r3, r1, #2
     ba6:	0000      	movs	r0, r0
     ba8:	05c3      	lsls	r3, r0, #23
     baa:	0000      	movs	r0, r0
     bac:	4111      	asrs	r1, r2
     bae:	0000      	movs	r0, r0
     bb0:	0b00      	lsrs	r0, r0, #12
     bb2:	0600      	lsls	r0, r0, #24
     bb4:	008b      	lsls	r3, r1, #2
     bb6:	0000      	movs	r0, r0
     bb8:	05d3      	lsls	r3, r2, #23
     bba:	0000      	movs	r0, r0
     bbc:	4111      	asrs	r1, r2
     bbe:	0000      	movs	r0, r0
     bc0:	0300      	lsls	r0, r0, #12
     bc2:	0600      	lsls	r0, r0, #24
     bc4:	008b      	lsls	r3, r1, #2
     bc6:	0000      	movs	r0, r0
     bc8:	05e3      	lsls	r3, r4, #23
     bca:	0000      	movs	r0, r0
     bcc:	4111      	asrs	r1, r2
     bce:	0000      	movs	r0, r0
     bd0:	ef00 0600 	vmax.s8	d0, d0, d0
     bd4:	008b      	lsls	r3, r1, #2
     bd6:	0000      	movs	r0, r0
     bd8:	05f3      	lsls	r3, r6, #23
     bda:	0000      	movs	r0, r0
     bdc:	4111      	asrs	r1, r2
     bde:	0000      	movs	r0, r0
     be0:	f700 0600 			; <UNDEFINED> instruction: 0xf7000600
     be4:	008b      	lsls	r3, r1, #2
     be6:	0000      	movs	r0, r0
     be8:	0603      	lsls	r3, r0, #24
     bea:	0000      	movs	r0, r0
     bec:	4111      	asrs	r1, r2
     bee:	0000      	movs	r0, r0
     bf0:	7b00      	ldrb	r0, [r0, #12]
     bf2:	0600      	lsls	r0, r0, #24
     bf4:	00c4      	lsls	r4, r0, #3
     bf6:	0000      	movs	r0, r0
     bf8:	0613      	lsls	r3, r2, #24
     bfa:	0000      	movs	r0, r0
     bfc:	4111      	asrs	r1, r2
     bfe:	0000      	movs	r0, r0
     c00:	0200      	lsls	r0, r0, #8
     c02:	0b00      	lsrs	r0, r0, #12
     c04:	0603      	lsls	r3, r0, #24
     c06:	0000      	movs	r0, r0
     c08:	8b06      	ldrh	r6, [r0, #24]
     c0a:	0000      	movs	r0, r0
     c0c:	2800      	cmp	r0, #0
     c0e:	0006      	movs	r6, r0
     c10:	1100      	asrs	r0, r0, #4
     c12:	0041      	lsls	r1, r0, #1
     c14:	0000      	movs	r0, r0
     c16:	0023      	movs	r3, r4
     c18:	8b06      	ldrh	r6, [r0, #24]
     c1a:	0000      	movs	r0, r0
     c1c:	3800      	subs	r0, #0
     c1e:	0006      	movs	r6, r0
     c20:	1100      	asrs	r0, r0, #4
     c22:	0041      	lsls	r1, r0, #1
     c24:	0000      	movs	r0, r0
     c26:	000f      	movs	r7, r1
     c28:	8b06      	ldrh	r6, [r0, #24]
     c2a:	0000      	movs	r0, r0
     c2c:	4800      	ldr	r0, [pc, #0]	; (0xc30)
     c2e:	0006      	movs	r6, r0
     c30:	1100      	asrs	r0, r0, #4
     c32:	0041      	lsls	r1, r0, #1
     c34:	0000      	movs	r0, r0
     c36:	0013      	movs	r3, r2
     c38:	0c0d      	lsrs	r5, r1, #16
     c3a:	0801      	lsrs	r1, r0, #32
     c3c:	0e2a      	lsrs	r2, r5, #24
     c3e:	07f6      	lsls	r6, r6, #31
     c40:	0000      	movs	r0, r0
     c42:	fc0e 0023 	stc2	0, cr0, [lr], {35}	; 0x23
     c46:	0800      	lsrs	r0, r0, #32
     c48:	0e2b      	lsrs	r3, r5, #24
     c4a:	00c4      	lsls	r4, r0, #3
     c4c:	0000      	movs	r0, r0
     c4e:	0e00      	lsrs	r0, r0, #24
     c50:	2416      	movs	r4, #22
     c52:	0000      	movs	r0, r0
     c54:	2c08      	cmp	r4, #8
     c56:	c90e      	ldmia	r1, {r1, r2, r3}
     c58:	0000      	movs	r0, r0
     c5a:	0400      	lsls	r0, r0, #16
     c5c:	5c0e      	ldrb	r6, [r1, r0]
     c5e:	000f      	movs	r7, r1
     c60:	0800      	lsrs	r0, r0, #32
     c62:	0e2d      	lsrs	r5, r5, #24
     c64:	05c3      	lsls	r3, r0, #23
     c66:	0000      	movs	r0, r0
     c68:	0e08      	lsrs	r0, r1, #24
     c6a:	1874      	adds	r4, r6, r1
     c6c:	0000      	movs	r0, r0
     c6e:	2e08      	cmp	r6, #8
     c70:	c40e      	stmia	r4!, {r1, r2, r3}
     c72:	0000      	movs	r0, r0
     c74:	0c00      	lsrs	r0, r0, #16
     c76:	d30e      	bcc.n	0xc96
     c78:	0026      	movs	r6, r4
     c7a:	0800      	lsrs	r0, r0, #32
     c7c:	0e2f      	lsrs	r7, r5, #24
     c7e:	00c4      	lsls	r4, r0, #3
     c80:	0000      	movs	r0, r0
     c82:	0e10      	lsrs	r0, r2, #24
     c84:	1d91      	adds	r1, r2, #6
     c86:	0000      	movs	r0, r0
     c88:	3008      	adds	r0, #8
     c8a:	c90e      	ldmia	r1, {r1, r2, r3}
     c8c:	0000      	movs	r0, r0
     c8e:	1400      	asrs	r0, r0, #16
     c90:	590e      	ldr	r6, [r1, r4]
     c92:	0016      	movs	r6, r2
     c94:	0800      	lsrs	r0, r0, #32
     c96:	0e31      	lsrs	r1, r6, #24
     c98:	00c4      	lsls	r4, r0, #3
     c9a:	0000      	movs	r0, r0
     c9c:	0e18      	lsrs	r0, r3, #24
     c9e:	0f67      	lsrs	r7, r4, #29
     ca0:	0000      	movs	r0, r0
     ca2:	3208      	adds	r2, #8
     ca4:	c30e      	stmia	r3!, {r1, r2, r3}
     ca6:	0005      	movs	r5, r0
     ca8:	1c00      	adds	r0, r0, #0
     caa:	da0e      	bge.n	0xcca
     cac:	002d      	movs	r5, r5
     cae:	0800      	lsrs	r0, r0, #32
     cb0:	0e33      	lsrs	r3, r6, #24
     cb2:	00c4      	lsls	r4, r0, #3
     cb4:	0000      	movs	r0, r0
     cb6:	0e20      	lsrs	r0, r4, #24
     cb8:	2183      	movs	r1, #131	; 0x83
     cba:	0000      	movs	r0, r0
     cbc:	3408      	adds	r4, #8
     cbe:	c90e      	ldmia	r1, {r1, r2, r3}
     cc0:	0000      	movs	r0, r0
     cc2:	2400      	movs	r4, #0
     cc4:	720e      	strb	r6, [r1, #8]
     cc6:	000f      	movs	r7, r1
     cc8:	0800      	lsrs	r0, r0, #32
     cca:	0e35      	lsrs	r5, r6, #24
     ccc:	05a3      	lsls	r3, r4, #22
     cce:	0000      	movs	r0, r0
     cd0:	0e28      	lsrs	r0, r5, #24
     cd2:	0388      	lsls	r0, r1, #14
     cd4:	0000      	movs	r0, r0
     cd6:	3608      	adds	r6, #8
     cd8:	c40e      	stmia	r4!, {r1, r2, r3}
     cda:	0000      	movs	r0, r0
     cdc:	3000      	adds	r0, #0
     cde:	ac0e      	add	r4, sp, #56	; 0x38
     ce0:	002f      	movs	r7, r5
     ce2:	0800      	lsrs	r0, r0, #32
     ce4:	0e37      	lsrs	r7, r6, #24
     ce6:	00c9      	lsls	r1, r1, #3
     ce8:	0000      	movs	r0, r0
     cea:	0e34      	lsrs	r4, r6, #24
     cec:	0f7d      	lsrs	r5, r7, #29
     cee:	0000      	movs	r0, r0
     cf0:	3808      	subs	r0, #8
     cf2:	a30e      	add	r3, pc, #56	; (adr r3, 0xd2c)
     cf4:	0005      	movs	r5, r0
     cf6:	3800      	subs	r0, #0
     cf8:	500e      	str	r6, [r1, r0]
     cfa:	002c      	movs	r4, r5
     cfc:	0800      	lsrs	r0, r0, #32
     cfe:	0e39      	lsrs	r1, r7, #24
     d00:	00c4      	lsls	r4, r0, #3
     d02:	0000      	movs	r0, r0
     d04:	0e40      	lsrs	r0, r0, #25
     d06:	2af9      	cmp	r2, #249	; 0xf9
     d08:	0000      	movs	r0, r0
     d0a:	3a08      	subs	r2, #8
     d0c:	c40e      	stmia	r4!, {r1, r2, r3}
     d0e:	0000      	movs	r0, r0
     d10:	4400      	add	r0, r0
     d12:	f90e 0029 	vst4.8	{d0-d3}, [lr :128], r9
     d16:	0800      	lsrs	r0, r0, #32
     d18:	0e3b      	lsrs	r3, r7, #24
     d1a:	00c4      	lsls	r4, r0, #3
     d1c:	0000      	movs	r0, r0
     d1e:	0e48      	lsrs	r0, r1, #25
     d20:	0f88      	lsrs	r0, r1, #30
     d22:	0000      	movs	r0, r0
     d24:	3c08      	subs	r4, #8
     d26:	f60e 0007 	addw	r0, lr, #2055	; 0x807
     d2a:	4c00      	ldr	r4, [pc, #0]	; (0xd2c)
     d2c:	c10e      	stmia	r1!, {r1, r2, r3}
     d2e:	001d      	movs	r5, r3
     d30:	0800      	lsrs	r0, r0, #32
     d32:	0e3d      	lsrs	r5, r7, #24
     d34:	00c4      	lsls	r4, r0, #3
     d36:	0000      	movs	r0, r0
     d38:	0eb0      	lsrs	r0, r6, #26
     d3a:	1612      	asrs	r2, r2, #24
     d3c:	0000      	movs	r0, r0
     d3e:	3e08      	subs	r6, #8
     d40:	c40e      	stmia	r4!, {r1, r2, r3}
     d42:	0000      	movs	r0, r0
     d44:	b400      	push	{}
     d46:	930e      	str	r3, [sp, #56]	; 0x38
     d48:	000f      	movs	r7, r1
     d4a:	0800      	lsrs	r0, r0, #32
     d4c:	0e3f      	lsrs	r7, r7, #24
     d4e:	05a3      	lsls	r3, r4, #22
     d50:	0000      	movs	r0, r0
     d52:	0eb8      	lsrs	r0, r7, #26
     d54:	0a30      	lsrs	r0, r6, #8
     d56:	0000      	movs	r0, r0
     d58:	4008      	ands	r0, r1
     d5a:	c40e      	stmia	r4!, {r1, r2, r3}
     d5c:	0000      	movs	r0, r0
     d5e:	c000      	stmia	r0!, {}
     d60:	600e      	str	r6, [r1, #0]
     d62:	0011      	movs	r1, r2
     d64:	0800      	lsrs	r0, r0, #32
     d66:	0e41      	lsrs	r1, r0, #25
     d68:	00c4      	lsls	r4, r0, #3
     d6a:	0000      	movs	r0, r0
     d6c:	0ec4      	lsrs	r4, r0, #27
     d6e:	1f86      	subs	r6, r0, #6
     d70:	0000      	movs	r0, r0
     d72:	4208      	tst	r0, r1
     d74:	c90e      	ldmia	r1, {r1, r2, r3}
     d76:	0000      	movs	r0, r0
     d78:	c800      	ldmia	r0!, {}
     d7a:	9e0e      	ldr	r6, [sp, #56]	; 0x38
     d7c:	000f      	movs	r7, r1
     d7e:	0800      	lsrs	r0, r0, #32
     d80:	0e43      	lsrs	r3, r0, #25
     d82:	0618      	lsls	r0, r3, #24
     d84:	0000      	movs	r0, r0
     d86:	0ecc      	lsrs	r4, r1, #27
     d88:	2bce      	cmp	r3, #206	; 0xce
     d8a:	0000      	movs	r0, r0
     d8c:	4408      	add	r0, r1
     d8e:	c40e      	stmia	r4!, {r1, r2, r3}
     d90:	0000      	movs	r0, r0
     d92:	f000 1f0e 	and.w	pc, r0, #917518	; 0xe000e
     d96:	002e      	movs	r6, r5
     d98:	0800      	lsrs	r0, r0, #32
     d9a:	0e45      	lsrs	r5, r0, #25
     d9c:	00c4      	lsls	r4, r0, #3
     d9e:	0000      	movs	r0, r0
     da0:	0ef4      	lsrs	r4, r6, #27
     da2:	2ac2      	cmp	r2, #194	; 0xc2
     da4:	0000      	movs	r0, r0
     da6:	4608      	mov	r0, r1
     da8:	c40e      	stmia	r4!, {r1, r2, r3}
     daa:	0000      	movs	r0, r0
     dac:	f800 b90e 	strb.w	fp, [r0], #-14
     db0:	0016      	movs	r6, r2
     db2:	0800      	lsrs	r0, r0, #32
     db4:	0e47      	lsrs	r7, r0, #25
     db6:	00c9      	lsls	r1, r1, #3
     db8:	0000      	movs	r0, r0
     dba:	0ffc      	lsrs	r4, r7, #31
     dbc:	01cb      	lsls	r3, r1, #7
     dbe:	0000      	movs	r0, r0
     dc0:	4808      	ldr	r0, [pc, #32]	; (0xde4)
     dc2:	c40e      	stmia	r4!, {r1, r2, r3}
     dc4:	0000      	movs	r0, r0
     dc6:	0000      	movs	r0, r0
     dc8:	0f01      	lsrs	r1, r0, #28
     dca:	32e3      	adds	r2, #227	; 0xe3
     dcc:	0000      	movs	r0, r0
     dce:	4908      	ldr	r1, [pc, #32]	; (0xdf0)
     dd0:	c40e      	stmia	r4!, {r1, r2, r3}
     dd2:	0000      	movs	r0, r0
     dd4:	0400      	lsls	r0, r0, #16
     dd6:	0f01      	lsrs	r1, r0, #28
     dd8:	37dd      	adds	r7, #221	; 0xdd
     dda:	0000      	movs	r0, r0
     ddc:	4a08      	ldr	r2, [pc, #32]	; (0xe00)
     dde:	c90e      	ldmia	r1, {r1, r2, r3}
     de0:	0000      	movs	r0, r0
     de2:	0800      	lsrs	r0, r0, #32
     de4:	0001      	movs	r1, r0
     de6:	8b06      	ldrh	r6, [r0, #24]
     de8:	0000      	movs	r0, r0
     dea:	0600      	lsls	r0, r0, #24
     dec:	0008      	movs	r0, r1
     dee:	1100      	asrs	r0, r0, #4
     df0:	0041      	lsls	r1, r0, #1
     df2:	0000      	movs	r0, r0
     df4:	0063      	lsls	r3, r4, #1
     df6:	d913      	bls.n	0xe20
     df8:	0019      	movs	r1, r3
     dfa:	0800      	lsrs	r0, r0, #32
     dfc:	0e4b      	lsrs	r3, r1, #25
     dfe:	0648      	lsls	r0, r1, #25
     e00:	0000      	movs	r0, r0
     e02:	8b06      	ldrh	r6, [r0, #24]
     e04:	0000      	movs	r0, r0
     e06:	2200      	movs	r2, #0
     e08:	0008      	movs	r0, r1
     e0a:	1100      	asrs	r0, r0, #4
     e0c:	0041      	lsls	r1, r0, #1
     e0e:	0000      	movs	r0, r0
     e10:	0017      	movs	r7, r2
     e12:	c406      	stmia	r4!, {r1, r2}
     e14:	0000      	movs	r0, r0
     e16:	3200      	adds	r2, #0
     e18:	0008      	movs	r0, r1
     e1a:	1100      	asrs	r0, r0, #4
     e1c:	0041      	lsls	r1, r0, #1
     e1e:	0000      	movs	r0, r0
     e20:	0007      	movs	r7, r0
     e22:	220b      	movs	r2, #11
     e24:	0008      	movs	r0, r1
     e26:	0d00      	lsrs	r0, r0, #20
     e28:	0100      	lsls	r0, r0, #4
     e2a:	d008      	beq.n	0xe3e
     e2c:	4f2b      	ldr	r7, [pc, #172]	; (0xedc)
     e2e:	0008      	movs	r0, r1
     e30:	1400      	asrs	r0, r0, #16
     e32:	4950      	ldr	r1, [pc, #320]	; (0xf74)
     e34:	004f      	lsls	r7, r1, #1
     e36:	d108      	bne.n	0xe4a
     e38:	652b      	str	r3, [r5, #80]	; 0x50
     e3a:	0008      	movs	r0, r1
     e3c:	0000      	movs	r0, r0
     e3e:	0600      	lsls	r0, r0, #24
     e40:	00c4      	lsls	r4, r0, #3
     e42:	0000      	movs	r0, r0
     e44:	0865      	lsrs	r5, r4, #1
     e46:	0000      	movs	r0, r0
     e48:	4111      	asrs	r1, r2
     e4a:	0000      	movs	r0, r0
     e4c:	0100      	lsls	r0, r0, #4
     e4e:	4111      	asrs	r1, r2
     e50:	0000      	movs	r0, r0
     e52:	1f00      	subs	r0, r0, #4
     e54:	0b00      	lsrs	r0, r0, #12
     e56:	084f      	lsrs	r7, r1, #1
     e58:	0000      	movs	r0, r0
     e5a:	8c13      	ldrh	r3, [r2, #32]
     e5c:	0004      	movs	r4, r0
     e5e:	0800      	lsrs	r0, r0, #32
     e60:	2bd2      	cmp	r3, #210	; 0xd2
     e62:	0837      	lsrs	r7, r6, #32
     e64:	0000      	movs	r0, r0
     e66:	8b06      	ldrh	r6, [r0, #24]
     e68:	0000      	movs	r0, r0
     e6a:	8600      	strh	r0, [r0, #48]	; 0x30
     e6c:	0008      	movs	r0, r1
     e6e:	1100      	asrs	r0, r0, #4
     e70:	0041      	lsls	r1, r0, #1
     e72:	0000      	movs	r0, r0
     e74:	00af      	lsls	r7, r5, #2
     e76:	c406      	stmia	r4!, {r1, r2}
     e78:	0000      	movs	r0, r0
     e7a:	9600      	str	r6, [sp, #0]
     e7c:	0008      	movs	r0, r1
     e7e:	1100      	asrs	r0, r0, #4
     e80:	0041      	lsls	r1, r0, #1
     e82:	0000      	movs	r0, r0
     e84:	0004      	movs	r4, r0
     e86:	860b      	strh	r3, [r1, #48]	; 0x30
     e88:	0008      	movs	r0, r1
     e8a:	1500      	asrs	r0, r0, #20
     e8c:	08f8      	lsrs	r0, r7, #3
     e8e:	3139      	adds	r1, #57	; 0x39
     e90:	0b8a      	lsrs	r2, r1, #14
     e92:	0000      	movs	r0, r0
     e94:	ac0e      	add	r4, sp, #56	; 0x38
     e96:	0003      	movs	r3, r0
     e98:	0800      	lsrs	r0, r0, #32
     e9a:	313a      	adds	r1, #58	; 0x3a
     e9c:	00c4      	lsls	r4, r0, #3
     e9e:	0000      	movs	r0, r0
     ea0:	0e00      	lsrs	r0, r0, #24
     ea2:	207c      	movs	r0, #124	; 0x7c
     ea4:	0000      	movs	r0, r0
     ea6:	3b08      	subs	r3, #8
     ea8:	c931      	ldmia	r1!, {r0, r4, r5}
     eaa:	0000      	movs	r0, r0
     eac:	0400      	lsls	r0, r0, #16
     eae:	c50e      	stmia	r5!, {r1, r2, r3}
     eb0:	0036      	movs	r6, r6
     eb2:	0800      	lsrs	r0, r0, #32
     eb4:	313c      	adds	r1, #60	; 0x3c
     eb6:	00c4      	lsls	r4, r0, #3
     eb8:	0000      	movs	r0, r0
     eba:	0e08      	lsrs	r0, r1, #24
     ebc:	0e8c      	lsrs	r4, r1, #26
     ebe:	0000      	movs	r0, r0
     ec0:	3d08      	subs	r5, #8
     ec2:	c431      	stmia	r4!, {r0, r4, r5}
     ec4:	0000      	movs	r0, r0
     ec6:	0c00      	lsrs	r0, r0, #16
     ec8:	e30e      	b.n	0x14e8
     eca:	000a      	movs	r2, r1
     ecc:	0800      	lsrs	r0, r0, #32
     ece:	313e      	adds	r1, #62	; 0x3e
     ed0:	00c4      	lsls	r4, r0, #3
     ed2:	0000      	movs	r0, r0
     ed4:	0e10      	lsrs	r0, r2, #24
     ed6:	0ae9      	lsrs	r1, r5, #11
     ed8:	0000      	movs	r0, r0
     eda:	3f08      	subs	r7, #8
     edc:	c431      	stmia	r4!, {r0, r4, r5}
     ede:	0000      	movs	r0, r0
     ee0:	1400      	asrs	r0, r0, #16
     ee2:	500e      	str	r6, [r1, r0]
     ee4:	000f      	movs	r7, r1
     ee6:	0800      	lsrs	r0, r0, #32
     ee8:	3140      	adds	r1, #64	; 0x40
     eea:	00c4      	lsls	r4, r0, #3
     eec:	0000      	movs	r0, r0
     eee:	0e18      	lsrs	r0, r3, #24
     ef0:	0083      	lsls	r3, r0, #2
     ef2:	0000      	movs	r0, r0
     ef4:	4108      	asrs	r0, r1
     ef6:	c431      	stmia	r4!, {r0, r4, r5}
     ef8:	0000      	movs	r0, r0
     efa:	1c00      	adds	r0, r0, #0
     efc:	210e      	movs	r1, #14
     efe:	0022      	movs	r2, r4
     f00:	0800      	lsrs	r0, r0, #32
     f02:	3142      	adds	r1, #66	; 0x42
     f04:	00c4      	lsls	r4, r0, #3
     f06:	0000      	movs	r0, r0
     f08:	0e20      	lsrs	r0, r4, #24
     f0a:	1c1c      	adds	r4, r3, #0
     f0c:	0000      	movs	r0, r0
     f0e:	4308      	orrs	r0, r1
     f10:	c431      	stmia	r4!, {r0, r4, r5}
     f12:	0000      	movs	r0, r0
     f14:	2400      	movs	r4, #0
     f16:	8b0e      	ldrh	r6, [r1, #24]
     f18:	002d      	movs	r5, r5
     f1a:	0800      	lsrs	r0, r0, #32
     f1c:	3144      	adds	r1, #68	; 0x44
     f1e:	00c4      	lsls	r4, r0, #3
     f20:	0000      	movs	r0, r0
     f22:	0e28      	lsrs	r0, r5, #24
     f24:	12dc      	asrs	r4, r3, #11
     f26:	0000      	movs	r0, r0
     f28:	4508      	cmp	r0, r1
     f2a:	c431      	stmia	r4!, {r0, r4, r5}
     f2c:	0000      	movs	r0, r0
     f2e:	2c00      	cmp	r4, #0
     f30:	b30e      	cbz	r6, 0xf76
     f32:	0033      	movs	r3, r6
     f34:	0800      	lsrs	r0, r0, #32
     f36:	3146      	adds	r1, #70	; 0x46
     f38:	00c4      	lsls	r4, r0, #3
     f3a:	0000      	movs	r0, r0
     f3c:	0e30      	lsrs	r0, r6, #24
     f3e:	0f5c      	lsrs	r4, r3, #29
     f40:	0000      	movs	r0, r0
     f42:	4708      	bx	r1
     f44:	c331      	stmia	r3!, {r0, r4, r5}
     f46:	0005      	movs	r5, r0
     f48:	3400      	adds	r4, #0
     f4a:	7c0e      	ldrb	r6, [r1, #16]
     f4c:	0011      	movs	r1, r2
     f4e:	0800      	lsrs	r0, r0, #32
     f50:	3148      	adds	r1, #72	; 0x48
     f52:	00c4      	lsls	r4, r0, #3
     f54:	0000      	movs	r0, r0
     f56:	0e38      	lsrs	r0, r7, #24
     f58:	0f67      	lsrs	r7, r4, #29
     f5a:	0000      	movs	r0, r0
     f5c:	4908      	ldr	r1, [pc, #32]	; (0xf80)
     f5e:	c331      	stmia	r3!, {r0, r4, r5}
     f60:	0005      	movs	r5, r0
     f62:	3c00      	subs	r4, #0
     f64:	b00e      	add	sp, #56	; 0x38
     f66:	0010      	movs	r0, r2
     f68:	0800      	lsrs	r0, r0, #32
     f6a:	314a      	adds	r1, #74	; 0x4a
     f6c:	00c4      	lsls	r4, r0, #3
     f6e:	0000      	movs	r0, r0
     f70:	0e40      	lsrs	r0, r0, #25
     f72:	2e45      	cmp	r6, #69	; 0x45
     f74:	0000      	movs	r0, r0
     f76:	4b08      	ldr	r3, [pc, #32]	; (0xf98)
     f78:	c431      	stmia	r4!, {r0, r4, r5}
     f7a:	0000      	movs	r0, r0
     f7c:	4400      	add	r0, r0
     f7e:	0b0e      	lsrs	r6, r1, #12
     f80:	0016      	movs	r6, r2
     f82:	0800      	lsrs	r0, r0, #32
     f84:	314c      	adds	r1, #76	; 0x4c
     f86:	00c4      	lsls	r4, r0, #3
     f88:	0000      	movs	r0, r0
     f8a:	0e48      	lsrs	r0, r1, #25
     f8c:	167b      	asrs	r3, r7, #25
     f8e:	0000      	movs	r0, r0
     f90:	4d08      	ldr	r5, [pc, #32]	; (0xfb4)
     f92:	c431      	stmia	r4!, {r0, r4, r5}
     f94:	0000      	movs	r0, r0
     f96:	4c00      	ldr	r4, [pc, #0]	; (0xf98)
     f98:	610e      	str	r6, [r1, #16]
     f9a:	001c      	movs	r4, r3
     f9c:	0800      	lsrs	r0, r0, #32
     f9e:	314e      	adds	r1, #78	; 0x4e
     fa0:	00c4      	lsls	r4, r0, #3
     fa2:	0000      	movs	r0, r0
     fa4:	0e50      	lsrs	r0, r2, #25
     fa6:	0f72      	lsrs	r2, r6, #29
     fa8:	0000      	movs	r0, r0
     faa:	4f08      	ldr	r7, [pc, #32]	; (0xfcc)
     fac:	2831      	cmp	r0, #49	; 0x31
     fae:	0006      	movs	r6, r0
     fb0:	5400      	strb	r0, [r0, r0]
     fb2:	320e      	adds	r2, #14
     fb4:	001e      	movs	r6, r3
     fb6:	0800      	lsrs	r0, r0, #32
     fb8:	3150      	adds	r1, #80	; 0x50
     fba:	00c4      	lsls	r4, r0, #3
     fbc:	0000      	movs	r0, r0
     fbe:	0e64      	lsrs	r4, r4, #25
     fc0:	34f9      	adds	r4, #249	; 0xf9
     fc2:	0000      	movs	r0, r0
     fc4:	5108      	str	r0, [r1, r4]
     fc6:	c431      	stmia	r4!, {r0, r4, r5}
     fc8:	0000      	movs	r0, r0
     fca:	6800      	ldr	r0, [r0, #0]
     fcc:	7d0e      	ldrb	r6, [r1, #20]
     fce:	000f      	movs	r7, r1
     fd0:	0800      	lsrs	r0, r0, #32
     fd2:	3152      	adds	r1, #82	; 0x52
     fd4:	05c3      	lsls	r3, r0, #23
     fd6:	0000      	movs	r0, r0
     fd8:	0e6c      	lsrs	r4, r5, #25
     fda:	22ea      	movs	r2, #234	; 0xea
     fdc:	0000      	movs	r0, r0
     fde:	5308      	strh	r0, [r1, r4]
     fe0:	c931      	ldmia	r1!, {r0, r4, r5}
     fe2:	0000      	movs	r0, r0
     fe4:	7000      	strb	r0, [r0, #0]
     fe6:	000e      	movs	r6, r1
     fe8:	000b      	movs	r3, r1
     fea:	0800      	lsrs	r0, r0, #32
     fec:	3154      	adds	r1, #84	; 0x54
     fee:	00c4      	lsls	r4, r0, #3
     ff0:	0000      	movs	r0, r0
     ff2:	0e74      	lsrs	r4, r6, #25
     ff4:	0f88      	lsrs	r0, r1, #30
     ff6:	0000      	movs	r0, r0
     ff8:	5508      	strb	r0, [r1, r4]
     ffa:	b331      	cbz	r1, 0x104a
     ffc:	0005      	movs	r5, r0
     ffe:	7800      	ldrb	r0, [r0, #0]
    1000:	670e      	str	r6, [r1, #112]	; 0x70
    1002:	0009      	movs	r1, r1
    1004:	0800      	lsrs	r0, r0, #32
    1006:	3156      	adds	r1, #86	; 0x56
    1008:	00c4      	lsls	r4, r0, #3
    100a:	0000      	movs	r0, r0
    100c:	0e84      	lsrs	r4, r0, #26
    100e:	096e      	lsrs	r6, r5, #5
    1010:	0000      	movs	r0, r0
    1012:	5708      	ldrsb	r0, [r1, r4]
    1014:	c431      	stmia	r4!, {r0, r4, r5}
    1016:	0000      	movs	r0, r0
    1018:	8800      	ldrh	r0, [r0, #0]
    101a:	930e      	str	r3, [sp, #56]	; 0x38
    101c:	000f      	movs	r7, r1
    101e:	0800      	lsrs	r0, r0, #32
    1020:	3158      	adds	r1, #88	; 0x58
    1022:	05c3      	lsls	r3, r0, #23
    1024:	0000      	movs	r0, r0
    1026:	0e8c      	lsrs	r4, r1, #26
    1028:	2c7f      	cmp	r4, #127	; 0x7f
    102a:	0000      	movs	r0, r0
    102c:	5908      	ldr	r0, [r1, r4]
    102e:	c431      	stmia	r4!, {r0, r4, r5}
    1030:	0000      	movs	r0, r0
    1032:	9000      	str	r0, [sp, #0]
    1034:	720e      	strb	r6, [r1, #8]
    1036:	000c      	movs	r4, r1
    1038:	0800      	lsrs	r0, r0, #32
    103a:	315a      	adds	r1, #90	; 0x5a
    103c:	00c9      	lsls	r1, r1, #3
    103e:	0000      	movs	r0, r0
    1040:	0e94      	lsrs	r4, r2, #26
    1042:	1b7e      	subs	r6, r7, r5
    1044:	0000      	movs	r0, r0
    1046:	5b08      	ldrh	r0, [r1, r4]
    1048:	c431      	stmia	r4!, {r0, r4, r5}
    104a:	0000      	movs	r0, r0
    104c:	9800      	ldr	r0, [sp, #0]
    104e:	670e      	str	r6, [r1, #112]	; 0x70
    1050:	0023      	movs	r3, r4
    1052:	0800      	lsrs	r0, r0, #32
    1054:	315c      	adds	r1, #92	; 0x5c
    1056:	00c4      	lsls	r4, r0, #3
    1058:	0000      	movs	r0, r0
    105a:	0e9c      	lsrs	r4, r3, #26
    105c:	0f9e      	lsrs	r6, r3, #30
    105e:	0000      	movs	r0, r0
    1060:	5d08      	ldrb	r0, [r1, r4]
    1062:	c331      	stmia	r3!, {r0, r4, r5}
    1064:	0005      	movs	r5, r0
    1066:	a000      	add	r0, pc, #0	; (adr r0, 0x1068)
    1068:	200e      	movs	r0, #14
    106a:	0031      	movs	r1, r6
    106c:	0800      	lsrs	r0, r0, #32
    106e:	315e      	adds	r1, #94	; 0x5e
    1070:	00c4      	lsls	r4, r0, #3
    1072:	0000      	movs	r0, r0
    1074:	0ea4      	lsrs	r4, r4, #26
    1076:	2284      	movs	r2, #132	; 0x84
    1078:	0000      	movs	r0, r0
    107a:	5f08      	ldrsh	r0, [r1, r4]
    107c:	c431      	stmia	r4!, {r0, r4, r5}
    107e:	0000      	movs	r0, r0
    1080:	a800      	add	r0, sp, #0
    1082:	a90e      	add	r1, sp, #56	; 0x38
    1084:	000f      	movs	r7, r1
    1086:	0800      	lsrs	r0, r0, #32
    1088:	3160      	adds	r1, #96	; 0x60
    108a:	05c3      	lsls	r3, r0, #23
    108c:	0000      	movs	r0, r0
    108e:	0eac      	lsrs	r4, r5, #26
    1090:	02c9      	lsls	r1, r1, #11
    1092:	0000      	movs	r0, r0
    1094:	6108      	str	r0, [r1, #16]
    1096:	c431      	stmia	r4!, {r0, r4, r5}
    1098:	0000      	movs	r0, r0
    109a:	b000      	add	sp, #0
    109c:	380e      	subs	r0, #14
    109e:	0032      	movs	r2, r6
    10a0:	0800      	lsrs	r0, r0, #32
    10a2:	3162      	adds	r1, #98	; 0x62
    10a4:	00c4      	lsls	r4, r0, #3
    10a6:	0000      	movs	r0, r0
    10a8:	0eb4      	lsrs	r4, r6, #26
    10aa:	10ea      	asrs	r2, r5, #3
    10ac:	0000      	movs	r0, r0
    10ae:	6308      	str	r0, [r1, #48]	; 0x30
    10b0:	c431      	stmia	r4!, {r0, r4, r5}
    10b2:	0000      	movs	r0, r0
    10b4:	b800      			; <UNDEFINED> instruction: 0xb800
    10b6:	b40e      	push	{r1, r2, r3}
    10b8:	000f      	movs	r7, r1
    10ba:	0800      	lsrs	r0, r0, #32
    10bc:	3164      	adds	r1, #100	; 0x64
    10be:	05c3      	lsls	r3, r0, #23
    10c0:	0000      	movs	r0, r0
    10c2:	0ebc      	lsrs	r4, r7, #26
    10c4:	0d16      	lsrs	r6, r2, #20
    10c6:	0000      	movs	r0, r0
    10c8:	6508      	str	r0, [r1, #80]	; 0x50
    10ca:	c431      	stmia	r4!, {r0, r4, r5}
    10cc:	0000      	movs	r0, r0
    10ce:	c000      	stmia	r0!, {}
    10d0:	bf0e      	itee	eq
    10d2:	000f      	moveq	r7, r1
    10d4:	0800      	lsrne	r0, r0, #32
    10d6:	3166      	addne	r1, #102	; 0x66
    10d8:	05c3      	lsls	r3, r0, #23
    10da:	0000      	movs	r0, r0
    10dc:	0ec4      	lsrs	r4, r0, #27
    10de:	0836      	lsrs	r6, r6, #32
    10e0:	0000      	movs	r0, r0
    10e2:	6708      	str	r0, [r1, #112]	; 0x70
    10e4:	c431      	stmia	r4!, {r0, r4, r5}
    10e6:	0000      	movs	r0, r0
    10e8:	c800      	ldmia	r0!, {}
    10ea:	960e      	str	r6, [sp, #56]	; 0x38
    10ec:	000c      	movs	r4, r1
    10ee:	0800      	lsrs	r0, r0, #32
    10f0:	3168      	adds	r1, #104	; 0x68
    10f2:	05c3      	lsls	r3, r0, #23
    10f4:	0000      	movs	r0, r0
    10f6:	0ecc      	lsrs	r4, r1, #27
    10f8:	1919      	adds	r1, r3, r4
    10fa:	0000      	movs	r0, r0
    10fc:	6908      	ldr	r0, [r1, #16]
    10fe:	c431      	stmia	r4!, {r0, r4, r5}
    1100:	0000      	movs	r0, r0
    1102:	d000      	beq.n	0x1106
    1104:	e50e      	b.n	0xb24
    1106:	001a      	movs	r2, r3
    1108:	0800      	lsrs	r0, r0, #32
    110a:	316a      	adds	r1, #106	; 0x6a
    110c:	00c4      	lsls	r4, r0, #3
    110e:	0000      	movs	r0, r0
    1110:	0ed4      	lsrs	r4, r2, #27
    1112:	0d02      	lsrs	r2, r0, #20
    1114:	0000      	movs	r0, r0
    1116:	6b08      	ldr	r0, [r1, #48]	; 0x30
    1118:	c431      	stmia	r4!, {r0, r4, r5}
    111a:	0000      	movs	r0, r0
    111c:	d800      	bhi.n	0x1120
    111e:	0c0e      	lsrs	r6, r1, #16
    1120:	000d      	movs	r5, r1
    1122:	0800      	lsrs	r0, r0, #32
    1124:	316c      	adds	r1, #108	; 0x6c
    1126:	00c4      	lsls	r4, r0, #3
    1128:	0000      	movs	r0, r0
    112a:	0edc      	lsrs	r4, r3, #27
    112c:	0c52      	lsrs	r2, r2, #17
    112e:	0000      	movs	r0, r0
    1130:	6d08      	ldr	r0, [r1, #80]	; 0x50
    1132:	c431      	stmia	r4!, {r0, r4, r5}
    1134:	0000      	movs	r0, r0
    1136:	e000      	b.n	0x113a
    1138:	620e      	str	r6, [r1, #32]
    113a:	000c      	movs	r4, r1
    113c:	0800      	lsrs	r0, r0, #32
    113e:	316e      	adds	r1, #110	; 0x6e
    1140:	00c4      	lsls	r4, r0, #3
    1142:	0000      	movs	r0, r0
    1144:	0ee4      	lsrs	r4, r4, #27
    1146:	0ca2      	lsrs	r2, r4, #18
    1148:	0000      	movs	r0, r0
    114a:	6f08      	ldr	r0, [r1, #112]	; 0x70
    114c:	c331      	stmia	r3!, {r0, r4, r5}
    114e:	0005      	movs	r5, r0
    1150:	e800 b10e 			; <UNDEFINED> instruction: 0xe800b10e
    1154:	0003      	movs	r3, r0
    1156:	0800      	lsrs	r0, r0, #32
    1158:	3170      	adds	r1, #112	; 0x70
    115a:	00c4      	lsls	r4, r0, #3
    115c:	0000      	movs	r0, r0
    115e:	0eec      	lsrs	r4, r5, #27
    1160:	36ba      	adds	r6, #186	; 0xba
    1162:	0000      	movs	r0, r0
    1164:	7108      	strb	r0, [r1, #4]
    1166:	c431      	stmia	r4!, {r0, r4, r5}
    1168:	0000      	movs	r0, r0
    116a:	f000 ee0e 	blx	0x1d88
    116e:	0008      	movs	r0, r1
    1170:	0800      	lsrs	r0, r0, #32
    1172:	3172      	adds	r1, #114	; 0x72
    1174:	00c4      	lsls	r4, r0, #3
    1176:	0000      	movs	r0, r0
    1178:	00f4      	lsls	r4, r6, #3
    117a:	af13      	add	r7, sp, #76	; 0x4c
    117c:	000d      	movs	r5, r1
    117e:	0800      	lsrs	r0, r0, #32
    1180:	3173      	adds	r1, #115	; 0x73
    1182:	089b      	lsrs	r3, r3, #2
    1184:	0000      	movs	r0, r0
    1186:	8b06      	ldrh	r6, [r0, #24]
    1188:	0000      	movs	r0, r0
    118a:	a600      	add	r6, pc, #0	; (adr r6, 0x118c)
    118c:	000b      	movs	r3, r1
    118e:	1100      	asrs	r0, r0, #4
    1190:	0041      	lsls	r1, r0, #1
    1192:	0000      	movs	r0, r0
    1194:	006b      	lsls	r3, r5, #1
    1196:	0c15      	lsrs	r5, r2, #16
    1198:	1108      	asrs	r0, r1, #4
    119a:	d749      	bvc.n	0x1230
    119c:	000b      	movs	r3, r1
    119e:	0e00      	lsrs	r0, r0, #24
    11a0:	2255      	movs	r2, #85	; 0x55
    11a2:	0000      	movs	r0, r0
    11a4:	1208      	asrs	r0, r1, #8
    11a6:	c449      	stmia	r4!, {r0, r3, r6}
    11a8:	0000      	movs	r0, r0
    11aa:	0000      	movs	r0, r0
    11ac:	610e      	str	r6, [r1, #16]
    11ae:	0022      	movs	r2, r4
    11b0:	0800      	lsrs	r0, r0, #32
    11b2:	4913      	ldr	r1, [pc, #76]	; (0x1200)
    11b4:	00c4      	lsls	r4, r0, #3
    11b6:	0000      	movs	r0, r0
    11b8:	0e04      	lsrs	r4, r0, #24
    11ba:	226d      	movs	r2, #109	; 0x6d
    11bc:	0000      	movs	r0, r0
    11be:	1408      	asrs	r0, r1, #16
    11c0:	c449      	stmia	r4!, {r0, r3, r6}
    11c2:	0000      	movs	r0, r0
    11c4:	0800      	lsrs	r0, r0, #32
    11c6:	1600      	asrs	r0, r0, #24
    11c8:	080c      	lsrs	r4, r1, #32
    11ca:	4910      	ldr	r1, [pc, #64]	; (0x120c)
    11cc:	0bf9      	lsrs	r1, r7, #15
    11ce:	0000      	movs	r0, r0
    11d0:	4017      	ands	r7, r2
    11d2:	0015      	movs	r5, r2
    11d4:	0800      	lsrs	r0, r0, #32
    11d6:	4915      	ldr	r1, [pc, #84]	; (0x122c)
    11d8:	0ba6      	lsrs	r6, r4, #14
    11da:	0000      	movs	r0, r0
    11dc:	9517      	str	r5, [sp, #92]	; 0x5c
    11de:	0022      	movs	r2, r4
    11e0:	0800      	lsrs	r0, r0, #32
    11e2:	4916      	ldr	r1, [pc, #88]	; (0x123c)
    11e4:	0613      	lsls	r3, r2, #24
    11e6:	0000      	movs	r0, r0
    11e8:	1500      	asrs	r0, r0, #20
    11ea:	080c      	lsrs	r4, r1, #32
    11ec:	4920      	ldr	r1, [pc, #128]	; (0x1270)
    11ee:	0c2a      	lsrs	r2, r5, #16
    11f0:	0000      	movs	r0, r0
    11f2:	720e      	strb	r6, [r1, #8]
    11f4:	0034      	movs	r4, r6
    11f6:	0800      	lsrs	r0, r0, #32
    11f8:	4921      	ldr	r1, [pc, #132]	; (0x1280)
    11fa:	00c4      	lsls	r4, r0, #3
    11fc:	0000      	movs	r0, r0
    11fe:	0e00      	lsrs	r0, r0, #24
    1200:	347e      	adds	r4, #126	; 0x7e
    1202:	0000      	movs	r0, r0
    1204:	2208      	movs	r2, #8
    1206:	c449      	stmia	r4!, {r0, r3, r6}
    1208:	0000      	movs	r0, r0
    120a:	0400      	lsls	r0, r0, #16
    120c:	8a0e      	ldrh	r6, [r1, #16]
    120e:	0034      	movs	r4, r6
    1210:	0800      	lsrs	r0, r0, #32
    1212:	4923      	ldr	r1, [pc, #140]	; (0x12a0)
    1214:	00c4      	lsls	r4, r0, #3
    1216:	0000      	movs	r0, r0
    1218:	0008      	movs	r0, r1
    121a:	0c16      	lsrs	r6, r2, #16
    121c:	1f08      	subs	r0, r1, #4
    121e:	4c49      	ldr	r4, [pc, #292]	; (0x1344)
    1220:	000c      	movs	r4, r1
    1222:	1700      	asrs	r0, r0, #28
    1224:	052f      	lsls	r7, r5, #20
    1226:	0000      	movs	r0, r0
    1228:	2408      	movs	r4, #8
    122a:	f949 000b 	vst4.8	{d16-d19}, [r9], fp
    122e:	1700      	asrs	r0, r0, #28
    1230:	34ed      	adds	r4, #237	; 0xed
    1232:	0000      	movs	r0, r0
    1234:	2508      	movs	r5, #8
    1236:	1349      	asrs	r1, r1, #13
    1238:	0006      	movs	r6, r0
    123a:	0000      	movs	r0, r0
    123c:	0815      	lsrs	r5, r2, #32
    123e:	2d08      	cmp	r5, #8
    1240:	7049      	strb	r1, [r1, #1]
    1242:	000c      	movs	r4, r1
    1244:	0e00      	lsrs	r0, r0, #24
    1246:	2dbc      	cmp	r5, #188	; 0xbc
    1248:	0000      	movs	r0, r0
    124a:	2e08      	cmp	r6, #8
    124c:	c449      	stmia	r4!, {r0, r3, r6}
    124e:	0000      	movs	r0, r0
    1250:	0000      	movs	r0, r0
    1252:	cb0e      	ldmia	r3, {r1, r2, r3}
    1254:	002d      	movs	r5, r5
    1256:	0800      	lsrs	r0, r0, #32
    1258:	492f      	ldr	r1, [pc, #188]	; (0x1318)
    125a:	00c4      	lsls	r4, r0, #3
    125c:	0000      	movs	r0, r0
    125e:	0004      	movs	r4, r0
    1260:	0816      	lsrs	r6, r2, #32
    1262:	2c08      	cmp	r4, #8
    1264:	9249      	str	r2, [sp, #292]	; 0x124
    1266:	000c      	movs	r4, r1
    1268:	1700      	asrs	r0, r0, #28
    126a:	1985      	adds	r5, r0, r6
    126c:	0000      	movs	r0, r0
    126e:	3008      	adds	r0, #8
    1270:	4c49      	ldr	r4, [pc, #292]	; (0x1398)
    1272:	000c      	movs	r4, r1
    1274:	1700      	asrs	r0, r0, #28
    1276:	2e2b      	cmp	r6, #43	; 0x2b
    1278:	0000      	movs	r0, r0
    127a:	3108      	adds	r1, #8
    127c:	8749      	strh	r1, [r1, #58]	; 0x3a
    127e:	0005      	movs	r5, r0
    1280:	0000      	movs	r0, r0
    1282:	1415      	asrs	r5, r2, #16
    1284:	3508      	adds	r5, #8
    1286:	dd49      	ble.n	0x131c
    1288:	000c      	movs	r4, r1
    128a:	0e00      	lsrs	r0, r0, #24
    128c:	2be8      	cmp	r3, #232	; 0xe8
    128e:	0000      	movs	r0, r0
    1290:	3608      	adds	r6, #8
    1292:	c449      	stmia	r4!, {r0, r3, r6}
    1294:	0000      	movs	r0, r0
    1296:	0000      	movs	r0, r0
    1298:	f60e 002b 	addw	r0, lr, #2091	; 0x82b
    129c:	0800      	lsrs	r0, r0, #32
    129e:	4937      	ldr	r1, [pc, #220]	; (0x137c)
    12a0:	00c4      	lsls	r4, r0, #3
    12a2:	0000      	movs	r0, r0
    12a4:	0e04      	lsrs	r4, r0, #24
    12a6:	2c04      	cmp	r4, #4
    12a8:	0000      	movs	r0, r0
    12aa:	3808      	subs	r0, #8
    12ac:	c449      	stmia	r4!, {r0, r3, r6}
    12ae:	0000      	movs	r0, r0
    12b0:	0800      	lsrs	r0, r0, #32
    12b2:	120e      	asrs	r6, r1, #8
    12b4:	002c      	movs	r4, r5
    12b6:	0800      	lsrs	r0, r0, #32
    12b8:	4939      	ldr	r1, [pc, #228]	; (0x13a0)
    12ba:	00c4      	lsls	r4, r0, #3
    12bc:	0000      	movs	r0, r0
    12be:	0e0c      	lsrs	r4, r1, #24
    12c0:	2c20      	cmp	r4, #32
    12c2:	0000      	movs	r0, r0
    12c4:	3a08      	subs	r2, #8
    12c6:	c449      	stmia	r4!, {r0, r3, r6}
    12c8:	0000      	movs	r0, r0
    12ca:	1000      	asrs	r0, r0, #32
    12cc:	1600      	asrs	r0, r0, #24
    12ce:	0814      	lsrs	r4, r2, #32
    12d0:	4934      	ldr	r1, [pc, #208]	; (0x13a4)
    12d2:	0cff      	lsrs	r7, r7, #19
    12d4:	0000      	movs	r0, r0
    12d6:	1f17      	subs	r7, r2, #4
    12d8:	0034      	movs	r4, r6
    12da:	0800      	lsrs	r0, r0, #32
    12dc:	493b      	ldr	r1, [pc, #236]	; (0x13cc)
    12de:	0c92      	lsrs	r2, r2, #18
    12e0:	0000      	movs	r0, r0
    12e2:	8817      	ldrh	r7, [r2, #0]
    12e4:	002c      	movs	r4, r5
    12e6:	0800      	lsrs	r0, r0, #32
    12e8:	493c      	ldr	r1, [pc, #240]	; (0x13dc)
    12ea:	0896      	lsrs	r6, r2, #2
    12ec:	0000      	movs	r0, r0
    12ee:	1500      	asrs	r0, r0, #20
    12f0:	0820      	lsrs	r0, r4, #32
    12f2:	4949      	ldr	r1, [pc, #292]	; (0x1418)
    12f4:	0d71      	lsrs	r1, r6, #21
    12f6:	0000      	movs	r0, r0
    12f8:	610e      	str	r6, [r1, #16]
    12fa:	000a      	movs	r2, r1
    12fc:	0800      	lsrs	r0, r0, #32
    12fe:	494a      	ldr	r1, [pc, #296]	; (0x1428)
    1300:	00c4      	lsls	r4, r0, #3
    1302:	0000      	movs	r0, r0
    1304:	0e00      	lsrs	r0, r0, #24
    1306:	0a6b      	lsrs	r3, r5, #9
    1308:	0000      	movs	r0, r0
    130a:	4b08      	ldr	r3, [pc, #32]	; (0x132c)
    130c:	c449      	stmia	r4!, {r0, r3, r6}
    130e:	0000      	movs	r0, r0
    1310:	0400      	lsls	r0, r0, #16
    1312:	750e      	strb	r6, [r1, #20]
    1314:	000a      	movs	r2, r1
    1316:	0800      	lsrs	r0, r0, #32
    1318:	494c      	ldr	r1, [pc, #304]	; (0x144c)
    131a:	00c4      	lsls	r4, r0, #3
    131c:	0000      	movs	r0, r0
    131e:	0e08      	lsrs	r0, r1, #24
    1320:	0a7f      	lsrs	r7, r7, #9
    1322:	0000      	movs	r0, r0
    1324:	4d08      	ldr	r5, [pc, #32]	; (0x1348)
    1326:	c449      	stmia	r4!, {r0, r3, r6}
    1328:	0000      	movs	r0, r0
    132a:	0c00      	lsrs	r0, r0, #16
    132c:	890e      	ldrh	r6, [r1, #8]
    132e:	000a      	movs	r2, r1
    1330:	0800      	lsrs	r0, r0, #32
    1332:	494e      	ldr	r1, [pc, #312]	; (0x146c)
    1334:	00c4      	lsls	r4, r0, #3
    1336:	0000      	movs	r0, r0
    1338:	0e10      	lsrs	r0, r2, #24
    133a:	0a93      	lsrs	r3, r2, #10
    133c:	0000      	movs	r0, r0
    133e:	4f08      	ldr	r7, [pc, #32]	; (0x1360)
    1340:	c449      	stmia	r4!, {r0, r3, r6}
    1342:	0000      	movs	r0, r0
    1344:	1400      	asrs	r0, r0, #16
    1346:	9d0e      	ldr	r5, [sp, #56]	; 0x38
    1348:	000a      	movs	r2, r1
    134a:	0800      	lsrs	r0, r0, #32
    134c:	4950      	ldr	r1, [pc, #320]	; (0x1490)
    134e:	00c4      	lsls	r4, r0, #3
    1350:	0000      	movs	r0, r0
    1352:	0e18      	lsrs	r0, r3, #24
    1354:	0aa7      	lsrs	r7, r4, #10
    1356:	0000      	movs	r0, r0
    1358:	5108      	str	r0, [r1, r4]
    135a:	c449      	stmia	r4!, {r0, r3, r6}
    135c:	0000      	movs	r0, r0
    135e:	1c00      	adds	r0, r0, #0
    1360:	1600      	asrs	r0, r0, #24
    1362:	0820      	lsrs	r0, r4, #32
    1364:	4948      	ldr	r1, [pc, #288]	; (0x1488)
    1366:	0d93      	lsrs	r3, r2, #22
    1368:	0000      	movs	r0, r0
    136a:	9317      	str	r3, [sp, #92]	; 0x5c
    136c:	0012      	movs	r2, r2
    136e:	0800      	lsrs	r0, r0, #32
    1370:	4952      	ldr	r1, [pc, #328]	; (0x14bc)
    1372:	0cff      	lsrs	r7, r7, #19
    1374:	0000      	movs	r0, r0
    1376:	2f17      	cmp	r7, #23
    1378:	000b      	movs	r3, r1
    137a:	0800      	lsrs	r0, r0, #32
    137c:	4953      	ldr	r1, [pc, #332]	; (0x14cc)
    137e:	0832      	lsrs	r2, r6, #32
    1380:	0000      	movs	r0, r0
    1382:	1500      	asrs	r0, r0, #20
    1384:	0820      	lsrs	r0, r4, #32
    1386:	4963      	ldr	r1, [pc, #396]	; (0x1514)
    1388:	0e05      	lsrs	r5, r0, #24
    138a:	0000      	movs	r0, r0
    138c:	530e      	strh	r6, [r1, r4]
    138e:	002d      	movs	r5, r5
    1390:	0800      	lsrs	r0, r0, #32
    1392:	4964      	ldr	r1, [pc, #400]	; (0x1524)
    1394:	00c4      	lsls	r4, r0, #3
    1396:	0000      	movs	r0, r0
    1398:	0e00      	lsrs	r0, r0, #24
    139a:	061b      	lsls	r3, r3, #24
    139c:	0000      	movs	r0, r0
    139e:	6508      	str	r0, [r1, #80]	; 0x50
    13a0:	c449      	stmia	r4!, {r0, r3, r6}
    13a2:	0000      	movs	r0, r0
    13a4:	0400      	lsls	r0, r0, #16
    13a6:	670e      	str	r6, [r1, #112]	; 0x70
    13a8:	0018      	movs	r0, r3
    13aa:	0800      	lsrs	r0, r0, #32
    13ac:	4966      	ldr	r1, [pc, #408]	; (0x1548)
    13ae:	00c4      	lsls	r4, r0, #3
    13b0:	0000      	movs	r0, r0
    13b2:	0e08      	lsrs	r0, r1, #24
    13b4:	29c6      	cmp	r1, #198	; 0xc6
    13b6:	0000      	movs	r0, r0
    13b8:	6708      	str	r0, [r1, #112]	; 0x70
    13ba:	c449      	stmia	r4!, {r0, r3, r6}
    13bc:	0000      	movs	r0, r0
    13be:	0c00      	lsrs	r0, r0, #16
    13c0:	2e0e      	cmp	r6, #14
    13c2:	0002      	movs	r2, r0
    13c4:	0800      	lsrs	r0, r0, #32
    13c6:	4968      	ldr	r1, [pc, #416]	; (0x1568)
    13c8:	00c4      	lsls	r4, r0, #3
    13ca:	0000      	movs	r0, r0
    13cc:	0e10      	lsrs	r0, r2, #24
    13ce:	15d4      	asrs	r4, r2, #23
    13d0:	0000      	movs	r0, r0
    13d2:	6908      	ldr	r0, [r1, #16]
    13d4:	c449      	stmia	r4!, {r0, r3, r6}
    13d6:	0000      	movs	r0, r0
    13d8:	1400      	asrs	r0, r0, #16
    13da:	230e      	movs	r3, #14
    13dc:	0027      	movs	r7, r4
    13de:	0800      	lsrs	r0, r0, #32
    13e0:	496a      	ldr	r1, [pc, #424]	; (0x158c)
    13e2:	00c4      	lsls	r4, r0, #3
    13e4:	0000      	movs	r0, r0
    13e6:	0e18      	lsrs	r0, r3, #24
    13e8:	3824      	subs	r0, #36	; 0x24
    13ea:	0000      	movs	r0, r0
    13ec:	6b08      	ldr	r0, [r1, #48]	; 0x30
    13ee:	c449      	stmia	r4!, {r0, r3, r6}
    13f0:	0000      	movs	r0, r0
    13f2:	1c00      	adds	r0, r0, #0
    13f4:	1600      	asrs	r0, r0, #24
    13f6:	0820      	lsrs	r0, r4, #32
    13f8:	4962      	ldr	r1, [pc, #392]	; (0x1584)
    13fa:	0e27      	lsrs	r7, r4, #24
    13fc:	0000      	movs	r0, r0
    13fe:	c317      	stmia	r3!, {r0, r1, r2, r4}
    1400:	0034      	movs	r4, r6
    1402:	0800      	lsrs	r0, r0, #32
    1404:	496c      	ldr	r1, [pc, #432]	; (0x15b8)
    1406:	0d93      	lsrs	r3, r2, #22
    1408:	0000      	movs	r0, r0
    140a:	ff17 0012 	vqadd.u16	d0, d7, d2
    140e:	0800      	lsrs	r0, r0, #32
    1410:	496d      	ldr	r1, [pc, #436]	; (0x15c8)
    1412:	0832      	lsrs	r2, r6, #32
    1414:	0000      	movs	r0, r0
    1416:	0d00      	lsrs	r0, r0, #20
    1418:	1000      	asrs	r0, r0, #32
    141a:	0208      	lsls	r0, r1, #8
    141c:	0149      	lsls	r1, r1, #5
    141e:	0017      	movs	r7, r2
    1420:	0e00      	lsrs	r0, r0, #24
    1422:	2d02      	cmp	r5, #2
    1424:	0000      	movs	r0, r0
    1426:	0308      	lsls	r0, r1, #12
    1428:	c449      	stmia	r4!, {r0, r3, r6}
    142a:	0000      	movs	r0, r0
    142c:	0000      	movs	r0, r0
    142e:	5c0e      	ldrb	r6, [r1, r0]
    1430:	000f      	movs	r7, r1
    1432:	0800      	lsrs	r0, r0, #32
    1434:	4904      	ldr	r1, [pc, #16]	; (0x1448)
    1436:	05b3      	lsls	r3, r6, #22
    1438:	0000      	movs	r0, r0
    143a:	0e04      	lsrs	r4, r0, #24
    143c:	1035      	asrs	r5, r6, #32
    143e:	0000      	movs	r0, r0
    1440:	0508      	lsls	r0, r1, #20
    1442:	c449      	stmia	r4!, {r0, r3, r6}
    1444:	0000      	movs	r0, r0
    1446:	1000      	asrs	r0, r0, #32
    1448:	670e      	str	r6, [r1, #112]	; 0x70
    144a:	000f      	movs	r7, r1
    144c:	0800      	lsrs	r0, r0, #32
    144e:	4906      	ldr	r1, [pc, #24]	; (0x1468)
    1450:	05b3      	lsls	r3, r6, #22
    1452:	0000      	movs	r0, r0
    1454:	0e14      	lsrs	r4, r2, #24
    1456:	1eff      	subs	r7, r7, #3
    1458:	0000      	movs	r0, r0
    145a:	0708      	lsls	r0, r1, #28
    145c:	c449      	stmia	r4!, {r0, r3, r6}
    145e:	0000      	movs	r0, r0
    1460:	2000      	movs	r0, #0
    1462:	a90e      	add	r1, sp, #56	; 0x38
    1464:	001c      	movs	r4, r3
    1466:	0800      	lsrs	r0, r0, #32
    1468:	4908      	ldr	r1, [pc, #32]	; (0x148c)
    146a:	00c4      	lsls	r4, r0, #3
    146c:	0000      	movs	r0, r0
    146e:	0e24      	lsrs	r4, r4, #24
    1470:	0f72      	lsrs	r2, r6, #29
    1472:	0000      	movs	r0, r0
    1474:	0908      	lsrs	r0, r1, #4
    1476:	2849      	cmp	r0, #73	; 0x49
    1478:	0006      	movs	r6, r0
    147a:	2800      	cmp	r0, #0
    147c:	3d0e      	subs	r5, #14
    147e:	0029      	movs	r1, r5
    1480:	0800      	lsrs	r0, r0, #32
    1482:	490a      	ldr	r1, [pc, #40]	; (0x14ac)
    1484:	00c4      	lsls	r4, r0, #3
    1486:	0000      	movs	r0, r0
    1488:	0e38      	lsrs	r0, r7, #24
    148a:	297c      	cmp	r1, #124	; 0x7c
    148c:	0000      	movs	r0, r0
    148e:	0b08      	lsrs	r0, r1, #12
    1490:	c449      	stmia	r4!, {r0, r3, r6}
    1492:	0000      	movs	r0, r0
    1494:	3c00      	subs	r4, #0
    1496:	950e      	str	r5, [sp, #56]	; 0x38
    1498:	0007      	movs	r7, r0
    149a:	0800      	lsrs	r0, r0, #32
    149c:	490c      	ldr	r1, [pc, #48]	; (0x14d0)
    149e:	00c4      	lsls	r4, r0, #3
    14a0:	0000      	movs	r0, r0
    14a2:	0e40      	lsrs	r0, r0, #25
    14a4:	1776      	asrs	r6, r6, #29
    14a6:	0000      	movs	r0, r0
    14a8:	0d08      	lsrs	r0, r1, #20
    14aa:	c449      	stmia	r4!, {r0, r3, r6}
    14ac:	0000      	movs	r0, r0
    14ae:	4400      	add	r0, r0
    14b0:	840e      	strh	r6, [r1, #32]
    14b2:	0011      	movs	r1, r2
    14b4:	0800      	lsrs	r0, r0, #32
    14b6:	490e      	ldr	r1, [pc, #56]	; (0x14f0)
    14b8:	00c4      	lsls	r4, r0, #3
    14ba:	0000      	movs	r0, r0
    14bc:	0e48      	lsrs	r0, r1, #25
    14be:	0f7d      	lsrs	r5, r7, #29
    14c0:	0000      	movs	r0, r0
    14c2:	0f08      	lsrs	r0, r1, #28
    14c4:	0149      	lsls	r1, r1, #5
    14c6:	0017      	movs	r7, r2
    14c8:	4c00      	ldr	r4, [pc, #0]	; (0x14cc)
    14ca:	d718      	bvc.n	0x14fe
    14cc:	000b      	movs	r3, r1
    14ce:	0000      	movs	r0, r0
    14d0:	0f01      	lsrs	r1, r0, #28
    14d2:	0f88      	lsrs	r0, r1, #30
    14d4:	0000      	movs	r0, r0
    14d6:	1808      	adds	r0, r1, r0
    14d8:	3849      	subs	r0, #73	; 0x49
    14da:	0006      	movs	r6, r0
    14dc:	0c00      	lsrs	r0, r0, #16
    14de:	0f01      	lsrs	r1, r0, #28
    14e0:	171a      	asrs	r2, r3, #28
    14e2:	0000      	movs	r0, r0
    14e4:	1908      	adds	r0, r1, r4
    14e6:	1349      	asrs	r1, r1, #13
    14e8:	0006      	movs	r6, r0
    14ea:	2000      	movs	r0, #0
    14ec:	0f01      	lsrs	r1, r0, #28
    14ee:	0f93      	lsrs	r3, r2, #30
    14f0:	0000      	movs	r0, r0
    14f2:	1a08      	subs	r0, r1, r0
    14f4:	3849      	subs	r0, #73	; 0x49
    14f6:	0006      	movs	r6, r0
    14f8:	2c00      	cmp	r4, #0
    14fa:	0f01      	lsrs	r1, r0, #28
    14fc:	35ac      	adds	r5, #172	; 0xac
    14fe:	0000      	movs	r0, r0
    1500:	1b08      	subs	r0, r1, r4
    1502:	1349      	asrs	r1, r1, #13
    1504:	0006      	movs	r6, r0
    1506:	4000      	ands	r0, r0
    1508:	0f01      	lsrs	r1, r0, #28
    150a:	0f9e      	lsrs	r6, r3, #30
    150c:	0000      	movs	r0, r0
    150e:	1c08      	adds	r0, r1, #0
    1510:	3849      	subs	r0, #73	; 0x49
    1512:	0006      	movs	r6, r0
    1514:	4c00      	ldr	r4, [pc, #0]	; (0x1518)
    1516:	0f01      	lsrs	r1, r0, #28
    1518:	240c      	movs	r4, #12
    151a:	0000      	movs	r0, r0
    151c:	1d08      	adds	r0, r1, #4
    151e:	c449      	stmia	r4!, {r0, r3, r6}
    1520:	0000      	movs	r0, r0
    1522:	6000      	str	r0, [r0, #0]
    1524:	0f01      	lsrs	r1, r0, #28
    1526:	0fa9      	lsrs	r1, r5, #30
    1528:	0000      	movs	r0, r0
    152a:	1e08      	subs	r0, r1, #0
    152c:	1149      	asrs	r1, r1, #5
    152e:	0017      	movs	r7, r2
    1530:	6400      	str	r0, [r0, #64]	; 0x40
    1532:	1801      	adds	r1, r0, r0
    1534:	0c2a      	lsrs	r2, r5, #16
    1536:	0000      	movs	r0, r0
    1538:	0200      	lsls	r0, r0, #8
    153a:	b40f      	push	{r0, r1, r2, r3}
    153c:	000f      	movs	r7, r1
    153e:	0800      	lsrs	r0, r0, #32
    1540:	4927      	ldr	r1, [pc, #156]	; (0x15e0)
    1542:	0638      	lsls	r0, r7, #24
    1544:	0000      	movs	r0, r0
    1546:	020c      	lsls	r4, r1, #8
    1548:	ea0f 0006 	and.w	r0, pc, r6
    154c:	0800      	lsrs	r0, r0, #32
    154e:	4928      	ldr	r1, [pc, #160]	; (0x15f0)
    1550:	0613      	lsls	r3, r2, #24
    1552:	0000      	movs	r0, r0
    1554:	0220      	lsls	r0, r4, #8
    1556:	bf0f      	iteee	eq
    1558:	000f      	moveq	r7, r1
    155a:	0800      	lsrne	r0, r0, #32
    155c:	4929      	ldrne	r1, [pc, #164]	; (0x1604)
    155e:	0638      	lslne	r0, r7, #24
    1560:	0000      	movs	r0, r0
    1562:	022c      	lsls	r4, r5, #8
    1564:	570f      	ldrsb	r7, [r1, r4]
    1566:	0028      	movs	r0, r5
    1568:	0800      	lsrs	r0, r0, #32
    156a:	492a      	ldr	r1, [pc, #168]	; (0x1614)
    156c:	0613      	lsls	r3, r2, #24
    156e:	0000      	movs	r0, r0
    1570:	0240      	lsls	r0, r0, #9
    1572:	960f      	str	r6, [sp, #60]	; 0x3c
    1574:	000c      	movs	r4, r1
    1576:	0800      	lsrs	r0, r0, #32
    1578:	492b      	ldr	r1, [pc, #172]	; (0x1628)
    157a:	0638      	lsls	r0, r7, #24
    157c:	0000      	movs	r0, r0
    157e:	024c      	lsls	r4, r1, #9
    1580:	7018      	strb	r0, [r3, #0]
    1582:	000c      	movs	r4, r1
    1584:	6000      	str	r0, [r0, #0]
    1586:	0f02      	lsrs	r2, r0, #28
    1588:	04b2      	lsls	r2, r6, #18
    158a:	0000      	movs	r0, r0
    158c:	3308      	adds	r3, #8
    158e:	c449      	stmia	r4!, {r0, r3, r6}
    1590:	0000      	movs	r0, r0
    1592:	6800      	ldr	r0, [r0, #0]
    1594:	1802      	adds	r2, r0, r0
    1596:	0cdd      	lsrs	r5, r3, #19
    1598:	0000      	movs	r0, r0
    159a:	026c      	lsls	r4, r5, #9
    159c:	bf0f      	iteee	eq
    159e:	0028      	moveq	r0, r5
    15a0:	0800      	lsrne	r0, r0, #32
    15a2:	493e      	ldrne	r1, [pc, #248]	; (0x169c)
    15a4:	00c4      	lslne	r4, r0, #3
    15a6:	0000      	movs	r0, r0
    15a8:	0280      	lsls	r0, r0, #10
    15aa:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
    15ac:	0028      	movs	r0, r5
    15ae:	0800      	lsrs	r0, r0, #32
    15b0:	493f      	ldr	r1, [pc, #252]	; (0x16b0)
    15b2:	00c4      	lsls	r4, r0, #3
    15b4:	0000      	movs	r0, r0
    15b6:	0284      	lsls	r4, r0, #10
    15b8:	f10f 000b 	add.w	r0, pc, #11
    15bc:	0800      	lsrs	r0, r0, #32
    15be:	4940      	ldr	r1, [pc, #256]	; (0x16c0)
    15c0:	00c4      	lsls	r4, r0, #3
    15c2:	0000      	movs	r0, r0
    15c4:	0288      	lsls	r0, r1, #10
    15c6:	a20f      	add	r2, pc, #60	; (adr r2, 0x1604)
    15c8:	000c      	movs	r4, r1
    15ca:	0800      	lsrs	r0, r0, #32
    15cc:	4941      	ldr	r1, [pc, #260]	; (0x16d4)
    15ce:	05c3      	lsls	r3, r0, #23
    15d0:	0000      	movs	r0, r0
    15d2:	028c      	lsls	r4, r1, #10
    15d4:	6d0f      	ldr	r7, [r1, #80]	; 0x50
    15d6:	000e      	movs	r6, r1
    15d8:	0800      	lsrs	r0, r0, #32
    15da:	4942      	ldr	r1, [pc, #264]	; (0x16e4)
    15dc:	00c4      	lsls	r4, r0, #3
    15de:	0000      	movs	r0, r0
    15e0:	0290      	lsls	r0, r2, #10
    15e2:	7a0f      	ldrb	r7, [r1, #8]
    15e4:	0019      	movs	r1, r3
    15e6:	0800      	lsrs	r0, r0, #32
    15e8:	4943      	ldr	r1, [pc, #268]	; (0x16f8)
    15ea:	00c4      	lsls	r4, r0, #3
    15ec:	0000      	movs	r0, r0
    15ee:	0294      	lsls	r4, r2, #10
    15f0:	ae0f      	add	r6, sp, #60	; 0x3c
    15f2:	000c      	movs	r4, r1
    15f4:	0800      	lsrs	r0, r0, #32
    15f6:	4944      	ldr	r1, [pc, #272]	; (0x1708)
    15f8:	05b3      	lsls	r3, r6, #22
    15fa:	0000      	movs	r0, r0
    15fc:	0298      	lsls	r0, r3, #10
    15fe:	2c0f      	cmp	r4, #15
    1600:	0008      	movs	r0, r1
    1602:	0800      	lsrs	r0, r0, #32
    1604:	4945      	ldr	r1, [pc, #276]	; (0x171c)
    1606:	00c4      	lsls	r4, r0, #3
    1608:	0000      	movs	r0, r0
    160a:	02a4      	lsls	r4, r4, #10
    160c:	bc0f      	pop	{r0, r1, r2, r3}
    160e:	001b      	movs	r3, r3
    1610:	0800      	lsrs	r0, r0, #32
    1612:	4946      	ldr	r1, [pc, #280]	; (0x172c)
    1614:	00c4      	lsls	r4, r0, #3
    1616:	0000      	movs	r0, r0
    1618:	02a8      	lsls	r0, r5, #10
    161a:	d70f      	bvc.n	0x163c
    161c:	0028      	movs	r0, r5
    161e:	0800      	lsrs	r0, r0, #32
    1620:	4947      	ldr	r1, [pc, #284]	; (0x1740)
    1622:	00c4      	lsls	r4, r0, #3
    1624:	0000      	movs	r0, r0
    1626:	02ac      	lsls	r4, r5, #10
    1628:	7118      	strb	r0, [r3, #4]
    162a:	000d      	movs	r5, r1
    162c:	b000      	add	sp, #0
    162e:	0f02      	lsrs	r2, r0, #28
    1630:	2df7      	cmp	r5, #247	; 0xf7
    1632:	0000      	movs	r0, r0
    1634:	5508      	strb	r0, [r1, r4]
    1636:	c449      	stmia	r4!, {r0, r3, r6}
    1638:	0000      	movs	r0, r0
    163a:	d000      	beq.n	0x163e
    163c:	0f02      	lsrs	r2, r0, #28
    163e:	0cba      	lsrs	r2, r7, #18
    1640:	0000      	movs	r0, r0
    1642:	5608      	ldrsb	r0, [r1, r0]
    1644:	b349      	cbz	r1, 0x169a
    1646:	0005      	movs	r5, r0
    1648:	d400      	bmi.n	0x164c
    164a:	0f02      	lsrs	r2, r0, #28
    164c:	1196      	asrs	r6, r2, #6
    164e:	0000      	movs	r0, r0
    1650:	5708      	ldrsb	r0, [r1, r4]
    1652:	c449      	stmia	r4!, {r0, r3, r6}
    1654:	0000      	movs	r0, r0
    1656:	e000      	b.n	0x165a
    1658:	0f02      	lsrs	r2, r0, #28
    165a:	0cc6      	lsrs	r6, r0, #19
    165c:	0000      	movs	r0, r0
    165e:	5808      	ldr	r0, [r1, r0]
    1660:	a349      	add	r3, pc, #292	; (adr r3, 0x1788)
    1662:	0005      	movs	r5, r0
    1664:	e400      	b.n	0xe68
    1666:	0f02      	lsrs	r2, r0, #28
    1668:	01f9      	lsls	r1, r7, #7
    166a:	0000      	movs	r0, r0
    166c:	5908      	ldr	r0, [r1, r4]
    166e:	c449      	stmia	r4!, {r0, r3, r6}
    1670:	0000      	movs	r0, r0
    1672:	ec00 0f02 	stc	15, cr0, [r0], {2}
    1676:	0dda      	lsrs	r2, r3, #23
    1678:	0000      	movs	r0, r0
    167a:	5a08      	ldrh	r0, [r1, r0]
    167c:	c449      	stmia	r4!, {r0, r3, r6}
    167e:	0000      	movs	r0, r0
    1680:	f000 0f02 	and.w	pc, r0, #2
    1684:	1600      	asrs	r0, r0, #24
    1686:	0000      	movs	r0, r0
    1688:	5b08      	ldrh	r0, [r1, r4]
    168a:	c449      	stmia	r4!, {r0, r3, r6}
    168c:	0000      	movs	r0, r0
    168e:	f400 0f02 	and.w	pc, r0, #8519680	; 0x820000
    1692:	3021      	adds	r0, #33	; 0x21
    1694:	0000      	movs	r0, r0
    1696:	5c08      	ldrb	r0, [r1, r0]
    1698:	c449      	stmia	r4!, {r0, r3, r6}
    169a:	0000      	movs	r0, r0
    169c:	f800 0f02 	strb.w	r0, [r0, #2]!
    16a0:	0cd2      	lsrs	r2, r2, #19
    16a2:	0000      	movs	r0, r0
    16a4:	5d08      	ldrb	r0, [r1, r4]
    16a6:	c349      	stmia	r3!, {r0, r3, r6}
    16a8:	0005      	movs	r5, r0
    16aa:	fc00 0f02 	stc2	15, cr0, [r0], {2}
    16ae:	0694      	lsls	r4, r2, #26
    16b0:	0000      	movs	r0, r0
    16b2:	5e08      	ldrsh	r0, [r1, r0]
    16b4:	c449      	stmia	r4!, {r0, r3, r6}
    16b6:	0000      	movs	r0, r0
    16b8:	0000      	movs	r0, r0
    16ba:	0f03      	lsrs	r3, r0, #28
    16bc:	06a3      	lsls	r3, r4, #26
    16be:	0000      	movs	r0, r0
    16c0:	5f08      	ldrsh	r0, [r1, r4]
    16c2:	c449      	stmia	r4!, {r0, r3, r6}
    16c4:	0000      	movs	r0, r0
    16c6:	0400      	lsls	r0, r0, #16
    16c8:	0f03      	lsrs	r3, r0, #28
    16ca:	2902      	cmp	r1, #2
    16cc:	0000      	movs	r0, r0
    16ce:	6008      	str	r0, [r1, #0]
    16d0:	c449      	stmia	r4!, {r0, r3, r6}
    16d2:	0000      	movs	r0, r0
    16d4:	0800      	lsrs	r0, r0, #32
    16d6:	0f03      	lsrs	r3, r0, #28
    16d8:	0cde      	lsrs	r6, r3, #19
    16da:	0000      	movs	r0, r0
    16dc:	6108      	str	r0, [r1, #16]
    16de:	3849      	subs	r0, #73	; 0x49
    16e0:	0006      	movs	r6, r0
    16e2:	0c00      	lsrs	r0, r0, #16
    16e4:	1803      	adds	r3, r0, r0
    16e6:	0e05      	lsrs	r5, r0, #24
    16e8:	0000      	movs	r0, r0
    16ea:	0320      	lsls	r0, r4, #12
    16ec:	ea0f 000c 	and.w	r0, pc, ip
    16f0:	0800      	lsrs	r0, r0, #32
    16f2:	496f      	ldr	r1, [pc, #444]	; (0x18b0)
    16f4:	1721      	asrs	r1, r4, #28
    16f6:	0000      	movs	r0, r0
    16f8:	0340      	lsls	r0, r0, #13
    16fa:	830f      	strh	r7, [r1, #24]
    16fc:	0023      	movs	r3, r4
    16fe:	0800      	lsrs	r0, r0, #32
    1700:	4970      	ldr	r1, [pc, #448]	; (0x18c4)
    1702:	00c4      	lsls	r4, r0, #3
    1704:	0000      	movs	r0, r0
    1706:	0380      	lsls	r0, r0, #14
    1708:	bb0f      	cbnz	r7, 0x174e
    170a:	002e      	movs	r6, r5
    170c:	0800      	lsrs	r0, r0, #32
    170e:	4971      	ldr	r1, [pc, #452]	; (0x18d4)
    1710:	00c4      	lsls	r4, r0, #3
    1712:	0000      	movs	r0, r0
    1714:	0384      	lsls	r4, r0, #14
    1716:	170f      	asrs	r7, r1, #28
    1718:	001b      	movs	r3, r3
    171a:	0800      	lsrs	r0, r0, #32
    171c:	4972      	ldr	r1, [pc, #456]	; (0x18e8)
    171e:	00c4      	lsls	r4, r0, #3
    1720:	0000      	movs	r0, r0
    1722:	0388      	lsls	r0, r1, #14
    1724:	fb0f 0031 			; <UNDEFINED> instruction: 0xfb0f0031
    1728:	0800      	lsrs	r0, r0, #32
    172a:	4973      	ldr	r1, [pc, #460]	; (0x18f8)
    172c:	00c4      	lsls	r4, r0, #3
    172e:	0000      	movs	r0, r0
    1730:	038c      	lsls	r4, r1, #14
    1732:	f60f 000c 	addw	r0, pc, #2060	; 0x80c
    1736:	0800      	lsrs	r0, r0, #32
    1738:	4974      	ldr	r1, [pc, #464]	; (0x190c)
    173a:	05c3      	lsls	r3, r0, #23
    173c:	0000      	movs	r0, r0
    173e:	0390      	lsls	r0, r2, #14
    1740:	4b0f      	ldr	r3, [pc, #60]	; (0x1780)
    1742:	0015      	movs	r5, r2
    1744:	0800      	lsrs	r0, r0, #32
    1746:	4975      	ldr	r1, [pc, #468]	; (0x191c)
    1748:	00c4      	lsls	r4, r0, #3
    174a:	0000      	movs	r0, r0
    174c:	0394      	lsls	r4, r2, #14
    174e:	ed0f 0005 	stc	0, cr0, [pc, #-20]	; 0x173c
    1752:	0800      	lsrs	r0, r0, #32
    1754:	4976      	ldr	r1, [pc, #472]	; (0x1930)
    1756:	00c4      	lsls	r4, r0, #3
    1758:	0000      	movs	r0, r0
    175a:	0398      	lsls	r0, r3, #14
    175c:	6b0f      	ldr	r7, [r1, #48]	; 0x30
    175e:	0013      	movs	r3, r2
    1760:	0800      	lsrs	r0, r0, #32
    1762:	4977      	ldr	r1, [pc, #476]	; (0x1940)
    1764:	00c4      	lsls	r4, r0, #3
    1766:	0000      	movs	r0, r0
    1768:	039c      	lsls	r4, r3, #14
    176a:	b00f      	add	sp, #60	; 0x3c
    176c:	0018      	movs	r0, r3
    176e:	0800      	lsrs	r0, r0, #32
    1770:	4978      	ldr	r1, [pc, #480]	; (0x1954)
    1772:	05b3      	lsls	r3, r6, #22
    1774:	0000      	movs	r0, r0
    1776:	03a0      	lsls	r0, r4, #14
    1778:	210f      	movs	r1, #15
    177a:	0025      	movs	r5, r4
    177c:	0800      	lsrs	r0, r0, #32
    177e:	4979      	ldr	r1, [pc, #484]	; (0x1964)
    1780:	00c4      	lsls	r4, r0, #3
    1782:	0000      	movs	r0, r0
    1784:	03ac      	lsls	r4, r5, #14
    1786:	f40f 000d 	and.w	r0, pc, #9240576	; 0x8d0000
    178a:	0800      	lsrs	r0, r0, #32
    178c:	497a      	ldr	r1, [pc, #488]	; (0x1978)
    178e:	05c3      	lsls	r3, r0, #23
    1790:	0000      	movs	r0, r0
    1792:	03b0      	lsls	r0, r6, #14
    1794:	0a0f      	lsrs	r7, r1, #8
    1796:	0030      	movs	r0, r6
    1798:	0800      	lsrs	r0, r0, #32
    179a:	497b      	ldr	r1, [pc, #492]	; (0x1988)
    179c:	00c4      	lsls	r4, r0, #3
    179e:	0000      	movs	r0, r0
    17a0:	03b4      	lsls	r4, r6, #14
    17a2:	190f      	adds	r7, r1, r4
    17a4:	0038      	movs	r0, r7
    17a6:	0800      	lsrs	r0, r0, #32
    17a8:	497c      	ldr	r1, [pc, #496]	; (0x199c)
    17aa:	00c4      	lsls	r4, r0, #3
    17ac:	0000      	movs	r0, r0
    17ae:	03b8      	lsls	r0, r7, #14
    17b0:	b30f      	cbz	r7, 0x17f6
    17b2:	002c      	movs	r4, r5
    17b4:	0800      	lsrs	r0, r0, #32
    17b6:	497d      	ldr	r1, [pc, #500]	; (0x19ac)
    17b8:	00c4      	lsls	r4, r0, #3
    17ba:	0000      	movs	r0, r0
    17bc:	03bc      	lsls	r4, r7, #14
    17be:	000f      	movs	r7, r1
    17c0:	000e      	movs	r6, r1
    17c2:	0800      	lsrs	r0, r0, #32
    17c4:	497e      	ldr	r1, [pc, #504]	; (0x19c0)
    17c6:	05c3      	lsls	r3, r0, #23
    17c8:	0000      	movs	r0, r0
    17ca:	03c0      	lsls	r0, r0, #15
    17cc:	3a0f      	subs	r2, #15
    17ce:	0030      	movs	r0, r6
    17d0:	0800      	lsrs	r0, r0, #32
    17d2:	497f      	ldr	r1, [pc, #508]	; (0x19d0)
    17d4:	00c4      	lsls	r4, r0, #3
    17d6:	0000      	movs	r0, r0
    17d8:	03c4      	lsls	r4, r0, #15
    17da:	0c0f      	lsrs	r7, r1, #16
    17dc:	000e      	movs	r6, r1
    17de:	0800      	lsrs	r0, r0, #32
    17e0:	4980      	ldr	r1, [pc, #512]	; (0x19e4)
    17e2:	1731      	asrs	r1, r6, #28
    17e4:	0000      	movs	r0, r0
    17e6:	03c8      	lsls	r0, r1, #15
    17e8:	3c0f      	subs	r4, #15
    17ea:	0038      	movs	r0, r7
    17ec:	0800      	lsrs	r0, r0, #32
    17ee:	4981      	ldr	r1, [pc, #516]	; (0x19f4)
    17f0:	00c4      	lsls	r4, r0, #3
    17f2:	0000      	movs	r0, r0
    17f4:	03fc      	lsls	r4, r7, #15
    17f6:	e60f      	b.n	0x1418
    17f8:	001d      	movs	r5, r3
    17fa:	0800      	lsrs	r0, r0, #32
    17fc:	4982      	ldr	r1, [pc, #520]	; (0x1a08)
    17fe:	00c4      	lsls	r4, r0, #3
    1800:	0000      	movs	r0, r0
    1802:	0400      	lsls	r0, r0, #16
    1804:	600f      	str	r7, [r1, #0]
    1806:	000e      	movs	r6, r1
    1808:	0800      	lsrs	r0, r0, #32
    180a:	4983      	ldr	r1, [pc, #524]	; (0x1a18)
    180c:	00c4      	lsls	r4, r0, #3
    180e:	0000      	movs	r0, r0
    1810:	0404      	lsls	r4, r0, #16
    1812:	180f      	adds	r7, r1, r0
    1814:	000e      	movs	r6, r1
    1816:	0800      	lsrs	r0, r0, #32
    1818:	4984      	ldr	r1, [pc, #528]	; (0x1a2c)
    181a:	05c3      	lsls	r3, r0, #23
    181c:	0000      	movs	r0, r0
    181e:	0408      	lsls	r0, r1, #16
    1820:	5a0f      	ldrh	r7, [r1, r0]
    1822:	0012      	movs	r2, r2
    1824:	0800      	lsrs	r0, r0, #32
    1826:	4985      	ldr	r1, [pc, #532]	; (0x1a3c)
    1828:	00c4      	lsls	r4, r0, #3
    182a:	0000      	movs	r0, r0
    182c:	040c      	lsls	r4, r1, #16
    182e:	a40f      	add	r4, pc, #60	; (adr r4, 0x186c)
    1830:	002a      	movs	r2, r5
    1832:	0800      	lsrs	r0, r0, #32
    1834:	4986      	ldr	r1, [pc, #536]	; (0x1a50)
    1836:	00c9      	lsls	r1, r1, #3
    1838:	0000      	movs	r0, r0
    183a:	0410      	lsls	r0, r2, #16
    183c:	800f      	strh	r7, [r1, #0]
    183e:	0005      	movs	r5, r0
    1840:	0800      	lsrs	r0, r0, #32
    1842:	4987      	ldr	r1, [pc, #540]	; (0x1a60)
    1844:	00c4      	lsls	r4, r0, #3
    1846:	0000      	movs	r0, r0
    1848:	0414      	lsls	r4, r2, #16
    184a:	240f      	movs	r4, #15
    184c:	000e      	movs	r6, r1
    184e:	0800      	lsrs	r0, r0, #32
    1850:	4988      	ldr	r1, [pc, #544]	; (0x1a74)
    1852:	05c3      	lsls	r3, r0, #23
    1854:	0000      	movs	r0, r0
    1856:	0418      	lsls	r0, r3, #16
    1858:	dc0f      	bgt.n	0x187a
    185a:	001a      	movs	r2, r3
    185c:	0800      	lsrs	r0, r0, #32
    185e:	4989      	ldr	r1, [pc, #548]	; (0x1a84)
    1860:	00c4      	lsls	r4, r0, #3
    1862:	0000      	movs	r0, r0
    1864:	041c      	lsls	r4, r3, #16
    1866:	b80f      			; <UNDEFINED> instruction: 0xb80f
    1868:	0028      	movs	r0, r5
    186a:	0800      	lsrs	r0, r0, #32
    186c:	498a      	ldr	r1, [pc, #552]	; (0x1a98)
    186e:	00c4      	lsls	r4, r0, #3
    1870:	0000      	movs	r0, r0
    1872:	0420      	lsls	r0, r4, #16
    1874:	550f      	strb	r7, [r1, r4]
    1876:	0013      	movs	r3, r2
    1878:	0800      	lsrs	r0, r0, #32
    187a:	498b      	ldr	r1, [pc, #556]	; (0x1aa8)
    187c:	00c4      	lsls	r4, r0, #3
    187e:	0000      	movs	r0, r0
    1880:	0424      	lsls	r4, r4, #16
    1882:	5c0f      	ldrb	r7, [r1, r0]
    1884:	002c      	movs	r4, r5
    1886:	0800      	lsrs	r0, r0, #32
    1888:	498c      	ldr	r1, [pc, #560]	; (0x1abc)
    188a:	00c9      	lsls	r1, r1, #3
    188c:	0000      	movs	r0, r0
    188e:	0428      	lsls	r0, r5, #16
    1890:	300f      	adds	r0, #15
    1892:	000e      	movs	r6, r1
    1894:	0800      	lsrs	r0, r0, #32
    1896:	498d      	ldr	r1, [pc, #564]	; (0x1acc)
    1898:	0618      	lsls	r0, r3, #24
    189a:	0000      	movs	r0, r0
    189c:	042c      	lsls	r4, r5, #16
    189e:	ee0f 001b 	mcr	0, 0, r0, cr15, cr11, {0}
    18a2:	0800      	lsrs	r0, r0, #32
    18a4:	498e      	ldr	r1, [pc, #568]	; (0x1ae0)
    18a6:	00c4      	lsls	r4, r0, #3
    18a8:	0000      	movs	r0, r0
    18aa:	0450      	lsls	r0, r2, #17
    18ac:	3c0f      	subs	r4, #15
    18ae:	000e      	movs	r6, r1
    18b0:	0800      	lsrs	r0, r0, #32
    18b2:	498f      	ldr	r1, [pc, #572]	; (0x1af0)
    18b4:	05b3      	lsls	r3, r6, #22
    18b6:	0000      	movs	r0, r0
    18b8:	0454      	lsls	r4, r2, #17
    18ba:	770f      	strb	r7, [r1, #28]
    18bc:	000b      	movs	r3, r1
    18be:	0800      	lsrs	r0, r0, #32
    18c0:	4990      	ldr	r1, [pc, #576]	; (0x1b04)
    18c2:	00c4      	lsls	r4, r0, #3
    18c4:	0000      	movs	r0, r0
    18c6:	0460      	lsls	r0, r4, #17
    18c8:	480f      	ldr	r0, [pc, #60]	; (0x1908)
    18ca:	000e      	movs	r6, r1
    18cc:	0800      	lsrs	r0, r0, #32
    18ce:	4991      	ldr	r1, [pc, #580]	; (0x1b14)
    18d0:	1741      	asrs	r1, r0, #29
    18d2:	0000      	movs	r0, r0
    18d4:	0464      	lsls	r4, r4, #17
    18d6:	4a0f      	ldr	r2, [pc, #60]	; (0x1914)
    18d8:	0003      	movs	r3, r0
    18da:	0800      	lsrs	r0, r0, #32
    18dc:	4992      	ldr	r1, [pc, #584]	; (0x1b28)
    18de:	00c4      	lsls	r4, r0, #3
    18e0:	0000      	movs	r0, r0
    18e2:	0560      	lsls	r0, r4, #21
    18e4:	660f      	str	r7, [r1, #96]	; 0x60
    18e6:	001c      	movs	r4, r3
    18e8:	0800      	lsrs	r0, r0, #32
    18ea:	4993      	ldr	r1, [pc, #588]	; (0x1b38)
    18ec:	00c9      	lsls	r1, r1, #3
    18ee:	0000      	movs	r0, r0
    18f0:	0564      	lsls	r4, r4, #21
    18f2:	8c0f      	ldrh	r7, [r1, #32]
    18f4:	0022      	movs	r2, r4
    18f6:	0800      	lsrs	r0, r0, #32
    18f8:	4994      	ldr	r1, [pc, #592]	; (0x1b4c)
    18fa:	00c4      	lsls	r4, r0, #3
    18fc:	0000      	movs	r0, r0
    18fe:	0568      	lsls	r0, r5, #21
    1900:	1b0f      	subs	r7, r1, r4
    1902:	0007      	movs	r7, r0
    1904:	0800      	lsrs	r0, r0, #32
    1906:	4995      	ldr	r1, [pc, #596]	; (0x1b5c)
    1908:	00c4      	lsls	r4, r0, #3
    190a:	0000      	movs	r0, r0
    190c:	056c      	lsls	r4, r5, #21
    190e:	830f      	strh	r7, [r1, #24]
    1910:	0020      	movs	r0, r4
    1912:	0800      	lsrs	r0, r0, #32
    1914:	4996      	ldr	r1, [pc, #600]	; (0x1b70)
    1916:	00c4      	lsls	r4, r0, #3
    1918:	0000      	movs	r0, r0
    191a:	0570      	lsls	r0, r6, #21
    191c:	240f      	movs	r4, #15
    191e:	0032      	movs	r2, r6
    1920:	0800      	lsrs	r0, r0, #32
    1922:	4997      	ldr	r1, [pc, #604]	; (0x1b80)
    1924:	00c4      	lsls	r4, r0, #3
    1926:	0000      	movs	r0, r0
    1928:	0574      	lsls	r4, r6, #21
    192a:	ce0f      	ldmia	r6!, {r0, r1, r2, r3}
    192c:	0012      	movs	r2, r2
    192e:	0800      	lsrs	r0, r0, #32
    1930:	4998      	ldr	r1, [pc, #608]	; (0x1b94)
    1932:	00c9      	lsls	r1, r1, #3
    1934:	0000      	movs	r0, r0
    1936:	0578      	lsls	r0, r7, #21
    1938:	540f      	strb	r7, [r1, r0]
    193a:	000e      	movs	r6, r1
    193c:	0800      	lsrs	r0, r0, #32
    193e:	4999      	ldr	r1, [pc, #612]	; (0x1ba4)
    1940:	05c3      	lsls	r3, r0, #23
    1942:	0000      	movs	r0, r0
    1944:	057c      	lsls	r4, r7, #21
    1946:	f00f 002a 	and.w	r0, pc, #42	; 0x2a
    194a:	0800      	lsrs	r0, r0, #32
    194c:	499a      	ldr	r1, [pc, #616]	; (0x1bb8)
    194e:	00c4      	lsls	r4, r0, #3
    1950:	0000      	movs	r0, r0
    1952:	0580      	lsls	r0, r0, #22
    1954:	c70f      	stmia	r7!, {r0, r1, r2, r3}
    1956:	000b      	movs	r3, r1
    1958:	0800      	lsrs	r0, r0, #32
    195a:	499b      	ldr	r1, [pc, #620]	; (0x1bc8)
    195c:	00c9      	lsls	r1, r1, #3
    195e:	0000      	movs	r0, r0
    1960:	0584      	lsls	r4, r0, #22
    1962:	bf0f      	iteee	eq
    1964:	0011      	moveq	r1, r2
    1966:	0800      	lsrne	r0, r0, #32
    1968:	499c      	ldrne	r1, [pc, #624]	; (0x1bdc)
    196a:	00c4      	lslne	r4, r0, #3
    196c:	0000      	movs	r0, r0
    196e:	0588      	lsls	r0, r1, #22
    1970:	2c0f      	cmp	r4, #15
    1972:	0010      	movs	r0, r2
    1974:	0800      	lsrs	r0, r0, #32
    1976:	499d      	ldr	r1, [pc, #628]	; (0x1bec)
    1978:	00c4      	lsls	r4, r0, #3
    197a:	0000      	movs	r0, r0
    197c:	058c      	lsls	r4, r1, #22
    197e:	8e0f      	ldrh	r7, [r1, #48]	; 0x30
    1980:	0032      	movs	r2, r6
    1982:	0800      	lsrs	r0, r0, #32
    1984:	499e      	ldr	r1, [pc, #632]	; (0x1c00)
    1986:	00c4      	lsls	r4, r0, #3
    1988:	0000      	movs	r0, r0
    198a:	0590      	lsls	r0, r2, #22
    198c:	980f      	ldr	r0, [sp, #60]	; 0x3c
    198e:	0032      	movs	r2, r6
    1990:	0800      	lsrs	r0, r0, #32
    1992:	499f      	ldr	r1, [pc, #636]	; (0x1c10)
    1994:	00c4      	lsls	r4, r0, #3
    1996:	0000      	movs	r0, r0
    1998:	0594      	lsls	r4, r2, #22
    199a:	aa0f      	add	r2, sp, #60	; 0x3c
    199c:	0028      	movs	r0, r5
    199e:	0800      	lsrs	r0, r0, #32
    19a0:	49a0      	ldr	r1, [pc, #640]	; (0x1c24)
    19a2:	00c4      	lsls	r4, r0, #3
    19a4:	0000      	movs	r0, r0
    19a6:	0598      	lsls	r0, r3, #22
    19a8:	b50f      	push	{r0, r1, r2, r3, lr}
    19aa:	0007      	movs	r7, r0
    19ac:	0800      	lsrs	r0, r0, #32
    19ae:	49a1      	ldr	r1, [pc, #644]	; (0x1c34)
    19b0:	00c9      	lsls	r1, r1, #3
    19b2:	0000      	movs	r0, r0
    19b4:	059c      	lsls	r4, r3, #22
    19b6:	6d0f      	ldr	r7, [r1, #80]	; 0x50
    19b8:	001a      	movs	r2, r3
    19ba:	0800      	lsrs	r0, r0, #32
    19bc:	49a2      	ldr	r1, [pc, #648]	; (0x1c48)
    19be:	1751      	asrs	r1, r2, #29
    19c0:	0000      	movs	r0, r0
    19c2:	05a0      	lsls	r0, r4, #22
    19c4:	570f      	ldrsb	r7, [r1, r4]
    19c6:	001d      	movs	r5, r3
    19c8:	0800      	lsrs	r0, r0, #32
    19ca:	49a3      	ldr	r1, [pc, #652]	; (0x1c58)
    19cc:	00c4      	lsls	r4, r0, #3
    19ce:	0000      	movs	r0, r0
    19d0:	05cc      	lsls	r4, r1, #23
    19d2:	9c0f      	ldr	r4, [sp, #60]	; 0x3c
    19d4:	000e      	movs	r6, r1
    19d6:	0800      	lsrs	r0, r0, #32
    19d8:	49a4      	ldr	r1, [pc, #656]	; (0x1c6c)
    19da:	0876      	lsrs	r6, r6, #1
    19dc:	0000      	movs	r0, r0
    19de:	05d0      	lsls	r0, r2, #23
    19e0:	060f      	lsls	r7, r1, #24
    19e2:	0011      	movs	r1, r2
    19e4:	0800      	lsrs	r0, r0, #32
    19e6:	49a5      	ldr	r1, [pc, #660]	; (0x1c7c)
    19e8:	0587      	lsls	r7, r0, #22
    19ea:	0000      	movs	r0, r0
    19ec:	0680      	lsls	r0, r0, #26
    19ee:	a80f      	add	r0, sp, #60	; 0x3c
    19f0:	000e      	movs	r6, r1
    19f2:	0800      	lsrs	r0, r0, #32
    19f4:	49a6      	ldr	r1, [pc, #664]	; (0x1c90)
    19f6:	0812      	lsrs	r2, r2, #32
    19f8:	0000      	movs	r0, r0
    19fa:	0688      	lsls	r0, r1, #26
    19fc:	710f      	strb	r7, [r1, #4]
    19fe:	0015      	movs	r5, r2
    1a00:	0800      	lsrs	r0, r0, #32
    1a02:	49a7      	ldr	r1, [pc, #668]	; (0x1ca0)
    1a04:	0587      	lsls	r7, r0, #22
    1a06:	0000      	movs	r0, r0
    1a08:	06a0      	lsls	r0, r4, #26
    1a0a:	b40f      	push	{r0, r1, r2, r3}
    1a0c:	000e      	movs	r6, r1
    1a0e:	0800      	lsrs	r0, r0, #32
    1a10:	49a8      	ldr	r1, [pc, #672]	; (0x1cb4)
    1a12:	0812      	lsrs	r2, r2, #32
    1a14:	0000      	movs	r0, r0
    1a16:	06a8      	lsls	r0, r5, #26
    1a18:	ce0f      	ldmia	r6!, {r0, r1, r2, r3}
    1a1a:	0033      	movs	r3, r6
    1a1c:	0800      	lsrs	r0, r0, #32
    1a1e:	49a9      	ldr	r1, [pc, #676]	; (0x1cc4)
    1a20:	0587      	lsls	r7, r0, #22
    1a22:	0000      	movs	r0, r0
    1a24:	06c0      	lsls	r0, r0, #27
    1a26:	c00f      	stmia	r0!, {r0, r1, r2, r3}
    1a28:	000e      	movs	r6, r1
    1a2a:	0800      	lsrs	r0, r0, #32
    1a2c:	49aa      	ldr	r1, [pc, #680]	; (0x1cd8)
    1a2e:	1761      	asrs	r1, r4, #29
    1a30:	0000      	movs	r0, r0
    1a32:	06c8      	lsls	r0, r1, #27
    1a34:	980f      	ldr	r0, [sp, #60]	; 0x3c
    1a36:	0036      	movs	r6, r6
    1a38:	0800      	lsrs	r0, r0, #32
    1a3a:	49ab      	ldr	r1, [pc, #684]	; (0x1ce8)
    1a3c:	00c4      	lsls	r4, r0, #3
    1a3e:	0000      	movs	r0, r0
    1a40:	0704      	lsls	r4, r0, #28
    1a42:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
    1a44:	000e      	movs	r6, r1
    1a46:	0800      	lsrs	r0, r0, #32
    1a48:	49ac      	ldr	r1, [pc, #688]	; (0x1cfc)
    1a4a:	05c3      	lsls	r3, r0, #23
    1a4c:	0000      	movs	r0, r0
    1a4e:	0708      	lsls	r0, r1, #28
    1a50:	460f      	mov	r7, r1
    1a52:	001c      	movs	r4, r3
    1a54:	0800      	lsrs	r0, r0, #32
    1a56:	49ad      	ldr	r1, [pc, #692]	; (0x1d0c)
    1a58:	00c4      	lsls	r4, r0, #3
    1a5a:	0000      	movs	r0, r0
    1a5c:	070c      	lsls	r4, r1, #28
    1a5e:	ee0f 0027 	cdp	0, 0, cr0, cr15, cr7, {1}
    1a62:	0800      	lsrs	r0, r0, #32
    1a64:	49ae      	ldr	r1, [pc, #696]	; (0x1d20)
    1a66:	00c4      	lsls	r4, r0, #3
    1a68:	0000      	movs	r0, r0
    1a6a:	0710      	lsls	r0, r2, #28
    1a6c:	d80f      	bhi.n	0x1a8e
    1a6e:	000e      	movs	r6, r1
    1a70:	0800      	lsrs	r0, r0, #32
    1a72:	49af      	ldr	r1, [pc, #700]	; (0x1d30)
    1a74:	0b96      	lsrs	r6, r2, #14
    1a76:	0000      	movs	r0, r0
    1a78:	0714      	lsls	r4, r2, #28
    1a7a:	3c0f      	subs	r4, #15
    1a7c:	0035      	movs	r5, r6
    1a7e:	0800      	lsrs	r0, r0, #32
    1a80:	49b0      	ldr	r1, [pc, #704]	; (0x1d44)
    1a82:	00c4      	lsls	r4, r0, #3
    1a84:	0000      	movs	r0, r0
    1a86:	0780      	lsls	r0, r0, #30
    1a88:	e40f      	b.n	0x12aa
    1a8a:	000e      	movs	r6, r1
    1a8c:	0800      	lsrs	r0, r0, #32
    1a8e:	49b1      	ldr	r1, [pc, #708]	; (0x1d54)
    1a90:	05f3      	lsls	r3, r6, #23
    1a92:	0000      	movs	r0, r0
    1a94:	0784      	lsls	r4, r0, #30
    1a96:	a10f      	add	r1, pc, #60	; (adr r1, 0x1ad4)
    1a98:	0011      	movs	r1, r2
    1a9a:	0800      	lsrs	r0, r0, #32
    1a9c:	49b2      	ldr	r1, [pc, #712]	; (0x1d68)
    1a9e:	00c4      	lsls	r4, r0, #3
    1aa0:	0000      	movs	r0, r0
    1aa2:	0800      	lsrs	r0, r0, #32
    1aa4:	590f      	ldr	r7, [r1, r4]
    1aa6:	0010      	movs	r0, r2
    1aa8:	0800      	lsrs	r0, r0, #32
    1aaa:	49b3      	ldr	r1, [pc, #716]	; (0x1d78)
    1aac:	00c4      	lsls	r4, r0, #3
    1aae:	0000      	movs	r0, r0
    1ab0:	0804      	lsrs	r4, r0, #32
    1ab2:	d10f      	bne.n	0x1ad4
    1ab4:	002c      	movs	r4, r5
    1ab6:	0800      	lsrs	r0, r0, #32
    1ab8:	49b4      	ldr	r1, [pc, #720]	; (0x1d8c)
    1aba:	00c4      	lsls	r4, r0, #3
    1abc:	0000      	movs	r0, r0
    1abe:	0808      	lsrs	r0, r1, #32
    1ac0:	490f      	ldr	r1, [pc, #60]	; (0x1b00)
    1ac2:	0029      	movs	r1, r5
    1ac4:	0800      	lsrs	r0, r0, #32
    1ac6:	49b5      	ldr	r1, [pc, #724]	; (0x1d9c)
    1ac8:	00c9      	lsls	r1, r1, #3
    1aca:	0000      	movs	r0, r0
    1acc:	080c      	lsrs	r4, r1, #32
    1ace:	f00f 000e 	and.w	r0, pc, #14
    1ad2:	0800      	lsrs	r0, r0, #32
    1ad4:	49b6      	ldr	r1, [pc, #728]	; (0x1db0)
    1ad6:	05d3      	lsls	r3, r2, #23
    1ad8:	0000      	movs	r0, r0
    1ada:	0810      	lsrs	r0, r2, #32
    1adc:	b50f      	push	{r0, r1, r2, r3, lr}
    1ade:	0026      	movs	r6, r4
    1ae0:	0800      	lsrs	r0, r0, #32
    1ae2:	49b7      	ldr	r1, [pc, #732]	; (0x1dc0)
    1ae4:	00c4      	lsls	r4, r0, #3
    1ae6:	0000      	movs	r0, r0
    1ae8:	0900      	lsrs	r0, r0, #4
    1aea:	bf0f      	iteee	eq
    1aec:	0026      	moveq	r6, r4
    1aee:	0800      	lsrne	r0, r0, #32
    1af0:	49b8      	ldrne	r1, [pc, #736]	; (0x1dd4)
    1af2:	00c4      	lslne	r4, r0, #3
    1af4:	0000      	movs	r0, r0
    1af6:	0904      	lsrs	r4, r0, #4
    1af8:	c90f      	ldmia	r1, {r0, r1, r2, r3}
    1afa:	0026      	movs	r6, r4
    1afc:	0800      	lsrs	r0, r0, #32
    1afe:	49b9      	ldr	r1, [pc, #740]	; (0x1de4)
    1b00:	00c4      	lsls	r4, r0, #3
    1b02:	0000      	movs	r0, r0
    1b04:	0908      	lsrs	r0, r1, #4
    1b06:	4a0f      	ldr	r2, [pc, #60]	; (0x1b44)
    1b08:	0035      	movs	r5, r6
    1b0a:	0800      	lsrs	r0, r0, #32
    1b0c:	49ba      	ldr	r1, [pc, #744]	; (0x1df8)
    1b0e:	00c4      	lsls	r4, r0, #3
    1b10:	0000      	movs	r0, r0
    1b12:	090c      	lsrs	r4, r1, #4
    1b14:	e00f      	b.n	0x1b36
    1b16:	0026      	movs	r6, r4
    1b18:	0800      	lsrs	r0, r0, #32
    1b1a:	49bb      	ldr	r1, [pc, #748]	; (0x1e08)
    1b1c:	00c4      	lsls	r4, r0, #3
    1b1e:	0000      	movs	r0, r0
    1b20:	0910      	lsrs	r0, r2, #4
    1b22:	ea0f 0026 	and.w	r0, pc, r6, asr #32
    1b26:	0800      	lsrs	r0, r0, #32
    1b28:	49bc      	ldr	r1, [pc, #752]	; (0x1e1c)
    1b2a:	00c4      	lsls	r4, r0, #3
    1b2c:	0000      	movs	r0, r0
    1b2e:	0914      	lsrs	r4, r2, #4
    1b30:	f40f 0026 	and.w	r0, pc, #10878976	; 0xa60000
    1b34:	0800      	lsrs	r0, r0, #32
    1b36:	49bd      	ldr	r1, [pc, #756]	; (0x1e2c)
    1b38:	00c4      	lsls	r4, r0, #3
    1b3a:	0000      	movs	r0, r0
    1b3c:	0918      	lsrs	r0, r3, #4
    1b3e:	fe0f 0026 	cdp2	0, 0, cr0, cr15, cr6, {1}
    1b42:	0800      	lsrs	r0, r0, #32
    1b44:	49be      	ldr	r1, [pc, #760]	; (0x1e40)
    1b46:	00c4      	lsls	r4, r0, #3
    1b48:	0000      	movs	r0, r0
    1b4a:	091c      	lsrs	r4, r3, #4
    1b4c:	fc0f 000e 	stc2	0, cr0, [pc], {14}
    1b50:	0800      	lsrs	r0, r0, #32
    1b52:	49bf      	ldr	r1, [pc, #764]	; (0x1e50)
    1b54:	05e3      	lsls	r3, r4, #23
    1b56:	0000      	movs	r0, r0
    1b58:	0920      	lsrs	r0, r4, #4
    1b5a:	a80f      	add	r0, sp, #60	; 0x3c
    1b5c:	0033      	movs	r3, r6
    1b5e:	0800      	lsrs	r0, r0, #32
    1b60:	49c0      	ldr	r1, [pc, #768]	; (0x1e64)
    1b62:	00c4      	lsls	r4, r0, #3
    1b64:	0000      	movs	r0, r0
    1b66:	0a18      	lsrs	r0, r3, #8
    1b68:	080f      	lsrs	r7, r1, #32
    1b6a:	000f      	movs	r7, r1
    1b6c:	0800      	lsrs	r0, r0, #32
    1b6e:	49c1      	ldr	r1, [pc, #772]	; (0x1e74)
    1b70:	1771      	asrs	r1, r6, #29
    1b72:	0000      	movs	r0, r0
    1b74:	0a1c      	lsrs	r4, r3, #8
    1b76:	de0f      	udf	#15
    1b78:	0020      	movs	r0, r4
    1b7a:	0800      	lsrs	r0, r0, #32
    1b7c:	49c2      	ldr	r1, [pc, #776]	; (0x1e88)
    1b7e:	00c4      	lsls	r4, r0, #3
    1b80:	0000      	movs	r0, r0
    1b82:	0b10      	lsrs	r0, r2, #12
    1b84:	db0f      	blt.n	0x1ba6
    1b86:	0018      	movs	r0, r3
    1b88:	0800      	lsrs	r0, r0, #32
    1b8a:	49c3      	ldr	r1, [pc, #780]	; (0x1e98)
    1b8c:	00c9      	lsls	r1, r1, #3
    1b8e:	0000      	movs	r0, r0
    1b90:	0b14      	lsrs	r4, r2, #12
    1b92:	d80f      	bhi.n	0x1bb4
    1b94:	000f      	movs	r7, r1
    1b96:	0800      	lsrs	r0, r0, #32
    1b98:	49c4      	ldr	r1, [pc, #784]	; (0x1eac)
    1b9a:	1781      	asrs	r1, r0, #30
    1b9c:	0000      	movs	r0, r0
    1b9e:	0b18      	lsrs	r0, r3, #12
    1ba0:	d40f      	bmi.n	0x1bc2
    1ba2:	001b      	movs	r3, r3
    1ba4:	0800      	lsrs	r0, r0, #32
    1ba6:	49c5      	ldr	r1, [pc, #788]	; (0x1ebc)
    1ba8:	00c4      	lsls	r4, r0, #3
    1baa:	0000      	movs	r0, r0
    1bac:	0e04      	lsrs	r4, r0, #24
    1bae:	cf0f      	ldmia	r7!, {r0, r1, r2, r3}
    1bb0:	001e      	movs	r6, r3
    1bb2:	0800      	lsrs	r0, r0, #32
    1bb4:	49c6      	ldr	r1, [pc, #792]	; (0x1ed0)
    1bb6:	00c4      	lsls	r4, r0, #3
    1bb8:	0000      	movs	r0, r0
    1bba:	0e08      	lsrs	r0, r1, #24
    1bbc:	e40f      	b.n	0x13de
    1bbe:	000f      	movs	r7, r1
    1bc0:	0800      	lsrs	r0, r0, #32
    1bc2:	49c7      	ldr	r1, [pc, #796]	; (0x1ee0)
    1bc4:	0638      	lsls	r0, r7, #24
    1bc6:	0000      	movs	r0, r0
    1bc8:	0e0c      	lsrs	r4, r1, #24
    1bca:	8f0f      	ldrh	r7, [r1, #56]	; 0x38
    1bcc:	0033      	movs	r3, r6
    1bce:	0800      	lsrs	r0, r0, #32
    1bd0:	49c8      	ldr	r1, [pc, #800]	; (0x1ef4)
    1bd2:	00c4      	lsls	r4, r0, #3
    1bd4:	0000      	movs	r0, r0
    1bd6:	0e20      	lsrs	r0, r4, #24
    1bd8:	f00f 000f 	and.w	r0, pc, #15
    1bdc:	0800      	lsrs	r0, r0, #32
    1bde:	49c9      	ldr	r1, [pc, #804]	; (0x1f04)
    1be0:	1792      	asrs	r2, r2, #30
    1be2:	0000      	movs	r0, r0
    1be4:	0e24      	lsrs	r4, r4, #24
    1be6:	d90f      	bls.n	0x1c08
    1be8:	002c      	movs	r4, r5
    1bea:	0800      	lsrs	r0, r0, #32
    1bec:	49ca      	ldr	r1, [pc, #808]	; (0x1f18)
    1bee:	00c4      	lsls	r4, r0, #3
    1bf0:	0000      	movs	r0, r0
    1bf2:	0fa0      	lsrs	r0, r4, #30
    1bf4:	4a0f      	ldr	r2, [pc, #60]	; (0x1c34)
    1bf6:	000d      	movs	r5, r1
    1bf8:	0800      	lsrs	r0, r0, #32
    1bfa:	49cb      	ldr	r1, [pc, #812]	; (0x1f28)
    1bfc:	00c4      	lsls	r4, r0, #3
    1bfe:	0000      	movs	r0, r0
    1c00:	0fa4      	lsrs	r4, r4, #30
    1c02:	540f      	strb	r7, [r1, r0]
    1c04:	001f      	movs	r7, r3
    1c06:	0800      	lsrs	r0, r0, #32
    1c08:	49cc      	ldr	r1, [pc, #816]	; (0x1f3c)
    1c0a:	00c4      	lsls	r4, r0, #3
    1c0c:	0000      	movs	r0, r0
    1c0e:	0fa8      	lsrs	r0, r5, #30
    1c10:	fc0f 000f 	stc2	0, cr0, [pc], {15}
    1c14:	0800      	lsrs	r0, r0, #32
    1c16:	49cd      	ldr	r1, [pc, #820]	; (0x1f4c)
    1c18:	05c3      	lsls	r3, r0, #23
    1c1a:	0000      	movs	r0, r0
    1c1c:	0fac      	lsrs	r4, r5, #30
    1c1e:	070f      	lsls	r7, r1, #28
    1c20:	001c      	movs	r4, r3
    1c22:	0800      	lsrs	r0, r0, #32
    1c24:	49ce      	ldr	r1, [pc, #824]	; (0x1f60)
    1c26:	00c4      	lsls	r4, r0, #3
    1c28:	0000      	movs	r0, r0
    1c2a:	0fb0      	lsrs	r0, r6, #30
    1c2c:	c60f      	stmia	r6!, {r0, r1, r2, r3}
    1c2e:	0016      	movs	r6, r2
    1c30:	0800      	lsrs	r0, r0, #32
    1c32:	49cf      	ldr	r1, [pc, #828]	; (0x1f70)
    1c34:	00c4      	lsls	r4, r0, #3
    1c36:	0000      	movs	r0, r0
    1c38:	0fb4      	lsrs	r4, r6, #30
    1c3a:	db0f      	blt.n	0x1c5c
    1c3c:	0016      	movs	r6, r2
    1c3e:	0800      	lsrs	r0, r0, #32
    1c40:	49d0      	ldr	r1, [pc, #832]	; (0x1f84)
    1c42:	00c4      	lsls	r4, r0, #3
    1c44:	0000      	movs	r0, r0
    1c46:	0fb8      	lsrs	r0, r7, #30
    1c48:	610f      	str	r7, [r1, #16]
    1c4a:	0013      	movs	r3, r2
    1c4c:	0800      	lsrs	r0, r0, #32
    1c4e:	49d1      	ldr	r1, [pc, #836]	; (0x1f94)
    1c50:	00c4      	lsls	r4, r0, #3
    1c52:	0000      	movs	r0, r0
    1c54:	0fbc      	lsrs	r4, r7, #30
    1c56:	e70f      	b.n	0x1a78
    1c58:	0033      	movs	r3, r6
    1c5a:	0800      	lsrs	r0, r0, #32
    1c5c:	49d2      	ldr	r1, [pc, #840]	; (0x1fa8)
    1c5e:	00c4      	lsls	r4, r0, #3
    1c60:	0000      	movs	r0, r0
    1c62:	0fc0      	lsrs	r0, r0, #31
    1c64:	080f      	lsrs	r7, r1, #32
    1c66:	0010      	movs	r0, r2
    1c68:	0800      	lsrs	r0, r0, #32
    1c6a:	49d3      	ldr	r1, [pc, #844]	; (0x1fb8)
    1c6c:	0628      	lsls	r0, r5, #24
    1c6e:	0000      	movs	r0, r0
    1c70:	0fc4      	lsrs	r4, r0, #31
    1c72:	b20f      	sxth	r7, r1
    1c74:	0006      	movs	r6, r0
    1c76:	0800      	lsrs	r0, r0, #32
    1c78:	49d4      	ldr	r1, [pc, #848]	; (0x1fcc)
    1c7a:	00c4      	lsls	r4, r0, #3
    1c7c:	0000      	movs	r0, r0
    1c7e:	0fd4      	lsrs	r4, r2, #31
    1c80:	140f      	asrs	r7, r1, #16
    1c82:	0010      	movs	r0, r2
    1c84:	0800      	lsrs	r0, r0, #32
    1c86:	49d5      	ldr	r1, [pc, #852]	; (0x1fdc)
    1c88:	05a3      	lsls	r3, r4, #22
    1c8a:	0000      	movs	r0, r0
    1c8c:	0fd8      	lsrs	r0, r3, #31
    1c8e:	d50f      	bpl.n	0x1cb0
    1c90:	0038      	movs	r0, r7
    1c92:	0800      	lsrs	r0, r0, #32
    1c94:	49d6      	ldr	r1, [pc, #856]	; (0x1ff0)
    1c96:	00c4      	lsls	r4, r0, #3
    1c98:	0000      	movs	r0, r0
    1c9a:	0fe0      	lsrs	r0, r4, #31
    1c9c:	fd0f 0037 	stc2	0, cr0, [pc, #-220]	; 0x1bc4
    1ca0:	0800      	lsrs	r0, r0, #32
    1ca2:	49d7      	ldr	r1, [pc, #860]	; (0x2000)
    1ca4:	00c4      	lsls	r4, r0, #3
    1ca6:	0000      	movs	r0, r0
    1ca8:	0fe4      	lsrs	r4, r4, #31
    1caa:	910f      	str	r1, [sp, #60]	; 0x3c
    1cac:	0026      	movs	r6, r4
    1cae:	0800      	lsrs	r0, r0, #32
    1cb0:	49d8      	ldr	r1, [pc, #864]	; (0x2014)
    1cb2:	00c4      	lsls	r4, r0, #3
    1cb4:	0000      	movs	r0, r0
    1cb6:	0fe8      	lsrs	r0, r5, #31
    1cb8:	d00f      	beq.n	0x1cda
    1cba:	001a      	movs	r2, r3
    1cbc:	0800      	lsrs	r0, r0, #32
    1cbe:	49d9      	ldr	r1, [pc, #868]	; (0x2024)
    1cc0:	00c4      	lsls	r4, r0, #3
    1cc2:	0000      	movs	r0, r0
    1cc4:	0fec      	lsrs	r4, r5, #31
    1cc6:	200f      	movs	r0, #15
    1cc8:	0010      	movs	r0, r2
    1cca:	0800      	lsrs	r0, r0, #32
    1ccc:	49da      	ldr	r1, [pc, #872]	; (0x2038)
    1cce:	05a3      	lsls	r3, r4, #22
    1cd0:	0000      	movs	r0, r0
    1cd2:	0ff0      	lsrs	r0, r6, #31
    1cd4:	3a0f      	subs	r2, #15
    1cd6:	002e      	movs	r6, r5
    1cd8:	0800      	lsrs	r0, r0, #32
    1cda:	49db      	ldr	r1, [pc, #876]	; (0x2048)
    1cdc:	00c9      	lsls	r1, r1, #3
    1cde:	0000      	movs	r0, r0
    1ce0:	0ff8      	lsrs	r0, r7, #31
    1ce2:	ca0f      	ldmia	r2, {r0, r1, r2, r3}
    1ce4:	0010      	movs	r0, r2
    1ce6:	0800      	lsrs	r0, r0, #32
    1ce8:	49dc      	ldr	r1, [pc, #880]	; (0x205c)
    1cea:	00c9      	lsls	r1, r1, #3
    1cec:	0000      	movs	r0, r0
    1cee:	0ffc      	lsrs	r4, r7, #31
    1cf0:	0600      	lsls	r0, r0, #24
    1cf2:	008b      	lsls	r3, r1, #2
    1cf4:	0000      	movs	r0, r0
    1cf6:	1711      	asrs	r1, r2, #28
    1cf8:	0000      	movs	r0, r0
    1cfa:	4111      	asrs	r1, r2
    1cfc:	0000      	movs	r0, r0
    1cfe:	b300      	cbz	r0, 0x1d42
    1d00:	0600      	lsls	r0, r0, #24
    1d02:	008b      	lsls	r3, r1, #2
    1d04:	0000      	movs	r0, r0
    1d06:	1721      	asrs	r1, r4, #28
    1d08:	0000      	movs	r0, r0
    1d0a:	4111      	asrs	r1, r2
    1d0c:	0000      	movs	r0, r0
    1d0e:	9b00      	ldr	r3, [sp, #0]
    1d10:	0600      	lsls	r0, r0, #24
    1d12:	008b      	lsls	r3, r1, #2
    1d14:	0000      	movs	r0, r0
    1d16:	1731      	asrs	r1, r6, #28
    1d18:	0000      	movs	r0, r0
    1d1a:	4111      	asrs	r1, r2
    1d1c:	0000      	movs	r0, r0
    1d1e:	3f00      	subs	r7, #0
    1d20:	0600      	lsls	r0, r0, #24
    1d22:	008b      	lsls	r3, r1, #2
    1d24:	0000      	movs	r0, r0
    1d26:	1741      	asrs	r1, r0, #29
    1d28:	0000      	movs	r0, r0
    1d2a:	4111      	asrs	r1, r2
    1d2c:	0000      	movs	r0, r0
    1d2e:	3300      	adds	r3, #0
    1d30:	0600      	lsls	r0, r0, #24
    1d32:	008b      	lsls	r3, r1, #2
    1d34:	0000      	movs	r0, r0
    1d36:	1751      	asrs	r1, r2, #29
    1d38:	0000      	movs	r0, r0
    1d3a:	4111      	asrs	r1, r2
    1d3c:	0000      	movs	r0, r0
    1d3e:	fb00 0600 	mla	r6, r0, r0, r0
    1d42:	008b      	lsls	r3, r1, #2
    1d44:	0000      	movs	r0, r0
    1d46:	1761      	asrs	r1, r4, #29
    1d48:	0000      	movs	r0, r0
    1d4a:	4111      	asrs	r1, r2
    1d4c:	0000      	movs	r0, r0
    1d4e:	2b00      	cmp	r3, #0
    1d50:	0600      	lsls	r0, r0, #24
    1d52:	008b      	lsls	r3, r1, #2
    1d54:	0000      	movs	r0, r0
    1d56:	1771      	asrs	r1, r6, #29
    1d58:	0000      	movs	r0, r0
    1d5a:	4111      	asrs	r1, r2
    1d5c:	0000      	movs	r0, r0
    1d5e:	3b00      	subs	r3, #0
    1d60:	0600      	lsls	r0, r0, #24
    1d62:	008b      	lsls	r3, r1, #2
    1d64:	0000      	movs	r0, r0
    1d66:	1781      	asrs	r1, r0, #30
    1d68:	0000      	movs	r0, r0
    1d6a:	4111      	asrs	r1, r2
    1d6c:	0000      	movs	r0, r0
    1d6e:	f300 0600 	ssat	r6, #1, r0
    1d72:	008b      	lsls	r3, r1, #2
    1d74:	0000      	movs	r0, r0
    1d76:	1792      	asrs	r2, r2, #30
    1d78:	0000      	movs	r0, r0
    1d7a:	4112      	asrs	r2, r2
    1d7c:	0000      	movs	r0, r0
    1d7e:	eb00 0002 	add.w	r0, r0, r2
    1d82:	8b06      	ldrh	r6, [r0, #24]
    1d84:	0000      	movs	r0, r0
    1d86:	a300      	add	r3, pc, #0	; (adr r3, 0x1d88)
    1d88:	0017      	movs	r7, r2
    1d8a:	1200      	asrs	r0, r0, #8
    1d8c:	0041      	lsls	r1, r0, #1
    1d8e:	0000      	movs	r0, r0
    1d90:	017b      	lsls	r3, r7, #5
    1d92:	1300      	asrs	r0, r0, #12
    1d94:	157c      	asrs	r4, r7, #21
    1d96:	0000      	movs	r0, r0
    1d98:	dd08      	ble.n	0x1dac
    1d9a:	2749      	movs	r7, #73	; 0x49
    1d9c:	000e      	movs	r6, r1
    1d9e:	1900      	adds	r0, r0, r4
    1da0:	194c      	adds	r4, r1, r5
    1da2:	0000      	movs	r0, r0
    1da4:	0107      	lsls	r7, r0, #4
    1da6:	002c      	movs	r4, r5
    1da8:	0000      	movs	r0, r0
    1daa:	3a09      	subs	r2, #9
    1dac:	19e3      	adds	r3, r4, r7
    1dae:	0000      	movs	r0, r0
    1db0:	401a      	ands	r2, r3
    1db2:	0022      	movs	r2, r4
    1db4:	0000      	movs	r0, r0
    1db6:	0a1a      	lsrs	r2, r3, #8
    1db8:	000b      	movs	r3, r1
    1dba:	0100      	lsls	r0, r0, #4
    1dbc:	0d1a      	lsrs	r2, r3, #20
    1dbe:	0028      	movs	r0, r5
    1dc0:	0400      	lsls	r0, r0, #16
    1dc2:	881a      	ldrh	r2, [r3, #0]
    1dc4:	0015      	movs	r5, r2
    1dc6:	0500      	lsls	r0, r0, #20
    1dc8:	be1a      	bkpt	0x001a
    1dca:	0004      	movs	r4, r0
    1dcc:	0600      	lsls	r0, r0, #24
    1dce:	111a      	asrs	r2, r3, #4
    1dd0:	0035      	movs	r5, r6
    1dd2:	0700      	lsls	r0, r0, #28
    1dd4:	b51a      	push	{r1, r3, r4, lr}
    1dd6:	0032      	movs	r2, r6
    1dd8:	0800      	lsrs	r0, r0, #32
    1dda:	c71a      	stmia	r7!, {r1, r3, r4}
    1ddc:	000d      	movs	r5, r1
    1dde:	0900      	lsrs	r0, r0, #4
    1de0:	241a      	movs	r4, #26
    1de2:	0021      	movs	r1, r4
    1de4:	0a00      	lsrs	r0, r0, #8
    1de6:	081a      	lsrs	r2, r3, #32
    1de8:	0036      	movs	r6, r6
    1dea:	0b00      	lsrs	r0, r0, #12
    1dec:	041a      	lsls	r2, r3, #16
    1dee:	001b      	movs	r3, r3
    1df0:	0c00      	lsrs	r0, r0, #16
    1df2:	631a      	str	r2, [r3, #48]	; 0x30
    1df4:	000b      	movs	r3, r1
    1df6:	0d00      	lsrs	r0, r0, #20
    1df8:	811a      	strh	r2, [r3, #8]
    1dfa:	0018      	movs	r0, r3
    1dfc:	0e00      	lsrs	r0, r0, #24
    1dfe:	5b1a      	ldrh	r2, [r3, r4]
    1e00:	0019      	movs	r1, r3
    1e02:	0f00      	lsrs	r0, r0, #28
    1e04:	751a      	strb	r2, [r3, #20]
    1e06:	0009      	movs	r1, r1
    1e08:	1000      	asrs	r0, r0, #32
    1e0a:	491a      	ldr	r1, [pc, #104]	; (0x1e74)
    1e0c:	002a      	movs	r2, r5
    1e0e:	1100      	asrs	r0, r0, #4
    1e10:	2f1a      	cmp	r7, #26
    1e12:	001a      	movs	r2, r3
    1e14:	1200      	asrs	r0, r0, #8
    1e16:	ef1a 000a 	vhadd.s16	d0, d10, d10
    1e1a:	1300      	asrs	r0, r0, #12
    1e1c:	421a      	tst	r2, r3
    1e1e:	0023      	movs	r3, r4
    1e20:	1400      	asrs	r0, r0, #16
    1e22:	841a      	strh	r2, [r3, #32]
    1e24:	0007      	movs	r7, r0
    1e26:	1500      	asrs	r0, r0, #20
    1e28:	791a      	ldrb	r2, [r3, #4]
    1e2a:	0004      	movs	r4, r0
    1e2c:	1600      	asrs	r0, r0, #24
    1e2e:	011a      	lsls	r2, r3, #4
    1e30:	0033      	movs	r3, r6
    1e32:	1700      	asrs	r0, r0, #28
    1e34:	bb1a      	cbnz	r2, 0x1e7e
    1e36:	0021      	movs	r1, r4
    1e38:	1800      	adds	r0, r0, r0
    1e3a:	bf1a      	itte	ne
    1e3c:	0035      	movne	r5, r6
    1e3e:	1900      	addne	r0, r0, r4
    1e40:	b11a      	cbz	r2, 0x1e4a	; unpredictable <IT:eq>
    1e42:	0001      	movs	r1, r0
    1e44:	1a00      	subs	r0, r0, r0
    1e46:	4f1a      	ldr	r7, [pc, #104]	; (0x1eb0)
    1e48:	0036      	movs	r6, r6
    1e4a:	1b00      	subs	r0, r0, r4
    1e4c:	931a      	str	r3, [sp, #104]	; 0x68
    1e4e:	0019      	movs	r1, r3
    1e50:	1c00      	adds	r0, r0, #0
    1e52:	2c1a      	cmp	r4, #26
    1e54:	0034      	movs	r4, r6
    1e56:	1d00      	adds	r0, r0, #4
    1e58:	591a      	ldr	r2, [r3, r4]
    1e5a:	000d      	movs	r5, r1
    1e5c:	1e00      	subs	r0, r0, #0
    1e5e:	631a      	str	r2, [r3, #48]	; 0x30
    1e60:	0006      	movs	r6, r0
    1e62:	2300      	movs	r3, #0
    1e64:	6f1a      	ldr	r2, [r3, #112]	; 0x70
    1e66:	0026      	movs	r6, r4
    1e68:	2700      	movs	r7, #0
    1e6a:	7d1a      	ldrb	r2, [r3, #20]
    1e6c:	0033      	movs	r3, r6
    1e6e:	2800      	cmp	r0, #0
    1e70:	e21a      	b.n	0x22a8
    1e72:	0038      	movs	r0, r7
    1e74:	2900      	cmp	r1, #0
    1e76:	bc1a      	pop	{r1, r3, r4}
    1e78:	001a      	movs	r2, r3
    1e7a:	2a00      	cmp	r2, #0
    1e7c:	651a      	str	r2, [r3, #80]	; 0x50
    1e7e:	0028      	movs	r0, r5
    1e80:	2b00      	cmp	r3, #0
    1e82:	b51a      	push	{r1, r3, r4, lr}
    1e84:	000b      	movs	r3, r1
    1e86:	2c00      	cmp	r4, #0
    1e88:	e11a      	b.n	0x20c0
    1e8a:	0015      	movs	r5, r2
    1e8c:	2d00      	cmp	r5, #0
    1e8e:	fa1a 0033 			; <UNDEFINED> instruction: 0xfa1a0033
    1e92:	3200      	adds	r2, #0
    1e94:	9a1a      	ldr	r2, [sp, #104]	; 0x68
    1e96:	0003      	movs	r3, r0
    1e98:	3300      	adds	r3, #0
    1e9a:	831a      	strh	r2, [r3, #24]
    1e9c:	0016      	movs	r6, r2
    1e9e:	3400      	adds	r4, #0
    1ea0:	961a      	str	r6, [sp, #104]	; 0x68
    1ea2:	0034      	movs	r4, r6
    1ea4:	3500      	adds	r5, #0
    1ea6:	0e1a      	lsrs	r2, r3, #24
    1ea8:	002e      	movs	r6, r5
    1eaa:	3600      	adds	r6, #0
    1eac:	451a      	cmp	r2, r3
    1eae:	0011      	movs	r1, r2
    1eb0:	3700      	adds	r7, #0
    1eb2:	451a      	cmp	r2, r3
    1eb4:	0020      	movs	r0, r4
    1eb6:	3800      	subs	r0, #0
    1eb8:	171a      	asrs	r2, r3, #28
    1eba:	000c      	movs	r4, r1
    1ebc:	3900      	subs	r1, #0
    1ebe:	641a      	str	r2, [r3, #64]	; 0x40
    1ec0:	0017      	movs	r7, r2
    1ec2:	3a00      	subs	r2, #0
    1ec4:	051a      	lsls	r2, r3, #20
    1ec6:	002b      	movs	r3, r5
    1ec8:	3b00      	subs	r3, #0
    1eca:	5b1a      	ldrh	r2, [r3, r4]
    1ecc:	002a      	movs	r2, r5
    1ece:	3c00      	subs	r4, #0
    1ed0:	5e1a      	ldrsh	r2, [r3, r0]
    1ed2:	0005      	movs	r5, r0
    1ed4:	3d00      	subs	r5, #0
    1ed6:	4e1a      	ldr	r6, [pc, #104]	; (0x1f40)
    1ed8:	0024      	movs	r4, r4
    1eda:	3e00      	subs	r6, #0
    1edc:	271a      	movs	r7, #26
    1ede:	0023      	movs	r3, r4
    1ee0:	3f00      	subs	r7, #0
    1ee2:	9c1a      	ldr	r4, [sp, #104]	; 0x68
    1ee4:	000d      	movs	r5, r1
    1ee6:	4000      	ands	r0, r0
    1ee8:	a91a      	add	r1, sp, #104	; 0x68
    1eea:	002d      	movs	r5, r5
    1eec:	4100      	asrs	r0, r0
    1eee:	4e1a      	ldr	r6, [pc, #104]	; (0x1f58)
    1ef0:	0006      	movs	r6, r0
    1ef2:	4200      	tst	r0, r0
    1ef4:	171a      	asrs	r2, r3, #28
    1ef6:	002b      	movs	r3, r5
    1ef8:	4300      	orrs	r0, r0
    1efa:	291a      	cmp	r1, #26
    1efc:	0025      	movs	r5, r4
    1efe:	4400      	add	r0, r0
    1f00:	311a      	adds	r1, #26
    1f02:	0013      	movs	r3, r2
    1f04:	4500      	cmp	r0, r0
    1f06:	891a      	ldrh	r2, [r3, #8]
    1f08:	0029      	movs	r1, r5
    1f0a:	4600      	mov	r0, r0
    1f0c:	a61a      	add	r6, pc, #104	; (adr r6, 0x1f78)
    1f0e:	0025      	movs	r5, r4
    1f10:	4700      	bx	r0
    1f12:	ab1a      	add	r3, sp, #104	; 0x68
    1f14:	0034      	movs	r4, r6
    1f16:	4800      	ldr	r0, [pc, #0]	; (0x1f18)
    1f18:	f91a 002e 	ldrsb.w	r0, [sl, lr, lsl #2]
    1f1c:	4900      	ldr	r1, [pc, #0]	; (0x1f20)
    1f1e:	141a      	asrs	r2, r3, #16
    1f20:	000f      	movs	r7, r1
    1f22:	4a00      	ldr	r2, [pc, #0]	; (0x1f24)
    1f24:	661a      	str	r2, [r3, #96]	; 0x60
    1f26:	0012      	movs	r2, r2
    1f28:	4b00      	ldr	r3, [pc, #0]	; (0x1f2c)
    1f2a:	b21a      	sxth	r2, r3
    1f2c:	0038      	movs	r0, r7
    1f2e:	4c00      	ldr	r4, [pc, #0]	; (0x1f30)
    1f30:	1a1a      	subs	r2, r3, r0
    1f32:	002f      	movs	r7, r5
    1f34:	4d00      	ldr	r5, [pc, #0]	; (0x1f38)
    1f36:	361a      	adds	r6, #26
    1f38:	0021      	movs	r1, r4
    1f3a:	4e00      	ldr	r6, [pc, #0]	; (0x1f3c)
    1f3c:	931a      	str	r3, [sp, #104]	; 0x68
    1f3e:	001b      	movs	r3, r3
    1f40:	6100      	str	r0, [r0, #16]
    1f42:	a01a      	add	r0, pc, #104	; (adr r0, 0x1fac)
    1f44:	001d      	movs	r5, r3
    1f46:	6200      	str	r0, [r0, #32]
    1f48:	8a1a      	ldrh	r2, [r3, #16]
    1f4a:	0035      	movs	r5, r6
    1f4c:	6300      	str	r0, [r0, #48]	; 0x30
    1f4e:	6a1a      	ldr	r2, [r3, #32]
    1f50:	0029      	movs	r1, r5
    1f52:	6400      	str	r0, [r0, #64]	; 0x40
    1f54:	841a      	strh	r2, [r3, #32]
    1f56:	001a      	movs	r2, r3
    1f58:	6500      	str	r0, [r0, #80]	; 0x50
    1f5a:	731a      	strb	r2, [r3, #12]
    1f5c:	0007      	movs	r7, r0
    1f5e:	6600      	str	r0, [r0, #96]	; 0x60
    1f60:	cd1a      	ldmia	r5!, {r1, r3, r4}
    1f62:	0032      	movs	r2, r6
    1f64:	7900      	ldrb	r0, [r0, #4]
    1f66:	241a      	movs	r4, #26
    1f68:	0015      	movs	r5, r2
    1f6a:	7a00      	ldrb	r0, [r0, #8]
    1f6c:	0e1a      	lsrs	r2, r3, #24
    1f6e:	0029      	movs	r1, r5
    1f70:	7b00      	ldrb	r0, [r0, #12]
    1f72:	091a      	lsrs	r2, r3, #4
    1f74:	0020      	movs	r0, r4
    1f76:	7c00      	ldrb	r0, [r0, #16]
    1f78:	281a      	cmp	r0, #26
    1f7a:	0006      	movs	r6, r0
    1f7c:	7d00      	ldrb	r0, [r0, #20]
    1f7e:	c01a      	stmia	r0!, {r1, r3, r4}
    1f80:	002f      	movs	r7, r5
    1f82:	7e00      	ldrb	r0, [r0, #24]
    1f84:	4f1a      	ldr	r7, [pc, #104]	; (0x1ff0)
    1f86:	0017      	movs	r7, r2
    1f88:	7f00      	ldrb	r0, [r0, #28]
    1f8a:	211a      	movs	r1, #26
    1f8c:	0019      	movs	r1, r3
    1f8e:	8000      	strh	r0, [r0, #0]
    1f90:	231a      	movs	r3, #26
    1f92:	0016      	movs	r6, r2
    1f94:	8700      	strh	r0, [r0, #56]	; 0x38
    1f96:	2f1a      	cmp	r7, #26
    1f98:	0003      	movs	r3, r0
    1f9a:	8800      	ldrh	r0, [r0, #0]
    1f9c:	751a      	strb	r2, [r3, #20]
    1f9e:	001f      	movs	r7, r3
    1fa0:	8900      	ldrh	r0, [r0, #8]
    1fa2:	531a      	strh	r2, [r3, r4]
    1fa4:	0032      	movs	r2, r6
    1fa6:	8a00      	ldrh	r0, [r0, #16]
    1fa8:	7f1a      	ldrb	r2, [r3, #28]
    1faa:	0030      	movs	r0, r6
    1fac:	8b00      	ldrh	r0, [r0, #24]
    1fae:	d91a      	bls.n	0x1fe6
    1fb0:	001e      	movs	r6, r3
    1fb2:	8c00      	ldrh	r0, [r0, #32]
    1fb4:	7f1a      	ldrb	r2, [r3, #28]
    1fb6:	0036      	movs	r6, r6
    1fb8:	8d00      	ldrh	r0, [r0, #40]	; 0x28
    1fba:	7d1a      	ldrb	r2, [r3, #20]
    1fbc:	0001      	movs	r1, r0
    1fbe:	8e00      	ldrh	r0, [r0, #48]	; 0x30
    1fc0:	681a      	ldr	r2, [r3, #0]
    1fc2:	0004      	movs	r4, r0
    1fc4:	8f00      	ldrh	r0, [r0, #56]	; 0x38
    1fc6:	a61a      	add	r6, pc, #104	; (adr r6, 0x2030)
    1fc8:	0019      	movs	r1, r3
    1fca:	9000      	str	r0, [sp, #0]
    1fcc:	671a      	str	r2, [r3, #112]	; 0x70
    1fce:	0032      	movs	r2, r6
    1fd0:	9100      	str	r1, [sp, #0]
    1fd2:	1b00      	subs	r0, r0, r4
    1fd4:	0db8      	lsrs	r0, r7, #22
    1fd6:	0000      	movs	r0, r0
    1fd8:	0207      	lsls	r7, r0, #8
    1fda:	00a2      	lsls	r2, r4, #2
    1fdc:	0000      	movs	r0, r0
    1fde:	5402      	strb	r2, [r0, r0]
    1fe0:	aa01      	add	r2, sp, #4
    1fe2:	001c      	movs	r4, r3
    1fe4:	1a00      	subs	r0, r0, r0
    1fe6:	2820      	cmp	r0, #32
    1fe8:	0000      	movs	r0, r0
    1fea:	1a00      	subs	r0, r0, r0
    1fec:	2279      	movs	r2, #121	; 0x79
    1fee:	0000      	movs	r0, r0
    1ff0:	1a01      	subs	r1, r0, r0
    1ff2:	1700      	asrs	r0, r0, #28
    1ff4:	0000      	movs	r0, r0
    1ff6:	1a03      	subs	r3, r0, r0
    1ff8:	170d      	asrs	r5, r1, #28
    1ffa:	0000      	movs	r0, r0
    1ffc:	1a04      	subs	r4, r0, r0
    1ffe:	0f25      	lsrs	r5, r4, #28
    2000:	0000      	movs	r0, r0
    2002:	1a05      	subs	r5, r0, r0
    2004:	1728      	asrs	r0, r5, #28
    2006:	0000      	movs	r0, r0
    2008:	1a06      	subs	r6, r0, r0
    200a:	1dd9      	adds	r1, r3, #7
    200c:	0000      	movs	r0, r0
    200e:	1a07      	subs	r7, r0, r0
    2010:	182d      	adds	r5, r5, r0
    2012:	0000      	movs	r0, r0
    2014:	1a08      	subs	r0, r1, r0
    2016:	15a0      	asrs	r0, r4, #22
    2018:	0000      	movs	r0, r0
    201a:	1a0b      	subs	r3, r1, r0
    201c:	02a0      	lsls	r0, r4, #10
    201e:	0000      	movs	r0, r0
    2020:	1a0d      	subs	r5, r1, r0
    2022:	1b20      	subs	r0, r4, r4
    2024:	0000      	movs	r0, r0
    2026:	1a0e      	subs	r6, r1, r0
    2028:	1b2d      	subs	r5, r5, r4
    202a:	0000      	movs	r0, r0
    202c:	1a0f      	subs	r7, r1, r0
    202e:	1b3a      	subs	r2, r7, r4
    2030:	0000      	movs	r0, r0
    2032:	1a10      	subs	r0, r2, r0
    2034:	1b47      	subs	r7, r0, r5
    2036:	0000      	movs	r0, r0
    2038:	1a11      	subs	r1, r2, r0
    203a:	09a2      	lsrs	r2, r4, #6
    203c:	0000      	movs	r0, r0
    203e:	1a12      	subs	r2, r2, r0
    2040:	2ec5      	cmp	r6, #197	; 0xc5
    2042:	0000      	movs	r0, r0
    2044:	1a13      	subs	r3, r2, r0
    2046:	1d79      	adds	r1, r7, #5
    2048:	0000      	movs	r0, r0
    204a:	1a14      	subs	r4, r2, r0
    204c:	0c0c      	lsrs	r4, r1, #16
    204e:	0000      	movs	r0, r0
    2050:	1a15      	subs	r5, r2, r0
    2052:	299e      	cmp	r1, #158	; 0x9e
    2054:	0000      	movs	r0, r0
    2056:	1a16      	subs	r6, r2, r0
    2058:	284c      	cmp	r0, #76	; 0x4c
    205a:	0000      	movs	r0, r0
    205c:	1a17      	subs	r7, r2, r0
    205e:	3352      	adds	r3, #82	; 0x52
    2060:	0000      	movs	r0, r0
    2062:	1a1a      	subs	r2, r3, r0
    2064:	0f44      	lsrs	r4, r0, #29
    2066:	0000      	movs	r0, r0
    2068:	1c1b      	adds	r3, r3, #0
    206a:	0095      	lsls	r5, r2, #2
    206c:	0000      	movs	r0, r0
    206e:	0100      	lsls	r0, r0, #4
    2070:	1e1c      	subs	r4, r3, #0
    2072:	0002      	movs	r2, r0
    2074:	0100      	lsls	r0, r0, #4
    2076:	1c01      	adds	r1, r0, #0
    2078:	063d      	lsls	r5, r7, #24
    207a:	0000      	movs	r0, r0
    207c:	0102      	lsls	r2, r0, #4
    207e:	fd1c 0024 	ldc2	0, cr0, [ip, #-144]	; 0xffffff70
    2082:	0600      	lsls	r0, r0, #24
    2084:	1c01      	adds	r1, r0, #0
    2086:	1741      	asrs	r1, r0, #29
    2088:	0000      	movs	r0, r0
    208a:	010a      	lsls	r2, r1, #4
    208c:	ce1c      	ldmia	r6!, {r2, r3, r4}
    208e:	0003      	movs	r3, r0
    2090:	0b00      	lsrs	r0, r0, #12
    2092:	1c01      	adds	r1, r0, #0
    2094:	03df      	lsls	r7, r3, #15
    2096:	0000      	movs	r0, r0
    2098:	010c      	lsls	r4, r1, #4
    209a:	f01c 0003 	ands.w	r0, ip, #3
    209e:	0d00      	lsrs	r0, r0, #20
    20a0:	1c01      	adds	r1, r0, #0
    20a2:	0401      	lsls	r1, r0, #16
    20a4:	0000      	movs	r0, r0
    20a6:	010e      	lsls	r6, r1, #4
    20a8:	121c      	asrs	r4, r3, #8
    20aa:	0004      	movs	r4, r0
    20ac:	0f00      	lsrs	r0, r0, #28
    20ae:	1c01      	adds	r1, r0, #0
    20b0:	0423      	lsls	r3, r4, #16
    20b2:	0000      	movs	r0, r0
    20b4:	0110      	lsls	r0, r2, #4
    20b6:	341c      	adds	r4, #28
    20b8:	0004      	movs	r4, r0
    20ba:	1100      	asrs	r0, r0, #4
    20bc:	1c01      	adds	r1, r0, #0
    20be:	0445      	lsls	r5, r0, #17
    20c0:	0000      	movs	r0, r0
    20c2:	0112      	lsls	r2, r2, #4
    20c4:	761c      	strb	r4, [r3, #24]
    20c6:	0013      	movs	r3, r2
    20c8:	0b00      	lsrs	r0, r0, #12
    20ca:	1c01      	adds	r1, r0, #0
    20cc:	1386      	asrs	r6, r0, #14
    20ce:	0000      	movs	r0, r0
    20d0:	010c      	lsls	r4, r1, #4
    20d2:	961c      	str	r6, [sp, #112]	; 0x70
    20d4:	0013      	movs	r3, r2
    20d6:	0d00      	lsrs	r0, r0, #20
    20d8:	1c01      	adds	r1, r0, #0
    20da:	13a6      	asrs	r6, r4, #14
    20dc:	0000      	movs	r0, r0
    20de:	010e      	lsls	r6, r1, #4
    20e0:	b61c      			; <UNDEFINED> instruction: 0xb61c
    20e2:	0013      	movs	r3, r2
    20e4:	0f00      	lsrs	r0, r0, #28
    20e6:	1c01      	adds	r1, r0, #0
    20e8:	13c6      	asrs	r6, r0, #15
    20ea:	0000      	movs	r0, r0
    20ec:	0110      	lsls	r0, r2, #4
    20ee:	d61c      	bvs.n	0x212a
    20f0:	0013      	movs	r3, r2
    20f2:	1100      	asrs	r0, r0, #4
    20f4:	1c01      	adds	r1, r0, #0
    20f6:	13e6      	asrs	r6, r4, #15
    20f8:	0000      	movs	r0, r0
    20fa:	0112      	lsls	r2, r2, #4
    20fc:	941c      	str	r4, [sp, #112]	; 0x70
    20fe:	0023      	movs	r3, r4
    2100:	0b00      	lsrs	r0, r0, #12
    2102:	1c01      	adds	r1, r0, #0
    2104:	23a1      	movs	r3, #161	; 0xa1
    2106:	0000      	movs	r0, r0
    2108:	010c      	lsls	r4, r1, #4
    210a:	ae1c      	add	r6, sp, #112	; 0x70
    210c:	0023      	movs	r3, r4
    210e:	0d00      	lsrs	r0, r0, #20
    2110:	1c01      	adds	r1, r0, #0
    2112:	23bb      	movs	r3, #187	; 0xbb
    2114:	0000      	movs	r0, r0
    2116:	010e      	lsls	r6, r1, #4
    2118:	c81c      	ldmia	r0!, {r2, r3, r4}
    211a:	0023      	movs	r3, r4
    211c:	0f00      	lsrs	r0, r0, #28
    211e:	1c01      	adds	r1, r0, #0
    2120:	23d5      	movs	r3, #213	; 0xd5
    2122:	0000      	movs	r0, r0
    2124:	0110      	lsls	r0, r2, #4
    2126:	e21c      	b.n	0x2562
    2128:	0023      	movs	r3, r4
    212a:	1100      	asrs	r0, r0, #4
    212c:	1c01      	adds	r1, r0, #0
    212e:	23ef      	movs	r3, #239	; 0xef
    2130:	0000      	movs	r0, r0
    2132:	0112      	lsls	r2, r2, #4
    2134:	9d1c      	ldr	r5, [sp, #112]	; 0x70
    2136:	0020      	movs	r0, r4
    2138:	0b00      	lsrs	r0, r0, #12
    213a:	1c01      	adds	r1, r0, #0
    213c:	20aa      	movs	r0, #170	; 0xaa
    213e:	0000      	movs	r0, r0
    2140:	010c      	lsls	r4, r1, #4
    2142:	b71c      			; <UNDEFINED> instruction: 0xb71c
    2144:	0020      	movs	r0, r4
    2146:	0d00      	lsrs	r0, r0, #20
    2148:	1c01      	adds	r1, r0, #0
    214a:	20c4      	movs	r0, #196	; 0xc4
    214c:	0000      	movs	r0, r0
    214e:	010e      	lsls	r6, r1, #4
    2150:	d11c      	bne.n	0x218c
    2152:	0020      	movs	r0, r4
    2154:	0f00      	lsrs	r0, r0, #28
    2156:	1c01      	adds	r1, r0, #0
    2158:	3014      	adds	r0, #20
    215a:	0000      	movs	r0, r0
    215c:	0110      	lsls	r0, r2, #4
    215e:	ec1c 0020 	ldc	0, cr0, [ip], {32}
    2162:	1100      	asrs	r0, r0, #4
    2164:	1c01      	adds	r1, r0, #0
    2166:	20f9      	movs	r0, #249	; 0xf9
    2168:	0000      	movs	r0, r0
    216a:	0112      	lsls	r2, r2, #4
    216c:	cd1c      	ldmia	r5!, {r2, r3, r4}
    216e:	002a      	movs	r2, r5
    2170:	0b00      	lsrs	r0, r0, #12
    2172:	1c01      	adds	r1, r0, #0
    2174:	2e4b      	cmp	r6, #75	; 0x4b
    2176:	0000      	movs	r0, r0
    2178:	010c      	lsls	r4, r1, #4
    217a:	5b1c      	ldrh	r4, [r3, r4]
    217c:	002e      	movs	r6, r5
    217e:	0d00      	lsrs	r0, r0, #20
    2180:	1c01      	adds	r1, r0, #0
    2182:	2e6b      	cmp	r6, #107	; 0x6b
    2184:	0000      	movs	r0, r0
    2186:	010e      	lsls	r6, r1, #4
    2188:	7b1c      	ldrb	r4, [r3, #12]
    218a:	002e      	movs	r6, r5
    218c:	0f00      	lsrs	r0, r0, #28
    218e:	1c01      	adds	r1, r0, #0
    2190:	2e8b      	cmp	r6, #139	; 0x8b
    2192:	0000      	movs	r0, r0
    2194:	0110      	lsls	r0, r2, #4
    2196:	9b1c      	ldr	r3, [sp, #112]	; 0x70
    2198:	002e      	movs	r6, r5
    219a:	1100      	asrs	r0, r0, #4
    219c:	1c01      	adds	r1, r0, #0
    219e:	2eab      	cmp	r6, #171	; 0xab
    21a0:	0000      	movs	r0, r0
    21a2:	0112      	lsls	r2, r2, #4
    21a4:	cf1c      	ldmia	r7!, {r2, r3, r4}
    21a6:	0034      	movs	r4, r6
    21a8:	1400      	asrs	r0, r0, #16
    21aa:	1c01      	adds	r1, r0, #0
    21ac:	2106      	movs	r1, #6
    21ae:	0000      	movs	r0, r0
    21b0:	0116      	lsls	r6, r2, #4
    21b2:	bf1c      	itt	ne
    21b4:	0019      	movne	r1, r3
    21b6:	1900      	addne	r0, r0, r4
    21b8:	1c01      	adds	r1, r0, #0
    21ba:	2bb2      	cmp	r3, #178	; 0xb2
    21bc:	0000      	movs	r0, r0
    21be:	011a      	lsls	r2, r3, #4
    21c0:	c01c      	stmia	r0!, {r2, r3, r4}
    21c2:	002b      	movs	r3, r5
    21c4:	1b00      	subs	r0, r0, r4
    21c6:	1c01      	adds	r1, r0, #0
    21c8:	1d30      	adds	r0, r6, #4
    21ca:	0000      	movs	r0, r0
    21cc:	011c      	lsls	r4, r3, #4
    21ce:	881c      	ldrh	r4, [r3, #0]
    21d0:	0017      	movs	r7, r2
    21d2:	1e00      	subs	r0, r0, #0
    21d4:	1c01      	adds	r1, r0, #0
    21d6:	1794      	asrs	r4, r2, #30
    21d8:	0000      	movs	r0, r0
    21da:	011f      	lsls	r7, r3, #4
    21dc:	851c      	strh	r4, [r3, #40]	; 0x28
    21de:	001d      	movs	r5, r3
    21e0:	0100      	lsls	r0, r0, #4
    21e2:	1c02      	adds	r2, r0, #0
    21e4:	1a11      	subs	r1, r2, r0
    21e6:	0000      	movs	r0, r0
    21e8:	0202      	lsls	r2, r0, #8
    21ea:	da1c      	bge.n	0x2226
    21ec:	0001      	movs	r1, r0
    21ee:	0300      	lsls	r0, r0, #12
    21f0:	1c02      	adds	r2, r0, #0
    21f2:	14b7      	asrs	r7, r6, #18
    21f4:	0000      	movs	r0, r0
    21f6:	0204      	lsls	r4, r0, #8
    21f8:	cc1c      	ldmia	r4, {r2, r3, r4}
    21fa:	0019      	movs	r1, r3
    21fc:	0500      	lsls	r0, r0, #20
    21fe:	1c02      	adds	r2, r0, #0
    2200:	15c5      	asrs	r5, r0, #23
    2202:	0000      	movs	r0, r0
    2204:	0206      	lsls	r6, r0, #8
    2206:	ec1c 001d 	ldc	0, cr0, [ip], {29}
    220a:	0700      	lsls	r0, r0, #28
    220c:	1c02      	adds	r2, r0, #0
    220e:	10bc      	asrs	r4, r7, #2
    2210:	0000      	movs	r0, r0
    2212:	0208      	lsls	r0, r1, #8
    2214:	541c      	strb	r4, [r3, r0]
    2216:	001b      	movs	r3, r3
    2218:	0900      	lsrs	r0, r0, #4
    221a:	1c02      	adds	r2, r0, #0
    221c:	1b61      	subs	r1, r4, r5
    221e:	0000      	movs	r0, r0
    2220:	020a      	lsls	r2, r1, #8
    2222:	7d1c      	ldrb	r4, [r3, #20]
    2224:	0017      	movs	r7, r2
    2226:	0c00      	lsrs	r0, r0, #16
    2228:	1c02      	adds	r2, r0, #0
    222a:	2190      	movs	r1, #144	; 0x90
    222c:	0000      	movs	r0, r0
    222e:	020d      	lsls	r5, r1, #8
    2230:	9f1c      	ldr	r7, [sp, #112]	; 0x70
    2232:	0018      	movs	r0, r3
    2234:	0e00      	lsrs	r0, r0, #24
    2236:	1c02      	adds	r2, r0, #0
    2238:	1dcb      	adds	r3, r1, #7
    223a:	0000      	movs	r0, r0
    223c:	020f      	lsls	r7, r1, #8
    223e:	231c      	movs	r3, #28
    2240:	000d      	movs	r5, r1
    2242:	1000      	asrs	r0, r0, #32
    2244:	1c02      	adds	r2, r0, #0
    2246:	2887      	cmp	r0, #135	; 0x87
    2248:	0000      	movs	r0, r0
    224a:	0211      	lsls	r1, r2, #8
    224c:	fb1c 001d 	smlabt	r0, ip, sp, r0
    2250:	1200      	asrs	r0, r0, #8
    2252:	1c02      	adds	r2, r0, #0
    2254:	35f7      	adds	r5, #247	; 0xf7
    2256:	0000      	movs	r0, r0
    2258:	0213      	lsls	r3, r2, #8
    225a:	ae1c      	add	r6, sp, #112	; 0x70
    225c:	0009      	movs	r1, r1
    225e:	1400      	asrs	r0, r0, #16
    2260:	1c02      	adds	r2, r0, #0
    2262:	2bda      	cmp	r3, #218	; 0xda
    2264:	0000      	movs	r0, r0
    2266:	0215      	lsls	r5, r2, #8
    2268:	4f1c      	ldr	r7, [pc, #112]	; (0x22dc)
    226a:	0021      	movs	r1, r4
    226c:	1600      	asrs	r0, r0, #24
    226e:	1c02      	adds	r2, r0, #0
    2270:	1c6f      	adds	r7, r5, #1
    2272:	0000      	movs	r0, r0
    2274:	0217      	lsls	r7, r2, #8
    2276:	b71c      			; <UNDEFINED> instruction: 0xb71c
    2278:	0003      	movs	r3, r0
    227a:	1800      	adds	r0, r0, r0
    227c:	1c02      	adds	r2, r0, #0
    227e:	09cc      	lsrs	r4, r1, #7
    2280:	0000      	movs	r0, r0
    2282:	021b      	lsls	r3, r3, #8
    2284:	0c1c      	lsrs	r4, r3, #16
    2286:	0007      	movs	r7, r0
    2288:	1c00      	adds	r0, r0, #0
    228a:	1c02      	adds	r2, r0, #0
    228c:	10da      	asrs	r2, r3, #3
    228e:	0000      	movs	r0, r0
    2290:	021d      	lsls	r5, r3, #8
    2292:	961c      	str	r6, [sp, #112]	; 0x70
    2294:	0028      	movs	r0, r5
    2296:	1e00      	subs	r0, r0, #0
    2298:	0002      	movs	r2, r0
    229a:	0813      	lsrs	r3, r2, #32
    229c:	0027      	movs	r7, r4
    229e:	0200      	lsls	r0, r0, #8
    22a0:	01bc      	lsls	r4, r7, #6
    22a2:	19e3      	adds	r3, r4, r7
    22a4:	0000      	movs	r0, r0
    22a6:	351b      	adds	r5, #27
    22a8:	0017      	movs	r7, r2
    22aa:	0700      	lsls	r0, r0, #28
    22ac:	2c01      	cmp	r4, #1
    22ae:	0000      	movs	r0, r0
    22b0:	0200      	lsls	r0, r0, #8
    22b2:	01c4      	lsls	r4, r0, #7
    22b4:	1d89      	adds	r1, r1, #6
    22b6:	0000      	movs	r0, r0
    22b8:	251a      	movs	r5, #26
    22ba:	0029      	movs	r1, r5
    22bc:	0000      	movs	r0, r0
    22be:	861a      	strh	r2, [r3, #48]	; 0x30
    22c0:	0006      	movs	r6, r0
    22c2:	0100      	lsls	r0, r0, #4
    22c4:	9b1a      	ldr	r3, [sp, #104]	; 0x68
    22c6:	0021      	movs	r1, r4
    22c8:	0200      	lsls	r0, r0, #8
    22ca:	c41a      	stmia	r4!, {r1, r3, r4}
    22cc:	0014      	movs	r4, r2
    22ce:	0300      	lsls	r0, r0, #12
    22d0:	a81a      	add	r0, sp, #104	; 0x68
    22d2:	002c      	movs	r4, r5
    22d4:	0400      	lsls	r0, r0, #16
    22d6:	0c1a      	lsrs	r2, r3, #16
    22d8:	0013      	movs	r3, r2
    22da:	0500      	lsls	r0, r0, #20
    22dc:	181a      	adds	r2, r3, r0
    22de:	0013      	movs	r3, r2
    22e0:	0600      	lsls	r0, r0, #24
    22e2:	7e1a      	ldrb	r2, [r3, #24]
    22e4:	0008      	movs	r0, r1
    22e6:	0700      	lsls	r0, r0, #28
    22e8:	231a      	movs	r3, #26
    22ea:	0005      	movs	r5, r0
    22ec:	0800      	lsrs	r0, r0, #32
    22ee:	561a      	ldrsb	r2, [r3, r0]
    22f0:	001c      	movs	r4, r3
    22f2:	0900      	lsrs	r0, r0, #4
    22f4:	051a      	lsls	r2, r3, #20
    22f6:	0035      	movs	r5, r6
    22f8:	0a00      	lsrs	r0, r0, #8
    22fa:	451a      	cmp	r2, r3
    22fc:	0034      	movs	r4, r6
    22fe:	0b00      	lsrs	r0, r0, #12
    2300:	5e1a      	ldrsh	r2, [r3, r0]
    2302:	0034      	movs	r4, r6
    2304:	0c00      	lsrs	r0, r0, #16
    2306:	821a      	strh	r2, [r3, #16]
    2308:	0026      	movs	r6, r4
    230a:	0d00      	lsrs	r0, r0, #20
    230c:	d61a      	bvs.n	0x2344
    230e:	0021      	movs	r1, r4
    2310:	0e00      	lsrs	r0, r0, #24
    2312:	de1a      	udf	#26
    2314:	0034      	movs	r4, r6
    2316:	0f00      	lsrs	r0, r0, #28
    2318:	6f1a      	ldr	r2, [r3, #112]	; 0x70
    231a:	0005      	movs	r5, r0
    231c:	1000      	asrs	r0, r0, #32
    231e:	fc1a 0027 	ldc2	0, cr0, [sl], {39}	; 0x27
    2322:	1100      	asrs	r0, r0, #4
    2324:	871a      	strh	r2, [r3, #56]	; 0x38
    2326:	0005      	movs	r5, r0
    2328:	1200      	asrs	r0, r0, #8
    232a:	981a      	ldr	r0, [sp, #104]	; 0x68
    232c:	0005      	movs	r5, r0
    232e:	1300      	asrs	r0, r0, #12
    2330:	a91a      	add	r1, sp, #104	; 0x68
    2332:	0005      	movs	r5, r0
    2334:	1400      	asrs	r0, r0, #16
    2336:	ba1a      	rev	r2, r3
    2338:	0005      	movs	r5, r0
    233a:	1500      	asrs	r0, r0, #20
    233c:	cb1a      	ldmia	r3, {r1, r3, r4}
    233e:	0005      	movs	r5, r0
    2340:	1600      	asrs	r0, r0, #24
    2342:	dc1a      	bgt.n	0x237a
    2344:	0005      	movs	r5, r0
    2346:	1700      	asrs	r0, r0, #28
    2348:	941a      	str	r4, [sp, #104]	; 0x68
    234a:	0009      	movs	r1, r1
    234c:	1800      	adds	r0, r0, r0
    234e:	031a      	lsls	r2, r3, #12
    2350:	000a      	movs	r2, r1
    2352:	1900      	adds	r0, r0, r4
    2354:	121a      	asrs	r2, r3, #8
    2356:	000a      	movs	r2, r1
    2358:	1a00      	subs	r0, r0, r0
    235a:	211a      	movs	r1, #26
    235c:	000a      	movs	r2, r1
    235e:	1b00      	subs	r0, r0, r4
    2360:	db1a      	blt.n	0x2398
    2362:	0022      	movs	r2, r4
    2364:	1c00      	adds	r0, r0, #0
    2366:	3b1a      	subs	r3, #26
    2368:	000a      	movs	r2, r1
    236a:	1d00      	adds	r0, r0, #4
    236c:	101a      	asrs	r2, r3, #32
    236e:	001d      	movs	r5, r3
    2370:	1e00      	subs	r0, r0, #0
    2372:	201a      	movs	r0, #26
    2374:	001d      	movs	r5, r3
    2376:	1f00      	subs	r0, r0, #4
    2378:	1b00      	subs	r0, r0, r4
    237a:	116b      	asrs	r3, r5, #5
    237c:	0000      	movs	r0, r0
    237e:	0405      	lsls	r5, r0, #16
    2380:	0033      	movs	r3, r6
    2382:	0000      	movs	r0, r0
    2384:	1902      	adds	r2, r0, r4
    2386:	6102      	str	r2, [r0, #16]
    2388:	0022      	movs	r2, r4
    238a:	1d00      	adds	r0, r0, #4
    238c:	0d6f      	lsrs	r7, r5, #21
    238e:	0000      	movs	r0, r0
    2390:	9108      	str	r1, [sp, #32]
    2392:	0010      	movs	r0, r2
    2394:	8f1d      	ldrh	r5, [r3, #56]	; 0x38
    2396:	0001      	movs	r1, r0
    2398:	0800      	lsrs	r0, r0, #32
    239a:	1092      	asrs	r2, r2, #2
    239c:	1d00      	adds	r0, r0, #4
    239e:	2cbe      	cmp	r4, #190	; 0xbe
    23a0:	0000      	movs	r0, r0
    23a2:	9308      	str	r3, [sp, #32]
    23a4:	0010      	movs	r0, r2
    23a6:	691d      	ldr	r5, [r3, #16]
    23a8:	0033      	movs	r3, r6
    23aa:	0800      	lsrs	r0, r0, #32
    23ac:	1094      	asrs	r4, r2, #2
    23ae:	1d00      	adds	r0, r0, #4
    23b0:	1a55      	subs	r5, r2, r1
    23b2:	0000      	movs	r0, r0
    23b4:	9108      	str	r1, [sp, #32]
    23b6:	0020      	movs	r0, r4
    23b8:	321d      	adds	r2, #29
    23ba:	000f      	movs	r7, r1
    23bc:	0800      	lsrs	r0, r0, #32
    23be:	3091      	adds	r0, #145	; 0x91
    23c0:	1d00      	adds	r0, r0, #4
    23c2:	09ef      	lsrs	r7, r5, #7
    23c4:	0000      	movs	r0, r0
    23c6:	9108      	str	r1, [sp, #32]
    23c8:	0040      	lsls	r0, r0, #1
    23ca:	d11c      	bne.n	0x2406
    23cc:	0014      	movs	r4, r2
    23ce:	0a00      	lsrs	r0, r0, #8
    23d0:	1c01      	adds	r1, r0, #0
    23d2:	14f1      	asrs	r1, r6, #19
    23d4:	0000      	movs	r0, r0
    23d6:	020a      	lsls	r2, r1, #8
    23d8:	aa1c      	add	r2, sp, #112	; 0x70
    23da:	0029      	movs	r1, r5
    23dc:	0a00      	lsrs	r0, r0, #8
    23de:	1c03      	adds	r3, r0, #0
    23e0:	1f31      	subs	r1, r6, #4
    23e2:	0000      	movs	r0, r0
    23e4:	040a      	lsls	r2, r1, #16
    23e6:	a71c      	add	r7, pc, #112	; (adr r7, 0x2458)
    23e8:	0017      	movs	r7, r2
    23ea:	0a00      	lsrs	r0, r0, #8
    23ec:	1c05      	adds	r5, r0, #0
    23ee:	0de4      	lsrs	r4, r4, #23
    23f0:	0000      	movs	r0, r0
    23f2:	060a      	lsls	r2, r1, #24
    23f4:	961c      	str	r6, [sp, #112]	; 0x70
    23f6:	002c      	movs	r4, r5
    23f8:	0a00      	lsrs	r0, r0, #8
    23fa:	1c07      	adds	r7, r0, #0
    23fc:	088d      	lsrs	r5, r1, #2
    23fe:	0000      	movs	r0, r0
    2400:	080a      	lsrs	r2, r1, #32
    2402:	ea1c 0011 	ands.w	r0, ip, r1, lsr #32
    2406:	0c00      	lsrs	r0, r0, #16
    2408:	1c01      	adds	r1, r0, #0
    240a:	2c2e      	cmp	r4, #46	; 0x2e
    240c:	0000      	movs	r0, r0
    240e:	020c      	lsls	r4, r1, #8
    2410:	d01c      	beq.n	0x244c
    2412:	000b      	movs	r3, r1
    2414:	0c00      	lsrs	r0, r0, #16
    2416:	1c03      	adds	r3, r0, #0
    2418:	0932      	lsrs	r2, r6, #4
    241a:	0000      	movs	r0, r0
    241c:	040c      	lsls	r4, r1, #16
    241e:	f41c 0022 	ands.w	r0, ip, #10616832	; 0xa20000
    2422:	0c00      	lsrs	r0, r0, #16
    2424:	1c08      	adds	r0, r1, #0
    2426:	3057      	adds	r0, #87	; 0x57
    2428:	0000      	movs	r0, r0
    242a:	0111      	lsls	r1, r2, #4
    242c:	5d1c      	ldrb	r4, [r3, r4]
    242e:	0038      	movs	r0, r7
    2430:	1100      	asrs	r0, r0, #4
    2432:	1c02      	adds	r2, r0, #0
    2434:	0b88      	lsrs	r0, r1, #14
    2436:	0000      	movs	r0, r0
    2438:	0311      	lsls	r1, r2, #12
    243a:	df1c      	svc	28
    243c:	000b      	movs	r3, r1
    243e:	1100      	asrs	r0, r0, #4
    2440:	1c04      	adds	r4, r0, #0
    2442:	3213      	adds	r2, #19
    2444:	0000      	movs	r0, r0
    2446:	0811      	lsrs	r1, r2, #32
    2448:	0a1c      	lsrs	r4, r3, #8
    244a:	0012      	movs	r2, r2
    244c:	1200      	asrs	r0, r0, #8
    244e:	1c01      	adds	r1, r0, #0
    2450:	29e7      	cmp	r1, #231	; 0xe7
    2452:	0000      	movs	r0, r0
    2454:	0212      	lsls	r2, r2, #8
    2456:	531c      	strh	r4, [r3, r4]
    2458:	0023      	movs	r3, r4
    245a:	1200      	asrs	r0, r0, #8
    245c:	1c04      	adds	r4, r0, #0
    245e:	3619      	adds	r6, #25
    2460:	0000      	movs	r0, r0
    2462:	0612      	lsls	r2, r2, #24
    2464:	971c      	str	r7, [sp, #112]	; 0x70
    2466:	0016      	movs	r6, r2
    2468:	1200      	asrs	r0, r0, #8
    246a:	1c08      	adds	r0, r1, #0
    246c:	2b28      	cmp	r3, #40	; 0x28
    246e:	0000      	movs	r0, r0
    2470:	0114      	lsls	r4, r2, #4
    2472:	301c      	adds	r0, #28
    2474:	0027      	movs	r7, r4
    2476:	1400      	asrs	r0, r0, #16
    2478:	1c02      	adds	r2, r0, #0
    247a:	00a0      	lsls	r0, r4, #2
    247c:	0000      	movs	r0, r0
    247e:	0314      	lsls	r4, r2, #12
    2480:	5b1c      	ldrh	r4, [r3, r4]
    2482:	0025      	movs	r5, r4
    2484:	1400      	asrs	r0, r0, #16
    2486:	1c04      	adds	r4, r0, #0
    2488:	312e      	adds	r1, #46	; 0x2e
    248a:	0000      	movs	r0, r0
    248c:	0514      	lsls	r4, r2, #20
    248e:	601c      	str	r4, [r3, #0]
    2490:	0024      	movs	r4, r4
    2492:	1400      	asrs	r0, r0, #16
    2494:	1c06      	adds	r6, r0, #0
    2496:	07a0      	lsls	r0, r4, #30
    2498:	0000      	movs	r0, r0
    249a:	0714      	lsls	r4, r2, #28
    249c:	1f1c      	subs	r4, r3, #4
    249e:	001e      	movs	r6, r3
    24a0:	1400      	asrs	r0, r0, #16
    24a2:	1c08      	adds	r0, r1, #0
    24a4:	2b3f      	cmp	r3, #63	; 0x3f
    24a6:	0000      	movs	r0, r0
    24a8:	0115      	lsls	r5, r2, #4
    24aa:	471c      	bxns	r3
    24ac:	0027      	movs	r7, r4
    24ae:	1500      	asrs	r0, r0, #20
    24b0:	1c02      	adds	r2, r0, #0
    24b2:	00b5      	lsls	r5, r6, #2
    24b4:	0000      	movs	r0, r0
    24b6:	0315      	lsls	r5, r2, #12
    24b8:	741c      	strb	r4, [r3, #16]
    24ba:	0025      	movs	r5, r4
    24bc:	1500      	asrs	r0, r0, #20
    24be:	1c04      	adds	r4, r0, #0
    24c0:	3142      	adds	r1, #66	; 0x42
    24c2:	0000      	movs	r0, r0
    24c4:	0515      	lsls	r5, r2, #20
    24c6:	731c      	strb	r4, [r3, #12]
    24c8:	0024      	movs	r4, r4
    24ca:	1500      	asrs	r0, r0, #20
    24cc:	1c06      	adds	r6, r0, #0
    24ce:	201e      	movs	r0, #30
    24d0:	0000      	movs	r0, r0
    24d2:	0715      	lsls	r5, r2, #28
    24d4:	d71c      	bvc.n	0x2510
    24d6:	002f      	movs	r7, r5
    24d8:	1500      	asrs	r0, r0, #20
    24da:	1c08      	adds	r0, r1, #0
    24dc:	2b56      	cmp	r3, #86	; 0x56
    24de:	0000      	movs	r0, r0
    24e0:	0116      	lsls	r6, r2, #4
    24e2:	5e1c      	ldrsh	r4, [r3, r0]
    24e4:	0027      	movs	r7, r4
    24e6:	1600      	asrs	r0, r0, #24
    24e8:	1c02      	adds	r2, r0, #0
    24ea:	00ca      	lsls	r2, r1, #3
    24ec:	0000      	movs	r0, r0
    24ee:	0316      	lsls	r6, r2, #12
    24f0:	8d1c      	ldrh	r4, [r3, #40]	; 0x28
    24f2:	0025      	movs	r5, r4
    24f4:	1600      	asrs	r0, r0, #24
    24f6:	1c04      	adds	r4, r0, #0
    24f8:	3156      	adds	r1, #86	; 0x56
    24fa:	0000      	movs	r0, r0
    24fc:	0516      	lsls	r6, r2, #20
    24fe:	861c      	strh	r4, [r3, #48]	; 0x30
    2500:	0024      	movs	r4, r4
    2502:	1600      	asrs	r0, r0, #24
    2504:	1c06      	adds	r6, r0, #0
    2506:	07c3      	lsls	r3, r0, #31
    2508:	0000      	movs	r0, r0
    250a:	0716      	lsls	r6, r2, #28
    250c:	ea1c 002f 	ands.w	r0, ip, pc, asr #32
    2510:	1600      	asrs	r0, r0, #24
    2512:	1c08      	adds	r0, r1, #0
    2514:	2b6d      	cmp	r3, #109	; 0x6d
    2516:	0000      	movs	r0, r0
    2518:	0117      	lsls	r7, r2, #4
    251a:	751c      	strb	r4, [r3, #20]
    251c:	0027      	movs	r7, r4
    251e:	1700      	asrs	r0, r0, #28
    2520:	1c02      	adds	r2, r0, #0
    2522:	00df      	lsls	r7, r3, #3
    2524:	0000      	movs	r0, r0
    2526:	0317      	lsls	r7, r2, #12
    2528:	391c      	subs	r1, #28
    252a:	000b      	movs	r3, r1
    252c:	1700      	asrs	r0, r0, #28
    252e:	1c04      	adds	r4, r0, #0
    2530:	316a      	adds	r1, #106	; 0x6a
    2532:	0000      	movs	r0, r0
    2534:	0517      	lsls	r7, r2, #20
    2536:	991c      	ldr	r1, [sp, #112]	; 0x70
    2538:	0024      	movs	r4, r4
    253a:	1700      	asrs	r0, r0, #28
    253c:	1c06      	adds	r6, r0, #0
    253e:	07d8      	lsls	r0, r3, #31
    2540:	0000      	movs	r0, r0
    2542:	0717      	lsls	r7, r2, #28
    2544:	461c      	mov	r4, r3
    2546:	001e      	movs	r6, r3
    2548:	1700      	asrs	r0, r0, #28
    254a:	1c08      	adds	r0, r1, #0
    254c:	2b84      	cmp	r3, #132	; 0x84
    254e:	0000      	movs	r0, r0
    2550:	0118      	lsls	r0, r3, #4
    2552:	8c1c      	ldrh	r4, [r3, #32]
    2554:	0027      	movs	r7, r4
    2556:	1800      	adds	r0, r0, r0
    2558:	1c02      	adds	r2, r0, #0
    255a:	00f4      	lsls	r4, r6, #3
    255c:	0000      	movs	r0, r0
    255e:	0318      	lsls	r0, r3, #12
    2560:	b81c      			; <UNDEFINED> instruction: 0xb81c
    2562:	0025      	movs	r5, r4
    2564:	1800      	adds	r0, r0, r0
    2566:	1c04      	adds	r4, r0, #0
    2568:	317e      	adds	r1, #126	; 0x7e
    256a:	0000      	movs	r0, r0
    256c:	0518      	lsls	r0, r3, #20
    256e:	ac1c      	add	r4, sp, #112	; 0x70
    2570:	0024      	movs	r4, r4
    2572:	1800      	adds	r0, r0, r0
    2574:	1c06      	adds	r6, r0, #0
    2576:	07ed      	lsls	r5, r5, #31
    2578:	0000      	movs	r0, r0
    257a:	0718      	lsls	r0, r3, #28
    257c:	591c      	ldr	r4, [r3, r4]
    257e:	001e      	movs	r6, r3
    2580:	1800      	adds	r0, r0, r0
    2582:	1c08      	adds	r0, r1, #0
    2584:	2b9b      	cmp	r3, #155	; 0x9b
    2586:	0000      	movs	r0, r0
    2588:	0119      	lsls	r1, r3, #4
    258a:	4a1c      	ldr	r2, [pc, #112]	; (0x25fc)
    258c:	000a      	movs	r2, r1
    258e:	1900      	adds	r0, r0, r4
    2590:	1c02      	adds	r2, r0, #0
    2592:	0109      	lsls	r1, r1, #4
    2594:	0000      	movs	r0, r0
    2596:	0319      	lsls	r1, r3, #12
    2598:	d11c      	bne.n	0x25d4
    259a:	0025      	movs	r5, r4
    259c:	1900      	adds	r0, r0, r4
    259e:	1c04      	adds	r4, r0, #0
    25a0:	3192      	adds	r1, #146	; 0x92
    25a2:	0000      	movs	r0, r0
    25a4:	0519      	lsls	r1, r3, #20
    25a6:	bf1c      	itt	ne
    25a8:	0024      	movne	r4, r4
    25aa:	1900      	addne	r0, r0, r4
    25ac:	1c06      	adds	r6, r0, #0
    25ae:	0802      	lsrs	r2, r0, #32
    25b0:	0000      	movs	r0, r0
    25b2:	0719      	lsls	r1, r3, #28
    25b4:	6c1c      	ldr	r4, [r3, #64]	; 0x40
    25b6:	001e      	movs	r6, r3
    25b8:	1900      	adds	r0, r0, r4
    25ba:	1c08      	adds	r0, r1, #0
    25bc:	08ad      	lsrs	r5, r5, #2
    25be:	0000      	movs	r0, r0
    25c0:	011a      	lsls	r2, r3, #4
    25c2:	b21c      	sxth	r4, r3
    25c4:	0027      	movs	r7, r4
    25c6:	1a00      	subs	r0, r0, r0
    25c8:	1c02      	adds	r2, r0, #0
    25ca:	011e      	lsls	r6, r3, #4
    25cc:	0000      	movs	r0, r0
    25ce:	031a      	lsls	r2, r3, #12
    25d0:	ea1c 0025 	ands.w	r0, ip, r5, asr #32
    25d4:	1a00      	subs	r0, r0, r0
    25d6:	1c04      	adds	r4, r0, #0
    25d8:	31a6      	adds	r1, #166	; 0xa6
    25da:	0000      	movs	r0, r0
    25dc:	051a      	lsls	r2, r3, #20
    25de:	d21c      	bcs.n	0x261a
    25e0:	0024      	movs	r4, r4
    25e2:	1a00      	subs	r0, r0, r0
    25e4:	1c06      	adds	r6, r0, #0
    25e6:	0817      	lsrs	r7, r2, #32
    25e8:	0000      	movs	r0, r0
    25ea:	071a      	lsls	r2, r3, #28
    25ec:	7f1c      	ldrb	r4, [r3, #28]
    25ee:	001e      	movs	r6, r3
    25f0:	1a00      	subs	r0, r0, r0
    25f2:	1c08      	adds	r0, r1, #0
    25f4:	08d7      	lsrs	r7, r2, #3
    25f6:	0000      	movs	r0, r0
    25f8:	011b      	lsls	r3, r3, #4
    25fa:	c91c      	ldmia	r1!, {r2, r3, r4}
    25fc:	0027      	movs	r7, r4
    25fe:	1b00      	subs	r0, r0, r4
    2600:	1c02      	adds	r2, r0, #0
    2602:	0133      	lsls	r3, r6, #4
    2604:	0000      	movs	r0, r0
    2606:	031b      	lsls	r3, r3, #12
    2608:	031c      	lsls	r4, r3, #12
    260a:	0026      	movs	r6, r4
    260c:	1b00      	subs	r0, r0, r4
    260e:	1c04      	adds	r4, r0, #0
    2610:	31ba      	adds	r1, #186	; 0xba
    2612:	0000      	movs	r0, r0
    2614:	051b      	lsls	r3, r3, #20
    2616:	e51c      	b.n	0x2052
    2618:	0024      	movs	r4, r4
    261a:	1b00      	subs	r0, r0, r4
    261c:	1c06      	adds	r6, r0, #0
    261e:	2067      	movs	r0, #103	; 0x67
    2620:	0000      	movs	r0, r0
    2622:	071b      	lsls	r3, r3, #28
    2624:	921c      	str	r2, [sp, #112]	; 0x70
    2626:	001e      	movs	r6, r3
    2628:	1b00      	subs	r0, r0, r4
    262a:	1c08      	adds	r0, r1, #0
    262c:	06f8      	lsls	r0, r7, #27
    262e:	0000      	movs	r0, r0
    2630:	011c      	lsls	r4, r3, #4
    2632:	3f1c      	subs	r7, #28
    2634:	002d      	movs	r5, r5
    2636:	1c00      	adds	r0, r0, #0
    2638:	1c02      	adds	r2, r0, #0
    263a:	13f6      	asrs	r6, r6, #15
    263c:	0000      	movs	r0, r0
    263e:	031c      	lsls	r4, r3, #12
    2640:	a91c      	add	r1, sp, #112	; 0x70
    2642:	0011      	movs	r1, r2
    2644:	1c00      	adds	r0, r0, #0
    2646:	1c04      	adds	r4, r0, #0
    2648:	1134      	asrs	r4, r6, #4
    264a:	0000      	movs	r0, r0
    264c:	051c      	lsls	r4, r3, #20
    264e:	d81c      	bhi.n	0x268a
    2650:	0006      	movs	r6, r0
    2652:	1c00      	adds	r0, r0, #0
    2654:	1c07      	adds	r7, r0, #0
    2656:	0073      	lsls	r3, r6, #1
    2658:	0000      	movs	r0, r0
    265a:	081c      	lsrs	r4, r3, #32
    265c:	f01c 0016 	ands.w	r0, ip, #22
    2660:	2000      	movs	r0, #0
    2662:	1c01      	adds	r1, r0, #0
    2664:	27e0      	movs	r7, #224	; 0xe0
    2666:	0000      	movs	r0, r0
    2668:	0220      	lsls	r0, r4, #8
    266a:	441c      	add	r4, r3
    266c:	0032      	movs	r2, r6
    266e:	2000      	movs	r0, #0
    2670:	1c03      	adds	r3, r0, #0
    2672:	1c34      	adds	r4, r6, #0
    2674:	0000      	movs	r0, r0
    2676:	0420      	lsls	r0, r4, #16
    2678:	791c      	ldrb	r4, [r3, #4]
    267a:	0012      	movs	r2, r2
    267c:	2000      	movs	r0, #0
    267e:	1c08      	adds	r0, r1, #0
    2680:	1aa7      	subs	r7, r4, r2
    2682:	0000      	movs	r0, r0
    2684:	0124      	lsls	r4, r4, #4
    2686:	de1c      	udf	#28
    2688:	0009      	movs	r1, r1
    268a:	2400      	movs	r4, #0
    268c:	1c02      	adds	r2, r0, #0
    268e:	0353      	lsls	r3, r2, #13
    2690:	0000      	movs	r0, r0
    2692:	0324      	lsls	r4, r4, #12
    2694:	961c      	str	r6, [sp, #112]	; 0x70
    2696:	002d      	movs	r5, r5
    2698:	2400      	movs	r4, #0
    269a:	1c04      	adds	r4, r0, #0
    269c:	08f7      	lsrs	r7, r6, #3
    269e:	0000      	movs	r0, r0
    26a0:	0624      	lsls	r4, r4, #24
    26a2:	431c      	orrs	r4, r3
    26a4:	0002      	movs	r2, r0
    26a6:	2400      	movs	r4, #0
    26a8:	1c08      	adds	r0, r1, #0
    26aa:	05f8      	lsls	r0, r7, #23
    26ac:	0000      	movs	r0, r0
    26ae:	0126      	lsls	r6, r4, #4
    26b0:	921c      	str	r2, [sp, #112]	; 0x70
    26b2:	0014      	movs	r4, r2
    26b4:	2600      	movs	r6, #0
    26b6:	1c02      	adds	r2, r0, #0
    26b8:	18fb      	adds	r3, r7, r3
    26ba:	0000      	movs	r0, r0
    26bc:	0426      	lsls	r6, r4, #16
    26be:	681c      	ldr	r4, [r3, #0]
    26c0:	002c      	movs	r4, r5
    26c2:	2600      	movs	r6, #0
    26c4:	1c06      	adds	r6, r0, #0
    26c6:	0ba3      	lsrs	r3, r4, #14
    26c8:	0000      	movs	r0, r0
    26ca:	0826      	lsrs	r6, r4, #32
    26cc:	a91c      	add	r1, sp, #112	; 0x70
    26ce:	0012      	movs	r2, r2
    26d0:	3f00      	subs	r7, #0
    26d2:	1c01      	adds	r1, r0, #0
    26d4:	08c4      	lsrs	r4, r0, #3
    26d6:	0000      	movs	r0, r0
    26d8:	023f      	lsls	r7, r7, #8
    26da:	781c      	ldrb	r4, [r3, #0]
    26dc:	000e      	movs	r6, r1
    26de:	0200      	lsls	r0, r0, #8
    26e0:	1c01      	adds	r1, r0, #0
    26e2:	331e      	adds	r3, #30
    26e4:	0000      	movs	r0, r0
    26e6:	0202      	lsls	r2, r0, #8
    26e8:	001c      	movs	r4, r3
    26ea:	001a      	movs	r2, r3
    26ec:	0200      	lsls	r0, r0, #8
    26ee:	1c03      	adds	r3, r0, #0
    26f0:	32f2      	adds	r2, #242	; 0xf2
    26f2:	0000      	movs	r0, r0
    26f4:	0802      	lsrs	r2, r0, #32
    26f6:	451c      	cmp	r4, r3
    26f8:	0018      	movs	r0, r3
    26fa:	0000      	movs	r0, r0
    26fc:	1c01      	adds	r1, r0, #0
    26fe:	12bb      	asrs	r3, r7, #10
    2700:	0000      	movs	r0, r0
    2702:	0200      	lsls	r0, r0, #8
    2704:	561c      	ldrsb	r4, [r3, r0]
    2706:	0008      	movs	r0, r1
    2708:	0000      	movs	r0, r0
    270a:	1c03      	adds	r3, r0, #0
    270c:	0c2e      	lsrs	r6, r5, #16
    270e:	0000      	movs	r0, r0
    2710:	0800      	lsrs	r0, r0, #32
    2712:	b11c      	cbz	r4, 0x271c
    2714:	0030      	movs	r0, r6
    2716:	0100      	lsls	r0, r0, #4
    2718:	1c01      	adds	r1, r0, #0
    271a:	262a      	movs	r6, #42	; 0x2a
    271c:	0000      	movs	r0, r0
    271e:	0201      	lsls	r1, r0, #8
    2720:	6a1c      	ldr	r4, [r3, #32]
    2722:	0008      	movs	r0, r1
    2724:	0100      	lsls	r0, r0, #4
    2726:	1c03      	adds	r3, r0, #0
    2728:	0c40      	lsrs	r0, r0, #17
    272a:	0000      	movs	r0, r0
    272c:	0801      	lsrs	r1, r0, #32
    272e:	fa1c 0011 			; <UNDEFINED> instruction: 0xfa1c0011
    2732:	0d00      	lsrs	r0, r0, #20
    2734:	1c01      	adds	r1, r0, #0
    2736:	2c3f      	cmp	r4, #63	; 0x3f
    2738:	0000      	movs	r0, r0
    273a:	020d      	lsls	r5, r1, #8
    273c:	f01c 0012 	ands.w	r0, ip, #18
    2740:	0d00      	lsrs	r0, r0, #20
    2742:	1c03      	adds	r3, r0, #0
    2744:	0942      	lsrs	r2, r0, #5
    2746:	0000      	movs	r0, r0
    2748:	040d      	lsls	r5, r1, #16
    274a:	021c      	lsls	r4, r3, #8
    274c:	0023      	movs	r3, r4
    274e:	0d00      	lsrs	r0, r0, #20
    2750:	1c08      	adds	r0, r1, #0
    2752:	0908      	lsrs	r0, r1, #4
    2754:	0000      	movs	r0, r0
    2756:	0103      	lsls	r3, r0, #4
    2758:	cb1c      	ldmia	r3, {r2, r3, r4}
    275a:	0030      	movs	r0, r6
    275c:	0300      	lsls	r0, r0, #12
    275e:	1c02      	adds	r2, r0, #0
    2760:	0254      	lsls	r4, r2, #9
    2762:	0000      	movs	r0, r0
    2764:	0403      	lsls	r3, r0, #16
    2766:	d51c      	bpl.n	0x27a2
    2768:	0002      	movs	r2, r0
    276a:	0300      	lsls	r0, r0, #12
    276c:	1c05      	adds	r5, r0, #0
    276e:	17ce      	asrs	r6, r1, #31
    2770:	0000      	movs	r0, r0
    2772:	0603      	lsls	r3, r0, #24
    2774:	aa1c      	add	r2, sp, #112	; 0x70
    2776:	001f      	movs	r7, r3
    2778:	0300      	lsls	r0, r0, #12
    277a:	1c07      	adds	r7, r0, #0
    277c:	0bfb      	lsrs	r3, r7, #15
    277e:	0000      	movs	r0, r0
    2780:	0803      	lsrs	r3, r0, #32
    2782:	1d1c      	adds	r4, r3, #4
    2784:	0009      	movs	r1, r1
    2786:	0400      	lsls	r0, r0, #16
    2788:	1c01      	adds	r1, r0, #0
    278a:	30dc      	adds	r0, #220	; 0xdc
    278c:	0000      	movs	r0, r0
    278e:	0204      	lsls	r4, r0, #8
    2790:	671c      	str	r4, [r3, #112]	; 0x70
    2792:	0002      	movs	r2, r0
    2794:	0400      	lsls	r0, r0, #16
    2796:	1c04      	adds	r4, r0, #0
    2798:	02e7      	lsls	r7, r4, #11
    279a:	0000      	movs	r0, r0
    279c:	0504      	lsls	r4, r0, #20
    279e:	df1c      	svc	28
    27a0:	0017      	movs	r7, r2
    27a2:	0400      	lsls	r0, r0, #16
    27a4:	1c06      	adds	r6, r0, #0
    27a6:	1fbd      	subs	r5, r7, #6
    27a8:	0000      	movs	r0, r0
    27aa:	0704      	lsls	r4, r0, #28
    27ac:	051c      	lsls	r4, r3, #20
    27ae:	002a      	movs	r2, r5
    27b0:	0400      	lsls	r0, r0, #16
    27b2:	1c08      	adds	r0, r1, #0
    27b4:	1d42      	adds	r2, r0, #5
    27b6:	0000      	movs	r0, r0
    27b8:	0105      	lsls	r5, r0, #4
    27ba:	ed1c 0030 	ldc	0, cr0, [ip, #-192]	; 0xffffff40
    27be:	0500      	lsls	r0, r0, #20
    27c0:	1c02      	adds	r2, r0, #0
    27c2:	027a      	lsls	r2, r7, #9
    27c4:	0000      	movs	r0, r0
    27c6:	0405      	lsls	r5, r0, #16
    27c8:	f91c 0002 	ldrsb.w	r0, [ip, r2]
    27cc:	0500      	lsls	r0, r0, #20
    27ce:	1c05      	adds	r5, r0, #0
    27d0:	17f0      	asrs	r0, r6, #31
    27d2:	0000      	movs	r0, r0
    27d4:	0605      	lsls	r5, r0, #24
    27d6:	d01c      	beq.n	0x2812
    27d8:	001f      	movs	r7, r3
    27da:	0500      	lsls	r0, r0, #20
    27dc:	1c07      	adds	r7, r0, #0
    27de:	2a16      	cmp	r2, #22
    27e0:	0000      	movs	r0, r0
    27e2:	0805      	lsrs	r5, r0, #32
    27e4:	641c      	str	r4, [r3, #64]	; 0x40
    27e6:	001d      	movs	r5, r3
    27e8:	0600      	lsls	r0, r0, #24
    27ea:	1c01      	adds	r1, r0, #0
    27ec:	30fe      	adds	r0, #254	; 0xfe
    27ee:	0000      	movs	r0, r0
    27f0:	0206      	lsls	r6, r0, #8
    27f2:	8d1c      	ldrh	r4, [r3, #40]	; 0x28
    27f4:	0002      	movs	r2, r0
    27f6:	0600      	lsls	r0, r0, #24
    27f8:	1c04      	adds	r4, r0, #0
    27fa:	030b      	lsls	r3, r1, #12
    27fc:	0000      	movs	r0, r0
    27fe:	0506      	lsls	r6, r0, #20
    2800:	011c      	lsls	r4, r3, #4
    2802:	0018      	movs	r0, r3
    2804:	0600      	lsls	r0, r0, #24
    2806:	1c06      	adds	r6, r0, #0
    2808:	1fe3      	subs	r3, r4, #7
    280a:	0000      	movs	r0, r0
    280c:	0706      	lsls	r6, r0, #28
    280e:	271c      	movs	r7, #28
    2810:	002a      	movs	r2, r5
    2812:	0600      	lsls	r0, r0, #24
    2814:	1c08      	adds	r0, r1, #0
    2816:	0952      	lsrs	r2, r2, #5
    2818:	0000      	movs	r0, r0
    281a:	0107      	lsls	r7, r0, #4
    281c:	0f1c      	lsrs	r4, r3, #28
    281e:	0031      	movs	r1, r6
    2820:	0700      	lsls	r0, r0, #28
    2822:	1c02      	adds	r2, r0, #0
    2824:	14a4      	asrs	r4, r4, #18
    2826:	0000      	movs	r0, r0
    2828:	0407      	lsls	r7, r0, #16
    282a:	1d1c      	adds	r4, r3, #4
    282c:	0003      	movs	r3, r0
    282e:	0700      	lsls	r0, r0, #28
    2830:	1c05      	adds	r5, r0, #0
    2832:	1812      	adds	r2, r2, r0
    2834:	0000      	movs	r0, r0
    2836:	0607      	lsls	r7, r0, #24
    2838:	f61c 001f 			; <UNDEFINED> instruction: 0xf61c001f
    283c:	0700      	lsls	r0, r0, #28
    283e:	1c07      	adds	r7, r0, #0
    2840:	2a38      	cmp	r2, #56	; 0x38
    2842:	0000      	movs	r0, r0
    2844:	0807      	lsrs	r7, r0, #32
    2846:	051e      	lsls	r6, r3, #20
    2848:	0032      	movs	r2, r6
    284a:	8000      	strh	r0, [r0, #0]
    284c:	8080      	strh	r0, [r0, #4]
    284e:	7880      	ldrb	r0, [r0, #2]
    2850:	1b00      	subs	r0, r0, r4
    2852:	18eb      	adds	r3, r5, r3
    2854:	0000      	movs	r0, r0
    2856:	0107      	lsls	r7, r0, #4
    2858:	002c      	movs	r4, r5
    285a:	0000      	movs	r0, r0
    285c:	e502      	b.n	0x2264
    285e:	f202 0022 	addw	r0, r2, #34	; 0x22
    2862:	1a00      	subs	r0, r0, r0
    2864:	3278      	adds	r2, #120	; 0x78
    2866:	0000      	movs	r0, r0
    2868:	1a00      	subs	r0, r0, r0
    286a:	2ee3      	cmp	r6, #227	; 0xe3
    286c:	0000      	movs	r0, r0
    286e:	1a01      	subs	r1, r0, r0
    2870:	0acd      	lsrs	r5, r1, #11
    2872:	0000      	movs	r0, r0
    2874:	1a02      	subs	r2, r0, r0
    2876:	1408      	asrs	r0, r1, #16
    2878:	0000      	movs	r0, r0
    287a:	1a08      	subs	r0, r1, r0
    287c:	141b      	asrs	r3, r3, #16
    287e:	0000      	movs	r0, r0
    2880:	1a09      	subs	r1, r1, r0
    2882:	142e      	asrs	r6, r5, #16
    2884:	0000      	movs	r0, r0
    2886:	1a0a      	subs	r2, r1, r0
    2888:	1441      	asrs	r1, r0, #17
    288a:	0000      	movs	r0, r0
    288c:	1a0b      	subs	r3, r1, r0
    288e:	1454      	asrs	r4, r2, #17
    2890:	0000      	movs	r0, r0
    2892:	1a0c      	subs	r4, r1, r0
    2894:	2429      	movs	r4, #41	; 0x29
    2896:	0000      	movs	r0, r0
    2898:	1a0d      	subs	r5, r1, r0
    289a:	146c      	asrs	r4, r5, #17
    289c:	0000      	movs	r0, r0
    289e:	1a0e      	subs	r6, r1, r0
    28a0:	147f      	asrs	r7, r7, #17
    28a2:	0000      	movs	r0, r0
    28a4:	1a0f      	subs	r7, r1, r0
    28a6:	2831      	cmp	r0, #49	; 0x31
    28a8:	0000      	movs	r0, r0
    28aa:	1a20      	subs	r0, r4, r0
    28ac:	1f43      	subs	r3, r0, #5
    28ae:	0000      	movs	r0, r0
    28b0:	1a21      	subs	r1, r4, r0
    28b2:	2add      	cmp	r2, #221	; 0xdd
    28b4:	0000      	movs	r0, r0
    28b6:	1a22      	subs	r2, r4, r0
    28b8:	208c      	movs	r0, #140	; 0x8c
    28ba:	0000      	movs	r0, r0
    28bc:	1a23      	subs	r3, r4, r0
    28be:	150e      	asrs	r6, r1, #20
    28c0:	0000      	movs	r0, r0
    28c2:	1a25      	subs	r5, r4, r0
    28c4:	352a      	adds	r5, #42	; 0x2a
    28c6:	0000      	movs	r0, r0
    28c8:	1a26      	subs	r6, r4, r0
    28ca:	0677      	lsls	r7, r6, #25
    28cc:	0000      	movs	r0, r0
    28ce:	1a2b      	subs	r3, r5, r0
    28d0:	2959      	cmp	r1, #89	; 0x59
    28d2:	0000      	movs	r0, r0
    28d4:	1a2d      	subs	r5, r5, r0
    28d6:	0736      	lsls	r6, r6, #28
    28d8:	0000      	movs	r0, r0
    28da:	1a2f      	subs	r7, r5, r0
    28dc:	2de5      	cmp	r5, #229	; 0xe5
    28de:	0000      	movs	r0, r0
    28e0:	0031      	movs	r1, r6
    28e2:	0102      	lsls	r2, r0, #4
    28e4:	1802      	adds	r2, r0, r0
    28e6:	0002      	movs	r2, r0
    28e8:	1f00      	subs	r0, r0, #4
    28ea:	0a40      	lsrs	r0, r0, #9
    28ec:	9227      	str	r2, [sp, #156]	; 0x9c
    28ee:	0023      	movs	r3, r4
    28f0:	2000      	movs	r0, #0
    28f2:	4643      	mov	r3, r8
    28f4:	0047      	lsls	r7, r0, #1
    28f6:	290a      	cmp	r1, #10
    28f8:	00c4      	lsls	r4, r0, #3
    28fa:	0000      	movs	r0, r0
    28fc:	2100      	movs	r1, #0
    28fe:	0b9b      	lsrs	r3, r3, #14
    2900:	0000      	movs	r0, r0
    2902:	2a0a      	cmp	r2, #10
    2904:	00c4      	lsls	r4, r0, #3
    2906:	0000      	movs	r0, r0
    2908:	2104      	movs	r1, #4
    290a:	3238      	adds	r2, #56	; 0x38
    290c:	0000      	movs	r0, r0
    290e:	2c0a      	cmp	r4, #10
    2910:	00c4      	lsls	r4, r0, #3
    2912:	0000      	movs	r0, r0
    2914:	2108      	movs	r1, #8
    2916:	1a79      	subs	r1, r7, r1
    2918:	0000      	movs	r0, r0
    291a:	2e0a      	cmp	r6, #10
    291c:	00c4      	lsls	r4, r0, #3
    291e:	0000      	movs	r0, r0
    2920:	210c      	movs	r1, #12
    2922:	26ad      	movs	r6, #173	; 0xad
    2924:	0000      	movs	r0, r0
    2926:	2f0a      	cmp	r7, #10
    2928:	00e5      	lsls	r5, r4, #3
    292a:	0000      	movs	r0, r0
    292c:	2110      	movs	r1, #16
    292e:	2842      	cmp	r0, #66	; 0x42
    2930:	0000      	movs	r0, r0
    2932:	300a      	adds	r0, #10
    2934:	00e5      	lsls	r5, r4, #3
    2936:	0000      	movs	r0, r0
    2938:	2118      	movs	r1, #24
    293a:	2e04      	cmp	r6, #4
    293c:	0000      	movs	r0, r0
    293e:	310a      	adds	r1, #10
    2940:	00e5      	lsls	r5, r4, #3
    2942:	0000      	movs	r0, r0
    2944:	2120      	movs	r1, #32
    2946:	1d3b      	adds	r3, r7, #4
    2948:	0000      	movs	r0, r0
    294a:	320a      	adds	r2, #10
    294c:	00c4      	lsls	r4, r0, #3
    294e:	0000      	movs	r0, r0
    2950:	2128      	movs	r1, #40	; 0x28
    2952:	14e5      	asrs	r5, r4, #19
    2954:	0000      	movs	r0, r0
    2956:	340a      	adds	r4, #10
    2958:	00c4      	lsls	r4, r0, #3
    295a:	0000      	movs	r0, r0
    295c:	212c      	movs	r1, #44	; 0x2c
    295e:	21f0      	movs	r1, #240	; 0xf0
    2960:	0000      	movs	r0, r0
    2962:	350a      	adds	r5, #10
    2964:	00c4      	lsls	r4, r0, #3
    2966:	0000      	movs	r0, r0
    2968:	2130      	movs	r1, #48	; 0x30
    296a:	11df      	asrs	r7, r3, #7
    296c:	0000      	movs	r0, r0
    296e:	360a      	adds	r6, #10
    2970:	00c4      	lsls	r4, r0, #3
    2972:	0000      	movs	r0, r0
    2974:	2134      	movs	r1, #52	; 0x34
    2976:	1220      	asrs	r0, r4, #8
    2978:	0000      	movs	r0, r0
    297a:	370a      	adds	r7, #10
    297c:	00c4      	lsls	r4, r0, #3
    297e:	0000      	movs	r0, r0
    2980:	0038      	movs	r0, r7
    2982:	d30a      	bcc.n	0x299a
    2984:	0029      	movs	r1, r5
    2986:	0a00      	lsrs	r0, r0, #8
    2988:	f939 0022 	ldrsh.w	r0, [r9, r2, lsl #2]
    298c:	1900      	adds	r0, r0, r4
    298e:	0c8e      	lsrs	r6, r1, #18
    2990:	0000      	movs	r0, r0
    2992:	0407      	lsls	r7, r0, #16
    2994:	0041      	lsls	r1, r0, #1
    2996:	0000      	movs	r0, r0
    2998:	6a0a      	ldr	r2, [r1, #32]
    299a:	2471      	movs	r4, #113	; 0x71
    299c:	0000      	movs	r0, r0
    299e:	1d1a      	adds	r2, r3, #4
    29a0:	000b      	movs	r3, r1
    29a2:	0100      	lsls	r0, r0, #4
    29a4:	b01a      	add	sp, #104	; 0x68
    29a6:	002a      	movs	r2, r5
    29a8:	0200      	lsls	r0, r0, #8
    29aa:	9d1a      	ldr	r5, [sp, #104]	; 0x68
    29ac:	0038      	movs	r0, r7
    29ae:	0400      	lsls	r0, r0, #16
    29b0:	e21a      	b.n	0x2de8
    29b2:	0028      	movs	r0, r5
    29b4:	0800      	lsrs	r0, r0, #32
    29b6:	ac1a      	add	r4, sp, #104	; 0x68
    29b8:	0022      	movs	r2, r4
    29ba:	1000      	asrs	r0, r0, #32
    29bc:	b01a      	add	sp, #104	; 0x68
    29be:	0015      	movs	r5, r2
    29c0:	2000      	movs	r0, #0
    29c2:	1d1a      	adds	r2, r3, #4
    29c4:	001f      	movs	r7, r3
    29c6:	4000      	ands	r0, r0
    29c8:	f91a 0004 	ldrsb.w	r0, [sl, r4]
    29cc:	8000      	strh	r0, [r0, #0]
    29ce:	0e1c      	lsrs	r4, r3, #24
    29d0:	0005      	movs	r5, r0
    29d2:	0000      	movs	r0, r0
    29d4:	1c01      	adds	r1, r0, #0
    29d6:	362b      	adds	r6, #43	; 0x2b
    29d8:	0000      	movs	r0, r0
    29da:	0200      	lsls	r0, r0, #8
    29dc:	3d1c      	subs	r5, #28
    29de:	0036      	movs	r6, r6
    29e0:	0000      	movs	r0, r0
    29e2:	1c04      	adds	r4, r0, #0
    29e4:	2d60      	cmp	r5, #96	; 0x60
    29e6:	0000      	movs	r0, r0
    29e8:	0800      	lsrs	r0, r0, #32
    29ea:	e51c      	b.n	0x2426
    29ec:	001c      	movs	r4, r3
    29ee:	0000      	movs	r0, r0
    29f0:	1c10      	adds	r0, r2, #0
    29f2:	38f3      	subs	r0, #243	; 0xf3
    29f4:	0000      	movs	r0, r0
    29f6:	2000      	movs	r0, #0
    29f8:	b81c      			; <UNDEFINED> instruction: 0xb81c
    29fa:	0017      	movs	r7, r2
    29fc:	0000      	movs	r0, r0
    29fe:	1c40      	adds	r0, r0, #1
    2a00:	33bb      	adds	r3, #187	; 0xbb
    2a02:	0000      	movs	r0, r0
    2a04:	8000      	strh	r0, [r0, #0]
    2a06:	ee1d 002c 	cdp	0, 1, cr0, cr13, cr12, {1}
    2a0a:	0000      	movs	r0, r0
    2a0c:	0100      	lsls	r0, r0, #4
    2a0e:	1d00      	adds	r0, r0, #4
    2a10:	19e6      	adds	r6, r4, r7
    2a12:	0000      	movs	r0, r0
    2a14:	0000      	movs	r0, r0
    2a16:	0002      	movs	r2, r0
    2a18:	941d      	str	r4, [sp, #116]	; 0x74
    2a1a:	001f      	movs	r7, r3
    2a1c:	0000      	movs	r0, r0
    2a1e:	0400      	lsls	r0, r0, #16
    2a20:	1d00      	adds	r0, r0, #4
    2a22:	0ab7      	lsrs	r7, r6, #10
    2a24:	0000      	movs	r0, r0
    2a26:	0000      	movs	r0, r0
    2a28:	0008      	movs	r0, r1
    2a2a:	361d      	adds	r6, #29
    2a2c:	0019      	movs	r1, r3
    2a2e:	0000      	movs	r0, r0
    2a30:	1000      	asrs	r0, r0, #32
    2a32:	1d00      	adds	r0, r0, #4
    2a34:	0d32      	lsrs	r2, r6, #20
    2a36:	0000      	movs	r0, r0
    2a38:	0000      	movs	r0, r0
    2a3a:	0020      	movs	r0, r4
    2a3c:	9c1d      	ldr	r4, [sp, #116]	; 0x74
    2a3e:	0026      	movs	r6, r4
    2a40:	0000      	movs	r0, r0
    2a42:	4000      	ands	r0, r0
    2a44:	1d00      	adds	r0, r0, #4
    2a46:	333b      	adds	r3, #59	; 0x3b
    2a48:	0000      	movs	r0, r0
    2a4a:	0000      	movs	r0, r0
    2a4c:	0080      	lsls	r0, r0, #2
    2a4e:	6e1d      	ldr	r5, [r3, #96]	; 0x60
    2a50:	002a      	movs	r2, r5
    2a52:	0000      	movs	r0, r0
    2a54:	0000      	movs	r0, r0
    2a56:	1d01      	adds	r1, r0, #4
    2a58:	1c81      	adds	r1, r0, #2
    2a5a:	0000      	movs	r0, r0
    2a5c:	0000      	movs	r0, r0
    2a5e:	8000      	strh	r0, [r0, #0]
    2a60:	1900      	adds	r0, r0, r4
    2a62:	153a      	asrs	r2, r7, #20
    2a64:	0000      	movs	r0, r0
    2a66:	0107      	lsls	r7, r0, #4
    2a68:	002c      	movs	r4, r5
    2a6a:	0000      	movs	r0, r0
    2a6c:	f50a 253d 	add.w	r5, sl, #774144	; 0xbd000
    2a70:	0000      	movs	r0, r0
    2a72:	811a      	strh	r2, [r3, #8]
    2a74:	002f      	movs	r7, r5
    2a76:	0100      	lsls	r0, r0, #4
    2a78:	ce1a      	ldmia	r6!, {r1, r3, r4}
    2a7a:	0031      	movs	r1, r6
    2a7c:	0200      	lsls	r0, r0, #8
    2a7e:	9d1a      	ldr	r5, [sp, #104]	; 0x68
    2a80:	0033      	movs	r3, r6
    2a82:	0300      	lsls	r0, r0, #12
    2a84:	e51a      	b.n	0x24bc
    2a86:	0012      	movs	r2, r2
    2a88:	0400      	lsls	r0, r0, #16
    2a8a:	531a      	strh	r2, [r3, r4]
    2a8c:	0034      	movs	r4, r6
    2a8e:	0500      	lsls	r0, r0, #20
    2a90:	551a      	strb	r2, [r3, r4]
    2a92:	0015      	movs	r5, r2
    2a94:	0600      	lsls	r0, r0, #24
    2a96:	051a      	lsls	r2, r3, #20
    2a98:	0039      	movs	r1, r7
    2a9a:	0700      	lsls	r0, r0, #28
    2a9c:	e61a      	b.n	0x26d4
    2a9e:	0001      	movs	r1, r0
    2aa0:	0800      	lsrs	r0, r0, #32
    2aa2:	8a1a      	ldrh	r2, [r3, #16]
    2aa4:	0000      	movs	r0, r0
    2aa6:	0900      	lsrs	r0, r0, #4
    2aa8:	181a      	adds	r2, r3, r0
    2aaa:	0027      	movs	r7, r4
    2aac:	0a00      	lsrs	r0, r0, #8
    2aae:	f71a 0028 			; <UNDEFINED> instruction: 0xf71a0028
    2ab2:	0b00      	lsrs	r0, r0, #12
    2ab4:	891a      	ldrh	r2, [r3, #8]
    2ab6:	0009      	movs	r1, r1
    2ab8:	0c00      	lsrs	r0, r0, #16
    2aba:	741a      	strb	r2, [r3, #16]
    2abc:	0036      	movs	r6, r6
    2abe:	0d00      	lsrs	r0, r0, #20
    2ac0:	f91a 001a 	ldrsb.w	r0, [sl, sl, lsl #1]
    2ac4:	0e00      	lsrs	r0, r0, #24
    2ac6:	881a      	ldrh	r2, [r3, #0]
    2ac8:	001b      	movs	r3, r3
    2aca:	0f00      	lsrs	r0, r0, #28
    2acc:	291a      	cmp	r1, #26
    2ace:	001c      	movs	r4, r3
    2ad0:	1000      	asrs	r0, r0, #32
    2ad2:	bb1a      	cbnz	r2, 0x2b1c
    2ad4:	001c      	movs	r4, r3
    2ad6:	1100      	asrs	r0, r0, #4
    2ad8:	b61a      			; <UNDEFINED> instruction: 0xb61a
    2ada:	001d      	movs	r5, r3
    2adc:	1200      	asrs	r0, r0, #8
    2ade:	a51a      	add	r5, pc, #104	; (adr r5, 0x2b48)
    2ae0:	001e      	movs	r6, r3
    2ae2:	1300      	asrs	r0, r0, #12
    2ae4:	d51a      	bpl.n	0x2b1c
    2ae6:	0035      	movs	r5, r6
    2ae8:	1400      	asrs	r0, r0, #16
    2aea:	6e1a      	ldr	r2, [r3, #96]	; 0x60
    2aec:	0038      	movs	r0, r7
    2aee:	1500      	asrs	r0, r0, #20
    2af0:	161a      	asrs	r2, r3, #24
    2af2:	0022      	movs	r2, r4
    2af4:	1600      	asrs	r0, r0, #24
    2af6:	bf1a      	itte	ne
    2af8:	0022      	movne	r2, r4
    2afa:	1700      	asrne	r0, r0, #28
    2afc:	661a      	streq	r2, [r3, #96]	; 0x60
    2afe:	0015      	movs	r5, r2
    2b00:	1800      	adds	r0, r0, r0
    2b02:	521a      	strh	r2, [r3, r0]
    2b04:	0038      	movs	r0, r7
    2b06:	1900      	adds	r0, r0, r4
    2b08:	f91a 0021 	ldrsb.w	r0, [sl, r1, lsl #2]
    2b0c:	1a00      	subs	r0, r0, r0
    2b0e:	a11a      	add	r1, pc, #104	; (adr r1, 0x2b78)
    2b10:	0022      	movs	r2, r4
    2b12:	1b00      	subs	r0, r0, r4
    2b14:	701a      	strb	r2, [r3, #0]
    2b16:	0023      	movs	r3, r4
    2b18:	1c00      	adds	r0, r0, #0
    2b1a:	161a      	asrs	r2, r3, #24
    2b1c:	0025      	movs	r5, r4
    2b1e:	1d00      	adds	r0, r0, #4
    2b20:	0b1a      	lsrs	r2, r3, #12
    2b22:	0025      	movs	r5, r4
    2b24:	1e00      	subs	r0, r0, #0
    2b26:	7c1a      	ldrb	r2, [r3, #16]
    2b28:	0028      	movs	r0, r5
    2b2a:	1f00      	subs	r0, r0, #4
    2b2c:	1b00      	subs	r0, r0, r4
    2b2e:	2d76      	cmp	r5, #118	; 0x76
    2b30:	0000      	movs	r0, r0
    2b32:	0107      	lsls	r7, r0, #4
    2b34:	002c      	movs	r4, r5
    2b36:	0000      	movs	r0, r0
    2b38:	1c0a      	adds	r2, r1, #0
    2b3a:	8001      	strh	r1, [r0, #0]
    2b3c:	0025      	movs	r5, r4
    2b3e:	1a00      	subs	r0, r0, r0
    2b40:	3910      	subs	r1, #16
    2b42:	0000      	movs	r0, r0
    2b44:	1a00      	subs	r0, r0, r0
    2b46:	0206      	lsls	r6, r0, #8
    2b48:	0000      	movs	r0, r0
    2b4a:	1a01      	subs	r1, r0, r0
    2b4c:	04e7      	lsls	r7, r4, #19
    2b4e:	0000      	movs	r0, r0
    2b50:	1a02      	subs	r2, r0, r0
    2b52:	0724      	lsls	r4, r4, #28
    2b54:	0000      	movs	r0, r0
    2b56:	1a03      	subs	r3, r0, r0
    2b58:	1a1d      	subs	r5, r3, r0
    2b5a:	0000      	movs	r0, r0
    2b5c:	1a04      	subs	r4, r0, r0
    2b5e:	1baa      	subs	r2, r5, r6
    2b60:	0000      	movs	r0, r0
    2b62:	1a05      	subs	r5, r0, r0
    2b64:	2ed1      	cmp	r6, #209	; 0xd1
    2b66:	0000      	movs	r0, r0
    2b68:	1a06      	subs	r6, r0, r0
    2b6a:	2033      	movs	r0, #51	; 0x33
    2b6c:	0000      	movs	r0, r0
    2b6e:	0007      	movs	r7, r0
    2b70:	7b1b      	ldrb	r3, [r3, #12]
    2b72:	0023      	movs	r3, r4
    2b74:	0700      	lsls	r0, r0, #28
    2b76:	2c01      	cmp	r4, #1
    2b78:	0000      	movs	r0, r0
    2b7a:	0a00      	lsrs	r0, r0, #8
    2b7c:	012b      	lsls	r3, r5, #4
    2b7e:	25d5      	movs	r5, #213	; 0xd5
    2b80:	0000      	movs	r0, r0
    2b82:	de1a      	udf	#26
    2b84:	0031      	movs	r1, r6
    2b86:	0000      	movs	r0, r0
    2b88:	2e1a      	cmp	r6, #26
    2b8a:	0033      	movs	r3, r6
    2b8c:	0100      	lsls	r0, r0, #4
    2b8e:	031a      	lsls	r2, r3, #12
    2b90:	001d      	movs	r5, r3
    2b92:	0200      	lsls	r0, r0, #8
    2b94:	401a      	ands	r2, r3
    2b96:	0010      	movs	r0, r2
    2b98:	0300      	lsls	r0, r0, #12
    2b9a:	9c1a      	ldr	r4, [sp, #104]	; 0x68
    2b9c:	0012      	movs	r2, r2
    2b9e:	0400      	lsls	r0, r0, #16
    2ba0:	011a      	lsls	r2, r3, #4
    2ba2:	0015      	movs	r5, r2
    2ba4:	0500      	lsls	r0, r0, #20
    2ba6:	241a      	movs	r4, #26
    2ba8:	0013      	movs	r3, r2
    2baa:	0600      	lsls	r0, r0, #24
    2bac:	f31a 0015 			; <UNDEFINED> instruction: 0xf31a0015
    2bb0:	0700      	lsls	r0, r0, #28
    2bb2:	381a      	subs	r0, #26
    2bb4:	0018      	movs	r0, r3
    2bb6:	0800      	lsrs	r0, r0, #32
    2bb8:	6d1a      	ldr	r2, [r3, #80]	; 0x50
    2bba:	0019      	movs	r1, r3
    2bbc:	0900      	lsrs	r0, r0, #4
    2bbe:	921a      	str	r2, [sp, #104]	; 0x68
    2bc0:	0018      	movs	r0, r3
    2bc2:	0a00      	lsrs	r0, r0, #8
    2bc4:	2200      	movs	r2, #0
    2bc6:	2a85      	cmp	r2, #133	; 0x85
    2bc8:	0000      	movs	r0, r0
    2bca:	0a08      	lsrs	r0, r1, #8
    2bcc:	01bc      	lsls	r4, r7, #6
    2bce:	25fd      	movs	r5, #253	; 0xfd
    2bd0:	0000      	movs	r0, r0
    2bd2:	6e0e      	ldr	r6, [r1, #96]	; 0x60
    2bd4:	0003      	movs	r3, r0
    2bd6:	0a00      	lsrs	r0, r0, #8
    2bd8:	01be      	lsls	r6, r7, #6
    2bda:	0071      	lsls	r1, r6, #1
    2bdc:	0000      	movs	r0, r0
    2bde:	0e00      	lsrs	r0, r0, #24
    2be0:	0761      	lsls	r1, r4, #29
    2be2:	0000      	movs	r0, r0
    2be4:	bf0a      	itet	eq
    2be6:	0e01      	lsreq	r1, r0, #24
    2be8:	0026      	movne	r6, r4
    2bea:	0400      	lsleq	r0, r0, #16
    2bec:	2300      	movs	r3, #0
    2bee:	2608      	movs	r6, #8
    2bf0:	0000      	movs	r0, r0
    2bf2:	0824      	lsrs	r4, r4, #32
    2bf4:	0026      	movs	r6, r4
    2bf6:	0000      	movs	r0, r0
    2bf8:	0408      	lsls	r0, r1, #16
    2bfa:	2392      	movs	r3, #146	; 0x92
    2bfc:	0000      	movs	r0, r0
    2bfe:	0408      	lsls	r0, r1, #16
    2c00:	25fd      	movs	r5, #253	; 0xfd
    2c02:	0000      	movs	r0, r0
    2c04:	2313      	movs	r3, #19
    2c06:	002d      	movs	r5, r5
    2c08:	0a00      	lsrs	r0, r0, #8
    2c0a:	01c0      	lsls	r0, r0, #7
    2c0c:	25d5      	movs	r5, #213	; 0xd5
    2c0e:	0000      	movs	r0, r0
    2c10:	5025      	str	r5, [r4, r0]
    2c12:	0007      	movs	r7, r0
    2c14:	0100      	lsls	r0, r0, #4
    2c16:	2b14      	cmp	r3, #20
    2c18:	0026      	movs	r6, r4
    2c1a:	0800      	lsrs	r0, r0, #32
    2c1c:	1404      	asrs	r4, r0, #16
    2c1e:	0026      	movs	r6, r4
    2c20:	2600      	movs	r6, #0
    2c22:	2310      	movs	r3, #16
    2c24:	0000      	movs	r0, r0
    2c26:	6a01      	ldr	r1, [r0, #32]
    2c28:	0003      	movs	r3, r0
    2c2a:	0000      	movs	r0, r0
    2c2c:	2000      	movs	r0, #0
    2c2e:	0000      	movs	r0, r0
    2c30:	0100      	lsls	r0, r0, #4
    2c32:	949c      	str	r4, [sp, #624]	; 0x270
    2c34:	0026      	movs	r6, r4
    2c36:	2700      	movs	r7, #0
    2c38:	6d61      	ldr	r1, [r4, #84]	; 0x54
    2c3a:	0070      	lsls	r0, r6, #1
    2c3c:	6a01      	ldr	r1, [r0, #32]
    2c3e:	b903      	cbnz	r3, 0x2c42
    2c40:	0000      	movs	r0, r0
    2c42:	0000      	movs	r0, r0
    2c44:	0000      	movs	r0, r0
    2c46:	2700      	movs	r7, #0
    2c48:	6d67      	ldr	r7, [r4, #84]	; 0x54
    2c4a:	0100      	lsls	r0, r0, #4
    2c4c:	036a      	lsls	r2, r5, #13
    2c4e:	00b9      	lsls	r1, r7, #2
    2c50:	0000      	movs	r0, r0
    2c52:	0021      	movs	r1, r4
    2c54:	0000      	movs	r0, r0
    2c56:	9728      	str	r7, [sp, #160]	; 0xa0
    2c58:	000e      	movs	r6, r1
    2c5a:	0100      	lsls	r0, r0, #4
    2c5c:	036c      	lsls	r4, r5, #13
    2c5e:	00b9      	lsls	r1, r7, #2
    2c60:	0000      	movs	r0, r0
    2c62:	0042      	lsls	r2, r0, #1
    2c64:	0000      	movs	r0, r0
    2c66:	8329      	strh	r1, [r5, #24]
    2c68:	002d      	movs	r5, r5
    2c6a:	0100      	lsls	r0, r0, #4
    2c6c:	036d      	lsls	r5, r5, #13
    2c6e:	00ce      	lsls	r6, r1, #3
    2c70:	0000      	movs	r0, r0
    2c72:	28ee      	cmp	r0, #238	; 0xee
    2c74:	2950      	cmp	r1, #80	; 0x50
    2c76:	0000      	movs	r0, r0
    2c78:	6e01      	ldr	r1, [r0, #96]	; 0x60
    2c7a:	ce03      	ldmia	r6!, {r0, r1}
    2c7c:	0000      	movs	r0, r0
    2c7e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    2c80:	0000      	movs	r0, r0
    2c82:	0000      	movs	r0, r0
    2c84:	3d26      	subs	r5, #38	; 0x26
    2c86:	0026      	movs	r6, r4
    2c88:	0100      	lsls	r0, r0, #4
    2c8a:	0346      	lsls	r6, r0, #13
    2c8c:	0000      	movs	r0, r0
    2c8e:	0000      	movs	r0, r0
    2c90:	0030      	movs	r0, r6
    2c92:	0000      	movs	r0, r0
    2c94:	9c01      	ldr	r4, [sp, #4]
    2c96:	26d7      	movs	r6, #215	; 0xd7
    2c98:	0000      	movs	r0, r0
    2c9a:	9728      	str	r7, [sp, #160]	; 0xa0
    2c9c:	000e      	movs	r6, r1
    2c9e:	0100      	lsls	r0, r0, #4
    2ca0:	0348      	lsls	r0, r1, #13
    2ca2:	00b9      	lsls	r1, r7, #2
    2ca4:	0000      	movs	r0, r0
    2ca6:	00c1      	lsls	r1, r0, #3
    2ca8:	0000      	movs	r0, r0
    2caa:	832a      	strh	r2, [r5, #24]
    2cac:	002d      	movs	r5, r5
    2cae:	0100      	lsls	r0, r0, #4
    2cb0:	0349      	lsls	r1, r1, #13
    2cb2:	00ce      	lsls	r6, r1, #3
    2cb4:	0000      	movs	r0, r0
    2cb6:	03f8      	lsls	r0, r7, #15
    2cb8:	502a      	str	r2, [r5, r0]
    2cba:	0029      	movs	r1, r5
    2cbc:	0100      	lsls	r0, r0, #4
    2cbe:	034d      	lsls	r5, r1, #13
    2cc0:	00ce      	lsls	r6, r1, #3
    2cc2:	0000      	movs	r0, r0
    2cc4:	01a8      	lsls	r0, r5, #6
    2cc6:	2600      	movs	r6, #0
    2cc8:	02ad      	lsls	r5, r5, #10
    2cca:	0000      	movs	r0, r0
    2ccc:	1101      	asrs	r1, r0, #4
    2cce:	0003      	movs	r3, r0
    2cd0:	0000      	movs	r0, r0
    2cd2:	1400      	asrs	r0, r0, #16
    2cd4:	0000      	movs	r0, r0
    2cd6:	0100      	lsls	r0, r0, #4
    2cd8:	e29c      	b.n	0x3214
    2cda:	0027      	movs	r7, r4
    2cdc:	2b00      	cmp	r3, #0
    2cde:	2653      	movs	r6, #83	; 0x53
    2ce0:	0000      	movs	r0, r0
    2ce2:	1101      	asrs	r1, r0, #4
    2ce4:	a903      	add	r1, sp, #12
    2ce6:	0000      	movs	r0, r0
    2ce8:	0100      	lsls	r0, r0, #4
    2cea:	2b50      	cmp	r3, #80	; 0x50
    2cec:	1eb0      	subs	r0, r6, #2
    2cee:	0000      	movs	r0, r0
    2cf0:	1101      	asrs	r1, r0, #4
    2cf2:	a903      	add	r1, sp, #12
    2cf4:	0000      	movs	r0, r0
    2cf6:	0100      	lsls	r0, r0, #4
    2cf8:	2c51      	cmp	r4, #81	; 0x51
    2cfa:	06b9      	lsls	r1, r7, #26
    2cfc:	0000      	movs	r0, r0
    2cfe:	1101      	asrs	r1, r0, #4
    2d00:	a903      	add	r1, sp, #12
    2d02:	0000      	movs	r0, r0
    2d04:	d400      	bmi.n	0x2d08
    2d06:	0000      	movs	r0, r0
    2d08:	2d00      	cmp	r5, #0
    2d0a:	1f66      	subs	r6, r4, #5
    2d0c:	0000      	movs	r0, r0
    2d0e:	1301      	asrs	r1, r0, #12
    2d10:	b903      	cbnz	r3, 0x2d14
    2d12:	0000      	movs	r0, r0
    2d14:	0500      	lsls	r0, r0, #20
    2d16:	cc0c      	ldmia	r4!, {r2, r3}
    2d18:	09fc      	lsrs	r4, r7, #7
    2d1a:	2e00      	cmp	r6, #0
    2d1c:	0456      	lsls	r6, r2, #17
    2d1e:	0000      	movs	r0, r0
    2d20:	1401      	asrs	r1, r0, #16
    2d22:	8b03      	ldrh	r3, [r0, #24]
    2d24:	0000      	movs	r0, r0
    2d26:	2e00      	cmp	r6, #0
    2d28:	10f4      	asrs	r4, r6, #3
    2d2a:	0000      	movs	r0, r0
    2d2c:	1401      	asrs	r1, r0, #16
    2d2e:	8b03      	ldrh	r3, [r0, #24]
    2d30:	0000      	movs	r0, r0
    2d32:	2e00      	cmp	r6, #0
    2d34:	32a2      	adds	r2, #162	; 0xa2
    2d36:	0000      	movs	r0, r0
    2d38:	1401      	asrs	r1, r0, #16
    2d3a:	8b03      	ldrh	r3, [r0, #24]
    2d3c:	0000      	movs	r0, r0
    2d3e:	2e00      	cmp	r6, #0
    2d40:	049f      	lsls	r7, r3, #18
    2d42:	0000      	movs	r0, r0
    2d44:	1401      	asrs	r1, r0, #16
    2d46:	8b03      	ldrh	r3, [r0, #24]
    2d48:	0000      	movs	r0, r0
    2d4a:	2900      	cmp	r1, #0
    2d4c:	16a9      	asrs	r1, r5, #26
    2d4e:	0000      	movs	r0, r0
    2d50:	1501      	asrs	r1, r0, #20
    2d52:	a903      	add	r1, sp, #12
    2d54:	0000      	movs	r0, r0
    2d56:	1000      	asrs	r0, r0, #32
    2d58:	8b29      	ldrh	r1, [r5, #24]
    2d5a:	0011      	movs	r1, r2
    2d5c:	0100      	lsls	r0, r0, #4
    2d5e:	0315      	lsls	r5, r2, #12
    2d60:	00a9      	lsls	r1, r5, #2
    2d62:	0000      	movs	r0, r0
    2d64:	290c      	cmp	r1, #12
    2d66:	1662      	asrs	r2, r4, #25
    2d68:	0000      	movs	r0, r0
    2d6a:	1501      	asrs	r1, r0, #20
    2d6c:	a903      	add	r1, sp, #12
    2d6e:	0000      	movs	r0, r0
    2d70:	1000      	asrs	r0, r0, #32
    2d72:	bc29      	pop	{r0, r3, r5}
    2d74:	0034      	movs	r4, r6
    2d76:	0100      	lsls	r0, r0, #4
    2d78:	0315      	lsls	r5, r2, #12
    2d7a:	00a9      	lsls	r1, r5, #2
    2d7c:	0000      	movs	r0, r0
    2d7e:	280b      	cmp	r0, #11
    2d80:	09bc      	lsrs	r4, r7, #6
    2d82:	0000      	movs	r0, r0
    2d84:	1601      	asrs	r1, r0, #24
    2d86:	a903      	add	r1, sp, #12
    2d88:	0000      	movs	r0, r0
    2d8a:	f500 0000 	add.w	r0, r0, #8388608	; 0x800000
    2d8e:	2d00      	cmp	r5, #0
    2d90:	0b52      	lsrs	r2, r2, #13
    2d92:	0000      	movs	r0, r0
    2d94:	1601      	asrs	r1, r0, #24
    2d96:	a903      	add	r1, sp, #12
    2d98:	0000      	movs	r0, r0
    2d9a:	0b00      	lsrs	r0, r0, #12
    2d9c:	0070      	lsls	r0, r6, #1
    2d9e:	2431      	movs	r4, #49	; 0x31
    2da0:	0071      	lsls	r1, r6, #1
    2da2:	081c      	lsrs	r4, r3, #32
    2da4:	1c29      	adds	r1, r5, #0
    2da6:	299f      	cmp	r1, #159	; 0x9f
    2da8:	302c      	adds	r0, #44	; 0x2c
    2daa:	0000      	movs	r0, r0
    2dac:	1701      	asrs	r1, r0, #28
    2dae:	8b03      	ldrh	r3, [r0, #24]
    2db0:	0000      	movs	r0, r0
    2db2:	0000      	movs	r0, r0
    2db4:	0b29      	lsrs	r1, r5, #12
    2db6:	002f      	movs	r7, r5
    2db8:	0100      	lsls	r0, r0, #4
    2dba:	0317      	lsls	r7, r2, #12
    2dbc:	008b      	lsls	r3, r1, #2
    2dbe:	0000      	movs	r0, r0
    2dc0:	2800      	cmp	r0, #0
    2dc2:	2179      	movs	r1, #121	; 0x79
    2dc4:	0000      	movs	r0, r0
    2dc6:	1801      	adds	r1, r0, r0
    2dc8:	b903      	cbnz	r3, 0x2dcc
    2dca:	0000      	movs	r0, r0
    2dcc:	2800      	cmp	r0, #0
    2dce:	0001      	movs	r1, r0
    2dd0:	0000      	movs	r0, r0
    2dd2:	5d26      	ldrb	r6, [r4, r4]
    2dd4:	0021      	movs	r1, r4
    2dd6:	0100      	lsls	r0, r0, #4
    2dd8:	02d5      	lsls	r5, r2, #11
    2dda:	0000      	movs	r0, r0
    2ddc:	0000      	movs	r0, r0
    2dde:	0024      	movs	r4, r4
    2de0:	0000      	movs	r0, r0
    2de2:	9c01      	ldr	r4, [sp, #4]
    2de4:	290d      	cmp	r1, #13
    2de6:	0000      	movs	r0, r0
    2de8:	3d2b      	subs	r5, #43	; 0x2b
    2dea:	0016      	movs	r6, r2
    2dec:	0100      	lsls	r0, r0, #4
    2dee:	02d5      	lsls	r5, r2, #11
    2df0:	00a9      	lsls	r1, r5, #2
    2df2:	0000      	movs	r0, r0
    2df4:	5001      	str	r1, [r0, r0]
    2df6:	542c      	strb	r4, [r5, r0]
    2df8:	0035      	movs	r5, r6
    2dfa:	0100      	lsls	r0, r0, #4
    2dfc:	02d5      	lsls	r5, r2, #11
    2dfe:	00a9      	lsls	r1, r5, #2
    2e00:	0000      	movs	r0, r0
    2e02:	0146      	lsls	r6, r0, #5
    2e04:	0000      	movs	r0, r0
    2e06:	c62c      	stmia	r6!, {r2, r3, r5}
    2e08:	001c      	movs	r4, r3
    2e0a:	0100      	lsls	r0, r0, #4
    2e0c:	02d5      	lsls	r5, r2, #11
    2e0e:	00a9      	lsls	r1, r5, #2
    2e10:	0000      	movs	r0, r0
    2e12:	0167      	lsls	r7, r4, #5
    2e14:	0000      	movs	r0, r0
    2e16:	662d      	str	r5, [r5, #96]	; 0x60
    2e18:	001f      	movs	r7, r3
    2e1a:	0100      	lsls	r0, r0, #4
    2e1c:	02d7      	lsls	r7, r2, #11
    2e1e:	00b9      	lsls	r1, r7, #2
    2e20:	0000      	movs	r0, r0
    2e22:	0c05      	lsrs	r5, r0, #16
    2e24:	fcc8 0009 	stc2l	0, cr0, [r8], {9}
    2e28:	562e      	ldrsb	r6, [r5, r0]
    2e2a:	0004      	movs	r4, r0
    2e2c:	0100      	lsls	r0, r0, #4
    2e2e:	02d8      	lsls	r0, r3, #11
    2e30:	008b      	lsls	r3, r1, #2
    2e32:	0000      	movs	r0, r0
    2e34:	f42e 0010 	bic.w	r0, lr, #9437184	; 0x900000
    2e38:	0100      	lsls	r0, r0, #4
    2e3a:	02d8      	lsls	r0, r3, #11
    2e3c:	008b      	lsls	r3, r1, #2
    2e3e:	0000      	movs	r0, r0
    2e40:	a22e      	add	r2, pc, #184	; (adr r2, 0x2efc)
    2e42:	0032      	movs	r2, r6
    2e44:	0100      	lsls	r0, r0, #4
    2e46:	02d8      	lsls	r0, r3, #11
    2e48:	008b      	lsls	r3, r1, #2
    2e4a:	0000      	movs	r0, r0
    2e4c:	9f2e      	ldr	r7, [sp, #184]	; 0xb8
    2e4e:	0004      	movs	r4, r0
    2e50:	0100      	lsls	r0, r0, #4
    2e52:	02d8      	lsls	r0, r3, #11
    2e54:	008b      	lsls	r3, r1, #2
    2e56:	0000      	movs	r0, r0
    2e58:	0f29      	lsrs	r1, r5, #28
    2e5a:	0019      	movs	r1, r3
    2e5c:	0100      	lsls	r0, r0, #4
    2e5e:	02d8      	lsls	r0, r3, #11
    2e60:	008b      	lsls	r3, r1, #2
    2e62:	0000      	movs	r0, r0
    2e64:	2900      	cmp	r1, #0
    2e66:	16a9      	asrs	r1, r5, #26
    2e68:	0000      	movs	r0, r0
    2e6a:	d901      	bls.n	0x2e70
    2e6c:	a902      	add	r1, sp, #8
    2e6e:	0000      	movs	r0, r0
    2e70:	1400      	asrs	r0, r0, #16
    2e72:	8b2f      	ldrh	r7, [r5, #24]
    2e74:	0011      	movs	r1, r2
    2e76:	0100      	lsls	r0, r0, #4
    2e78:	02d9      	lsls	r1, r3, #11
    2e7a:	00a9      	lsls	r1, r5, #2
    2e7c:	0000      	movs	r0, r0
    2e7e:	2977      	cmp	r1, #119	; 0x77
    2e80:	1662      	asrs	r2, r4, #25
    2e82:	0000      	movs	r0, r0
    2e84:	d901      	bls.n	0x2e8a
    2e86:	a902      	add	r1, sp, #8
    2e88:	0000      	movs	r0, r0
    2e8a:	1400      	asrs	r0, r0, #16
    2e8c:	bc2f      	pop	{r0, r1, r2, r3, r5}
    2e8e:	0034      	movs	r4, r6
    2e90:	0100      	lsls	r0, r0, #4
    2e92:	02d9      	lsls	r1, r3, #11
    2e94:	00a9      	lsls	r1, r5, #2
    2e96:	0000      	movs	r0, r0
    2e98:	2d73      	cmp	r5, #115	; 0x73
    2e9a:	09bc      	lsrs	r4, r7, #6
    2e9c:	0000      	movs	r0, r0
    2e9e:	da01      	bge.n	0x2ea4
    2ea0:	a902      	add	r1, sp, #8
    2ea2:	0000      	movs	r0, r0
    2ea4:	0b00      	lsrs	r0, r0, #12
    2ea6:	0070      	lsls	r0, r6, #1
    2ea8:	2431      	movs	r4, #49	; 0x31
    2eaa:	01f3      	lsls	r3, r6, #7
    2eac:	1c52      	adds	r2, r2, #1
    2eae:	1823      	adds	r3, r4, r0
    2eb0:	2d9f      	cmp	r5, #159	; 0x9f
    2eb2:	0b52      	lsrs	r2, r2, #13
    2eb4:	0000      	movs	r0, r0
    2eb6:	da01      	bge.n	0x2ebc
    2eb8:	a902      	add	r1, sp, #8
    2eba:	0000      	movs	r0, r0
    2ebc:	0b00      	lsrs	r0, r0, #12
    2ebe:	0070      	lsls	r0, r6, #1
    2ec0:	2431      	movs	r4, #49	; 0x31
    2ec2:	01f3      	lsls	r3, r6, #7
    2ec4:	1c51      	adds	r1, r2, #1
    2ec6:	1c45      	adds	r5, r0, #1
    2ec8:	299f      	cmp	r1, #159	; 0x9f
    2eca:	302c      	adds	r0, #44	; 0x2c
    2ecc:	0000      	movs	r0, r0
    2ece:	db01      	blt.n	0x2ed4
    2ed0:	8b02      	ldrh	r2, [r0, #24]
    2ed2:	0000      	movs	r0, r0
    2ed4:	0000      	movs	r0, r0
    2ed6:	0b29      	lsrs	r1, r5, #12
    2ed8:	002f      	movs	r7, r5
    2eda:	0100      	lsls	r0, r0, #4
    2edc:	02db      	lsls	r3, r3, #11
    2ede:	008b      	lsls	r3, r1, #2
    2ee0:	0000      	movs	r0, r0
    2ee2:	2800      	cmp	r0, #0
    2ee4:	2179      	movs	r1, #121	; 0x79
    2ee6:	0000      	movs	r0, r0
    2ee8:	dc01      	bgt.n	0x2eee
    2eea:	b902      	cbnz	r2, 0x2eee
    2eec:	0000      	movs	r0, r0
    2eee:	8800      	ldrh	r0, [r0, #0]
    2ef0:	0001      	movs	r1, r0
    2ef2:	3000      	adds	r0, #0
    2ef4:	0006      	movs	r6, r0
    2ef6:	0000      	movs	r0, r0
    2ef8:	2694      	movs	r6, #148	; 0x94
    2efa:	0000      	movs	r0, r0
    2efc:	2600      	movs	r6, #0
    2efe:	2228      	movs	r2, #40	; 0x28
    2f00:	0000      	movs	r0, r0
    2f02:	b801      			; <UNDEFINED> instruction: 0xb801
    2f04:	0002      	movs	r2, r0
    2f06:	0000      	movs	r0, r0
    2f08:	2800      	cmp	r0, #0
    2f0a:	0000      	movs	r0, r0
    2f0c:	0100      	lsls	r0, r0, #4
    2f0e:	3d9c      	subs	r5, #156	; 0x9c
    2f10:	0029      	movs	r1, r5
    2f12:	2c00      	cmp	r4, #0
    2f14:	254c      	movs	r5, #76	; 0x4c
    2f16:	0000      	movs	r0, r0
    2f18:	b801      			; <UNDEFINED> instruction: 0xb801
    2f1a:	b902      	cbnz	r2, 0x2f1e
    2f1c:	0000      	movs	r0, r0
    2f1e:	bd00      	pop	{pc}
    2f20:	0001      	movs	r1, r0
    2f22:	3100      	adds	r1, #0
    2f24:	000e      	movs	r6, r1
    2f26:	0000      	movs	r0, r0
    2f28:	293d      	cmp	r1, #61	; 0x3d
    2f2a:	0000      	movs	r0, r0
    2f2c:	2600      	movs	r6, #0
    2f2e:	35e0      	adds	r5, #224	; 0xe0
    2f30:	0000      	movs	r0, r0
    2f32:	4201      	tst	r1, r0
    2f34:	0002      	movs	r2, r0
    2f36:	0000      	movs	r0, r0
    2f38:	c000      	stmia	r0!, {}
    2f3a:	0000      	movs	r0, r0
    2f3c:	0100      	lsls	r0, r0, #4
    2f3e:	b09c      	sub	sp, #112	; 0x70
    2f40:	0029      	movs	r1, r5
    2f42:	2c00      	cmp	r4, #0
    2f44:	243c      	movs	r4, #60	; 0x3c
    2f46:	0000      	movs	r0, r0
    2f48:	4201      	tst	r1, r0
    2f4a:	b902      	cbnz	r2, 0x2f4e
    2f4c:	0000      	movs	r0, r0
    2f4e:	f700 0001 			; <UNDEFINED> instruction: 0xf7000001
    2f52:	2800      	cmp	r0, #0
    2f54:	38cb      	subs	r0, #203	; 0xcb
    2f56:	0000      	movs	r0, r0
    2f58:	4701      	bx	r0
    2f5a:	b902      	cbnz	r2, 0x2f5e
    2f5c:	0000      	movs	r0, r0
    2f5e:	2300      	movs	r3, #0
    2f60:	0002      	movs	r2, r0
    2f62:	2800      	cmp	r0, #0
    2f64:	21ab      	movs	r1, #171	; 0xab
    2f66:	0000      	movs	r0, r0
    2f68:	4801      	ldr	r0, [pc, #4]	; (0x2f70)
    2f6a:	b902      	cbnz	r2, 0x2f6e
    2f6c:	0000      	movs	r0, r0
    2f6e:	4e00      	ldr	r6, [pc, #0]	; (0x2f70)
    2f70:	0002      	movs	r2, r0
    2f72:	2800      	cmp	r0, #0
    2f74:	3002      	adds	r0, #2
    2f76:	0000      	movs	r0, r0
    2f78:	4901      	ldr	r1, [pc, #4]	; (0x2f80)
    2f7a:	b902      	cbnz	r2, 0x2f7e
    2f7c:	0000      	movs	r0, r0
    2f7e:	7900      	ldrb	r0, [r0, #4]
    2f80:	0002      	movs	r2, r0
    2f82:	2a00      	cmp	r2, #0
    2f84:	060e      	lsls	r6, r1, #24
    2f86:	0000      	movs	r0, r0
    2f88:	4a01      	ldr	r2, [pc, #4]	; (0x2f90)
    2f8a:	b902      	cbnz	r2, 0x2f8e
    2f8c:	0000      	movs	r0, r0
    2f8e:	4c00      	ldr	r4, [pc, #0]	; (0x2f90)
    2f90:	2a04      	cmp	r2, #4
    2f92:	1aee      	subs	r6, r5, r3
    2f94:	0000      	movs	r0, r0
    2f96:	4b01      	ldr	r3, [pc, #4]	; (0x2f9c)
    2f98:	b902      	cbnz	r2, 0x2f9c
    2f9a:	0000      	movs	r0, r0
    2f9c:	4c00      	ldr	r4, [pc, #0]	; (0x2fa0)
    2f9e:	0004      	movs	r4, r0
    2fa0:	4432      	add	r2, r6
    2fa2:	0012      	movs	r2, r2
    2fa4:	0100      	lsls	r0, r0, #4
    2fa6:	0221      	lsls	r1, r4, #8
    2fa8:	008b      	lsls	r3, r1, #2
    2faa:	0000      	movs	r0, r0
    2fac:	da01      	bge.n	0x2fb2
    2fae:	0029      	movs	r1, r5
    2fb0:	3300      	adds	r3, #0
    2fb2:	1bfe      	subs	r6, r7, r7
    2fb4:	0000      	movs	r0, r0
    2fb6:	2101      	movs	r1, #1
    2fb8:	8b02      	ldrh	r2, [r0, #24]
    2fba:	0000      	movs	r0, r0
    2fbc:	3300      	adds	r3, #0
    2fbe:	3573      	adds	r5, #115	; 0x73
    2fc0:	0000      	movs	r0, r0
    2fc2:	2101      	movs	r1, #1
    2fc4:	8b02      	ldrh	r2, [r0, #24]
    2fc6:	0000      	movs	r0, r0
    2fc8:	0000      	movs	r0, r0
    2fca:	4332      	orrs	r2, r6
    2fcc:	0013      	movs	r3, r2
    2fce:	0100      	lsls	r0, r0, #4
    2fd0:	01cb      	lsls	r3, r1, #7
    2fd2:	00b9      	lsls	r1, r7, #2
    2fd4:	0000      	movs	r0, r0
    2fd6:	1001      	asrs	r1, r0, #32
    2fd8:	002a      	movs	r2, r5
    2fda:	3300      	adds	r3, #0
    2fdc:	2f8c      	cmp	r7, #140	; 0x8c
    2fde:	0000      	movs	r0, r0
    2fe0:	cb01      	ldmia	r3!, {r0}
    2fe2:	b901      	cbnz	r1, 0x2fe6
    2fe4:	0000      	movs	r0, r0
    2fe6:	2e00      	cmp	r6, #0
    2fe8:	3922      	subs	r1, #34	; 0x22
    2fea:	0000      	movs	r0, r0
    2fec:	cd01      	ldmia	r5!, {r0}
    2fee:	b901      	cbnz	r1, 0x2ff2
    2ff0:	0000      	movs	r0, r0
    2ff2:	2e00      	cmp	r6, #0
    2ff4:	01a4      	lsls	r4, r4, #6
    2ff6:	0000      	movs	r0, r0
    2ff8:	cd01      	ldmia	r5!, {r0}
    2ffa:	b901      	cbnz	r1, 0x2ffe
    2ffc:	0000      	movs	r0, r0
    2ffe:	0000      	movs	r0, r0
    3000:	5532      	strb	r2, [r6, r4]
    3002:	0000      	movs	r0, r0
    3004:	0100      	lsls	r0, r0, #4
    3006:	016c      	lsls	r4, r5, #5
    3008:	00b9      	lsls	r1, r7, #2
    300a:	0000      	movs	r0, r0
    300c:	6a01      	ldr	r1, [r0, #32]
    300e:	002a      	movs	r2, r5
    3010:	3300      	adds	r3, #0
    3012:	10d0      	asrs	r0, r2, #3
    3014:	0000      	movs	r0, r0
    3016:	6c01      	ldr	r1, [r0, #64]	; 0x40
    3018:	b901      	cbnz	r1, 0x301c
    301a:	0000      	movs	r0, r0
    301c:	3300      	adds	r3, #0
    301e:	166c      	asrs	r4, r5, #25
    3020:	0000      	movs	r0, r0
    3022:	6c01      	ldr	r1, [r0, #64]	; 0x40
    3024:	b901      	cbnz	r1, 0x3028
    3026:	0000      	movs	r0, r0
    3028:	2e00      	cmp	r6, #0
    302a:	104d      	asrs	r5, r1, #1
    302c:	0000      	movs	r0, r0
    302e:	7901      	ldrb	r1, [r0, #4]
    3030:	b901      	cbnz	r1, 0x3034
    3032:	0000      	movs	r0, r0
    3034:	2e00      	cmp	r6, #0
    3036:	3361      	adds	r3, #97	; 0x61
    3038:	0000      	movs	r0, r0
    303a:	7901      	ldrb	r1, [r0, #4]
    303c:	b901      	cbnz	r1, 0x3040
    303e:	0000      	movs	r0, r0
    3040:	2e00      	cmp	r6, #0
    3042:	205a      	movs	r0, #90	; 0x5a
    3044:	0000      	movs	r0, r0
    3046:	7a01      	ldrb	r1, [r0, #8]
    3048:	b901      	cbnz	r1, 0x304c
    304a:	0000      	movs	r0, r0
    304c:	2e00      	cmp	r6, #0
    304e:	1a42      	subs	r2, r0, r1
    3050:	0000      	movs	r0, r0
    3052:	7a01      	ldrb	r1, [r0, #8]
    3054:	b901      	cbnz	r1, 0x3058
    3056:	0000      	movs	r0, r0
    3058:	0000      	movs	r0, r0
    305a:	5c34      	ldrb	r4, [r6, r0]
    305c:	0001      	movs	r1, r0
    305e:	0100      	lsls	r0, r0, #4
    3060:	015b      	lsls	r3, r3, #5
    3062:	9001      	str	r0, [sp, #4]
    3064:	002a      	movs	r2, r5
    3066:	3300      	adds	r3, #0
    3068:	253c      	movs	r5, #60	; 0x3c
    306a:	0000      	movs	r0, r0
    306c:	5b01      	ldrh	r1, [r0, r4]
    306e:	b901      	cbnz	r1, 0x3072
    3070:	0000      	movs	r0, r0
    3072:	3300      	adds	r3, #0
    3074:	1bc7      	subs	r7, r0, r7
    3076:	0000      	movs	r0, r0
    3078:	5b01      	ldrh	r1, [r0, r4]
    307a:	9001      	str	r0, [sp, #4]
    307c:	002a      	movs	r2, r5
    307e:	0000      	movs	r0, r0
    3080:	0408      	lsls	r0, r1, #16
    3082:	00b9      	lsls	r1, r7, #2
    3084:	0000      	movs	r0, r0
    3086:	0b35      	lsrs	r5, r6, #12
    3088:	0034      	movs	r4, r6
    308a:	0100      	lsls	r0, r0, #4
    308c:	014e      	lsls	r6, r1, #5
    308e:	00b9      	lsls	r1, r7, #2
    3090:	0000      	movs	r0, r0
    3092:	0000      	movs	r0, r0
    3094:	0000      	movs	r0, r0
    3096:	0006      	movs	r6, r0
    3098:	0000      	movs	r0, r0
    309a:	9c01      	ldr	r4, [sp, #4]
    309c:	0e26      	lsrs	r6, r4, #24
    309e:	0011      	movs	r1, r2
    30a0:	0100      	lsls	r0, r0, #4
    30a2:	013d      	lsls	r5, r7, #4
    30a4:	0000      	movs	r0, r0
    30a6:	0000      	movs	r0, r0
    30a8:	001c      	movs	r4, r3
    30aa:	0000      	movs	r0, r0
    30ac:	9c01      	ldr	r4, [sp, #4]
    30ae:	2b19      	cmp	r3, #25
    30b0:	0000      	movs	r0, r0
    30b2:	d62e      	bvs.n	0x3112
    30b4:	0018      	movs	r0, r3
    30b6:	0100      	lsls	r0, r0, #4
    30b8:	013f      	lsls	r7, r7, #4
    30ba:	00b9      	lsls	r1, r7, #2
    30bc:	0000      	movs	r0, r0
    30be:	b236      	sxth	r6, r6
    30c0:	002f      	movs	r7, r5
    30c2:	0000      	movs	r0, r0
    30c4:	0000      	movs	r0, r0
    30c6:	0400      	lsls	r0, r0, #16
    30c8:	0000      	movs	r0, r0
    30ca:	0100      	lsls	r0, r0, #4
    30cc:	0140      	lsls	r0, r0, #5
    30ce:	2af2      	cmp	r2, #242	; 0xf2
    30d0:	0000      	movs	r0, r0
    30d2:	0037      	movs	r7, r6
    30d4:	0000      	movs	r0, r0
    30d6:	0400      	lsls	r0, r0, #16
    30d8:	0000      	movs	r0, r0
    30da:	3800      	subs	r0, #0
    30dc:	2fc3      	cmp	r7, #195	; 0xc3
    30de:	0000      	movs	r0, r0
    30e0:	0000      	movs	r0, r0
    30e2:	d039      	beq.n	0x3158
    30e4:	002f      	movs	r7, r5
    30e6:	0400      	lsls	r0, r0, #16
    30e8:	0000      	movs	r0, r0
    30ea:	0200      	lsls	r0, r0, #8
    30ec:	0000      	movs	r0, r0
    30ee:	0100      	lsls	r0, r0, #4
    30f0:	0141      	lsls	r1, r0, #5
    30f2:	983a      	ldr	r0, [sp, #232]	; 0xe8
    30f4:	002f      	movs	r7, r5
    30f6:	1200      	asrs	r0, r0, #8
    30f8:	0000      	movs	r0, r0
    30fa:	0400      	lsls	r0, r0, #16
    30fc:	0000      	movs	r0, r0
    30fe:	0100      	lsls	r0, r0, #4
    3100:	0144      	lsls	r4, r0, #5
    3102:	a53b      	add	r5, pc, #236	; (adr r5, 0x31f0)
    3104:	002f      	movs	r7, r5
    3106:	0000      	movs	r0, r0
    3108:	3c00      	subs	r4, #0
    310a:	122b      	asrs	r3, r5, #8
    310c:	0000      	movs	r0, r0
    310e:	fc01 0000 	stc2	0, cr0, [r1], {-0}
    3112:	0000      	movs	r0, r0
    3114:	0174      	lsls	r4, r6, #5
    3116:	0000      	movs	r0, r0
    3118:	9c01      	ldr	r4, [sp, #4]
    311a:	2c84      	cmp	r4, #132	; 0x84
    311c:	0000      	movs	r0, r0
    311e:	3c3d      	subs	r4, #61	; 0x3d
    3120:	0025      	movs	r5, r4
    3122:	0100      	lsls	r0, r0, #4
    3124:	b9fc      	cbnz	r4, 0x3166
    3126:	0000      	movs	r0, r0
    3128:	a400      	add	r4, pc, #0	; (adr r4, 0x312c)
    312a:	0002      	movs	r2, r0
    312c:	3d00      	subs	r5, #0
    312e:	3660      	adds	r6, #96	; 0x60
    3130:	0000      	movs	r0, r0
    3132:	fc01 00b9 	stc2	0, cr0, [r1], {185}	; 0xb9
    3136:	0000      	movs	r0, r0
    3138:	02db      	lsls	r3, r3, #11
    313a:	0000      	movs	r0, r0
    313c:	8b3d      	ldrh	r5, [r7, #24]
    313e:	0038      	movs	r0, r7
    3140:	0100      	lsls	r0, r0, #4
    3142:	dafc      	bge.n	0x313e
    3144:	0000      	movs	r0, r0
    3146:	1400      	asrs	r0, r0, #16
    3148:	0003      	movs	r3, r0
    314a:	3d00      	subs	r5, #0
    314c:	27a3      	movs	r7, #163	; 0xa3
    314e:	0000      	movs	r0, r0
    3150:	fc01 00b9 	stc2	0, cr0, [r1], {185}	; 0xb9
    3154:	0000      	movs	r0, r0
    3156:	033c      	lsls	r4, r7, #12
    3158:	0000      	movs	r0, r0
    315a:	2f3e      	cmp	r7, #62	; 0x3e
    315c:	0039      	movs	r1, r7
    315e:	0100      	lsls	r0, r0, #4
    3160:	92fe      	str	r2, [sp, #1016]	; 0x3f8
    3162:	0023      	movs	r3, r4
    3164:	0300      	lsls	r0, r0, #12
    3166:	a091      	add	r0, pc, #580	; (adr r0, 0x33ac)
    3168:	3f7f      	subs	r7, #127	; 0x7f
    316a:	36aa      	adds	r6, #170	; 0xaa
    316c:	0000      	movs	r0, r0
    316e:	ff01 00b9 	vqadd.u8	d0, d17, d25
    3172:	0000      	movs	r0, r0
    3174:	0350      	lsls	r0, r2, #13
    3176:	0000      	movs	r0, r0
    3178:	3a28      	subs	r2, #40	; 0x28
    317a:	0005      	movs	r5, r0
    317c:	0100      	lsls	r0, r0, #4
    317e:	0100      	lsls	r0, r0, #4
    3180:	00b9      	lsls	r1, r7, #2
    3182:	0000      	movs	r0, r0
    3184:	0375      	lsls	r5, r6, #13
    3186:	0000      	movs	r0, r0
    3188:	4c28      	ldr	r4, [pc, #160]	; (0x322c)
    318a:	0005      	movs	r5, r0
    318c:	0100      	lsls	r0, r0, #4
    318e:	0101      	lsls	r1, r0, #4
    3190:	00b9      	lsls	r1, r7, #2
    3192:	0000      	movs	r0, r0
    3194:	0388      	lsls	r0, r1, #14
    3196:	0000      	movs	r0, r0
    3198:	1036      	asrs	r6, r6, #32
    319a:	002a      	movs	r2, r5
    319c:	3c00      	subs	r4, #0
    319e:	0000      	movs	r0, r0
    31a0:	2200      	movs	r2, #0
    31a2:	0000      	movs	r0, r0
    31a4:	0100      	lsls	r0, r0, #4
    31a6:	0117      	lsls	r7, r2, #4
    31a8:	2bf5      	cmp	r3, #245	; 0xf5
    31aa:	0000      	movs	r0, r0
    31ac:	2d40      	cmp	r5, #64	; 0x40
    31ae:	002a      	movs	r2, r5
    31b0:	9b00      	ldr	r3, [sp, #0]
    31b2:	0003      	movs	r3, r0
    31b4:	4000      	ands	r0, r0
    31b6:	2a21      	cmp	r2, #33	; 0x21
    31b8:	0000      	movs	r0, r0
    31ba:	03af      	lsls	r7, r5, #14
    31bc:	0000      	movs	r0, r0
    31be:	3c37      	subs	r4, #55	; 0x37
    31c0:	0000      	movs	r0, r0
    31c2:	2200      	movs	r2, #0
    31c4:	0000      	movs	r0, r0
    31c6:	4100      	asrs	r0, r0
    31c8:	2a39      	cmp	r2, #57	; 0x39
    31ca:	0000      	movs	r0, r0
    31cc:	03c3      	lsls	r3, r0, #15
    31ce:	0000      	movs	r0, r0
    31d0:	4538      	cmp	r0, r7
    31d2:	002a      	movs	r2, r5
    31d4:	4200      	tst	r0, r0
    31d6:	2a51      	cmp	r2, #81	; 0x51
    31d8:	0000      	movs	r0, r0
    31da:	5201      	strh	r1, [r0, r0]
    31dc:	5d42      	ldrb	r2, [r0, r5]
    31de:	002a      	movs	r2, r5
    31e0:	0100      	lsls	r0, r0, #4
    31e2:	0053      	lsls	r3, r2, #1
    31e4:	4300      	orrs	r0, r0
    31e6:	29da      	cmp	r1, #218	; 0xda
    31e8:	0000      	movs	r0, r0
    31ea:	007e      	lsls	r6, r7, #1
    31ec:	0000      	movs	r0, r0
    31ee:	0060      	lsls	r0, r4, #1
    31f0:	0000      	movs	r0, r0
    31f2:	1d01      	adds	r1, r0, #4
    31f4:	5401      	strb	r1, [r0, r0]
    31f6:	002c      	movs	r4, r5
    31f8:	4000      	ands	r0, r0
    31fa:	29eb      	cmp	r1, #235	; 0xeb
    31fc:	0000      	movs	r0, r0
    31fe:	03d6      	lsls	r6, r2, #15
    3200:	0000      	movs	r0, r0
    3202:	6044      	str	r4, [r0, #4]
    3204:	0000      	movs	r0, r0
    3206:	4100      	asrs	r0, r0
    3208:	29f7      	cmp	r1, #247	; 0xf7
    320a:	0000      	movs	r0, r0
    320c:	03f4      	lsls	r4, r6, #15
    320e:	0000      	movs	r0, r0
    3210:	0341      	lsls	r1, r0, #13
    3212:	002a      	movs	r2, r5
    3214:	da00      	bge.n	0x3218
    3216:	0004      	movs	r4, r0
    3218:	4500      	cmp	r0, r0
    321a:	2f72      	cmp	r7, #114	; 0x72
    321c:	0000      	movs	r0, r0
    321e:	007e      	lsls	r6, r7, #1
    3220:	0000      	movs	r0, r0
    3222:	0088      	lsls	r0, r1, #2
    3224:	0000      	movs	r0, r0
    3226:	d001      	beq.n	0x322c
    3228:	4001      	ands	r1, r0
    322a:	2f7f      	cmp	r7, #127	; 0x7f
    322c:	0000      	movs	r0, r0
    322e:	055e      	lsls	r6, r3, #21
    3230:	0000      	movs	r0, r0
    3232:	8844      	ldrh	r4, [r0, #2]
    3234:	0000      	movs	r0, r0
    3236:	4100      	asrs	r0, r0
    3238:	2f8b      	cmp	r7, #139	; 0x8b
    323a:	0000      	movs	r0, r0
    323c:	0572      	lsls	r2, r6, #21
    323e:	0000      	movs	r0, r0
    3240:	0000      	movs	r0, r0
    3242:	0000      	movs	r0, r0
    3244:	1a46      	subs	r6, r0, r1
    3246:	0000      	movs	r0, r0
    3248:	d800      	bhi.n	0x324c
    324a:	002f      	movs	r7, r5
    324c:	7300      	strb	r0, [r0, #12]
    324e:	002c      	movs	r4, r5
    3250:	4700      	bx	r0
    3252:	5001      	str	r1, [r0, r0]
    3254:	7d02      	ldrb	r2, [r0, #20]
    3256:	4700      	bx	r0
    3258:	5101      	str	r1, [r0, r4]
    325a:	3001      	adds	r0, #1
    325c:	0147      	lsls	r7, r0, #5
    325e:	0252      	lsls	r2, r2, #9
    3260:	4008      	ands	r0, r1
    3262:	4800      	ldr	r0, [pc, #0]	; (0x3264)
    3264:	00f0      	lsls	r0, r6, #3
    3266:	0000      	movs	r0, r0
    3268:	2f0c      	cmp	r7, #12
    326a:	0000      	movs	r0, r0
    326c:	0147      	lsls	r7, r0, #5
    326e:	0250      	lsls	r0, r2, #9
    3270:	007d      	lsls	r5, r7, #1
    3272:	0000      	movs	r0, r0
    3274:	1f3c      	subs	r4, r7, #4
    3276:	0011      	movs	r1, r2
    3278:	0100      	lsls	r0, r0, #4
    327a:	0099      	lsls	r1, r3, #2
    327c:	0000      	movs	r0, r0
    327e:	4800      	ldr	r0, [pc, #0]	; (0x3280)
    3280:	0001      	movs	r1, r0
    3282:	0100      	lsls	r0, r0, #4
    3284:	b19c      	cbz	r4, 0x32ae
    3286:	002d      	movs	r5, r5
    3288:	3d00      	subs	r5, #0
    328a:	253c      	movs	r5, #60	; 0x3c
    328c:	0000      	movs	r0, r0
    328e:	9901      	ldr	r1, [sp, #4]
    3290:	00b9      	lsls	r1, r7, #2
    3292:	0000      	movs	r0, r0
    3294:	0586      	lsls	r6, r0, #22
    3296:	0000      	movs	r0, r0
    3298:	603d      	str	r5, [r7, #0]
    329a:	0036      	movs	r6, r6
    329c:	0100      	lsls	r0, r0, #4
    329e:	b999      	cbnz	r1, 0x32c8
    32a0:	0000      	movs	r0, r0
    32a2:	b200      	sxth	r0, r0
    32a4:	0005      	movs	r5, r0
    32a6:	3d00      	subs	r5, #0
    32a8:	388b      	subs	r0, #139	; 0x8b
    32aa:	0000      	movs	r0, r0
    32ac:	9901      	ldr	r1, [sp, #4]
    32ae:	00da      	lsls	r2, r3, #3
    32b0:	0000      	movs	r0, r0
    32b2:	05eb      	lsls	r3, r5, #23
    32b4:	0000      	movs	r0, r0
    32b6:	0c3d      	lsrs	r5, r7, #16
    32b8:	001e      	movs	r6, r3
    32ba:	0100      	lsls	r0, r0, #4
    32bc:	b999      	cbnz	r1, 0x32e6
    32be:	0000      	movs	r0, r0
    32c0:	1300      	asrs	r0, r0, #12
    32c2:	0006      	movs	r6, r0
    32c4:	3e00      	subs	r6, #0
    32c6:	392f      	subs	r1, #47	; 0x2f
    32c8:	0000      	movs	r0, r0
    32ca:	9b01      	ldr	r3, [sp, #4]
    32cc:	2392      	movs	r3, #146	; 0x92
    32ce:	0000      	movs	r0, r0
    32d0:	9103      	str	r1, [sp, #12]
    32d2:	7f98      	ldrb	r0, [r3, #30]
    32d4:	aa3f      	add	r2, sp, #252	; 0xfc
    32d6:	0036      	movs	r6, r6
    32d8:	0100      	lsls	r0, r0, #4
    32da:	b99c      	cbnz	r4, 0x3304
    32dc:	0000      	movs	r0, r0
    32de:	2700      	movs	r7, #0
    32e0:	0006      	movs	r6, r0
    32e2:	3f00      	subs	r7, #0
    32e4:	053a      	lsls	r2, r7, #20
    32e6:	0000      	movs	r0, r0
    32e8:	9d01      	ldr	r5, [sp, #4]
    32ea:	00b9      	lsls	r1, r7, #2
    32ec:	0000      	movs	r0, r0
    32ee:	064c      	lsls	r4, r1, #25
    32f0:	0000      	movs	r0, r0
    32f2:	4c3f      	ldr	r4, [pc, #252]	; (0x33f0)
    32f4:	0005      	movs	r5, r0
    32f6:	0100      	lsls	r0, r0, #4
    32f8:	b99e      	cbnz	r6, 0x3322
    32fa:	0000      	movs	r0, r0
    32fc:	7900      	ldrb	r0, [r0, #4]
    32fe:	0006      	movs	r6, r0
    3300:	4900      	ldr	r1, [pc, #0]	; (0x3304)
    3302:	2f9d      	cmp	r7, #157	; 0x9d
    3304:	0000      	movs	r0, r0
    3306:	9f01      	ldr	r7, [sp, #4]
    3308:	00da      	lsls	r2, r3, #3
    330a:	0000      	movs	r0, r0
    330c:	000c      	movs	r4, r1
    330e:	2102      	movs	r1, #2
    3310:	0040      	lsls	r0, r0, #1
    3312:	0000      	movs	r0, r0
    3314:	ca3f      	ldmia	r2, {r0, r1, r2, r3, r4, r5}
    3316:	0022      	movs	r2, r4
    3318:	0100      	lsls	r0, r0, #4
    331a:	b1a1      	cbz	r1, 0x3346
    331c:	002d      	movs	r5, r5
    331e:	a600      	add	r6, pc, #0	; (adr r6, 0x3320)
    3320:	0006      	movs	r6, r0
    3322:	4a00      	ldr	r2, [pc, #0]	; (0x3324)
    3324:	2a10      	cmp	r2, #16
    3326:	0000      	movs	r0, r0
    3328:	0038      	movs	r0, r7
    332a:	0000      	movs	r0, r0
    332c:	0022      	movs	r2, r4
    332e:	0000      	movs	r0, r0
    3330:	b701      			; <UNDEFINED> instruction: 0xb701
    3332:	2d7f      	cmp	r5, #127	; 0x7f
    3334:	0000      	movs	r0, r0
    3336:	2d40      	cmp	r5, #64	; 0x40
    3338:	002a      	movs	r2, r5
    333a:	6f00      	ldr	r0, [r0, #112]	; 0x70
    333c:	0008      	movs	r0, r1
    333e:	4000      	ands	r0, r0
    3340:	2a21      	cmp	r2, #33	; 0x21
    3342:	0000      	movs	r0, r0
    3344:	0883      	lsrs	r3, r0, #2
    3346:	0000      	movs	r0, r0
    3348:	3837      	subs	r0, #55	; 0x37
    334a:	0000      	movs	r0, r0
    334c:	2200      	movs	r2, #0
    334e:	0000      	movs	r0, r0
    3350:	4100      	asrs	r0, r0
    3352:	2a39      	cmp	r2, #57	; 0x39
    3354:	0000      	movs	r0, r0
    3356:	0897      	lsrs	r7, r2, #2
    3358:	0000      	movs	r0, r0
    335a:	4538      	cmp	r0, r7
    335c:	002a      	movs	r2, r5
    335e:	4200      	tst	r0, r0
    3360:	2a51      	cmp	r2, #81	; 0x51
    3362:	0000      	movs	r0, r0
    3364:	5201      	strh	r1, [r0, r0]
    3366:	5d42      	ldrb	r2, [r0, r5]
    3368:	002a      	movs	r2, r5
    336a:	0100      	lsls	r0, r0, #4
    336c:	0053      	lsls	r3, r2, #1
    336e:	4600      	mov	r0, r0
    3370:	0018      	movs	r0, r3
    3372:	0000      	movs	r0, r0
    3374:	2fd8      	cmp	r7, #216	; 0xd8
    3376:	0000      	movs	r0, r0
    3378:	2d9f      	cmp	r5, #159	; 0x9f
    337a:	0000      	movs	r0, r0
    337c:	0147      	lsls	r7, r0, #5
    337e:	0350      	lsls	r0, r2, #13
    3380:	9891      	ldr	r0, [sp, #580]	; 0x244
    3382:	477f      	bx	pc
    3384:	5101      	str	r1, [r0, r4]
    3386:	3001      	adds	r0, #1
    3388:	0147      	lsls	r7, r0, #5
    338a:	0252      	lsls	r2, r2, #9
    338c:	4008      	ands	r0, r1
    338e:	4800      	ldr	r0, [pc, #0]	; (0x3390)
    3390:	00da      	lsls	r2, r3, #3
    3392:	0000      	movs	r0, r0
    3394:	2f0c      	cmp	r7, #12
    3396:	0000      	movs	r0, r0
    3398:	0147      	lsls	r7, r0, #5
    339a:	0350      	lsls	r0, r2, #13
    339c:	9891      	ldr	r0, [sp, #580]	; 0x244
    339e:	007f      	lsls	r7, r7, #1
    33a0:	0600      	lsls	r0, r0, #24
    33a2:	00b9      	lsls	r1, r7, #2
    33a4:	0000      	movs	r0, r0
    33a6:	2dc1      	cmp	r5, #193	; 0xc1
    33a8:	0000      	movs	r0, r0
    33aa:	4111      	asrs	r1, r2
    33ac:	0000      	movs	r0, r0
    33ae:	0b00      	lsrs	r0, r0, #12
    33b0:	3c00      	subs	r4, #0
    33b2:	2d0e      	cmp	r5, #14
    33b4:	0000      	movs	r0, r0
    33b6:	5e01      	ldrsh	r1, [r0, r0]
    33b8:	0000      	movs	r0, r0
    33ba:	0000      	movs	r0, r0
    33bc:	00d0      	lsls	r0, r2, #3
    33be:	0000      	movs	r0, r0
    33c0:	9c01      	ldr	r4, [sp, #4]
    33c2:	2efb      	cmp	r6, #251	; 0xfb
    33c4:	0000      	movs	r0, r0
    33c6:	3c3d      	subs	r4, #61	; 0x3d
    33c8:	0025      	movs	r5, r4
    33ca:	0100      	lsls	r0, r0, #4
    33cc:	b95e      	cbnz	r6, 0x33e6
    33ce:	0000      	movs	r0, r0
    33d0:	aa00      	add	r2, sp, #0
    33d2:	0008      	movs	r0, r1
    33d4:	3d00      	subs	r5, #0
    33d6:	3660      	adds	r6, #96	; 0x60
    33d8:	0000      	movs	r0, r0
    33da:	5e01      	ldrsh	r1, [r0, r0]
    33dc:	00b9      	lsls	r1, r7, #2
    33de:	0000      	movs	r0, r0
    33e0:	08d6      	lsrs	r6, r2, #3
    33e2:	0000      	movs	r0, r0
    33e4:	8b3d      	ldrh	r5, [r7, #24]
    33e6:	0038      	movs	r0, r7
    33e8:	0100      	lsls	r0, r0, #4
    33ea:	da5e      	bge.n	0x34aa
    33ec:	0000      	movs	r0, r0
    33ee:	0200      	lsls	r0, r0, #8
    33f0:	0009      	movs	r1, r1
    33f2:	3d00      	subs	r5, #0
    33f4:	0843      	lsrs	r3, r0, #1
    33f6:	0000      	movs	r0, r0
    33f8:	5e01      	ldrsh	r1, [r0, r0]
    33fa:	00b9      	lsls	r1, r7, #2
    33fc:	0000      	movs	r0, r0
    33fe:	092a      	lsrs	r2, r5, #4
    3400:	0000      	movs	r0, r0
    3402:	2f3e      	cmp	r7, #62	; 0x3e
    3404:	0039      	movs	r1, r7
    3406:	0100      	lsls	r0, r0, #4
    3408:	9260      	str	r2, [sp, #384]	; 0x180
    340a:	0023      	movs	r3, r4
    340c:	0300      	lsls	r0, r0, #12
    340e:	a891      	add	r0, sp, #580	; 0x244
    3410:	3f7f      	subs	r7, #127	; 0x7f
    3412:	36aa      	adds	r6, #170	; 0xaa
    3414:	0000      	movs	r0, r0
    3416:	6101      	str	r1, [r0, #16]
    3418:	00b9      	lsls	r1, r7, #2
    341a:	0000      	movs	r0, r0
    341c:	093e      	lsrs	r6, r7, #4
    341e:	0000      	movs	r0, r0
    3420:	3a3f      	subs	r2, #63	; 0x3f
    3422:	0005      	movs	r5, r0
    3424:	0100      	lsls	r0, r0, #4
    3426:	b962      	cbnz	r2, 0x3442
    3428:	0000      	movs	r0, r0
    342a:	6300      	str	r0, [r0, #48]	; 0x30
    342c:	0009      	movs	r1, r1
    342e:	3f00      	subs	r7, #0
    3430:	054c      	lsls	r4, r1, #21
    3432:	0000      	movs	r0, r0
    3434:	6301      	str	r1, [r0, #48]	; 0x30
    3436:	00b9      	lsls	r1, r7, #2
    3438:	0000      	movs	r0, r0
    343a:	0976      	lsrs	r6, r6, #5
    343c:	0000      	movs	r0, r0
    343e:	c73f      	stmia	r7!, {r0, r1, r2, r3, r4, r5}
    3440:	001b      	movs	r3, r3
    3442:	0100      	lsls	r0, r0, #4
    3444:	b964      	cbnz	r4, 0x3460
    3446:	0000      	movs	r0, r0
    3448:	9900      	ldr	r1, [sp, #0]
    344a:	0009      	movs	r1, r1
    344c:	4b00      	ldr	r3, [pc, #0]	; (0x3450)
    344e:	2a6a      	cmp	r2, #106	; 0x6a
    3450:	0000      	movs	r0, r0
    3452:	001a      	movs	r2, r3
    3454:	0000      	movs	r0, r0
    3456:	0000      	movs	r0, r0
    3458:	0000      	movs	r0, r0
    345a:	6c01      	ldr	r1, [r0, #64]	; 0x40
    345c:	2e83      	cmp	r6, #131	; 0x83
    345e:	0000      	movs	r0, r0
    3460:	8340      	strh	r0, [r0, #26]
    3462:	002a      	movs	r2, r5
    3464:	c400      	stmia	r4!, {}
    3466:	0009      	movs	r1, r1
    3468:	4000      	ands	r0, r0
    346a:	2a77      	cmp	r2, #119	; 0x77
    346c:	0000      	movs	r0, r0
    346e:	09dc      	lsrs	r4, r3, #7
    3470:	0000      	movs	r0, r0
    3472:	4b00      	ldr	r3, [pc, #0]	; (0x3474)
    3474:	2a10      	cmp	r2, #16
    3476:	0000      	movs	r0, r0
    3478:	0044      	lsls	r4, r0, #1
    347a:	0000      	movs	r0, r0
    347c:	0038      	movs	r0, r7
    347e:	0000      	movs	r0, r0
    3480:	7301      	strb	r1, [r0, #12]
    3482:	2ecb      	cmp	r6, #203	; 0xcb
    3484:	0000      	movs	r0, r0
    3486:	2d40      	cmp	r5, #64	; 0x40
    3488:	002a      	movs	r2, r5
    348a:	ef00 0009 	vhadd.s8	d0, d0, d9
    348e:	4000      	ands	r0, r0
    3490:	2a21      	cmp	r2, #33	; 0x21
    3492:	0000      	movs	r0, r0
    3494:	0a02      	lsrs	r2, r0, #8
    3496:	0000      	movs	r0, r0
    3498:	3844      	subs	r0, #68	; 0x44
    349a:	0000      	movs	r0, r0
    349c:	4100      	asrs	r0, r0
    349e:	2a39      	cmp	r2, #57	; 0x39
    34a0:	0000      	movs	r0, r0
    34a2:	0a16      	lsrs	r6, r2, #8
    34a4:	0000      	movs	r0, r0
    34a6:	4538      	cmp	r0, r7
    34a8:	002a      	movs	r2, r5
    34aa:	4200      	tst	r0, r0
    34ac:	2a51      	cmp	r2, #81	; 0x51
    34ae:	0000      	movs	r0, r0
    34b0:	5301      	strh	r1, [r0, r4]
    34b2:	5d42      	ldrb	r2, [r0, r5]
    34b4:	002a      	movs	r2, r5
    34b6:	0100      	lsls	r0, r0, #4
    34b8:	0051      	lsls	r1, r2, #1
    34ba:	4600      	mov	r0, r0
    34bc:	0018      	movs	r0, r3
    34be:	0000      	movs	r0, r0
    34c0:	2fd8      	cmp	r7, #216	; 0xd8
    34c2:	0000      	movs	r0, r0
    34c4:	2eea      	cmp	r6, #234	; 0xea
    34c6:	0000      	movs	r0, r0
    34c8:	0147      	lsls	r7, r0, #5
    34ca:	0250      	lsls	r0, r2, #9
    34cc:	007d      	lsls	r5, r7, #1
    34ce:	0147      	lsls	r7, r0, #5
    34d0:	0151      	lsls	r1, r2, #5
    34d2:	4730      	bx	r6
    34d4:	5201      	strh	r1, [r0, r0]
    34d6:	0802      	lsrs	r2, r0, #32
    34d8:	0040      	lsls	r0, r0, #1
    34da:	a448      	add	r4, pc, #288	; (adr r4, 0x35fc)
    34dc:	0000      	movs	r0, r0
    34de:	0c00      	lsrs	r0, r0, #16
    34e0:	002f      	movs	r7, r5
    34e2:	4700      	bx	r0
    34e4:	5001      	str	r1, [r0, r0]
    34e6:	7d02      	ldrb	r2, [r0, #20]
    34e8:	0000      	movs	r0, r0
    34ea:	4c00      	ldr	r4, [pc, #0]	; (0x34ec)
    34ec:	04d0      	lsls	r0, r2, #19
    34ee:	0000      	movs	r0, r0
    34f0:	5501      	strb	r1, [r0, r4]
    34f2:	0000      	movs	r0, r0
    34f4:	0000      	movs	r0, r0
    34f6:	000c      	movs	r4, r1
    34f8:	0000      	movs	r0, r0
    34fa:	9c01      	ldr	r4, [sp, #4]
    34fc:	483c      	ldr	r0, [pc, #240]	; (0x35f0)
    34fe:	0001      	movs	r1, r0
    3500:	0100      	lsls	r0, r0, #4
    3502:	0037      	movs	r7, r6
    3504:	0000      	movs	r0, r0
    3506:	8c00      	ldrh	r0, [r0, #32]
    3508:	0000      	movs	r0, r0
    350a:	0100      	lsls	r0, r0, #4
    350c:	729c      	strb	r4, [r3, #10]
    350e:	002f      	movs	r7, r5
    3510:	3d00      	subs	r5, #0
    3512:	37ee      	adds	r7, #238	; 0xee
    3514:	0000      	movs	r0, r0
    3516:	3701      	adds	r7, #1
    3518:	2608      	movs	r6, #8
    351a:	0000      	movs	r0, r0
    351c:	0a29      	lsrs	r1, r5, #8
    351e:	0000      	movs	r0, r0
    3520:	4246      	negs	r6, r0
    3522:	0000      	movs	r0, r0
    3524:	e300      	b.n	0x3b28
    3526:	002f      	movs	r7, r5
    3528:	4700      	bx	r0
    352a:	002f      	movs	r7, r5
    352c:	4700      	bx	r0
    352e:	5001      	str	r1, [r0, r0]
    3530:	0c05      	lsrs	r5, r0, #16
    3532:	9108      	str	r1, [sp, #32]
    3534:	0010      	movs	r0, r2
    3536:	4600      	mov	r0, r0
    3538:	004c      	lsls	r4, r1, #1
    353a:	0000      	movs	r0, r0
    353c:	2fef      	cmp	r7, #239	; 0xef
    353e:	0000      	movs	r0, r0
    3540:	2f65      	cmp	r7, #101	; 0x65
    3542:	0000      	movs	r0, r0
    3544:	0147      	lsls	r7, r0, #5
    3546:	0250      	lsls	r0, r2, #9
    3548:	2008      	movs	r0, #8
    354a:	0147      	lsls	r7, r0, #5
    354c:	0151      	lsls	r1, r2, #5
    354e:	4731      	bx	r6
    3550:	5201      	strh	r1, [r0, r0]
    3552:	3001      	adds	r0, #1
    3554:	4d00      	ldr	r5, [pc, #0]	; (0x3558)
    3556:	0068      	lsls	r0, r5, #1
    3558:	0000      	movs	r0, r0
    355a:	0147      	lsls	r7, r0, #5
    355c:	0250      	lsls	r0, r2, #9
    355e:	0075      	lsls	r5, r6, #1
    3560:	0000      	movs	r0, r0
    3562:	4534      	cmp	r4, r6
    3564:	0030      	movs	r0, r6
    3566:	0200      	lsls	r0, r0, #8
    3568:	030b      	lsls	r3, r1, #12
    356a:	9803      	ldr	r0, [sp, #12]
    356c:	002f      	movs	r7, r5
    356e:	4e00      	ldr	r6, [pc, #0]	; (0x3570)
    3570:	6c63      	ldr	r3, [r4, #68]	; 0x44
    3572:	006b      	lsls	r3, r5, #1
    3574:	0b02      	lsrs	r2, r0, #12
    3576:	aa03      	add	r2, sp, #12
    3578:	001c      	movs	r4, r3
    357a:	2e00      	cmp	r6, #0
    357c:	0ab1      	lsrs	r1, r6, #10
    357e:	0000      	movs	r0, r0
    3580:	0d02      	lsrs	r2, r0, #20
    3582:	b903      	cbnz	r3, 0x3586
    3584:	0000      	movs	r0, r0
    3586:	0000      	movs	r0, r0
    3588:	d134      	bne.n	0x35f4
    358a:	0011      	movs	r1, r2
    358c:	0300      	lsls	r0, r0, #12
    358e:	019c      	lsls	r4, r3, #6
    3590:	b203      	sxth	r3, r0
    3592:	002f      	movs	r7, r5
    3594:	3300      	adds	r3, #0
    3596:	35a4      	adds	r5, #164	; 0xa4
    3598:	0000      	movs	r0, r0
    359a:	9c03      	ldr	r4, [sp, #12]
    359c:	b901      	cbnz	r1, 0x35a0
    359e:	0000      	movs	r0, r0
    35a0:	0000      	movs	r0, r0
    35a2:	0b32      	lsrs	r2, r6, #12
    35a4:	0038      	movs	r0, r7
    35a6:	0300      	lsls	r0, r0, #12
    35a8:	017e      	lsls	r6, r7, #5
    35aa:	00b9      	lsls	r1, r7, #2
    35ac:	0000      	movs	r0, r0
    35ae:	d003      	beq.n	0x35b8
    35b0:	002f      	movs	r7, r5
    35b2:	2e00      	cmp	r6, #0
    35b4:	1c99      	adds	r1, r3, #2
    35b6:	0000      	movs	r0, r0
    35b8:	8003      	strh	r3, [r0, #0]
    35ba:	b901      	cbnz	r1, 0x35be
    35bc:	0000      	movs	r0, r0
    35be:	0000      	movs	r0, r0
    35c0:	884f      	ldrh	r7, [r1, #2]
    35c2:	000d      	movs	r5, r1
    35c4:	0300      	lsls	r0, r0, #12
    35c6:	038c      	lsls	r4, r1, #14
    35c8:	7a50      	ldrb	r0, [r2, #9]
    35ca:	001c      	movs	r4, r3
    35cc:	7a00      	ldrb	r0, [r0, #8]
    35ce:	001c      	movs	r4, r3
    35d0:	0b00      	lsrs	r0, r0, #12
    35d2:	513b      	str	r3, [r7, r4]
    35d4:	31eb      	adds	r1, #235	; 0xeb
    35d6:	0000      	movs	r0, r0
    35d8:	31eb      	adds	r1, #235	; 0xeb
    35da:	0000      	movs	r0, r0
    35dc:	3902      	subs	r1, #2
    35de:	5103      	str	r3, [r0, r4]
    35e0:	0c7e      	lsrs	r6, r7, #17
    35e2:	0000      	movs	r0, r0
    35e4:	0c7e      	lsrs	r6, r7, #17
    35e6:	0000      	movs	r0, r0
    35e8:	4902      	ldr	r1, [pc, #8]	; (0x35f4)
    35ea:	0003      	movs	r3, r0
    35ec:	1101      	asrs	r1, r0, #4
    35ee:	2501      	movs	r5, #1
    35f0:	130e      	asrs	r6, r1, #12
    35f2:	030b      	lsls	r3, r1, #12
    35f4:	1b0e      	subs	r6, r1, r4
    35f6:	550e      	strb	r6, [r1, r4]
    35f8:	1117      	asrs	r7, r2, #4
    35fa:	1001      	asrs	r1, r0, #32
    35fc:	0017      	movs	r7, r2
    35fe:	0200      	lsls	r0, r0, #8
    3600:	0024      	movs	r4, r4
    3602:	0b0b      	lsrs	r3, r1, #12
    3604:	0b3e      	lsrs	r6, r7, #12
    3606:	0e03      	lsrs	r3, r0, #24
    3608:	0000      	movs	r0, r0
    360a:	2403      	movs	r4, #3
    360c:	0b00      	lsrs	r0, r0, #12
    360e:	3e0b      	subs	r6, #11
    3610:	030b      	lsls	r3, r1, #12
    3612:	0008      	movs	r0, r1
    3614:	0400      	lsls	r0, r0, #16
    3616:	0034      	movs	r4, r6
    3618:	0e03      	lsrs	r3, r0, #24
    361a:	0b3a      	lsrs	r2, r7, #12
    361c:	0b3b      	lsrs	r3, r7, #12
    361e:	1349      	asrs	r1, r1, #13
    3620:	193f      	adds	r7, r7, r4
    3622:	193c      	adds	r4, r7, r4
    3624:	0000      	movs	r0, r0
    3626:	3405      	adds	r4, #5
    3628:	0300      	lsls	r0, r0, #12
    362a:	3a0e      	subs	r2, #14
    362c:	3b0b      	subs	r3, #11
    362e:	4905      	ldr	r1, [pc, #20]	; (0x3644)
    3630:	3f13      	subs	r7, #19
    3632:	3c19      	subs	r4, #25
    3634:	0019      	movs	r1, r3
    3636:	0600      	lsls	r0, r0, #24
    3638:	0101      	lsls	r1, r0, #4
    363a:	1349      	asrs	r1, r1, #13
    363c:	1301      	asrs	r1, r0, #12
    363e:	0000      	movs	r0, r0
    3640:	2107      	movs	r1, #7
    3642:	0000      	movs	r0, r0
    3644:	0800      	lsrs	r0, r0, #32
    3646:	000f      	movs	r7, r1
    3648:	0b0b      	lsrs	r3, r1, #12
    364a:	1349      	asrs	r1, r1, #13
    364c:	0000      	movs	r0, r0
    364e:	1509      	asrs	r1, r1, #20
    3650:	2700      	movs	r7, #0
    3652:	0019      	movs	r1, r3
    3654:	0a00      	lsrs	r0, r0, #8
    3656:	0016      	movs	r6, r2
    3658:	0e03      	lsrs	r3, r0, #24
    365a:	0b3a      	lsrs	r2, r7, #12
    365c:	0b3b      	lsrs	r3, r7, #12
    365e:	1349      	asrs	r1, r1, #13
    3660:	0000      	movs	r0, r0
    3662:	350b      	adds	r5, #11
    3664:	4900      	ldr	r1, [pc, #0]	; (0x3668)
    3666:	0013      	movs	r3, r2
    3668:	0c00      	lsrs	r0, r0, #16
    366a:	0026      	movs	r6, r4
    366c:	1349      	asrs	r1, r1, #13
    366e:	0000      	movs	r0, r0
    3670:	130d      	asrs	r5, r1, #12
    3672:	0b01      	lsrs	r1, r0, #12
    3674:	3a05      	subs	r2, #5
    3676:	3b0b      	subs	r3, #11
    3678:	0105      	lsls	r5, r0, #4
    367a:	0013      	movs	r3, r2
    367c:	0e00      	lsrs	r0, r0, #24
    367e:	000d      	movs	r5, r1
    3680:	0e03      	lsrs	r3, r0, #24
    3682:	0b3a      	lsrs	r2, r7, #12
    3684:	053b      	lsls	r3, r7, #20
    3686:	1349      	asrs	r1, r1, #13
    3688:	0b38      	lsrs	r0, r7, #12
    368a:	0000      	movs	r0, r0
    368c:	0d0f      	lsrs	r7, r1, #20
    368e:	0300      	lsls	r0, r0, #12
    3690:	3a0e      	subs	r2, #14
    3692:	3b0b      	subs	r3, #11
    3694:	4905      	ldr	r1, [pc, #20]	; (0x36ac)
    3696:	3813      	subs	r0, #19
    3698:	0005      	movs	r5, r0
    369a:	1000      	asrs	r0, r0, #32
    369c:	000d      	movs	r5, r1
    369e:	0803      	lsrs	r3, r0, #32
    36a0:	0b3a      	lsrs	r2, r7, #12
    36a2:	053b      	lsls	r3, r7, #20
    36a4:	1349      	asrs	r1, r1, #13
    36a6:	0538      	lsls	r0, r7, #20
    36a8:	0000      	movs	r0, r0
    36aa:	2111      	movs	r1, #17
    36ac:	4900      	ldr	r1, [pc, #0]	; (0x36b0)
    36ae:	2f13      	cmp	r7, #19
    36b0:	000b      	movs	r3, r1
    36b2:	1200      	asrs	r0, r0, #8
    36b4:	0021      	movs	r1, r4
    36b6:	1349      	asrs	r1, r1, #13
    36b8:	052f      	lsls	r7, r5, #20
    36ba:	0000      	movs	r0, r0
    36bc:	1613      	asrs	r3, r2, #24
    36be:	0300      	lsls	r0, r0, #12
    36c0:	3a0e      	subs	r2, #14
    36c2:	3b0b      	subs	r3, #11
    36c4:	4905      	ldr	r1, [pc, #20]	; (0x36dc)
    36c6:	0013      	movs	r3, r2
    36c8:	1400      	asrs	r0, r0, #16
    36ca:	000d      	movs	r5, r1
    36cc:	0803      	lsrs	r3, r0, #32
    36ce:	0b3a      	lsrs	r2, r7, #12
    36d0:	053b      	lsls	r3, r7, #20
    36d2:	1349      	asrs	r1, r1, #13
    36d4:	0b38      	lsrs	r0, r7, #12
    36d6:	0000      	movs	r0, r0
    36d8:	1315      	asrs	r5, r2, #12
    36da:	0b01      	lsrs	r1, r0, #12
    36dc:	3a0b      	subs	r2, #11
    36de:	3b0b      	subs	r3, #11
    36e0:	0105      	lsls	r5, r0, #4
    36e2:	0013      	movs	r3, r2
    36e4:	1600      	asrs	r0, r0, #24
    36e6:	0117      	lsls	r7, r2, #4
    36e8:	0b0b      	lsrs	r3, r1, #12
    36ea:	0b3a      	lsrs	r2, r7, #12
    36ec:	053b      	lsls	r3, r7, #20
    36ee:	1301      	asrs	r1, r0, #12
    36f0:	0000      	movs	r0, r0
    36f2:	0d17      	lsrs	r7, r2, #20
    36f4:	0300      	lsls	r0, r0, #12
    36f6:	3a0e      	subs	r2, #14
    36f8:	3b0b      	subs	r3, #11
    36fa:	4905      	ldr	r1, [pc, #20]	; (0x3710)
    36fc:	0013      	movs	r3, r2
    36fe:	1800      	adds	r0, r0, r0
    3700:	000d      	movs	r5, r1
    3702:	1349      	asrs	r1, r1, #13
    3704:	0538      	lsls	r0, r7, #20
    3706:	0000      	movs	r0, r0
    3708:	0419      	lsls	r1, r3, #16
    370a:	0301      	lsls	r1, r0, #12
    370c:	3e0e      	subs	r6, #14
    370e:	0b0b      	lsrs	r3, r1, #12
    3710:	490b      	ldr	r1, [pc, #44]	; (0x3740)
    3712:	3a13      	subs	r2, #19
    3714:	3b0b      	subs	r3, #11
    3716:	010b      	lsls	r3, r1, #4
    3718:	0013      	movs	r3, r2
    371a:	1a00      	subs	r0, r0, r0
    371c:	0028      	movs	r0, r5
    371e:	0e03      	lsrs	r3, r0, #24
    3720:	0b1c      	lsrs	r4, r3, #12
    3722:	0000      	movs	r0, r0
    3724:	041b      	lsls	r3, r3, #16
    3726:	0301      	lsls	r1, r0, #12
    3728:	3e0e      	subs	r6, #14
    372a:	0b0b      	lsrs	r3, r1, #12
    372c:	490b      	ldr	r1, [pc, #44]	; (0x375c)
    372e:	3a13      	subs	r2, #19
    3730:	3b0b      	subs	r3, #11
    3732:	0105      	lsls	r5, r0, #4
    3734:	0013      	movs	r3, r2
    3736:	1c00      	adds	r0, r0, #0
    3738:	0028      	movs	r0, r5
    373a:	0e03      	lsrs	r3, r0, #24
    373c:	051c      	lsls	r4, r3, #20
    373e:	0000      	movs	r0, r0
    3740:	281d      	cmp	r0, #29
    3742:	0300      	lsls	r0, r0, #12
    3744:	1c0e      	adds	r6, r1, #0
    3746:	0006      	movs	r6, r0
    3748:	1e00      	subs	r0, r0, #0
    374a:	0028      	movs	r0, r5
    374c:	0e03      	lsrs	r3, r0, #24
    374e:	0d1c      	lsrs	r4, r3, #20
    3750:	0000      	movs	r0, r0
    3752:	131f      	asrs	r7, r3, #12
    3754:	0b01      	lsrs	r1, r0, #12
    3756:	3a0b      	subs	r2, #11
    3758:	3b0b      	subs	r3, #11
    375a:	010b      	lsls	r3, r1, #4
    375c:	0013      	movs	r3, r2
    375e:	2000      	movs	r0, #0
    3760:	000d      	movs	r5, r1
    3762:	0803      	lsrs	r3, r0, #32
    3764:	0b3a      	lsrs	r2, r7, #12
    3766:	0b3b      	lsrs	r3, r7, #12
    3768:	1349      	asrs	r1, r1, #13
    376a:	0b38      	lsrs	r0, r7, #12
    376c:	0000      	movs	r0, r0
    376e:	0d21      	lsrs	r1, r4, #20
    3770:	0300      	lsls	r0, r0, #12
    3772:	3a0e      	subs	r2, #14
    3774:	3b0b      	subs	r3, #11
    3776:	490b      	ldr	r1, [pc, #44]	; (0x37a4)
    3778:	3813      	subs	r0, #19
    377a:	000b      	movs	r3, r1
    377c:	2200      	movs	r2, #0
    377e:	0113      	lsls	r3, r2, #4
    3780:	0e03      	lsrs	r3, r0, #24
    3782:	0b0b      	lsrs	r3, r1, #12
    3784:	0b3a      	lsrs	r2, r7, #12
    3786:	053b      	lsls	r3, r7, #20
    3788:	1301      	asrs	r1, r0, #12
    378a:	0000      	movs	r0, r0
    378c:	1523      	asrs	r3, r4, #20
    378e:	2701      	movs	r7, #1
    3790:	0119      	lsls	r1, r3, #4
    3792:	0013      	movs	r3, r2
    3794:	2400      	movs	r4, #0
    3796:	0005      	movs	r5, r0
    3798:	1349      	asrs	r1, r1, #13
    379a:	0000      	movs	r0, r0
    379c:	3425      	adds	r4, #37	; 0x25
    379e:	0300      	lsls	r0, r0, #12
    37a0:	3a0e      	subs	r2, #14
    37a2:	3b0b      	subs	r3, #11
    37a4:	490b      	ldr	r1, [pc, #44]	; (0x37d4)
    37a6:	0013      	movs	r3, r2
    37a8:	2600      	movs	r6, #0
    37aa:	012e      	lsls	r6, r5, #4
    37ac:	193f      	adds	r7, r7, r4
    37ae:	0e03      	lsrs	r3, r0, #24
    37b0:	0b3a      	lsrs	r2, r7, #12
    37b2:	053b      	lsls	r3, r7, #20
    37b4:	1927      	adds	r7, r4, r4
    37b6:	0111      	lsls	r1, r2, #4
    37b8:	0612      	lsls	r2, r2, #24
    37ba:	1840      	adds	r0, r0, r1
    37bc:	4297      	cmp	r7, r2
    37be:	0119      	lsls	r1, r3, #4
    37c0:	0013      	movs	r3, r2
    37c2:	2700      	movs	r7, #0
    37c4:	0005      	movs	r5, r0
    37c6:	0803      	lsrs	r3, r0, #32
    37c8:	0b3a      	lsrs	r2, r7, #12
    37ca:	053b      	lsls	r3, r7, #20
    37cc:	1349      	asrs	r1, r1, #13
    37ce:	1702      	asrs	r2, r0, #28
    37d0:	0000      	movs	r0, r0
    37d2:	3428      	adds	r4, #40	; 0x28
    37d4:	0300      	lsls	r0, r0, #12
    37d6:	3a0e      	subs	r2, #14
    37d8:	3b0b      	subs	r3, #11
    37da:	4905      	ldr	r1, [pc, #20]	; (0x37f0)
    37dc:	0213      	lsls	r3, r2, #8
    37de:	0017      	movs	r7, r2
    37e0:	2900      	cmp	r1, #0
    37e2:	0034      	movs	r4, r6
    37e4:	0e03      	lsrs	r3, r0, #24
    37e6:	0b3a      	lsrs	r2, r7, #12
    37e8:	053b      	lsls	r3, r7, #20
    37ea:	1349      	asrs	r1, r1, #13
    37ec:	0b1c      	lsrs	r4, r3, #12
    37ee:	0000      	movs	r0, r0
    37f0:	342a      	adds	r4, #42	; 0x2a
    37f2:	0300      	lsls	r0, r0, #12
    37f4:	3a0e      	subs	r2, #14
    37f6:	3b0b      	subs	r3, #11
    37f8:	4905      	ldr	r1, [pc, #20]	; (0x3810)
    37fa:	1c13      	adds	r3, r2, #0
    37fc:	0005      	movs	r5, r0
    37fe:	2b00      	cmp	r3, #0
    3800:	0005      	movs	r5, r0
    3802:	0e03      	lsrs	r3, r0, #24
    3804:	0b3a      	lsrs	r2, r7, #12
    3806:	053b      	lsls	r3, r7, #20
    3808:	1349      	asrs	r1, r1, #13
    380a:	1802      	adds	r2, r0, r0
    380c:	0000      	movs	r0, r0
    380e:	052c      	lsls	r4, r5, #20
    3810:	0300      	lsls	r0, r0, #12
    3812:	3a0e      	subs	r2, #14
    3814:	3b0b      	subs	r3, #11
    3816:	4905      	ldr	r1, [pc, #20]	; (0x382c)
    3818:	0213      	lsls	r3, r2, #8
    381a:	0017      	movs	r7, r2
    381c:	2d00      	cmp	r5, #0
    381e:	0034      	movs	r4, r6
    3820:	0e03      	lsrs	r3, r0, #24
    3822:	0b3a      	lsrs	r2, r7, #12
    3824:	053b      	lsls	r3, r7, #20
    3826:	1349      	asrs	r1, r1, #13
    3828:	1802      	adds	r2, r0, r0
    382a:	0000      	movs	r0, r0
    382c:	342e      	adds	r4, #46	; 0x2e
    382e:	0300      	lsls	r0, r0, #12
    3830:	3a0e      	subs	r2, #14
    3832:	3b0b      	subs	r3, #11
    3834:	4905      	ldr	r1, [pc, #20]	; (0x384c)
    3836:	0013      	movs	r3, r2
    3838:	2f00      	cmp	r7, #0
    383a:	0034      	movs	r4, r6
    383c:	0e03      	lsrs	r3, r0, #24
    383e:	0b3a      	lsrs	r2, r7, #12
    3840:	053b      	lsls	r3, r7, #20
    3842:	1349      	asrs	r1, r1, #13
    3844:	0d1c      	lsrs	r4, r3, #20
    3846:	0000      	movs	r0, r0
    3848:	8930      	ldrh	r0, [r6, #8]
    384a:	0182      	lsls	r2, r0, #6
    384c:	1100      	asrs	r0, r0, #4
    384e:	3101      	adds	r1, #1
    3850:	0013      	movs	r3, r2
    3852:	3100      	adds	r1, #0
    3854:	8289      	strh	r1, [r1, #20]
    3856:	0001      	movs	r1, r0
    3858:	0111      	lsls	r1, r2, #4
    385a:	4295      	cmp	r5, r2
    385c:	3119      	adds	r1, #25
    385e:	0013      	movs	r3, r2
    3860:	3200      	adds	r2, #0
    3862:	012e      	lsls	r6, r5, #4
    3864:	0e03      	lsrs	r3, r0, #24
    3866:	0b3a      	lsrs	r2, r7, #12
    3868:	053b      	lsls	r3, r7, #20
    386a:	1927      	adds	r7, r4, r4
    386c:	1349      	asrs	r1, r1, #13
    386e:	0b20      	lsrs	r0, r4, #12
    3870:	1301      	asrs	r1, r0, #12
    3872:	0000      	movs	r0, r0
    3874:	0533      	lsls	r3, r6, #20
    3876:	0300      	lsls	r0, r0, #12
    3878:	3a0e      	subs	r2, #14
    387a:	3b0b      	subs	r3, #11
    387c:	4905      	ldr	r1, [pc, #20]	; (0x3894)
    387e:	0013      	movs	r3, r2
    3880:	3400      	adds	r4, #0
    3882:	012e      	lsls	r6, r5, #4
    3884:	0e03      	lsrs	r3, r0, #24
    3886:	0b3a      	lsrs	r2, r7, #12
    3888:	053b      	lsls	r3, r7, #20
    388a:	1927      	adds	r7, r4, r4
    388c:	0b20      	lsrs	r0, r4, #12
    388e:	1301      	asrs	r1, r0, #12
    3890:	0000      	movs	r0, r0
    3892:	2e35      	cmp	r6, #53	; 0x35
    3894:	3f00      	subs	r7, #0
    3896:	0319      	lsls	r1, r3, #12
    3898:	3a0e      	subs	r2, #14
    389a:	3b0b      	subs	r3, #11
    389c:	2705      	movs	r7, #5
    389e:	4919      	ldr	r1, [pc, #100]	; (0x3904)
    38a0:	1113      	asrs	r3, r2, #4
    38a2:	1201      	asrs	r1, r0, #8
    38a4:	4006      	ands	r6, r0
    38a6:	9718      	str	r7, [sp, #96]	; 0x60
    38a8:	1942      	adds	r2, r0, r5
    38aa:	0000      	movs	r0, r0
    38ac:	1d36      	adds	r6, r6, #4
    38ae:	3101      	adds	r1, #1
    38b0:	1113      	asrs	r3, r2, #4
    38b2:	1201      	asrs	r1, r0, #8
    38b4:	5806      	ldr	r6, [r0, r0]
    38b6:	590b      	ldr	r3, [r1, r4]
    38b8:	0105      	lsls	r5, r0, #4
    38ba:	0013      	movs	r3, r2
    38bc:	3700      	adds	r7, #0
    38be:	010b      	lsls	r3, r1, #4
    38c0:	0111      	lsls	r1, r2, #4
    38c2:	0612      	lsls	r2, r2, #24
    38c4:	0000      	movs	r0, r0
    38c6:	3438      	adds	r4, #56	; 0x38
    38c8:	3100      	adds	r1, #0
    38ca:	0013      	movs	r3, r2
    38cc:	3900      	subs	r1, #0
    38ce:	001d      	movs	r5, r3
    38d0:	1331      	asrs	r1, r6, #12
    38d2:	0111      	lsls	r1, r2, #4
    38d4:	0612      	lsls	r2, r2, #24
    38d6:	0b58      	lsrs	r0, r3, #13
    38d8:	0559      	lsls	r1, r3, #21
    38da:	0000      	movs	r0, r0
    38dc:	1d3a      	adds	r2, r7, #4
    38de:	3101      	adds	r1, #1
    38e0:	1113      	asrs	r3, r2, #4
    38e2:	1201      	asrs	r1, r0, #8
    38e4:	5806      	ldr	r6, [r0, r0]
    38e6:	590b      	ldr	r3, [r1, r4]
    38e8:	0005      	movs	r5, r0
    38ea:	3b00      	subs	r3, #0
    38ec:	0005      	movs	r5, r0
    38ee:	1331      	asrs	r1, r6, #12
    38f0:	0000      	movs	r0, r0
    38f2:	2e3c      	cmp	r6, #60	; 0x3c
    38f4:	3f01      	subs	r7, #1
    38f6:	0319      	lsls	r1, r3, #12
    38f8:	3a0e      	subs	r2, #14
    38fa:	3b0b      	subs	r3, #11
    38fc:	270b      	movs	r7, #11
    38fe:	1119      	asrs	r1, r3, #4
    3900:	1201      	asrs	r1, r0, #8
    3902:	4006      	ands	r6, r0
    3904:	9718      	str	r7, [sp, #96]	; 0x60
    3906:	1942      	adds	r2, r0, r5
    3908:	1301      	asrs	r1, r0, #12
    390a:	0000      	movs	r0, r0
    390c:	053d      	lsls	r5, r7, #20
    390e:	0300      	lsls	r0, r0, #12
    3910:	3a0e      	subs	r2, #14
    3912:	3b0b      	subs	r3, #11
    3914:	490b      	ldr	r1, [pc, #44]	; (0x3944)
    3916:	0213      	lsls	r3, r2, #8
    3918:	0017      	movs	r7, r2
    391a:	3e00      	subs	r6, #0
    391c:	0034      	movs	r4, r6
    391e:	0e03      	lsrs	r3, r0, #24
    3920:	0b3a      	lsrs	r2, r7, #12
    3922:	0b3b      	lsrs	r3, r7, #12
    3924:	1349      	asrs	r1, r1, #13
    3926:	1802      	adds	r2, r0, r0
    3928:	0000      	movs	r0, r0
    392a:	343f      	adds	r4, #63	; 0x3f
    392c:	0300      	lsls	r0, r0, #12
    392e:	3a0e      	subs	r2, #14
    3930:	3b0b      	subs	r3, #11
    3932:	490b      	ldr	r1, [pc, #44]	; (0x3960)
    3934:	0213      	lsls	r3, r2, #8
    3936:	0017      	movs	r7, r2
    3938:	4000      	ands	r0, r0
    393a:	0005      	movs	r5, r0
    393c:	1331      	asrs	r1, r6, #12
    393e:	1702      	asrs	r2, r0, #28
    3940:	0000      	movs	r0, r0
    3942:	3441      	adds	r4, #65	; 0x41
    3944:	3100      	adds	r1, #0
    3946:	0213      	lsls	r3, r2, #8
    3948:	0017      	movs	r7, r2
    394a:	4200      	tst	r0, r0
    394c:	0034      	movs	r4, r6
    394e:	1331      	asrs	r1, r6, #12
    3950:	1802      	adds	r2, r0, r0
    3952:	0000      	movs	r0, r0
    3954:	1d43      	adds	r3, r0, #5
    3956:	3101      	adds	r1, #1
    3958:	5213      	strh	r3, [r2, r0]
    395a:	5501      	strb	r1, [r0, r4]
    395c:	5817      	ldr	r7, [r2, r0]
    395e:	590b      	ldr	r3, [r1, r4]
    3960:	0105      	lsls	r5, r0, #4
    3962:	0013      	movs	r3, r2
    3964:	4400      	add	r0, r0
    3966:	010b      	lsls	r3, r1, #4
    3968:	1755      	asrs	r5, r2, #29
    396a:	0000      	movs	r0, r0
    396c:	1d45      	adds	r5, r0, #5
    396e:	3101      	adds	r1, #1
    3970:	5213      	strh	r3, [r2, r0]
    3972:	5501      	strb	r1, [r0, r4]
    3974:	5817      	ldr	r7, [r2, r0]
    3976:	590b      	ldr	r3, [r1, r4]
    3978:	0005      	movs	r5, r0
    397a:	4600      	mov	r0, r0
    397c:	8289      	strh	r1, [r1, #20]
    397e:	0101      	lsls	r1, r0, #4
    3980:	0111      	lsls	r1, r2, #4
    3982:	1331      	asrs	r1, r6, #12
    3984:	1301      	asrs	r1, r0, #12
    3986:	0000      	movs	r0, r0
    3988:	8a47      	ldrh	r7, [r0, #18]
    398a:	0182      	lsls	r2, r0, #6
    398c:	0200      	lsls	r0, r0, #8
    398e:	9118      	str	r1, [sp, #96]	; 0x60
    3990:	1842      	adds	r2, r0, r1
    3992:	0000      	movs	r0, r0
    3994:	8948      	ldrh	r0, [r1, #10]
    3996:	0182      	lsls	r2, r0, #6
    3998:	1101      	asrs	r1, r0, #4
    399a:	3101      	adds	r1, #1
    399c:	0013      	movs	r3, r2
    399e:	4900      	ldr	r1, [pc, #0]	; (0x39a0)
    39a0:	0034      	movs	r4, r6
    39a2:	0e03      	lsrs	r3, r0, #24
    39a4:	0b3a      	lsrs	r2, r7, #12
    39a6:	0b3b      	lsrs	r3, r7, #12
    39a8:	1349      	asrs	r1, r1, #13
    39aa:	071c      	lsls	r4, r3, #28
    39ac:	0000      	movs	r0, r0
    39ae:	1d4a      	adds	r2, r1, #5
    39b0:	3101      	adds	r1, #1
    39b2:	1113      	asrs	r3, r2, #4
    39b4:	1201      	asrs	r1, r0, #8
    39b6:	5806      	ldr	r6, [r0, r0]
    39b8:	590b      	ldr	r3, [r1, r4]
    39ba:	010b      	lsls	r3, r1, #4
    39bc:	0013      	movs	r3, r2
    39be:	4b00      	ldr	r3, [pc, #0]	; (0x39c0)
    39c0:	011d      	lsls	r5, r3, #4
    39c2:	1331      	asrs	r1, r6, #12
    39c4:	0152      	lsls	r2, r2, #5
    39c6:	1755      	asrs	r5, r2, #29
    39c8:	0b58      	lsrs	r0, r3, #13
    39ca:	0b59      	lsrs	r1, r3, #13
    39cc:	1301      	asrs	r1, r0, #12
    39ce:	0000      	movs	r0, r0
    39d0:	2e4c      	cmp	r6, #76	; 0x4c
    39d2:	3f00      	subs	r7, #0
    39d4:	0319      	lsls	r1, r3, #12
    39d6:	3a0e      	subs	r2, #14
    39d8:	3b0b      	subs	r3, #11
    39da:	270b      	movs	r7, #11
    39dc:	1119      	asrs	r1, r3, #4
    39de:	1201      	asrs	r1, r0, #8
    39e0:	4006      	ands	r6, r0
    39e2:	0018      	movs	r0, r3
    39e4:	4d00      	ldr	r5, [pc, #0]	; (0x39e8)
    39e6:	8289      	strh	r1, [r1, #20]
    39e8:	0101      	lsls	r1, r0, #4
    39ea:	0111      	lsls	r1, r2, #4
    39ec:	0000      	movs	r0, r0
    39ee:	054e      	lsls	r6, r1, #21
    39f0:	0300      	lsls	r0, r0, #12
    39f2:	3a08      	subs	r2, #8
    39f4:	3b0b      	subs	r3, #11
    39f6:	4905      	ldr	r1, [pc, #20]	; (0x3a0c)
    39f8:	0013      	movs	r3, r2
    39fa:	4f00      	ldr	r7, [pc, #0]	; (0x39fc)
    39fc:	002e      	movs	r6, r5
    39fe:	0e03      	lsrs	r3, r0, #24
    3a00:	0b3a      	lsrs	r2, r7, #12
    3a02:	0b3b      	lsrs	r3, r7, #12
    3a04:	1927      	adds	r7, r4, r4
    3a06:	0b20      	lsrs	r0, r4, #12
    3a08:	0000      	movs	r0, r0
    3a0a:	2e50      	cmp	r6, #80	; 0x50
    3a0c:	3f00      	subs	r7, #0
    3a0e:	3c19      	subs	r4, #25
    3a10:	6e19      	ldr	r1, [r3, #96]	; 0x60
    3a12:	030e      	lsls	r6, r1, #12
    3a14:	3a0e      	subs	r2, #14
    3a16:	3b0b      	subs	r3, #11
    3a18:	000b      	movs	r3, r1
    3a1a:	5100      	str	r0, [r0, r4]
    3a1c:	002e      	movs	r6, r5
    3a1e:	193f      	adds	r7, r7, r4
    3a20:	193c      	adds	r4, r7, r4
    3a22:	0e6e      	lsrs	r6, r5, #25
    3a24:	0e03      	lsrs	r3, r0, #24
    3a26:	0b3a      	lsrs	r2, r7, #12
    3a28:	053b      	lsls	r3, r7, #20
    3a2a:	0000      	movs	r0, r0
    3a2c:	0000      	movs	r0, r0
    3a2e:	0000      	movs	r0, r0
    3a30:	1000      	asrs	r0, r0, #32
    3a32:	0000      	movs	r0, r0
    3a34:	0100      	lsls	r0, r0, #4
    3a36:	5000      	str	r0, [r0, r0]
    3a38:	0010      	movs	r0, r2
    3a3a:	0000      	movs	r0, r0
    3a3c:	0020      	movs	r0, r4
    3a3e:	0000      	movs	r0, r0
    3a40:	0004      	movs	r4, r0
    3a42:	01f3      	lsls	r3, r6, #7
    3a44:	9f50      	ldr	r7, [sp, #320]	; 0x140
	...
    3a52:	0004      	movs	r4, r0
    3a54:	0000      	movs	r0, r0
    3a56:	0001      	movs	r1, r0
    3a58:	0451      	lsls	r1, r2, #17
    3a5a:	0000      	movs	r0, r0
    3a5c:	2000      	movs	r0, #0
    3a5e:	0000      	movs	r0, r0
    3a60:	0400      	lsls	r0, r0, #16
    3a62:	f300 5101 	ssat	r1, #2, r0, lsl #20
    3a66:	009f      	lsls	r7, r3, #2
    3a68:	0000      	movs	r0, r0
    3a6a:	0000      	movs	r0, r0
    3a6c:	0000      	movs	r0, r0
    3a6e:	0600      	lsls	r0, r0, #24
    3a70:	0000      	movs	r0, r0
    3a72:	0e00      	lsrs	r0, r0, #24
    3a74:	0000      	movs	r0, r0
    3a76:	0100      	lsls	r0, r0, #4
    3a78:	5300      	strh	r0, [r0, r4]
    3a7a:	0012      	movs	r2, r2
    3a7c:	0000      	movs	r0, r0
    3a7e:	0016      	movs	r6, r2
    3a80:	0000      	movs	r0, r0
    3a82:	0001      	movs	r1, r0
    3a84:	1653      	asrs	r3, r2, #25
    3a86:	0000      	movs	r0, r0
    3a88:	2000      	movs	r0, #0
    3a8a:	0000      	movs	r0, r0
    3a8c:	0100      	lsls	r0, r0, #4
    3a8e:	5000      	str	r0, [r0, r0]
	...
    3a9c:	0004      	movs	r4, r0
    3a9e:	0000      	movs	r0, r0
    3aa0:	000f      	movs	r7, r1
    3aa2:	0070      	lsls	r0, r6, #1
    3aa4:	2435      	movs	r4, #53	; 0x35
    3aa6:	ff08 711a 	veor	d7, d8, d10
    3aaa:	3100      	adds	r1, #0
    3aac:	3e24      	subs	r6, #36	; 0x24
    3aae:	211a      	movs	r1, #26
    3ab0:	049f      	lsls	r7, r3, #18
    3ab2:	0000      	movs	r0, r0
    3ab4:	1000      	asrs	r0, r0, #32
    3ab6:	0000      	movs	r0, r0
    3ab8:	1000      	asrs	r0, r0, #32
    3aba:	7000      	strb	r0, [r0, #0]
    3abc:	3500      	adds	r5, #0
    3abe:	0824      	lsrs	r4, r4, #32
    3ac0:	1aff      	subs	r7, r7, r3
    3ac2:	01f3      	lsls	r3, r6, #7
    3ac4:	3151      	adds	r1, #81	; 0x51
    3ac6:	3e24      	subs	r6, #36	; 0x24
    3ac8:	211a      	movs	r1, #26
    3aca:	109f      	asrs	r7, r3, #2
    3acc:	0000      	movs	r0, r0
    3ace:	2000      	movs	r0, #0
    3ad0:	0000      	movs	r0, r0
    3ad2:	1100      	asrs	r0, r0, #4
    3ad4:	f300 5001 	ssat	r0, #2, r0, lsl #20
    3ad8:	2435      	movs	r4, #53	; 0x35
    3ada:	ff08 f31a 	vcge.u8	d15, d8, d10
    3ade:	5101      	str	r1, [r0, r4]
    3ae0:	2431      	movs	r4, #49	; 0x31
    3ae2:	1a3e      	subs	r6, r7, r0
    3ae4:	9f21      	ldr	r7, [sp, #132]	; 0x84
	...
    3aee:	0006      	movs	r6, r0
    3af0:	0000      	movs	r0, r0
    3af2:	0022      	movs	r2, r4
    3af4:	0000      	movs	r0, r0
    3af6:	0001      	movs	r1, r0
    3af8:	0053      	lsls	r3, r2, #1
	...
    3b02:	0000      	movs	r0, r0
    3b04:	0200      	lsls	r0, r0, #8
    3b06:	0000      	movs	r0, r0
    3b08:	0100      	lsls	r0, r0, #4
    3b0a:	5200      	strh	r0, [r0, r0]
    3b0c:	0002      	movs	r2, r0
    3b0e:	0000      	movs	r0, r0
    3b10:	0014      	movs	r4, r2
    3b12:	0000      	movs	r0, r0
    3b14:	0004      	movs	r4, r0
    3b16:	01f3      	lsls	r3, r6, #7
    3b18:	9f52      	ldr	r7, [sp, #328]	; 0x148
	...
    3b26:	0002      	movs	r2, r0
    3b28:	0000      	movs	r0, r0
    3b2a:	000b      	movs	r3, r1
    3b2c:	0070      	lsls	r0, r6, #1
    3b2e:	2431      	movs	r4, #49	; 0x31
    3b30:	0072      	lsls	r2, r6, #1
    3b32:	081c      	lsrs	r4, r3, #32
    3b34:	1c82      	adds	r2, r0, #2
    3b36:	029f      	lsls	r7, r3, #10
    3b38:	0000      	movs	r0, r0
    3b3a:	1400      	asrs	r0, r0, #16
    3b3c:	0000      	movs	r0, r0
    3b3e:	0c00      	lsrs	r0, r0, #16
    3b40:	7000      	strb	r0, [r0, #0]
    3b42:	3100      	adds	r1, #0
    3b44:	f324 5201 	ssat	r2, #2, r4, asr #20
    3b48:	081c      	lsrs	r4, r3, #32
    3b4a:	1c82      	adds	r2, r0, #2
    3b4c:	009f      	lsls	r7, r3, #2
    3b4e:	0000      	movs	r0, r0
    3b50:	0000      	movs	r0, r0
    3b52:	0000      	movs	r0, r0
    3b54:	0400      	lsls	r0, r0, #16
    3b56:	0000      	movs	r0, r0
    3b58:	0800      	lsrs	r0, r0, #32
    3b5a:	0000      	movs	r0, r0
    3b5c:	0100      	lsls	r0, r0, #4
    3b5e:	5300      	strh	r0, [r0, r4]
    3b60:	000c      	movs	r4, r1
    3b62:	0000      	movs	r0, r0
    3b64:	0014      	movs	r4, r2
    3b66:	0000      	movs	r0, r0
    3b68:	0001      	movs	r1, r0
    3b6a:	0053      	lsls	r3, r2, #1
	...
    3b74:	0000      	movs	r0, r0
    3b76:	0500      	lsls	r0, r0, #20
    3b78:	0000      	movs	r0, r0
    3b7a:	0100      	lsls	r0, r0, #4
    3b7c:	5100      	str	r0, [r0, r4]
    3b7e:	0005      	movs	r5, r0
    3b80:	0000      	movs	r0, r0
    3b82:	0024      	movs	r4, r4
    3b84:	0000      	movs	r0, r0
    3b86:	0004      	movs	r4, r0
    3b88:	01f3      	lsls	r3, r6, #7
    3b8a:	9f51      	ldr	r7, [sp, #324]	; 0x144
	...
    3b98:	0005      	movs	r5, r0
    3b9a:	0000      	movs	r0, r0
    3b9c:	0001      	movs	r1, r0
    3b9e:	0552      	lsls	r2, r2, #21
    3ba0:	0000      	movs	r0, r0
    3ba2:	2400      	movs	r4, #0
    3ba4:	0000      	movs	r0, r0
    3ba6:	0400      	lsls	r0, r0, #16
    3ba8:	f300 5201 	ssat	r2, #2, r0, lsl #20
    3bac:	009f      	lsls	r7, r3, #2
    3bae:	0000      	movs	r0, r0
    3bb0:	0000      	movs	r0, r0
    3bb2:	0000      	movs	r0, r0
    3bb4:	0a00      	lsrs	r0, r0, #8
    3bb6:	0000      	movs	r0, r0
    3bb8:	0e00      	lsrs	r0, r0, #24
    3bba:	0000      	movs	r0, r0
    3bbc:	0100      	lsls	r0, r0, #4
    3bbe:	5300      	strh	r0, [r0, r4]
    3bc0:	0012      	movs	r2, r2
    3bc2:	0000      	movs	r0, r0
    3bc4:	0016      	movs	r6, r2
    3bc6:	0000      	movs	r0, r0
    3bc8:	0001      	movs	r1, r0
    3bca:	1a53      	subs	r3, r2, r1
    3bcc:	0000      	movs	r0, r0
    3bce:	1e00      	subs	r0, r0, #0
    3bd0:	0000      	movs	r0, r0
    3bd2:	0100      	lsls	r0, r0, #4
    3bd4:	5300      	strh	r0, [r0, r4]
    3bd6:	001e      	movs	r6, r3
    3bd8:	0000      	movs	r0, r0
    3bda:	0024      	movs	r4, r4
    3bdc:	0000      	movs	r0, r0
    3bde:	0002      	movs	r2, r0
    3be0:	2072      	movs	r0, #114	; 0x72
	...
    3bee:	000a      	movs	r2, r1
    3bf0:	0000      	movs	r0, r0
    3bf2:	0001      	movs	r1, r0
    3bf4:	0a50      	lsrs	r0, r2, #9
    3bf6:	0000      	movs	r0, r0
    3bf8:	0e00      	lsrs	r0, r0, #24
    3bfa:	0000      	movs	r0, r0
    3bfc:	0400      	lsls	r0, r0, #16
    3bfe:	f300 5001 	ssat	r0, #2, r0, lsl #20
    3c02:	0e9f      	lsrs	r7, r3, #26
    3c04:	0000      	movs	r0, r0
    3c06:	1800      	adds	r0, r0, r0
    3c08:	0000      	movs	r0, r0
    3c0a:	0100      	lsls	r0, r0, #4
    3c0c:	5000      	str	r0, [r0, r0]
    3c0e:	0018      	movs	r0, r3
    3c10:	0000      	movs	r0, r0
    3c12:	0028      	movs	r0, r5
    3c14:	0000      	movs	r0, r0
    3c16:	0004      	movs	r4, r0
    3c18:	01f3      	lsls	r3, r6, #7
    3c1a:	9f50      	ldr	r7, [sp, #320]	; 0x140
	...
    3c28:	0060      	lsls	r0, r4, #1
    3c2a:	0000      	movs	r0, r0
    3c2c:	0001      	movs	r1, r0
    3c2e:	6050      	str	r0, [r2, #4]
    3c30:	0000      	movs	r0, r0
    3c32:	7e00      	ldrb	r0, [r0, #24]
    3c34:	0000      	movs	r0, r0
    3c36:	0400      	lsls	r0, r0, #16
    3c38:	f300 5001 	ssat	r0, #2, r0, lsl #20
    3c3c:	7e9f      	ldrb	r7, [r3, #26]
    3c3e:	0000      	movs	r0, r0
    3c40:	c000      	stmia	r0!, {}
    3c42:	0000      	movs	r0, r0
    3c44:	0100      	lsls	r0, r0, #4
    3c46:	5000      	str	r0, [r0, r0]
	...
    3c54:	005c      	lsls	r4, r3, #1
    3c56:	0000      	movs	r0, r0
    3c58:	0002      	movs	r2, r0
    3c5a:	9f48      	ldr	r7, [sp, #288]	; 0x120
    3c5c:	005c      	lsls	r4, r3, #1
    3c5e:	0000      	movs	r0, r0
    3c60:	006a      	lsls	r2, r5, #1
    3c62:	0000      	movs	r0, r0
    3c64:	0001      	movs	r1, r0
    3c66:	7e51      	ldrb	r1, [r2, #25]
    3c68:	0000      	movs	r0, r0
    3c6a:	c000      	stmia	r0!, {}
    3c6c:	0000      	movs	r0, r0
    3c6e:	0200      	lsls	r0, r0, #8
    3c70:	4800      	ldr	r0, [pc, #0]	; (0x3c74)
    3c72:	009f      	lsls	r7, r3, #2
	...
    3c7c:	0000      	movs	r0, r0
    3c7e:	5c00      	ldrb	r0, [r0, r0]
    3c80:	0000      	movs	r0, r0
    3c82:	0200      	lsls	r0, r0, #8
    3c84:	4d00      	ldr	r5, [pc, #0]	; (0x3c88)
    3c86:	5c9f      	ldrb	r7, [r3, r2]
    3c88:	0000      	movs	r0, r0
    3c8a:	6e00      	ldr	r0, [r0, #96]	; 0x60
    3c8c:	0000      	movs	r0, r0
    3c8e:	0100      	lsls	r0, r0, #4
    3c90:	5200      	strh	r0, [r0, r0]
    3c92:	007e      	lsls	r6, r7, #1
    3c94:	0000      	movs	r0, r0
    3c96:	00c0      	lsls	r0, r0, #3
    3c98:	0000      	movs	r0, r0
    3c9a:	0002      	movs	r2, r0
    3c9c:	9f4d      	ldr	r7, [sp, #308]	; 0x134
	...
    3caa:	005c      	lsls	r4, r3, #1
    3cac:	0000      	movs	r0, r0
    3cae:	0002      	movs	r2, r0
    3cb0:	9f36      	ldr	r7, [sp, #216]	; 0xd8
    3cb2:	005c      	lsls	r4, r3, #1
    3cb4:	0000      	movs	r0, r0
    3cb6:	007a      	lsls	r2, r7, #1
    3cb8:	0000      	movs	r0, r0
    3cba:	0001      	movs	r1, r0
    3cbc:	7e53      	ldrb	r3, [r2, #25]
    3cbe:	0000      	movs	r0, r0
    3cc0:	c000      	stmia	r0!, {}
    3cc2:	0000      	movs	r0, r0
    3cc4:	0200      	lsls	r0, r0, #8
    3cc6:	3600      	adds	r6, #0
    3cc8:	009f      	lsls	r7, r3, #2
	...
    3cd2:	0000      	movs	r0, r0
    3cd4:	1200      	asrs	r0, r0, #8
    3cd6:	0000      	movs	r0, r0
    3cd8:	0100      	lsls	r0, r0, #4
    3cda:	5000      	str	r0, [r0, r0]
    3cdc:	0012      	movs	r2, r2
    3cde:	0000      	movs	r0, r0
    3ce0:	00ea      	lsls	r2, r5, #3
    3ce2:	0000      	movs	r0, r0
    3ce4:	0001      	movs	r1, r0
    3ce6:	ea58 0000 	orrs.w	r0, r8, r0
    3cea:	0600      	lsls	r0, r0, #24
    3cec:	0001      	movs	r1, r0
    3cee:	0400      	lsls	r0, r0, #16
    3cf0:	f300 5001 	ssat	r0, #2, r0, lsl #20
    3cf4:	069f      	lsls	r7, r3, #26
    3cf6:	0001      	movs	r1, r0
    3cf8:	7400      	strb	r0, [r0, #16]
    3cfa:	0001      	movs	r1, r0
    3cfc:	0100      	lsls	r0, r0, #4
    3cfe:	5800      	ldr	r0, [r0, r0]
	...
    3d0c:	000e      	movs	r6, r1
    3d0e:	0000      	movs	r0, r0
    3d10:	0001      	movs	r1, r0
    3d12:	0e51      	lsrs	r1, r2, #25
    3d14:	0000      	movs	r0, r0
    3d16:	3200      	adds	r2, #0
    3d18:	0000      	movs	r0, r0
    3d1a:	0100      	lsls	r0, r0, #4
    3d1c:	5700      	ldrsb	r0, [r0, r4]
    3d1e:	0032      	movs	r2, r6
    3d20:	0000      	movs	r0, r0
    3d22:	003c      	movs	r4, r7
    3d24:	0000      	movs	r0, r0
    3d26:	0003      	movs	r3, r0
    3d28:	a891      	add	r0, sp, #580	; 0x244
    3d2a:	3c7f      	subs	r4, #127	; 0x7f
    3d2c:	0000      	movs	r0, r0
    3d2e:	7400      	strb	r0, [r0, #16]
    3d30:	0001      	movs	r1, r0
    3d32:	0400      	lsls	r0, r0, #16
    3d34:	f300 5101 	ssat	r1, #2, r0, lsl #20
    3d38:	009f      	lsls	r7, r3, #2
	...
    3d42:	0000      	movs	r0, r0
    3d44:	1000      	asrs	r0, r0, #32
    3d46:	0000      	movs	r0, r0
    3d48:	0600      	lsls	r0, r0, #24
    3d4a:	5200      	strh	r0, [r0, r0]
    3d4c:	0493      	lsls	r3, r2, #18
    3d4e:	9353      	str	r3, [sp, #332]	; 0x14c
    3d50:	1004      	asrs	r4, r0, #32
    3d52:	0000      	movs	r0, r0
    3d54:	7400      	strb	r0, [r0, #16]
    3d56:	0001      	movs	r1, r0
    3d58:	0600      	lsls	r0, r0, #24
    3d5a:	f300 f503 	bl	0x704764
    3d5e:	2502      	movs	r5, #2
    3d60:	009f      	lsls	r7, r3, #2
	...
    3d6a:	0000      	movs	r0, r0
    3d6c:	8e00      	ldrh	r0, [r0, #48]	; 0x30
    3d6e:	0000      	movs	r0, r0
    3d70:	0200      	lsls	r0, r0, #8
    3d72:	9100      	str	r1, [sp, #0]
	...
    3d7c:	da00      	bge.n	0x3d80
    3d7e:	0000      	movs	r0, r0
    3d80:	f600 0000 	addw	r0, r0, #2048	; 0x800
    3d84:	0800      	lsrs	r0, r0, #32
    3d86:	7500      	strb	r0, [r0, #20]
    3d88:	4000      	ands	r0, r0
    3d8a:	244b      	movs	r4, #75	; 0x4b
    3d8c:	1a1f      	subs	r7, r3, r0
    3d8e:	f69f 0000 			; <UNDEFINED> instruction: 0xf69f0000
    3d92:	f800 0000 	strb.w	r0, [r0, r0]
    3d96:	0100      	lsls	r0, r0, #4
    3d98:	5500      	strb	r0, [r0, r4]
	...
    3da2:	00ea      	lsls	r2, r5, #3
    3da4:	0000      	movs	r0, r0
    3da6:	0106      	lsls	r6, r0, #4
    3da8:	0000      	movs	r0, r0
    3daa:	0001      	movs	r1, r0
    3dac:	0058      	lsls	r0, r3, #1
    3dae:	0000      	movs	r0, r0
    3db0:	0000      	movs	r0, r0
    3db2:	0000      	movs	r0, r0
    3db4:	ec00 0000 	stc	0, cr0, [r0], {-0}
    3db8:	0600      	lsls	r0, r0, #24
    3dba:	0001      	movs	r1, r0
    3dbc:	0100      	lsls	r0, r0, #4
    3dbe:	5700      	ldrsb	r0, [r0, r4]
	...
    3dc8:	003c      	movs	r4, r7
    3dca:	0000      	movs	r0, r0
    3dcc:	0052      	lsls	r2, r2, #1
    3dce:	0000      	movs	r0, r0
    3dd0:	0002      	movs	r2, r0
    3dd2:	9f30      	ldr	r7, [sp, #192]	; 0xc0
	...
    3ddc:	003c      	movs	r4, r7
    3dde:	0000      	movs	r0, r0
    3de0:	0052      	lsls	r2, r2, #1
    3de2:	0000      	movs	r0, r0
    3de4:	0002      	movs	r2, r0
    3de6:	9f33      	ldr	r7, [sp, #204]	; 0xcc
	...
    3df0:	0040      	lsls	r0, r0, #1
    3df2:	0000      	movs	r0, r0
    3df4:	0046      	lsls	r6, r0, #1
    3df6:	0000      	movs	r0, r0
    3df8:	0001      	movs	r1, r0
    3dfa:	0052      	lsls	r2, r2, #1
    3dfc:	0000      	movs	r0, r0
    3dfe:	0000      	movs	r0, r0
    3e00:	0000      	movs	r0, r0
    3e02:	8a00      	ldrh	r0, [r0, #16]
    3e04:	0000      	movs	r0, r0
    3e06:	d400      	bmi.n	0x3e0a
    3e08:	0000      	movs	r0, r0
    3e0a:	0100      	lsls	r0, r0, #4
    3e0c:	5600      	ldrsb	r0, [r0, r0]
    3e0e:	0106      	lsls	r6, r0, #4
    3e10:	0000      	movs	r0, r0
    3e12:	0174      	lsls	r4, r6, #5
    3e14:	0000      	movs	r0, r0
    3e16:	0001      	movs	r1, r0
    3e18:	0056      	lsls	r6, r2, #1
    3e1a:	0000      	movs	r0, r0
    3e1c:	0000      	movs	r0, r0
    3e1e:	0000      	movs	r0, r0
    3e20:	8e00      	ldrh	r0, [r0, #48]	; 0x30
    3e22:	0000      	movs	r0, r0
    3e24:	a200      	add	r2, pc, #0	; (adr r2, 0x3e28)
    3e26:	0000      	movs	r0, r0
    3e28:	0500      	lsls	r0, r0, #20
    3e2a:	7600      	strb	r0, [r0, #24]
    3e2c:	3300      	adds	r3, #0
    3e2e:	9f1a      	ldr	r7, [sp, #104]	; 0x68
    3e30:	00a2      	lsls	r2, r4, #2
    3e32:	0000      	movs	r0, r0
    3e34:	00ac      	lsls	r4, r5, #2
    3e36:	0000      	movs	r0, r0
    3e38:	0005      	movs	r5, r0
    3e3a:	0072      	lsls	r2, r6, #1
    3e3c:	1a33      	subs	r3, r6, r0
    3e3e:	ac9f      	add	r4, sp, #636	; 0x27c
    3e40:	0000      	movs	r0, r0
    3e42:	b000      	add	sp, #0
    3e44:	0000      	movs	r0, r0
    3e46:	0700      	lsls	r0, r0, #28
    3e48:	7600      	strb	r0, [r0, #24]
    3e4a:	3200      	adds	r2, #0
    3e4c:	3325      	adds	r3, #37	; 0x25
    3e4e:	9f1a      	ldr	r7, [sp, #104]	; 0x68
    3e50:	00b0      	lsls	r0, r6, #2
    3e52:	0000      	movs	r0, r0
    3e54:	00ba      	lsls	r2, r7, #2
    3e56:	0000      	movs	r0, r0
    3e58:	0005      	movs	r5, r0
    3e5a:	0072      	lsls	r2, r6, #1
    3e5c:	1a33      	subs	r3, r6, r0
    3e5e:	ba9f      	hlt	0x001f
    3e60:	0000      	movs	r0, r0
    3e62:	c000      	stmia	r0!, {}
    3e64:	0000      	movs	r0, r0
    3e66:	0700      	lsls	r0, r0, #28
    3e68:	7600      	strb	r0, [r0, #24]
    3e6a:	3400      	adds	r4, #0
    3e6c:	3325      	adds	r3, #37	; 0x25
    3e6e:	9f1a      	ldr	r7, [sp, #104]	; 0x68
    3e70:	00c0      	lsls	r0, r0, #3
    3e72:	0000      	movs	r0, r0
    3e74:	00ca      	lsls	r2, r1, #3
    3e76:	0000      	movs	r0, r0
    3e78:	0005      	movs	r5, r0
    3e7a:	0072      	lsls	r2, r6, #1
    3e7c:	1a33      	subs	r3, r6, r0
    3e7e:	ca9f      	ldmia	r2, {r0, r1, r2, r3, r4, r7}
    3e80:	0000      	movs	r0, r0
    3e82:	d400      	bmi.n	0x3e86
    3e84:	0000      	movs	r0, r0
    3e86:	0700      	lsls	r0, r0, #28
    3e88:	7600      	strb	r0, [r0, #24]
    3e8a:	3600      	adds	r6, #0
    3e8c:	3325      	adds	r3, #37	; 0x25
    3e8e:	9f1a      	ldr	r7, [sp, #104]	; 0x68
    3e90:	0106      	lsls	r6, r0, #4
    3e92:	0000      	movs	r0, r0
    3e94:	011e      	lsls	r6, r3, #4
    3e96:	0000      	movs	r0, r0
    3e98:	0005      	movs	r5, r0
    3e9a:	0076      	lsls	r6, r6, #1
    3e9c:	1a33      	subs	r3, r6, r0
    3e9e:	1e9f      	subs	r7, r3, #2
    3ea0:	0001      	movs	r1, r0
    3ea2:	2200      	movs	r2, #0
    3ea4:	0001      	movs	r1, r0
    3ea6:	0500      	lsls	r0, r0, #20
    3ea8:	7200      	strb	r0, [r0, #8]
    3eaa:	3300      	adds	r3, #0
    3eac:	9f1a      	ldr	r7, [sp, #104]	; 0x68
    3eae:	0122      	lsls	r2, r4, #4
    3eb0:	0000      	movs	r0, r0
    3eb2:	0134      	lsls	r4, r6, #4
    3eb4:	0000      	movs	r0, r0
    3eb6:	0007      	movs	r7, r0
    3eb8:	0076      	lsls	r6, r6, #1
    3eba:	2532      	movs	r5, #50	; 0x32
    3ebc:	1a33      	subs	r3, r6, r0
    3ebe:	349f      	adds	r4, #159	; 0x9f
    3ec0:	0001      	movs	r1, r0
    3ec2:	3800      	subs	r0, #0
    3ec4:	0001      	movs	r1, r0
    3ec6:	0500      	lsls	r0, r0, #20
    3ec8:	7200      	strb	r0, [r0, #8]
    3eca:	3300      	adds	r3, #0
    3ecc:	9f1a      	ldr	r7, [sp, #104]	; 0x68
    3ece:	0138      	lsls	r0, r7, #4
    3ed0:	0000      	movs	r0, r0
    3ed2:	014c      	lsls	r4, r1, #5
    3ed4:	0000      	movs	r0, r0
    3ed6:	0007      	movs	r7, r0
    3ed8:	0076      	lsls	r6, r6, #1
    3eda:	2534      	movs	r5, #52	; 0x34
    3edc:	1a33      	subs	r3, r6, r0
    3ede:	4c9f      	ldr	r4, [pc, #636]	; (0x415c)
    3ee0:	0001      	movs	r1, r0
    3ee2:	5000      	str	r0, [r0, r0]
    3ee4:	0001      	movs	r1, r0
    3ee6:	0500      	lsls	r0, r0, #20
    3ee8:	7200      	strb	r0, [r0, #8]
    3eea:	3300      	adds	r3, #0
    3eec:	9f1a      	ldr	r7, [sp, #104]	; 0x68
    3eee:	0150      	lsls	r0, r2, #5
    3ef0:	0000      	movs	r0, r0
    3ef2:	0174      	lsls	r4, r6, #5
    3ef4:	0000      	movs	r0, r0
    3ef6:	0007      	movs	r7, r0
    3ef8:	0076      	lsls	r6, r6, #1
    3efa:	2536      	movs	r5, #54	; 0x36
    3efc:	1a33      	subs	r3, r6, r0
    3efe:	009f      	lsls	r7, r3, #2
    3f00:	0000      	movs	r0, r0
    3f02:	0000      	movs	r0, r0
    3f04:	0000      	movs	r0, r0
    3f06:	8e00      	ldrh	r0, [r0, #48]	; 0x30
    3f08:	0000      	movs	r0, r0
    3f0a:	a000      	add	r0, pc, #0	; (adr r0, 0x3f0c)
    3f0c:	0000      	movs	r0, r0
    3f0e:	0200      	lsls	r0, r0, #8
    3f10:	3000      	adds	r0, #0
    3f12:	a09f      	add	r0, pc, #636	; (adr r0, 0x4190)
    3f14:	0000      	movs	r0, r0
    3f16:	d600      	bvs.n	0x3f1a
    3f18:	0000      	movs	r0, r0
    3f1a:	0100      	lsls	r0, r0, #4
    3f1c:	5300      	strh	r0, [r0, r4]
    3f1e:	0106      	lsls	r6, r0, #4
    3f20:	0000      	movs	r0, r0
    3f22:	0118      	lsls	r0, r3, #4
    3f24:	0000      	movs	r0, r0
    3f26:	0002      	movs	r2, r0
    3f28:	9f30      	ldr	r7, [sp, #192]	; 0xc0
    3f2a:	0118      	lsls	r0, r3, #4
    3f2c:	0000      	movs	r0, r0
    3f2e:	011e      	lsls	r6, r3, #4
    3f30:	0000      	movs	r0, r0
    3f32:	0004      	movs	r4, r0
    3f34:	000a      	movs	r2, r1
    3f36:	9f01      	ldr	r7, [sp, #4]
    3f38:	011e      	lsls	r6, r3, #4
    3f3a:	0000      	movs	r0, r0
    3f3c:	012c      	lsls	r4, r5, #4
    3f3e:	0000      	movs	r0, r0
    3f40:	0001      	movs	r1, r0
    3f42:	2e53      	cmp	r6, #83	; 0x53
    3f44:	0001      	movs	r1, r0
    3f46:	3400      	adds	r4, #0
    3f48:	0001      	movs	r1, r0
    3f4a:	0400      	lsls	r0, r0, #16
    3f4c:	0a00      	lsrs	r0, r0, #8
    3f4e:	0200      	lsls	r0, r0, #8
    3f50:	349f      	adds	r4, #159	; 0x9f
    3f52:	0001      	movs	r1, r0
    3f54:	4200      	tst	r0, r0
    3f56:	0001      	movs	r1, r0
    3f58:	0100      	lsls	r0, r0, #4
    3f5a:	5300      	strh	r0, [r0, r4]
    3f5c:	0146      	lsls	r6, r0, #5
    3f5e:	0000      	movs	r0, r0
    3f60:	014c      	lsls	r4, r1, #5
    3f62:	0000      	movs	r0, r0
    3f64:	0004      	movs	r4, r0
    3f66:	000a      	movs	r2, r1
    3f68:	9f04      	ldr	r7, [sp, #16]
    3f6a:	014c      	lsls	r4, r1, #5
    3f6c:	0000      	movs	r0, r0
    3f6e:	015a      	lsls	r2, r3, #5
    3f70:	0000      	movs	r0, r0
    3f72:	0001      	movs	r1, r0
    3f74:	5e53      	ldrsh	r3, [r2, r1]
    3f76:	0001      	movs	r1, r0
    3f78:	7400      	strb	r0, [r0, #16]
    3f7a:	0001      	movs	r1, r0
    3f7c:	0400      	lsls	r0, r0, #16
    3f7e:	0a00      	lsrs	r0, r0, #8
    3f80:	0800      	lsrs	r0, r0, #32
    3f82:	009f      	lsls	r7, r3, #2
    3f84:	0000      	movs	r0, r0
    3f86:	0000      	movs	r0, r0
    3f88:	0000      	movs	r0, r0
    3f8a:	8a00      	ldrh	r0, [r0, #16]
    3f8c:	0000      	movs	r0, r0
    3f8e:	8e00      	ldrh	r0, [r0, #48]	; 0x30
    3f90:	0000      	movs	r0, r0
    3f92:	0200      	lsls	r0, r0, #8
    3f94:	3d00      	subs	r5, #0
    3f96:	009f      	lsls	r7, r3, #2
    3f98:	0000      	movs	r0, r0
    3f9a:	0000      	movs	r0, r0
    3f9c:	0000      	movs	r0, r0
    3f9e:	8a00      	ldrh	r0, [r0, #16]
    3fa0:	0000      	movs	r0, r0
    3fa2:	8e00      	ldrh	r0, [r0, #48]	; 0x30
    3fa4:	0000      	movs	r0, r0
    3fa6:	0200      	lsls	r0, r0, #8
    3fa8:	3000      	adds	r0, #0
    3faa:	009f      	lsls	r7, r3, #2
	...
    3fb4:	0000      	movs	r0, r0
    3fb6:	1200      	asrs	r0, r0, #8
    3fb8:	0000      	movs	r0, r0
    3fba:	0100      	lsls	r0, r0, #4
    3fbc:	5000      	str	r0, [r0, r0]
    3fbe:	0012      	movs	r2, r2
    3fc0:	0000      	movs	r0, r0
    3fc2:	0026      	movs	r6, r4
    3fc4:	0000      	movs	r0, r0
    3fc6:	0001      	movs	r1, r0
    3fc8:	2655      	movs	r6, #85	; 0x55
    3fca:	0000      	movs	r0, r0
    3fcc:	4800      	ldr	r0, [pc, #0]	; (0x3fd0)
    3fce:	0001      	movs	r1, r0
    3fd0:	0400      	lsls	r0, r0, #16
    3fd2:	f300 5001 	ssat	r0, #2, r0, lsl #20
    3fd6:	009f      	lsls	r7, r3, #2
	...
    3fe0:	0000      	movs	r0, r0
    3fe2:	0e00      	lsrs	r0, r0, #24
    3fe4:	0000      	movs	r0, r0
    3fe6:	0100      	lsls	r0, r0, #4
    3fe8:	5100      	str	r0, [r0, r4]
    3fea:	000e      	movs	r6, r1
    3fec:	0000      	movs	r0, r0
    3fee:	002e      	movs	r6, r5
    3ff0:	0000      	movs	r0, r0
    3ff2:	0001      	movs	r1, r0
    3ff4:	2e54      	cmp	r6, #84	; 0x54
    3ff6:	0000      	movs	r0, r0
    3ff8:	3800      	subs	r0, #0
    3ffa:	0000      	movs	r0, r0
    3ffc:	0300      	lsls	r0, r0, #12
    3ffe:	9100      	str	r1, [sp, #0]
    4000:	7fa0      	ldrb	r0, [r4, #30]
    4002:	0038      	movs	r0, r7
    4004:	0000      	movs	r0, r0
    4006:	0148      	lsls	r0, r1, #5
    4008:	0000      	movs	r0, r0
    400a:	0004      	movs	r4, r0
    400c:	01f3      	lsls	r3, r6, #7
    400e:	9f51      	ldr	r7, [sp, #324]	; 0x144
	...
    401c:	0010      	movs	r0, r2
    401e:	0000      	movs	r0, r0
    4020:	0006      	movs	r6, r0
    4022:	9352      	str	r3, [sp, #328]	; 0x148
    4024:	5304      	strh	r4, [r0, r4]
    4026:	0493      	lsls	r3, r2, #18
    4028:	0010      	movs	r0, r2
    402a:	0000      	movs	r0, r0
    402c:	0148      	lsls	r0, r1, #5
    402e:	0000      	movs	r0, r0
    4030:	0006      	movs	r6, r0
    4032:	03f3      	lsls	r3, r6, #15
    4034:	02f5      	lsls	r5, r6, #11
    4036:	9f25      	ldr	r7, [sp, #148]	; 0x94
	...
    4044:	00c8      	lsls	r0, r1, #3
    4046:	0000      	movs	r0, r0
    4048:	0002      	movs	r2, r0
    404a:	0091      	lsls	r1, r2, #2
	...
    4054:	00bc      	lsls	r4, r7, #2
    4056:	0000      	movs	r0, r0
    4058:	00e4      	lsls	r4, r4, #3
    405a:	0000      	movs	r0, r0
    405c:	0008      	movs	r0, r1
    405e:	0075      	lsls	r5, r6, #1
    4060:	4b40      	ldr	r3, [pc, #256]	; (0x4164)
    4062:	1f24      	subs	r4, r4, #4
    4064:	9f1a      	ldr	r7, [sp, #104]	; 0x68
    4066:	00e4      	lsls	r4, r4, #3
    4068:	0000      	movs	r0, r0
    406a:	00e6      	lsls	r6, r4, #3
    406c:	0000      	movs	r0, r0
    406e:	0001      	movs	r1, r0
    4070:	0055      	lsls	r5, r2, #1
    4072:	0000      	movs	r0, r0
    4074:	0000      	movs	r0, r0
    4076:	0000      	movs	r0, r0
    4078:	d400      	bmi.n	0x407c
    407a:	0000      	movs	r0, r0
    407c:	d900      	bls.n	0x4080
    407e:	0000      	movs	r0, r0
    4080:	0100      	lsls	r0, r0, #4
    4082:	5100      	str	r0, [r0, r4]
    4084:	00d9      	lsls	r1, r3, #3
    4086:	0000      	movs	r0, r0
    4088:	012c      	lsls	r4, r5, #4
    408a:	0000      	movs	r0, r0
    408c:	0003      	movs	r3, r0
    408e:	9491      	str	r4, [sp, #580]	; 0x244
    4090:	2c7f      	cmp	r4, #127	; 0x7f
    4092:	0001      	movs	r1, r0
    4094:	4800      	ldr	r0, [pc, #0]	; (0x4098)
    4096:	0001      	movs	r1, r0
    4098:	0300      	lsls	r0, r0, #12
    409a:	7d00      	ldrb	r0, [r0, #20]
    409c:	7f94      	ldrb	r4, [r2, #30]
	...
    40a6:	00d6      	lsls	r6, r2, #3
    40a8:	0000      	movs	r0, r0
    40aa:	00d9      	lsls	r1, r3, #3
    40ac:	0000      	movs	r0, r0
    40ae:	0001      	movs	r1, r0
    40b0:	d952      	bls.n	0x4158
    40b2:	0000      	movs	r0, r0
    40b4:	2c00      	cmp	r4, #0
    40b6:	0001      	movs	r1, r0
    40b8:	0300      	lsls	r0, r0, #12
    40ba:	9100      	str	r1, [sp, #0]
    40bc:	7f90      	ldrb	r0, [r2, #30]
    40be:	012c      	lsls	r4, r5, #4
    40c0:	0000      	movs	r0, r0
    40c2:	0148      	lsls	r0, r1, #5
    40c4:	0000      	movs	r0, r0
    40c6:	0003      	movs	r3, r0
    40c8:	907d      	str	r0, [sp, #500]	; 0x1f4
    40ca:	007f      	lsls	r7, r7, #1
    40cc:	0000      	movs	r0, r0
    40ce:	0000      	movs	r0, r0
    40d0:	0000      	movs	r0, r0
    40d2:	7000      	strb	r0, [r0, #0]
    40d4:	0000      	movs	r0, r0
    40d6:	7400      	strb	r0, [r0, #16]
    40d8:	0000      	movs	r0, r0
    40da:	0500      	lsls	r0, r0, #20
    40dc:	5b00      	ldrh	r0, [r0, r4]
    40de:	0493      	lsls	r3, r2, #18
    40e0:	2c93      	cmp	r4, #147	; 0x93
    40e2:	0074      	lsls	r4, r6, #1
    40e4:	0000      	movs	r0, r0
    40e6:	0078      	lsls	r0, r7, #1
    40e8:	0000      	movs	r0, r0
    40ea:	0008      	movs	r0, r1
    40ec:	935b      	str	r3, [sp, #364]	; 0x16c
    40ee:	5a04      	ldrh	r4, [r0, r0]
    40f0:	0493      	lsls	r3, r2, #18
    40f2:	2893      	cmp	r0, #147	; 0x93
    40f4:	0078      	lsls	r0, r7, #1
    40f6:	0000      	movs	r0, r0
    40f8:	007a      	lsls	r2, r7, #1
    40fa:	0000      	movs	r0, r0
    40fc:	000b      	movs	r3, r1
    40fe:	935b      	str	r3, [sp, #364]	; 0x16c
    4100:	5a04      	ldrh	r4, [r0, r0]
    4102:	0493      	lsls	r3, r2, #18
    4104:	9352      	str	r3, [sp, #328]	; 0x148
    4106:	9304      	str	r3, [sp, #16]
    4108:	7a24      	ldrb	r4, [r4, #8]
    410a:	0000      	movs	r0, r0
    410c:	7e00      	ldrb	r0, [r0, #24]
    410e:	0000      	movs	r0, r0
    4110:	0c00      	lsrs	r0, r0, #16
    4112:	5b00      	ldrh	r0, [r0, r4]
    4114:	0493      	lsls	r3, r2, #18
    4116:	935a      	str	r3, [sp, #360]	; 0x168
    4118:	7d04      	ldrb	r4, [r0, #20]
    411a:	9300      	str	r3, [sp, #0]
    411c:	9304      	str	r3, [sp, #16]
    411e:	7e24      	ldrb	r4, [r4, #24]
    4120:	0000      	movs	r0, r0
    4122:	8000      	strh	r0, [r0, #0]
    4124:	0000      	movs	r0, r0
    4126:	1200      	asrs	r0, r0, #8
    4128:	5b00      	ldrh	r0, [r0, r4]
    412a:	0493      	lsls	r3, r2, #18
    412c:	935a      	str	r3, [sp, #360]	; 0x168
    412e:	7d04      	ldrb	r4, [r0, #20]
    4130:	9300      	str	r3, [sp, #0]
    4132:	5204      	strh	r4, [r0, r0]
    4134:	0493      	lsls	r3, r2, #18
    4136:	9357      	str	r3, [sp, #348]	; 0x15c
    4138:	9304      	str	r3, [sp, #16]
    413a:	801c      	strh	r4, [r3, #0]
    413c:	0000      	movs	r0, r0
    413e:	8200      	strh	r0, [r0, #16]
    4140:	0000      	movs	r0, r0
    4142:	1500      	asrs	r0, r0, #20
    4144:	5b00      	ldrh	r0, [r0, r4]
    4146:	0493      	lsls	r3, r2, #18
    4148:	935a      	str	r3, [sp, #360]	; 0x168
    414a:	7d04      	ldrb	r4, [r0, #20]
    414c:	9300      	str	r3, [sp, #0]
    414e:	5204      	strh	r4, [r0, r0]
    4150:	0493      	lsls	r3, r2, #18
    4152:	9357      	str	r3, [sp, #348]	; 0x15c
    4154:	5604      	ldrsb	r4, [r0, r0]
    4156:	0493      	lsls	r3, r2, #18
    4158:	1893      	adds	r3, r2, r2
    415a:	0082      	lsls	r2, r0, #2
    415c:	0000      	movs	r0, r0
    415e:	0084      	lsls	r4, r0, #2
    4160:	0000      	movs	r0, r0
    4162:	0017      	movs	r7, r2
    4164:	935b      	str	r3, [sp, #364]	; 0x16c
    4166:	5a04      	ldrh	r4, [r0, r0]
    4168:	0493      	lsls	r3, r2, #18
    416a:	007d      	lsls	r5, r7, #1
    416c:	0493      	lsls	r3, r2, #18
    416e:	f491 937e 	b.w	0xff09586e
    4172:	5704      	ldrsb	r4, [r0, r4]
    4174:	0493      	lsls	r3, r2, #18
    4176:	9356      	str	r3, [sp, #344]	; 0x158
    4178:	9304      	str	r3, [sp, #16]
    417a:	8418      	strh	r0, [r3, #32]
    417c:	0000      	movs	r0, r0
    417e:	8600      	strh	r0, [r0, #48]	; 0x30
    4180:	0000      	movs	r0, r0
    4182:	1a00      	subs	r0, r0, r0
    4184:	5b00      	ldrh	r0, [r0, r4]
    4186:	0493      	lsls	r3, r2, #18
    4188:	935a      	str	r3, [sp, #360]	; 0x168
    418a:	7d04      	ldrb	r4, [r0, #20]
    418c:	9300      	str	r3, [sp, #0]
    418e:	9104      	str	r1, [sp, #16]
    4190:	7ef4      	ldrb	r4, [r6, #27]
    4192:	0493      	lsls	r3, r2, #18
    4194:	9357      	str	r3, [sp, #348]	; 0x15c
    4196:	5604      	ldrsb	r4, [r0, r0]
    4198:	0493      	lsls	r3, r2, #18
    419a:	9352      	str	r3, [sp, #328]	; 0x148
    419c:	9304      	str	r3, [sp, #16]
    419e:	8614      	strh	r4, [r2, #48]	; 0x30
    41a0:	0000      	movs	r0, r0
    41a2:	8800      	ldrh	r0, [r0, #0]
    41a4:	0000      	movs	r0, r0
    41a6:	1c00      	adds	r0, r0, #0
    41a8:	5b00      	ldrh	r0, [r0, r4]
    41aa:	0493      	lsls	r3, r2, #18
    41ac:	935a      	str	r3, [sp, #360]	; 0x168
    41ae:	7d04      	ldrb	r4, [r0, #20]
    41b0:	9300      	str	r3, [sp, #0]
    41b2:	9104      	str	r1, [sp, #16]
    41b4:	7ef4      	ldrb	r4, [r6, #27]
    41b6:	0493      	lsls	r3, r2, #18
    41b8:	9357      	str	r3, [sp, #348]	; 0x15c
    41ba:	5604      	ldrsb	r4, [r0, r0]
    41bc:	0493      	lsls	r3, r2, #18
    41be:	f891 937e 	ldrb.w	r9, [r1, #894]	; 0x37e
    41c2:	9304      	str	r3, [sp, #16]
    41c4:	8814      	ldrh	r4, [r2, #0]
    41c6:	0000      	movs	r0, r0
    41c8:	8c00      	ldrh	r0, [r0, #32]
    41ca:	0000      	movs	r0, r0
    41cc:	1f00      	subs	r0, r0, #4
    41ce:	5b00      	ldrh	r0, [r0, r4]
    41d0:	0493      	lsls	r3, r2, #18
    41d2:	935a      	str	r3, [sp, #360]	; 0x168
    41d4:	7d04      	ldrb	r4, [r0, #20]
    41d6:	9300      	str	r3, [sp, #0]
    41d8:	9104      	str	r1, [sp, #16]
    41da:	7ef4      	ldrb	r4, [r6, #27]
    41dc:	0493      	lsls	r3, r2, #18
    41de:	9357      	str	r3, [sp, #348]	; 0x15c
    41e0:	5604      	ldrsb	r4, [r0, r0]
    41e2:	0493      	lsls	r3, r2, #18
    41e4:	f891 937e 	ldrb.w	r9, [r1, #894]	; 0x37e
    41e8:	5204      	strh	r4, [r0, r0]
    41ea:	0493      	lsls	r3, r2, #18
    41ec:	1093      	asrs	r3, r2, #2
    41ee:	008c      	lsls	r4, r1, #2
    41f0:	0000      	movs	r0, r0
    41f2:	00a0      	lsls	r0, r4, #2
    41f4:	0000      	movs	r0, r0
    41f6:	0021      	movs	r1, r4
    41f8:	935b      	str	r3, [sp, #364]	; 0x16c
    41fa:	5a04      	ldrh	r4, [r0, r0]
    41fc:	0493      	lsls	r3, r2, #18
    41fe:	007d      	lsls	r5, r7, #1
    4200:	0493      	lsls	r3, r2, #18
    4202:	f491 937e 	b.w	0xff095902
    4206:	5704      	ldrsb	r4, [r0, r4]
    4208:	0493      	lsls	r3, r2, #18
    420a:	9356      	str	r3, [sp, #344]	; 0x158
    420c:	9104      	str	r1, [sp, #16]
    420e:	7ef8      	ldrb	r0, [r7, #27]
    4210:	0493      	lsls	r3, r2, #18
    4212:	fc91 937e 	ldc2	3, cr9, [r1], {126}	; 0x7e
    4216:	9304      	str	r3, [sp, #16]
    4218:	a010      	add	r0, pc, #64	; (adr r0, 0x425c)
    421a:	0000      	movs	r0, r0
    421c:	2800      	cmp	r0, #0
    421e:	0001      	movs	r1, r0
    4220:	2100      	movs	r1, #0
    4222:	5b00      	ldrh	r0, [r0, r4]
    4224:	0493      	lsls	r3, r2, #18
    4226:	935a      	str	r3, [sp, #360]	; 0x168
    4228:	7d04      	ldrb	r4, [r0, #20]
    422a:	9300      	str	r3, [sp, #0]
    422c:	9104      	str	r1, [sp, #16]
    422e:	7ef4      	ldrb	r4, [r6, #27]
    4230:	0493      	lsls	r3, r2, #18
    4232:	9357      	str	r3, [sp, #348]	; 0x15c
    4234:	5604      	ldrsb	r4, [r0, r0]
    4236:	0493      	lsls	r3, r2, #18
    4238:	f891 937e 	ldrb.w	r9, [r1, #894]	; 0x37e
    423c:	9104      	str	r1, [sp, #16]
    423e:	7efc      	ldrb	r4, [r7, #27]
    4240:	0493      	lsls	r3, r2, #18
    4242:	1093      	asrs	r3, r2, #2
    4244:	0128      	lsls	r0, r5, #4
    4246:	0000      	movs	r0, r0
    4248:	012c      	lsls	r4, r5, #4
    424a:	0000      	movs	r0, r0
    424c:	0022      	movs	r2, r4
    424e:	935b      	str	r3, [sp, #364]	; 0x16c
    4250:	5a04      	ldrh	r4, [r0, r0]
    4252:	0493      	lsls	r3, r2, #18
    4254:	f091 937e 	b.w	0xc95954
    4258:	9104      	str	r1, [sp, #16]
    425a:	7ef4      	ldrb	r4, [r6, #27]
    425c:	0493      	lsls	r3, r2, #18
    425e:	9357      	str	r3, [sp, #348]	; 0x15c
    4260:	5604      	ldrsb	r4, [r0, r0]
    4262:	0493      	lsls	r3, r2, #18
    4264:	f891 937e 	ldrb.w	r9, [r1, #894]	; 0x37e
    4268:	9104      	str	r1, [sp, #16]
    426a:	7efc      	ldrb	r4, [r7, #27]
    426c:	0493      	lsls	r3, r2, #18
    426e:	1093      	asrs	r3, r2, #2
    4270:	012c      	lsls	r4, r5, #4
    4272:	0000      	movs	r0, r0
    4274:	0148      	lsls	r0, r1, #5
    4276:	0000      	movs	r0, r0
    4278:	001a      	movs	r2, r3
    427a:	0893      	lsrs	r3, r2, #2
    427c:	f07d 937e 	b.w	0xc8197c
    4280:	7d04      	ldrb	r4, [r0, #20]
    4282:	7ef4      	ldrb	r4, [r6, #27]
    4284:	0493      	lsls	r3, r2, #18
    4286:	0893      	lsrs	r3, r2, #2
    4288:	f87d 937e 	ldr??.w	r9, [sp, <undefined>]
    428c:	7d04      	ldrb	r4, [r0, #20]
    428e:	7efc      	ldrb	r4, [r7, #27]
    4290:	0493      	lsls	r3, r2, #18
    4292:	1093      	asrs	r3, r2, #2
	...
    429c:	0038      	movs	r0, r7
    429e:	0000      	movs	r0, r0
    42a0:	004e      	lsls	r6, r1, #1
    42a2:	0000      	movs	r0, r0
    42a4:	0002      	movs	r2, r0
    42a6:	9f30      	ldr	r7, [sp, #192]	; 0xc0
	...
    42b0:	0038      	movs	r0, r7
    42b2:	0000      	movs	r0, r0
    42b4:	004e      	lsls	r6, r1, #1
    42b6:	0000      	movs	r0, r0
    42b8:	0002      	movs	r2, r0
    42ba:	9f32      	ldr	r7, [sp, #200]	; 0xc8
	...
    42c4:	003c      	movs	r4, r7
    42c6:	0000      	movs	r0, r0
    42c8:	0042      	lsls	r2, r0, #1
    42ca:	0000      	movs	r0, r0
    42cc:	0001      	movs	r1, r0
    42ce:	0052      	lsls	r2, r2, #1
	...
    42d8:	0000      	movs	r0, r0
    42da:	1200      	asrs	r0, r0, #8
    42dc:	0000      	movs	r0, r0
    42de:	0100      	lsls	r0, r0, #4
    42e0:	5000      	str	r0, [r0, r0]
    42e2:	0012      	movs	r2, r2
    42e4:	0000      	movs	r0, r0
    42e6:	00a0      	lsls	r0, r4, #2
    42e8:	0000      	movs	r0, r0
    42ea:	0001      	movs	r1, r0
    42ec:	a057      	add	r0, pc, #348	; (adr r0, 0x444c)
    42ee:	0000      	movs	r0, r0
    42f0:	d000      	beq.n	0x42f4
    42f2:	0000      	movs	r0, r0
    42f4:	0400      	lsls	r0, r0, #16
    42f6:	f300 5001 	ssat	r0, #2, r0, lsl #20
    42fa:	009f      	lsls	r7, r3, #2
	...
    4304:	0000      	movs	r0, r0
    4306:	1000      	asrs	r0, r0, #32
    4308:	0000      	movs	r0, r0
    430a:	0100      	lsls	r0, r0, #4
    430c:	5100      	str	r0, [r0, r4]
    430e:	0010      	movs	r0, r2
    4310:	0000      	movs	r0, r0
    4312:	008c      	lsls	r4, r1, #2
    4314:	0000      	movs	r0, r0
    4316:	0001      	movs	r1, r0
    4318:	8c56      	ldrh	r6, [r2, #34]	; 0x22
    431a:	0000      	movs	r0, r0
    431c:	d000      	beq.n	0x4320
    431e:	0000      	movs	r0, r0
    4320:	0400      	lsls	r0, r0, #16
    4322:	f300 5101 	ssat	r1, #2, r0, lsl #20
    4326:	009f      	lsls	r7, r3, #2
	...
    4330:	0000      	movs	r0, r0
    4332:	0e00      	lsrs	r0, r0, #24
    4334:	0000      	movs	r0, r0
    4336:	0600      	lsls	r0, r0, #24
    4338:	5200      	strh	r0, [r0, r0]
    433a:	0493      	lsls	r3, r2, #18
    433c:	9353      	str	r3, [sp, #332]	; 0x14c
    433e:	0e04      	lsrs	r4, r0, #24
    4340:	0000      	movs	r0, r0
    4342:	d000      	beq.n	0x4346
    4344:	0000      	movs	r0, r0
    4346:	0600      	lsls	r0, r0, #24
    4348:	f300 f503 	bl	0x704d52
    434c:	2502      	movs	r5, #2
    434e:	009f      	lsls	r7, r3, #2
	...
    4358:	0000      	movs	r0, r0
    435a:	9a00      	ldr	r2, [sp, #0]
    435c:	0000      	movs	r0, r0
    435e:	0200      	lsls	r0, r0, #8
    4360:	9100      	str	r1, [sp, #0]
	...
    436a:	9000      	str	r0, [sp, #0]
    436c:	0000      	movs	r0, r0
    436e:	aa00      	add	r2, sp, #0
    4370:	0000      	movs	r0, r0
    4372:	0800      	lsrs	r0, r0, #32
    4374:	7500      	strb	r0, [r0, #20]
    4376:	4000      	ands	r0, r0
    4378:	244b      	movs	r4, #75	; 0x4b
    437a:	1a1f      	subs	r7, r3, r0
    437c:	aa9f      	add	r2, sp, #636	; 0x27c
    437e:	0000      	movs	r0, r0
    4380:	ac00      	add	r4, sp, #0
    4382:	0000      	movs	r0, r0
    4384:	0100      	lsls	r0, r0, #4
    4386:	5500      	strb	r0, [r0, r4]
	...
    4390:	009e      	lsls	r6, r3, #2
    4392:	0000      	movs	r0, r0
    4394:	00ba      	lsls	r2, r7, #2
    4396:	0000      	movs	r0, r0
    4398:	0001      	movs	r1, r0
    439a:	0058      	lsls	r0, r3, #1
    439c:	0000      	movs	r0, r0
    439e:	0000      	movs	r0, r0
    43a0:	0000      	movs	r0, r0
    43a2:	a000      	add	r0, pc, #0	; (adr r0, 0x43a4)
    43a4:	0000      	movs	r0, r0
    43a6:	ba00      	rev	r0, r0
    43a8:	0000      	movs	r0, r0
    43aa:	0100      	lsls	r0, r0, #4
    43ac:	5700      	ldrsb	r0, [r0, r4]
    43ae:	00ba      	lsls	r2, r7, #2
    43b0:	0000      	movs	r0, r0
    43b2:	00d0      	lsls	r0, r2, #3
    43b4:	0000      	movs	r0, r0
    43b6:	0006      	movs	r6, r0
    43b8:	8411      	strh	r1, [r2, #32]
    43ba:	83c2      	strh	r2, [r0, #30]
    43bc:	7e80      	ldrb	r0, [r0, #26]
	...
    43c6:	0028      	movs	r0, r5
    43c8:	0000      	movs	r0, r0
    43ca:	0040      	lsls	r0, r0, #1
    43cc:	0000      	movs	r0, r0
    43ce:	0002      	movs	r2, r0
    43d0:	9f30      	ldr	r7, [sp, #192]	; 0xc0
    43d2:	0040      	lsls	r0, r0, #1
    43d4:	0000      	movs	r0, r0
    43d6:	0054      	lsls	r4, r2, #1
    43d8:	0000      	movs	r0, r0
    43da:	0002      	movs	r2, r0
    43dc:	9f32      	ldr	r7, [sp, #200]	; 0xc8
    43de:	0054      	lsls	r4, r2, #1
    43e0:	0000      	movs	r0, r0
    43e2:	00a3      	lsls	r3, r4, #2
    43e4:	0000      	movs	r0, r0
    43e6:	0001      	movs	r1, r0
    43e8:	005c      	lsls	r4, r3, #1
    43ea:	0000      	movs	r0, r0
    43ec:	0000      	movs	r0, r0
    43ee:	0000      	movs	r0, r0
    43f0:	2800      	cmp	r0, #0
    43f2:	0000      	movs	r0, r0
    43f4:	5400      	strb	r0, [r0, r0]
    43f6:	0000      	movs	r0, r0
    43f8:	0600      	lsls	r0, r0, #24
    43fa:	f200 2e4e 	addw	lr, r0, #590	; 0x24e
	...
    4406:	0000      	movs	r0, r0
    4408:	2800      	cmp	r0, #0
    440a:	0000      	movs	r0, r0
    440c:	5400      	strb	r0, [r0, r0]
    440e:	0000      	movs	r0, r0
    4410:	0100      	lsls	r0, r0, #4
    4412:	5700      	ldrsb	r0, [r0, r4]
	...
    441c:	0054      	lsls	r4, r2, #1
    441e:	0000      	movs	r0, r0
    4420:	006e      	lsls	r6, r5, #1
    4422:	0000      	movs	r0, r0
    4424:	0001      	movs	r1, r0
    4426:	005c      	lsls	r4, r3, #1
    4428:	0000      	movs	r0, r0
    442a:	0000      	movs	r0, r0
    442c:	0000      	movs	r0, r0
    442e:	5400      	strb	r0, [r0, r0]
    4430:	0000      	movs	r0, r0
    4432:	6e00      	ldr	r0, [r0, #96]	; 0x60
    4434:	0000      	movs	r0, r0
    4436:	0200      	lsls	r0, r0, #8
    4438:	3200      	adds	r2, #0
    443a:	009f      	lsls	r7, r3, #2
    443c:	0000      	movs	r0, r0
    443e:	0000      	movs	r0, r0
    4440:	0000      	movs	r0, r0
    4442:	5400      	strb	r0, [r0, r0]
    4444:	0000      	movs	r0, r0
    4446:	5a00      	ldrh	r0, [r0, r0]
    4448:	0000      	movs	r0, r0
    444a:	0100      	lsls	r0, r0, #4
    444c:	5300      	strh	r0, [r0, r4]
	...
    445a:	003e      	movs	r6, r7
    445c:	0000      	movs	r0, r0
    445e:	0001      	movs	r1, r0
    4460:	3e50      	subs	r6, #80	; 0x50
    4462:	0000      	movs	r0, r0
    4464:	7a00      	ldrb	r0, [r0, #8]
    4466:	0000      	movs	r0, r0
    4468:	0100      	lsls	r0, r0, #4
    446a:	5500      	strb	r0, [r0, r4]
    446c:	007a      	lsls	r2, r7, #1
    446e:	0000      	movs	r0, r0
    4470:	008c      	lsls	r4, r1, #2
    4472:	0000      	movs	r0, r0
    4474:	0004      	movs	r4, r0
    4476:	01f3      	lsls	r3, r6, #7
    4478:	9f50      	ldr	r7, [sp, #320]	; 0x140
	...
    4482:	007c      	lsls	r4, r7, #1
    4484:	0000      	movs	r0, r0
    4486:	0002      	movs	r2, r0
    4488:	0000      	movs	r0, r0
    448a:	0000      	movs	r0, r0
    448c:	0004      	movs	r4, r0
	...
    4496:	008c      	lsls	r4, r1, #2
    4498:	0000      	movs	r0, r0
    449a:	0000      	movs	r0, r0
    449c:	0000      	movs	r0, r0
    449e:	000c      	movs	r4, r1
    44a0:	0000      	movs	r0, r0
    44a2:	0000      	movs	r0, r0
    44a4:	0000      	movs	r0, r0
    44a6:	00d0      	lsls	r0, r2, #3
    44a8:	0000      	movs	r0, r0
    44aa:	0000      	movs	r0, r0
    44ac:	0000      	movs	r0, r0
    44ae:	0148      	lsls	r0, r1, #5
    44b0:	0000      	movs	r0, r0
    44b2:	0000      	movs	r0, r0
    44b4:	0000      	movs	r0, r0
    44b6:	0174      	lsls	r4, r6, #5
    44b8:	0000      	movs	r0, r0
    44ba:	0000      	movs	r0, r0
    44bc:	0000      	movs	r0, r0
    44be:	001c      	movs	r4, r3
    44c0:	0000      	movs	r0, r0
    44c2:	0000      	movs	r0, r0
    44c4:	0000      	movs	r0, r0
    44c6:	0006      	movs	r6, r0
    44c8:	0000      	movs	r0, r0
    44ca:	0000      	movs	r0, r0
    44cc:	0000      	movs	r0, r0
    44ce:	00c0      	lsls	r0, r0, #3
    44d0:	0000      	movs	r0, r0
    44d2:	0000      	movs	r0, r0
    44d4:	0000      	movs	r0, r0
    44d6:	0028      	movs	r0, r5
    44d8:	0000      	movs	r0, r0
    44da:	0000      	movs	r0, r0
    44dc:	0000      	movs	r0, r0
    44de:	0014      	movs	r4, r2
    44e0:	0000      	movs	r0, r0
    44e2:	0000      	movs	r0, r0
    44e4:	0000      	movs	r0, r0
    44e6:	0030      	movs	r0, r6
    44e8:	0000      	movs	r0, r0
    44ea:	0000      	movs	r0, r0
    44ec:	0000      	movs	r0, r0
    44ee:	0024      	movs	r4, r4
    44f0:	0000      	movs	r0, r0
    44f2:	0000      	movs	r0, r0
    44f4:	0000      	movs	r0, r0
    44f6:	0020      	movs	r0, r4
	...
    4500:	0000      	movs	r0, r0
    4502:	001a      	movs	r2, r3
    4504:	0000      	movs	r0, r0
    4506:	001e      	movs	r6, r3
    4508:	0000      	movs	r0, r0
    450a:	0022      	movs	r2, r4
    450c:	0000      	movs	r0, r0
    450e:	0026      	movs	r6, r4
    4510:	0000      	movs	r0, r0
    4512:	0028      	movs	r0, r5
    4514:	0000      	movs	r0, r0
    4516:	002e      	movs	r6, r5
    4518:	0000      	movs	r0, r0
    451a:	0030      	movs	r0, r6
    451c:	0000      	movs	r0, r0
    451e:	0036      	movs	r6, r6
    4520:	0000      	movs	r0, r0
    4522:	003a      	movs	r2, r7
    4524:	0000      	movs	r0, r0
    4526:	0040      	lsls	r0, r0, #1
    4528:	0000      	movs	r0, r0
    452a:	004a      	lsls	r2, r1, #1
    452c:	0000      	movs	r0, r0
    452e:	0054      	lsls	r4, r2, #1
	...
    4538:	0000      	movs	r0, r0
    453a:	0044      	lsls	r4, r0, #1
    453c:	0000      	movs	r0, r0
    453e:	0046      	lsls	r6, r0, #1
    4540:	0000      	movs	r0, r0
    4542:	0048      	lsls	r0, r1, #1
    4544:	0000      	movs	r0, r0
    4546:	004a      	lsls	r2, r1, #1
    4548:	0000      	movs	r0, r0
    454a:	0054      	lsls	r4, r2, #1
    454c:	0000      	movs	r0, r0
    454e:	0070      	lsls	r0, r6, #1
    4550:	0000      	movs	r0, r0
    4552:	0072      	lsls	r2, r6, #1
    4554:	0000      	movs	r0, r0
    4556:	0076      	lsls	r6, r6, #1
	...
    4560:	0000      	movs	r0, r0
    4562:	007e      	lsls	r6, r7, #1
    4564:	0000      	movs	r0, r0
    4566:	0086      	lsls	r6, r0, #2
    4568:	0000      	movs	r0, r0
    456a:	008a      	lsls	r2, r1, #2
    456c:	0000      	movs	r0, r0
    456e:	00ce      	lsls	r6, r1, #3
    4570:	0000      	movs	r0, r0
    4572:	00d2      	lsls	r2, r2, #3
    4574:	0000      	movs	r0, r0
    4576:	00d6      	lsls	r6, r2, #3
    4578:	0000      	movs	r0, r0
    457a:	0106      	lsls	r6, r0, #4
    457c:	0000      	movs	r0, r0
    457e:	0174      	lsls	r4, r6, #5
	...
    4588:	0000      	movs	r0, r0
    458a:	007e      	lsls	r6, r7, #1
    458c:	0000      	movs	r0, r0
    458e:	0086      	lsls	r6, r0, #2
    4590:	0000      	movs	r0, r0
    4592:	008a      	lsls	r2, r1, #2
    4594:	0000      	movs	r0, r0
    4596:	008e      	lsls	r6, r1, #2
	...
    45a4:	0000      	movs	r0, r0
    45a6:	008c      	lsls	r4, r1, #2
    45a8:	0000      	movs	r0, r0
    45aa:	0000      	movs	r0, r0
    45ac:	0000      	movs	r0, r0
    45ae:	000c      	movs	r4, r1
    45b0:	0000      	movs	r0, r0
    45b2:	0000      	movs	r0, r0
    45b4:	0000      	movs	r0, r0
    45b6:	00d0      	lsls	r0, r2, #3
    45b8:	0000      	movs	r0, r0
    45ba:	0000      	movs	r0, r0
    45bc:	0000      	movs	r0, r0
    45be:	0148      	lsls	r0, r1, #5
    45c0:	0000      	movs	r0, r0
    45c2:	0000      	movs	r0, r0
    45c4:	0000      	movs	r0, r0
    45c6:	0174      	lsls	r4, r6, #5
    45c8:	0000      	movs	r0, r0
    45ca:	0000      	movs	r0, r0
    45cc:	0000      	movs	r0, r0
    45ce:	001c      	movs	r4, r3
    45d0:	0000      	movs	r0, r0
    45d2:	0000      	movs	r0, r0
    45d4:	0000      	movs	r0, r0
    45d6:	0006      	movs	r6, r0
    45d8:	0000      	movs	r0, r0
    45da:	0000      	movs	r0, r0
    45dc:	0000      	movs	r0, r0
    45de:	00c0      	lsls	r0, r0, #3
    45e0:	0000      	movs	r0, r0
    45e2:	0000      	movs	r0, r0
    45e4:	0000      	movs	r0, r0
    45e6:	0028      	movs	r0, r5
    45e8:	0000      	movs	r0, r0
    45ea:	0000      	movs	r0, r0
    45ec:	0000      	movs	r0, r0
    45ee:	0014      	movs	r4, r2
    45f0:	0000      	movs	r0, r0
    45f2:	0000      	movs	r0, r0
    45f4:	0000      	movs	r0, r0
    45f6:	0030      	movs	r0, r6
    45f8:	0000      	movs	r0, r0
    45fa:	0000      	movs	r0, r0
    45fc:	0000      	movs	r0, r0
    45fe:	0024      	movs	r4, r4
    4600:	0000      	movs	r0, r0
    4602:	0000      	movs	r0, r0
    4604:	0000      	movs	r0, r0
    4606:	0020      	movs	r0, r4
	...
    4610:	0000      	movs	r0, r0
    4612:	057c      	lsls	r4, r7, #21
    4614:	0000      	movs	r0, r0
    4616:	0002      	movs	r2, r0
    4618:	02a6      	lsls	r6, r4, #10
    461a:	0000      	movs	r0, r0
    461c:	0102      	lsls	r2, r0, #4
    461e:	0efb      	lsrs	r3, r7, #27
    4620:	000d      	movs	r5, r1
    4622:	0101      	lsls	r1, r0, #4
    4624:	0101      	lsls	r1, r0, #4
    4626:	0000      	movs	r0, r0
    4628:	0100      	lsls	r0, r0, #4
    462a:	0000      	movs	r0, r0
    462c:	4301      	orrs	r1, r0
    462e:	2f3a      	cmp	r7, #58	; 0x3a
    4630:	6f77      	ldr	r7, [r6, #116]	; 0x74
    4632:	6b72      	ldr	r2, [r6, #52]	; 0x34
    4634:	7073      	strb	r3, [r6, #1]
    4636:	6361      	str	r1, [r4, #52]	; 0x34
    4638:	2f65      	cmp	r7, #101	; 0x65
    463a:	3939      	subs	r1, #57	; 0x39
    463c:	725f      	strb	r7, [r3, #9]
    463e:	7065      	strb	r5, [r4, #1]
    4640:	2f6f      	cmp	r7, #111	; 0x6f
    4642:	636d      	str	r5, [r5, #52]	; 0x34
    4644:	2d75      	cmp	r5, #117	; 0x75
    4646:	6473      	str	r3, [r6, #68]	; 0x44
    4648:	2d6b      	cmp	r5, #107	; 0x6b
    464a:	2e32      	cmp	r6, #50	; 0x32
    464c:	2f30      	cmp	r7, #48	; 0x30
    464e:	6564      	str	r4, [r4, #84]	; 0x54
    4650:	6976      	ldr	r6, [r6, #20]
    4652:	6563      	str	r3, [r4, #84]	; 0x54
    4654:	2f73      	cmp	r7, #115	; 0x73
    4656:	504c      	str	r4, [r1, r1]
    4658:	3543      	adds	r5, #67	; 0x43
    465a:	5335      	strh	r5, [r6, r4]
    465c:	3936      	subs	r1, #54	; 0x36
    465e:	662f      	str	r7, [r5, #96]	; 0x60
    4660:	6c73      	ldr	r3, [r6, #68]	; 0x44
    4662:	705f      	strb	r7, [r3, #1]
    4664:	776f      	strb	r7, [r5, #29]
    4666:	7265      	strb	r5, [r4, #9]
    4668:	6c5f      	ldr	r7, [r3, #68]	; 0x44
    466a:	6269      	str	r1, [r5, #36]	; 0x24
    466c:	2e00      	cmp	r6, #0
    466e:	2f2e      	cmp	r7, #46	; 0x2e
    4670:	2e2e      	cmp	r6, #46	; 0x2e
    4672:	2e2f      	cmp	r6, #47	; 0x2f
    4674:	2f2e      	cmp	r7, #46	; 0x2e
    4676:	2e2e      	cmp	r6, #46	; 0x2e
    4678:	2e2f      	cmp	r6, #47	; 0x2f
    467a:	2f2e      	cmp	r7, #46	; 0x2e
    467c:	2e2e      	cmp	r6, #46	; 0x2e
    467e:	642f      	str	r7, [r5, #64]	; 0x40
    4680:	7665      	strb	r5, [r4, #25]
    4682:	6369      	str	r1, [r5, #52]	; 0x34
    4684:	7365      	strb	r5, [r4, #13]
    4686:	4c2f      	ldr	r4, [pc, #188]	; (0x4744)
    4688:	4350      	muls	r0, r2
    468a:	3535      	adds	r5, #53	; 0x35
    468c:	3653      	adds	r6, #83	; 0x53
    468e:	2f39      	cmp	r7, #57	; 0x39
    4690:	7264      	strb	r4, [r4, #9]
    4692:	7669      	strb	r1, [r5, #25]
    4694:	7265      	strb	r5, [r4, #9]
    4696:	0073      	lsls	r3, r6, #1
    4698:	2e2e      	cmp	r6, #46	; 0x2e
    469a:	2e2f      	cmp	r6, #47	; 0x2f
    469c:	2f2e      	cmp	r7, #46	; 0x2e
    469e:	2e2e      	cmp	r6, #46	; 0x2e
    46a0:	2e2f      	cmp	r6, #47	; 0x2f
    46a2:	2f2e      	cmp	r7, #46	; 0x2e
    46a4:	2e2e      	cmp	r6, #46	; 0x2e
    46a6:	2e2f      	cmp	r6, #47	; 0x2f
    46a8:	2f2e      	cmp	r7, #46	; 0x2e
    46aa:	4d43      	ldr	r5, [pc, #268]	; (0x47b8)
    46ac:	4953      	ldr	r1, [pc, #332]	; (0x47fc)
    46ae:	2f53      	cmp	r7, #83	; 0x53
    46b0:	6e49      	ldr	r1, [r1, #100]	; 0x64
    46b2:	6c63      	ldr	r3, [r4, #68]	; 0x44
    46b4:	6475      	str	r5, [r6, #68]	; 0x44
    46b6:	0065      	lsls	r5, r4, #1
    46b8:	3a63      	subs	r2, #99	; 0x63
    46ba:	6e5c      	ldr	r4, [r3, #100]	; 0x64
    46bc:	7078      	strb	r0, [r7, #1]
    46be:	6d5c      	ldr	r4, [r3, #84]	; 0x54
    46c0:	7563      	strb	r3, [r4, #21]
    46c2:	7078      	strb	r0, [r7, #1]
    46c4:	6572      	str	r2, [r6, #84]	; 0x54
    46c6:	7373      	strb	r3, [r6, #13]
    46c8:	696f      	ldr	r7, [r5, #20]
    46ca:	6564      	str	r4, [r4, #84]	; 0x54
    46cc:	315f      	adds	r1, #95	; 0x5f
    46ce:	2e30      	cmp	r6, #48	; 0x30
    46d0:	2e33      	cmp	r6, #51	; 0x33
    46d2:	5f30      	ldrsh	r0, [r6, r4]
    46d4:	3132      	adds	r1, #50	; 0x32
    46d6:	3539      	adds	r5, #57	; 0x39
    46d8:	705f      	strb	r7, [r3, #1]
    46da:	6372      	str	r2, [r6, #52]	; 0x34
    46dc:	5c34      	ldrb	r4, [r6, r0]
    46de:	6469      	str	r1, [r5, #68]	; 0x44
    46e0:	5c65      	ldrb	r5, [r4, r1]
    46e2:	6c70      	ldr	r0, [r6, #68]	; 0x44
    46e4:	6775      	str	r5, [r6, #116]	; 0x74
    46e6:	6e69      	ldr	r1, [r5, #100]	; 0x64
    46e8:	5c73      	ldrb	r3, [r6, r1]
    46ea:	6f63      	ldr	r3, [r4, #116]	; 0x74
    46ec:	2e6d      	cmp	r6, #109	; 0x6d
    46ee:	786e      	ldrb	r6, [r5, #1]
    46f0:	2e70      	cmp	r6, #112	; 0x70
    46f2:	636d      	str	r5, [r5, #52]	; 0x34
    46f4:	7875      	ldrb	r5, [r6, #1]
    46f6:	7270      	strb	r0, [r6, #9]
    46f8:	7365      	strb	r5, [r4, #13]
    46fa:	6f73      	ldr	r3, [r6, #116]	; 0x74
    46fc:	742e      	strb	r6, [r5, #16]
    46fe:	6f6f      	ldr	r7, [r5, #116]	; 0x74
    4700:	736c      	strb	r4, [r5, #13]
    4702:	772e      	strb	r6, [r5, #28]
    4704:	6e69      	ldr	r1, [r5, #100]	; 0x64
    4706:	3233      	adds	r2, #51	; 0x33
    4708:	315f      	adds	r1, #95	; 0x5f
    470a:	2e30      	cmp	r6, #48	; 0x30
    470c:	2e33      	cmp	r6, #51	; 0x33
    470e:	2e30      	cmp	r6, #48	; 0x30
    4710:	3032      	adds	r0, #50	; 0x32
    4712:	3831      	subs	r0, #49	; 0x31
    4714:	3131      	adds	r1, #49	; 0x31
    4716:	3130      	adds	r1, #48	; 0x30
    4718:	3831      	subs	r0, #49	; 0x31
    471a:	3134      	adds	r1, #52	; 0x34
    471c:	745c      	strb	r4, [r3, #17]
    471e:	6f6f      	ldr	r7, [r5, #116]	; 0x74
    4720:	736c      	strb	r4, [r5, #13]
    4722:	725c      	strb	r4, [r3, #9]
    4724:	6465      	str	r5, [r4, #68]	; 0x44
    4726:	696c      	ldr	r4, [r5, #20]
    4728:	5c62      	ldrb	r2, [r4, r1]
    472a:	6e69      	ldr	r1, [r5, #100]	; 0x64
    472c:	6c63      	ldr	r3, [r4, #68]	; 0x44
    472e:	6475      	str	r5, [r6, #68]	; 0x44
    4730:	5c65      	ldrb	r5, [r4, r1]
    4732:	7973      	ldrb	r3, [r6, #5]
    4734:	0073      	lsls	r3, r6, #1
    4736:	3a63      	subs	r2, #99	; 0x63
    4738:	6e5c      	ldr	r4, [r3, #100]	; 0x64
    473a:	7078      	strb	r0, [r7, #1]
    473c:	6d5c      	ldr	r4, [r3, #84]	; 0x54
    473e:	7563      	strb	r3, [r4, #21]
    4740:	7078      	strb	r0, [r7, #1]
    4742:	6572      	str	r2, [r6, #84]	; 0x54
    4744:	7373      	strb	r3, [r6, #13]
    4746:	696f      	ldr	r7, [r5, #20]
    4748:	6564      	str	r4, [r4, #84]	; 0x54
    474a:	315f      	adds	r1, #95	; 0x5f
    474c:	2e30      	cmp	r6, #48	; 0x30
    474e:	2e33      	cmp	r6, #51	; 0x33
    4750:	5f30      	ldrsh	r0, [r6, r4]
    4752:	3132      	adds	r1, #50	; 0x32
    4754:	3539      	adds	r5, #57	; 0x39
    4756:	705f      	strb	r7, [r3, #1]
    4758:	6372      	str	r2, [r6, #52]	; 0x34
    475a:	5c34      	ldrb	r4, [r6, r0]
    475c:	6469      	str	r1, [r5, #68]	; 0x44
    475e:	5c65      	ldrb	r5, [r4, r1]
    4760:	6c70      	ldr	r0, [r6, #68]	; 0x44
    4762:	6775      	str	r5, [r6, #116]	; 0x74
    4764:	6e69      	ldr	r1, [r5, #100]	; 0x64
    4766:	5c73      	ldrb	r3, [r6, r1]
    4768:	6f63      	ldr	r3, [r4, #116]	; 0x74
    476a:	2e6d      	cmp	r6, #109	; 0x6d
    476c:	786e      	ldrb	r6, [r5, #1]
    476e:	2e70      	cmp	r6, #112	; 0x70
    4770:	636d      	str	r5, [r5, #52]	; 0x34
    4772:	7875      	ldrb	r5, [r6, #1]
    4774:	7270      	strb	r0, [r6, #9]
    4776:	7365      	strb	r5, [r4, #13]
    4778:	6f73      	ldr	r3, [r6, #116]	; 0x74
    477a:	742e      	strb	r6, [r5, #16]
    477c:	6f6f      	ldr	r7, [r5, #116]	; 0x74
    477e:	736c      	strb	r4, [r5, #13]
    4780:	772e      	strb	r6, [r5, #28]
    4782:	6e69      	ldr	r1, [r5, #100]	; 0x64
    4784:	3233      	adds	r2, #51	; 0x33
    4786:	315f      	adds	r1, #95	; 0x5f
    4788:	2e30      	cmp	r6, #48	; 0x30
    478a:	2e33      	cmp	r6, #51	; 0x33
    478c:	2e30      	cmp	r6, #48	; 0x30
    478e:	3032      	adds	r0, #50	; 0x32
    4790:	3831      	subs	r0, #49	; 0x31
    4792:	3131      	adds	r1, #49	; 0x31
    4794:	3130      	adds	r1, #48	; 0x30
    4796:	3831      	subs	r0, #49	; 0x31
    4798:	3134      	adds	r1, #52	; 0x34
    479a:	745c      	strb	r4, [r3, #17]
    479c:	6f6f      	ldr	r7, [r5, #116]	; 0x74
    479e:	736c      	strb	r4, [r5, #13]
    47a0:	725c      	strb	r4, [r3, #9]
    47a2:	6465      	str	r5, [r4, #68]	; 0x44
    47a4:	696c      	ldr	r4, [r5, #20]
    47a6:	5c62      	ldrb	r2, [r4, r1]
    47a8:	6e69      	ldr	r1, [r5, #100]	; 0x64
    47aa:	6c63      	ldr	r3, [r4, #68]	; 0x44
    47ac:	6475      	str	r5, [r6, #68]	; 0x44
    47ae:	0065      	lsls	r5, r4, #1
    47b0:	2e2e      	cmp	r6, #46	; 0x2e
    47b2:	2e2f      	cmp	r6, #47	; 0x2f
    47b4:	2f2e      	cmp	r7, #46	; 0x2e
    47b6:	2e2e      	cmp	r6, #46	; 0x2e
    47b8:	2e2f      	cmp	r6, #47	; 0x2f
    47ba:	2f2e      	cmp	r7, #46	; 0x2e
    47bc:	2e2e      	cmp	r6, #46	; 0x2e
    47be:	2e2f      	cmp	r6, #47	; 0x2f
    47c0:	2f2e      	cmp	r7, #46	; 0x2e
    47c2:	6564      	str	r4, [r4, #84]	; 0x54
    47c4:	6976      	ldr	r6, [r6, #20]
    47c6:	6563      	str	r3, [r4, #84]	; 0x54
    47c8:	2f73      	cmp	r7, #115	; 0x73
    47ca:	504c      	str	r4, [r1, r1]
    47cc:	3543      	adds	r5, #67	; 0x43
    47ce:	5335      	strh	r5, [r6, r4]
    47d0:	3936      	subs	r1, #54	; 0x36
    47d2:	2e00      	cmp	r6, #0
    47d4:	2f2e      	cmp	r7, #46	; 0x2e
    47d6:	2e2e      	cmp	r6, #46	; 0x2e
    47d8:	2e2f      	cmp	r6, #47	; 0x2f
    47da:	2f2e      	cmp	r7, #46	; 0x2e
    47dc:	2e2e      	cmp	r6, #46	; 0x2e
    47de:	2e2f      	cmp	r6, #47	; 0x2f
    47e0:	2f2e      	cmp	r7, #46	; 0x2e
    47e2:	2e2e      	cmp	r6, #46	; 0x2e
    47e4:	702f      	strb	r7, [r5, #0]
    47e6:	616c      	str	r4, [r5, #20]
    47e8:	6674      	str	r4, [r6, #100]	; 0x64
    47ea:	726f      	strb	r7, [r5, #9]
    47ec:	2f6d      	cmp	r7, #109	; 0x6d
    47ee:	7264      	strb	r4, [r4, #9]
    47f0:	7669      	strb	r1, [r5, #25]
    47f2:	7265      	strb	r5, [r4, #9]
    47f4:	2f73      	cmp	r7, #115	; 0x73
    47f6:	6f63      	ldr	r3, [r4, #116]	; 0x74
    47f8:	6d6d      	ldr	r5, [r5, #84]	; 0x54
    47fa:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    47fc:	0000      	movs	r0, r0
    47fe:	7366      	strb	r6, [r4, #13]
    4800:	5f6c      	ldrsh	r4, [r5, r5]
    4802:	6f70      	ldr	r0, [r6, #116]	; 0x74
    4804:	6577      	str	r7, [r6, #84]	; 0x54
    4806:	5f72      	ldrsh	r2, [r6, r5]
    4808:	696c      	ldr	r4, [r5, #20]
    480a:	2e62      	cmp	r6, #98	; 0x62
    480c:	0063      	lsls	r3, r4, #1
    480e:	0001      	movs	r1, r0
    4810:	6600      	str	r0, [r0, #96]	; 0x60
    4812:	6c73      	ldr	r3, [r6, #68]	; 0x44
    4814:	635f      	str	r7, [r3, #52]	; 0x34
    4816:	6f6c      	ldr	r4, [r5, #116]	; 0x74
    4818:	6b63      	ldr	r3, [r4, #52]	; 0x34
    481a:	682e      	ldr	r6, [r5, #0]
    481c:	0200      	lsls	r0, r0, #8
    481e:	0000      	movs	r0, r0
    4820:	6d63      	ldr	r3, [r4, #84]	; 0x54
    4822:	6973      	ldr	r3, [r6, #20]
    4824:	5f73      	ldrsh	r3, [r6, r5]
    4826:	6367      	str	r7, [r4, #52]	; 0x34
    4828:	2e63      	cmp	r6, #99	; 0x63
    482a:	0068      	lsls	r0, r5, #1
    482c:	0003      	movs	r3, r0
    482e:	6c00      	ldr	r0, [r0, #64]	; 0x40
    4830:	6269      	str	r1, [r5, #36]	; 0x24
    4832:	6f63      	ldr	r3, [r4, #116]	; 0x74
    4834:	666e      	str	r6, [r5, #100]	; 0x64
    4836:	6769      	str	r1, [r5, #116]	; 0x74
    4838:	612d      	str	r5, [r5, #16]
    483a:	6d72      	ldr	r2, [r6, #84]	; 0x54
    483c:	682e      	ldr	r6, [r5, #0]
    483e:	0400      	lsls	r0, r0, #16
    4840:	0000      	movs	r0, r0
    4842:	7473      	strb	r3, [r6, #17]
    4844:	6964      	ldr	r4, [r4, #20]
    4846:	746e      	strb	r6, [r5, #17]
    4848:	682e      	ldr	r6, [r5, #0]
    484a:	0500      	lsls	r0, r0, #20
    484c:	0000      	movs	r0, r0
    484e:	6f63      	ldr	r3, [r4, #116]	; 0x74
    4850:	6572      	str	r2, [r6, #84]	; 0x54
    4852:	635f      	str	r7, [r3, #52]	; 0x34
    4854:	336d      	adds	r3, #109	; 0x6d
    4856:	2e33      	cmp	r6, #51	; 0x33
    4858:	0068      	lsls	r0, r5, #1
    485a:	0003      	movs	r3, r0
    485c:	7300      	strb	r0, [r0, #12]
    485e:	7379      	strb	r1, [r7, #13]
    4860:	6574      	str	r4, [r6, #84]	; 0x54
    4862:	5f6d      	ldrsh	r5, [r5, r5]
    4864:	504c      	str	r4, [r1, r1]
    4866:	3543      	adds	r5, #67	; 0x43
    4868:	5335      	strh	r5, [r6, r4]
    486a:	3936      	subs	r1, #54	; 0x36
    486c:	635f      	str	r7, [r3, #52]	; 0x34
    486e:	336d      	adds	r3, #109	; 0x6d
    4870:	5f33      	ldrsh	r3, [r6, r4]
    4872:	6f63      	ldr	r3, [r4, #116]	; 0x74
    4874:	6572      	str	r2, [r6, #84]	; 0x54
    4876:	2e30      	cmp	r6, #48	; 0x30
    4878:	0068      	lsls	r0, r5, #1
    487a:	0006      	movs	r6, r0
    487c:	4c00      	ldr	r4, [pc, #0]	; (0x4880)
    487e:	4350      	muls	r0, r2
    4880:	3535      	adds	r5, #53	; 0x35
    4882:	3653      	adds	r6, #83	; 0x53
    4884:	5f39      	ldrsh	r1, [r7, r4]
    4886:	6d63      	ldr	r3, [r4, #84]	; 0x54
    4888:	3333      	adds	r3, #51	; 0x33
    488a:	635f      	str	r7, [r3, #52]	; 0x34
    488c:	726f      	strb	r7, [r5, #9]
    488e:	3065      	adds	r0, #101	; 0x65
    4890:	682e      	ldr	r6, [r5, #0]
    4892:	0600      	lsls	r0, r0, #24
    4894:	0000      	movs	r0, r0
    4896:	7366      	strb	r6, [r4, #13]
    4898:	5f6c      	ldrsh	r4, [r5, r5]
    489a:	6f63      	ldr	r3, [r4, #116]	; 0x74
    489c:	6d6d      	ldr	r5, [r5, #84]	; 0x54
    489e:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    48a0:	682e      	ldr	r6, [r5, #0]
    48a2:	0700      	lsls	r0, r0, #28
    48a4:	0000      	movs	r0, r0
    48a6:	7366      	strb	r6, [r4, #13]
    48a8:	5f6c      	ldrsh	r4, [r5, r5]
    48aa:	6f70      	ldr	r0, [r6, #116]	; 0x74
    48ac:	6577      	str	r7, [r6, #84]	; 0x54
    48ae:	2e72      	cmp	r6, #114	; 0x72
    48b0:	0068      	lsls	r0, r5, #1
    48b2:	0002      	movs	r2, r0
    48b4:	7300      	strb	r0, [r0, #12]
    48b6:	7274      	strb	r4, [r6, #9]
    48b8:	6e69      	ldr	r1, [r5, #100]	; 0x64
    48ba:	2e67      	cmp	r6, #103	; 0x67
    48bc:	0068      	lsls	r0, r5, #1
    48be:	0005      	movs	r5, r0
    48c0:	0000      	movs	r0, r0
    48c2:	0500      	lsls	r0, r0, #20
    48c4:	0002      	movs	r2, r0
    48c6:	0000      	movs	r0, r0
    48c8:	0300      	lsls	r0, r0, #12
    48ca:	0137      	lsls	r7, r6, #4
    48cc:	0b03      	lsrs	r3, r0, #12
    48ce:	0320      	lsls	r0, r4, #12
    48d0:	2e75      	cmp	r6, #117	; 0x75
    48d2:	2322      	movs	r3, #34	; 0x22
    48d4:	3f1d      	subs	r7, #29
    48d6:	694d      	ldr	r5, [r1, #20]
    48d8:	3daf      	subs	r5, #175	; 0xaf
    48da:	3059      	adds	r0, #89	; 0x59
    48dc:	841e      	strh	r6, [r3, #32]
    48de:	833f      	strh	r7, [r7, #24]
    48e0:	0a02      	lsrs	r2, r0, #8
    48e2:	0100      	lsls	r0, r0, #4
    48e4:	0001      	movs	r1, r0
    48e6:	0205      	lsls	r5, r0, #8
    48e8:	0000      	movs	r0, r0
    48ea:	0000      	movs	r0, r0
    48ec:	d503      	bpl.n	0x48f6
    48ee:	0100      	lsls	r0, r0, #4
    48f0:	0213      	lsls	r3, r2, #8
    48f2:	0006      	movs	r6, r0
    48f4:	0101      	lsls	r1, r0, #4
    48f6:	0500      	lsls	r0, r0, #20
    48f8:	0002      	movs	r2, r0
    48fa:	0000      	movs	r0, r0
    48fc:	0300      	lsls	r0, r0, #12
    48fe:	00de      	lsls	r6, r3, #3
    4900:	4a01      	ldr	r2, [pc, #4]	; (0x4908)
    4902:	0336      	lsls	r6, r6, #12
    4904:	3c78      	subs	r4, #120	; 0x78
    4906:	3128      	adds	r1, #40	; 0x28
    4908:	f503 2001 	add.w	r0, r3, #528384	; 0x81000
    490c:	8b03      	ldrh	r3, [r0, #24]
    490e:	2e7e      	cmp	r6, #126	; 0x7e
    4910:	f803 2e01 	strbt	r2, [r3, #1]
    4914:	8803      	ldrh	r3, [r0, #0]
    4916:	2e7e      	cmp	r6, #126	; 0x7e
    4918:	f803 2001 	strb.w	r2, [r3, r1]
    491c:	8d03      	ldrh	r3, [r0, #40]	; 0x28
    491e:	3c7e      	subs	r4, #126	; 0x7e
    4920:	f303 2001 	ssat	r0, #2, r3, lsl #8
    4924:	8d03      	ldrh	r3, [r0, #40]	; 0x28
    4926:	3c7e      	subs	r4, #126	; 0x7e
    4928:	f303 2e01 	ssat	lr, #2, r3, lsl #8
    492c:	8d03      	ldrh	r3, [r0, #40]	; 0x28
    492e:	3c7e      	subs	r4, #126	; 0x7e
    4930:	8d03      	ldrh	r3, [r0, #40]	; 0x28
    4932:	2e02      	cmp	r6, #2
    4934:	f303 207d 			; <UNDEFINED> instruction: 0xf303207d
    4938:	8d03      	ldrh	r3, [r0, #40]	; 0x28
    493a:	2002      	movs	r0, #2
    493c:	6703      	str	r3, [r0, #112]	; 0x70
    493e:	0320      	lsls	r0, r4, #12
    4940:	3c7a      	subs	r4, #122	; 0x7a
    4942:	3603      	adds	r6, #3
    4944:	032e      	lsls	r6, r5, #12
    4946:	2009      	movs	r0, #9
    4948:	1e03      	subs	r3, r0, #0
    494a:	032e      	lsls	r6, r5, #12
    494c:	205c      	movs	r0, #92	; 0x5c
    494e:	0351      	lsls	r1, r2, #13
    4950:	201d      	movs	r0, #29
    4952:	5d03      	ldrb	r3, [r0, r4]
    4954:	032e      	lsls	r6, r5, #12
    4956:	2e23      	cmp	r6, #35	; 0x23
    4958:	b903      	cbnz	r3, 0x495c
    495a:	207d      	movs	r0, #125	; 0x7d
    495c:	c703      	stmia	r7!, {r0, r1}
    495e:	2002      	movs	r0, #2
    4960:	b903      	cbnz	r3, 0x4964
    4962:	2e7d      	cmp	r6, #125	; 0x7d
    4964:	2331      	movs	r3, #49	; 0x31
    4966:	332f      	adds	r3, #47	; 0x2f
    4968:	262c      	movs	r6, #44	; 0x2c
    496a:	7a03      	ldrb	r3, [r0, #8]
    496c:	2220      	movs	r2, #32
    496e:	0321      	lsls	r1, r4, #12
    4970:	2009      	movs	r0, #9
    4972:	7703      	strb	r3, [r0, #28]
    4974:	3f20      	subs	r7, #32
    4976:	252f      	movs	r5, #47	; 0x2f
    4978:	0333      	lsls	r3, r6, #12
    497a:	2071      	movs	r0, #113	; 0x71
    497c:	0f03      	lsrs	r3, r0, #28
    497e:	312e      	adds	r1, #46	; 0x2e
    4980:	212f      	movs	r1, #47	; 0x2f
    4982:	0e02      	lsrs	r2, r0, #24
    4984:	0100      	lsls	r0, r0, #4
    4986:	0001      	movs	r1, r0
    4988:	0205      	lsls	r5, r0, #8
    498a:	0000      	movs	r0, r0
    498c:	0000      	movs	r0, r0
    498e:	9903      	ldr	r1, [sp, #12]
    4990:	0101      	lsls	r1, r0, #4
    4992:	0358      	lsls	r0, r3, #13
    4994:	200a      	movs	r0, #10
    4996:	7603      	strb	r3, [r0, #24]
    4998:	033c      	lsls	r4, r7, #12
    499a:	200a      	movs	r0, #10
    499c:	4d31      	ldr	r5, [pc, #196]	; (0x4a64)
    499e:	234d      	movs	r3, #77	; 0x4d
    49a0:	033e      	lsls	r6, r7, #12
    49a2:	01ca      	lsls	r2, r1, #7
    49a4:	034a      	lsls	r2, r1, #13
    49a6:	2e17      	cmp	r6, #23
    49a8:	0903      	lsrs	r3, r0, #4
    49aa:	2f20      	cmp	r7, #32
    49ac:	7903      	ldrb	r3, [r0, #4]
    49ae:	3d20      	subs	r5, #32
    49b0:	2303      	movs	r3, #3
    49b2:	032e      	lsls	r6, r5, #12
    49b4:	7dfd      	ldrb	r5, [r7, #23]
    49b6:	4266      	negs	r6, r4
    49b8:	234c      	movs	r3, #76	; 0x4c
    49ba:	2f3d      	cmp	r7, #61	; 0x3d
    49bc:	212f      	movs	r1, #47	; 0x2f
    49be:	221f      	movs	r2, #31
    49c0:	2f21      	cmp	r7, #33	; 0x21
    49c2:	3d2f      	subs	r5, #47	; 0x2f
    49c4:	2f3d      	cmp	r7, #61	; 0x3d
    49c6:	212d      	movs	r1, #45	; 0x2d
    49c8:	2b28      	cmp	r3, #40	; 0x28
    49ca:	3091      	adds	r0, #145	; 0x91
    49cc:	2321      	movs	r3, #33	; 0x21
    49ce:	3f2b      	subs	r7, #43	; 0x2b
    49d0:	312f      	adds	r1, #47	; 0x2f
    49d2:	211c      	movs	r1, #28
    49d4:	3423      	adds	r4, #35	; 0x23
    49d6:	2123      	movs	r1, #35	; 0x23
    49d8:	6e03      	ldr	r3, [r0, #96]	; 0x60
    49da:	0320      	lsls	r0, r4, #12
    49dc:	2e0e      	cmp	r6, #14
    49de:	1c35      	adds	r5, r6, #0
    49e0:	332f      	adds	r3, #47	; 0x2f
    49e2:	2f1e      	cmp	r7, #30
    49e4:	212f      	movs	r1, #47	; 0x2f
    49e6:	1e31      	subs	r1, r6, #0
    49e8:	2121      	movs	r1, #33	; 0x21
    49ea:	2f21      	cmp	r7, #33	; 0x21
    49ec:	3d3d      	subs	r5, #61	; 0x3d
    49ee:	3d3d      	subs	r5, #61	; 0x3d
    49f0:	0008      	movs	r0, r1
    49f2:	0101      	lsls	r1, r0, #4
    49f4:	0500      	lsls	r0, r0, #20
    49f6:	0002      	movs	r2, r0
    49f8:	0000      	movs	r0, r0
    49fa:	0300      	lsls	r0, r0, #12
    49fc:	01fc      	lsls	r4, r7, #7
    49fe:	3c01      	subs	r4, #1
    4a00:	0343      	lsls	r3, r0, #13
    4a02:	3c79      	subs	r4, #121	; 0x79
    4a04:	3435      	adds	r4, #53	; 0x35
    4a06:	232b      	movs	r3, #43	; 0x2b
    4a08:	3f2b      	subs	r7, #43	; 0x2b
    4a0a:	2323      	movs	r3, #35	; 0x23
    4a0c:	033e      	lsls	r6, r7, #12
    4a0e:	00ea      	lsls	r2, r5, #3
    4a10:	034a      	lsls	r2, r1, #13
    4a12:	2e28      	cmp	r6, #40	; 0x28
    4a14:	0903      	lsrs	r3, r0, #4
    4a16:	2f20      	cmp	r7, #32
    4a18:	7903      	ldrb	r3, [r0, #4]
    4a1a:	3d20      	subs	r5, #32
    4a1c:	1203      	asrs	r3, r0, #8
    4a1e:	032e      	lsls	r6, r5, #12
    4a20:	7edd      	ldrb	r5, [r3, #27]
    4a22:	3e66      	subs	r6, #102	; 0x66
    4a24:	0467      	lsls	r7, r4, #17
    4a26:	0302      	lsls	r2, r0, #12
    4a28:	03f4      	lsls	r4, r6, #15
    4a2a:	0474      	lsls	r4, r6, #17
    4a2c:	0301      	lsls	r1, r0, #12
    4a2e:	7c8c      	ldrb	r4, [r1, #18]
    4a30:	044a      	lsls	r2, r1, #17
    4a32:	0302      	lsls	r2, r0, #12
    4a34:	03f4      	lsls	r4, r6, #15
    4a36:	042e      	lsls	r6, r5, #16
    4a38:	0301      	lsls	r1, r0, #12
    4a3a:	7dc8      	ldrb	r0, [r1, #23]
    4a3c:	3f2e      	subs	r7, #46	; 0x2e
    4a3e:	7903      	ldrb	r3, [r0, #4]
    4a40:	0358      	lsls	r0, r3, #13
    4a42:	2014      	movs	r0, #20
    4a44:	3121      	adds	r1, #33	; 0x21
    4a46:	0d03      	lsrs	r3, r0, #20
    4a48:	214a      	movs	r1, #74	; 0x4a
    4a4a:	0331      	lsls	r1, r6, #12
    4a4c:	580d      	ldr	r5, [r1, r0]
    4a4e:	3121      	adds	r1, #33	; 0x21
    4a50:	9303      	str	r3, [sp, #12]
    4a52:	587e      	ldr	r6, [r7, r1]
    4a54:	fa03 2e01 			; <UNDEFINED> instruction: 0xfa032e01
    4a58:	8403      	strh	r3, [r0, #32]
    4a5a:	2e7e      	cmp	r6, #126	; 0x7e
    4a5c:	2122      	movs	r1, #34	; 0x22
    4a5e:	1d23      	adds	r3, r4, #4
    4a60:	0a03      	lsrs	r3, r0, #8
    4a62:	033c      	lsls	r4, r7, #12
    4a64:	2079      	movs	r0, #121	; 0x79
    4a66:	262f      	movs	r6, #47	; 0x2f
    4a68:	0336      	lsls	r6, r6, #12
    4a6a:	206d      	movs	r0, #109	; 0x6d
    4a6c:	1303      	asrs	r3, r0, #12
    4a6e:	312e      	adds	r1, #46	; 0x2e
    4a70:	212f      	movs	r1, #47	; 0x2f
    4a72:	9e03      	ldr	r6, [sp, #12]
    4a74:	3c01      	subs	r4, #1
    4a76:	2336      	movs	r3, #54	; 0x36
    4a78:	4167      	adcs	r7, r4
    4a7a:	2336      	movs	r3, #54	; 0x36
    4a7c:	4159      	adcs	r1, r3
    4a7e:	2336      	movs	r3, #54	; 0x36
    4a80:	4167      	adcs	r7, r4
    4a82:	2336      	movs	r3, #54	; 0x36
    4a84:	0267      	lsls	r7, r4, #9
    4a86:	000b      	movs	r3, r1
    4a88:	0101      	lsls	r1, r0, #4
    4a8a:	0500      	lsls	r0, r0, #20
    4a8c:	0002      	movs	r2, r0
    4a8e:	0000      	movs	r0, r0
    4a90:	0300      	lsls	r0, r0, #12
    4a92:	02bd      	lsls	r5, r7, #10
    4a94:	0401      	lsls	r1, r0, #16
    4a96:	0303      	lsls	r3, r0, #12
    4a98:	00c4      	lsls	r4, r0, #3
    4a9a:	0301      	lsls	r1, r0, #12
    4a9c:	7e8c      	ldrb	r4, [r1, #26]
    4a9e:	042e      	lsls	r6, r5, #16
    4aa0:	0301      	lsls	r1, r0, #12
    4aa2:	01b4      	lsls	r4, r6, #6
    4aa4:	5920      	ldr	r0, [r4, r4]
    4aa6:	0304      	lsls	r4, r0, #12
    4aa8:	db03      	blt.n	0x4ab2
    4aaa:	2000      	movs	r0, #0
    4aac:	0104      	lsls	r4, r0, #4
    4aae:	a703      	add	r7, pc, #12	; (adr r7, 0x4abc)
    4ab0:	2e7f      	cmp	r6, #127	; 0x7f
    4ab2:	0302      	lsls	r2, r0, #12
    4ab4:	0100      	lsls	r0, r0, #4
    4ab6:	0001      	movs	r1, r0
    4ab8:	0205      	lsls	r5, r0, #8
    4aba:	0000      	movs	r0, r0
    4abc:	0000      	movs	r0, r0
    4abe:	ce03      	ldmia	r6!, {r0, r1}
    4ac0:	0102      	lsls	r2, r0, #4
    4ac2:	0214      	lsls	r4, r2, #8
    4ac4:	0003      	movs	r3, r0
    4ac6:	0101      	lsls	r1, r0, #4
    4ac8:	0500      	lsls	r0, r0, #20
    4aca:	0002      	movs	r2, r0
    4acc:	0000      	movs	r0, r0
    4ace:	0300      	lsls	r0, r0, #12
    4ad0:	04c2      	lsls	r2, r0, #19
    4ad2:	0301      	lsls	r1, r0, #12
    4ad4:	0111      	lsls	r1, r2, #4
    4ad6:	6f03      	ldr	r3, [r0, #112]	; 0x70
    4ad8:	033c      	lsls	r4, r7, #12
    4ada:	2011      	movs	r0, #17
    4adc:	4428      	add	r0, r5
    4ade:	5244      	strh	r4, [r0, r1]
    4ae0:	5252      	strh	r2, [r2, r1]
    4ae2:	5252      	strh	r2, [r2, r1]
    4ae4:	0352      	lsls	r2, r2, #13
    4ae6:	2e09      	cmp	r6, #9
    4ae8:	7503      	strb	r3, [r0, #20]
    4aea:	1e3c      	subs	r4, r7, #0
    4aec:	be03      	bkpt	0x0003
    4aee:	2e7f      	cmp	r6, #127	; 0x7f
    4af0:	1e24      	subs	r4, r4, #0
    4af2:	d503      	bpl.n	0x4afc
    4af4:	2000      	movs	r0, #0
    4af6:	67a1      	str	r1, [r4, #120]	; 0x78
    4af8:	ad03      	add	r5, sp, #12
    4afa:	207f      	movs	r0, #127	; 0x7f
    4afc:	1e24      	subs	r4, r4, #0
    4afe:	2434      	movs	r4, #52	; 0x34
    4b00:	341e      	adds	r4, #30
    4b02:	1e24      	subs	r4, r4, #0
    4b04:	2434      	movs	r4, #52	; 0x34
    4b06:	341e      	adds	r4, #30
    4b08:	1e24      	subs	r4, r4, #0
    4b0a:	2434      	movs	r4, #52	; 0x34
    4b0c:	341e      	adds	r4, #30
    4b0e:	1e24      	subs	r4, r4, #0
    4b10:	0234      	lsls	r4, r6, #8
    4b12:	0005      	movs	r5, r0
    4b14:	0101      	lsls	r1, r0, #4
    4b16:	0500      	lsls	r0, r0, #20
    4b18:	0002      	movs	r2, r0
    4b1a:	0000      	movs	r0, r0
    4b1c:	0300      	lsls	r0, r0, #12
    4b1e:	05b8      	lsls	r0, r7, #22
    4b20:	1a01      	subs	r1, r0, r0
    4b22:	033f      	lsls	r7, r7, #12
    4b24:	2e0c      	cmp	r6, #12
    4b26:	7803      	ldrb	r3, [r0, #0]
    4b28:	312e      	adds	r1, #46	; 0x2e
    4b2a:	0241      	lsls	r1, r0, #9
    4b2c:	0008      	movs	r0, r1
    4b2e:	0101      	lsls	r1, r0, #4
    4b30:	0500      	lsls	r0, r0, #20
    4b32:	0002      	movs	r2, r0
    4b34:	0000      	movs	r0, r0
    4b36:	0300      	lsls	r0, r0, #12
    4b38:	0691      	lsls	r1, r2, #26
    4b3a:	0301      	lsls	r1, r0, #12
    4b3c:	0128      	lsls	r0, r5, #4
    4b3e:	522f      	strh	r7, [r5, r0]
    4b40:	0221      	lsls	r1, r4, #8
    4b42:	0003      	movs	r3, r0
    4b44:	0101      	lsls	r1, r0, #4
    4b46:	0500      	lsls	r0, r0, #20
    4b48:	0002      	movs	r2, r0
    4b4a:	0000      	movs	r0, r0
    4b4c:	0300      	lsls	r0, r0, #12
    4b4e:	06c6      	lsls	r6, r0, #27
    4b50:	0301      	lsls	r1, r0, #12
    4b52:	010b      	lsls	r3, r1, #4
    4b54:	4c3e      	ldr	r4, [pc, #248]	; (0x4c50)
    4b56:	3044      	adds	r0, #68	; 0x44
    4b58:	5935      	ldr	r5, [r6, r4]
    4b5a:	0502      	lsls	r2, r0, #20
    4b5c:	0100      	lsls	r0, r0, #4
    4b5e:	0001      	movs	r1, r0
    4b60:	0205      	lsls	r5, r0, #8
    4b62:	0000      	movs	r0, r0
    4b64:	0000      	movs	r0, r0
    4b66:	d503      	bpl.n	0x4b70
    4b68:	0105      	lsls	r5, r0, #4
    4b6a:	0903      	lsrs	r3, r0, #4
    4b6c:	0320      	lsls	r0, r4, #12
    4b6e:	2e22      	cmp	r6, #34	; 0x22
    4b70:	502f      	str	r7, [r5, r0]
    4b72:	2150      	movs	r1, #80	; 0x50
    4b74:	0402      	lsls	r2, r0, #16
    4b76:	0100      	lsls	r0, r0, #4
    4b78:	0001      	movs	r1, r0
    4b7a:	0205      	lsls	r5, r0, #8
    4b7c:	0000      	movs	r0, r0
    4b7e:	0000      	movs	r0, r0
    4b80:	ea03 0106 	and.w	r1, r3, r6
    4b84:	1d18      	adds	r0, r3, #4
    4b86:	1d23      	adds	r3, r4, #4
    4b88:	2a32      	cmp	r2, #50	; 0x32
    4b8a:	2141      	movs	r1, #65	; 0x41
    4b8c:	0221      	lsls	r1, r4, #8
    4b8e:	0004      	movs	r4, r0
    4b90:	0101      	lsls	r1, r0, #4
    4b92:	3a43      	subs	r2, #67	; 0x43
    4b94:	775c      	strb	r4, [r3, #29]
    4b96:	726f      	strb	r7, [r5, #9]
    4b98:	736b      	strb	r3, [r5, #13]
    4b9a:	6170      	str	r0, [r6, #20]
    4b9c:	6563      	str	r3, [r4, #84]	; 0x54
    4b9e:	395c      	subs	r1, #92	; 0x5c
    4ba0:	5f39      	ldrsh	r1, [r7, r4]
    4ba2:	6572      	str	r2, [r6, #84]	; 0x54
    4ba4:	6f70      	ldr	r0, [r6, #116]	; 0x74
    4ba6:	6d5c      	ldr	r4, [r3, #84]	; 0x54
    4ba8:	7563      	strb	r3, [r4, #21]
    4baa:	732d      	strb	r5, [r5, #12]
    4bac:	6b64      	ldr	r4, [r4, #52]	; 0x34
    4bae:	322d      	adds	r2, #45	; 0x2d
    4bb0:	302e      	adds	r0, #46	; 0x2e
    4bb2:	645c      	str	r4, [r3, #68]	; 0x44
    4bb4:	7665      	strb	r5, [r4, #25]
    4bb6:	6369      	str	r1, [r5, #52]	; 0x34
    4bb8:	7365      	strb	r5, [r4, #13]
    4bba:	4c5c      	ldr	r4, [pc, #368]	; (0x4d2c)
    4bbc:	4350      	muls	r0, r2
    4bbe:	3535      	adds	r5, #53	; 0x35
    4bc0:	3653      	adds	r6, #83	; 0x53
    4bc2:	5c39      	ldrb	r1, [r7, r0]
    4bc4:	7366      	strb	r6, [r4, #13]
    4bc6:	5f6c      	ldrsh	r4, [r5, r5]
    4bc8:	6f70      	ldr	r0, [r6, #116]	; 0x74
    4bca:	6577      	str	r7, [r6, #84]	; 0x54
    4bcc:	5f72      	ldrsh	r2, [r6, r5]
    4bce:	696c      	ldr	r4, [r5, #20]
    4bd0:	5c62      	ldrb	r2, [r4, r1]
    4bd2:	636d      	str	r5, [r5, #52]	; 0x34
    4bd4:	7875      	ldrb	r5, [r6, #1]
    4bd6:	685c      	ldr	r4, [r3, #4]
    4bd8:	7261      	strb	r1, [r4, #9]
    4bda:	6164      	str	r4, [r4, #20]
    4bdc:	6962      	ldr	r2, [r4, #20]
    4bde:	525c      	strh	r4, [r3, r1]
    4be0:	6c65      	ldr	r5, [r4, #68]	; 0x44
    4be2:	6165      	str	r5, [r4, #20]
    4be4:	6573      	str	r3, [r6, #84]	; 0x54
    4be6:	6c00      	ldr	r0, [r0, #64]	; 0x40
    4be8:	5f66      	ldrsh	r6, [r4, r5]
    4bea:	6573      	str	r3, [r6, #84]	; 0x54
    4bec:	5f74      	ldrsh	r4, [r6, r5]
    4bee:	646c      	str	r4, [r5, #68]	; 0x44
    4bf0:	5f6f      	ldrsh	r7, [r5, r5]
    4bf2:	6f61      	ldr	r1, [r4, #116]	; 0x74
    4bf4:	6c5f      	ldr	r7, [r3, #68]	; 0x44
    4bf6:	6f64      	ldr	r4, [r4, #116]	; 0x74
    4bf8:	6d5f      	ldr	r7, [r3, #84]	; 0x54
    4bfa:	6d65      	ldr	r5, [r4, #84]	; 0x54
    4bfc:	765f      	strb	r7, [r3, #25]
    4bfe:	6c6f      	ldr	r7, [r5, #68]	; 0x44
    4c00:	6174      	str	r4, [r6, #20]
    4c02:	6567      	str	r7, [r4, #84]	; 0x54
    4c04:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4c06:	4f4e      	ldr	r7, [pc, #312]	; (0x4d40)
    4c08:	454e      	cmp	r6, r9
    4c0a:	745f      	strb	r7, [r3, #17]
    4c0c:	5f6f      	ldrsh	r7, [r5, r5]
    4c0e:	5348      	strh	r0, [r1, r5]
    4c10:	534c      	strh	r4, [r1, r5]
    4c12:	4950      	ldr	r1, [pc, #320]	; (0x4d54)
    4c14:	4c00      	ldr	r4, [pc, #0]	; (0x4c18)
    4c16:	4f44      	ldr	r7, [pc, #272]	; (0x4d28)
    4c18:	4d50      	ldr	r5, [pc, #320]	; (0x4d5c)
    4c1a:	0055      	lsls	r5, r2, #1
    4c1c:	5f56      	ldrsh	r6, [r2, r5]
    4c1e:	4f41      	ldr	r7, [pc, #260]	; (0x4d24)
    4c20:	305f      	adds	r0, #95	; 0x5f
    4c22:	3950      	subs	r1, #80	; 0x50
    4c24:	3030      	adds	r0, #48	; 0x30
    4c26:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4c28:	4c43      	ldr	r4, [pc, #268]	; (0x4d38)
    4c2a:	434f      	muls	r7, r1
    4c2c:	5f4b      	ldrsh	r3, [r1, r5]
    4c2e:	724d      	strb	r5, [r1, #9]
    4c30:	0074      	lsls	r4, r6, #1
    4c32:	466b      	mov	r3, sp
    4c34:	4f52      	ldr	r7, [pc, #328]	; (0x4d80)
    4c36:	3231      	adds	r2, #49	; 0x31
    4c38:	5f4d      	ldrsh	r5, [r1, r5]
    4c3a:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4c3c:	465f      	mov	r7, fp
    4c3e:	454c      	cmp	r4, r9
    4c40:	4358      	muls	r0, r3
    4c42:	4d4f      	ldr	r5, [pc, #316]	; (0x4d80)
    4c44:	304d      	adds	r0, #77	; 0x4d
    4c46:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4c48:	5246      	strh	r6, [r0, r1]
    4c4a:	314f      	adds	r1, #79	; 0x4f
    4c4c:	4d32      	ldr	r5, [pc, #200]	; (0x4d18)
    4c4e:	745f      	strb	r7, [r3, #17]
    4c50:	5f6f      	ldrsh	r7, [r5, r5]
    4c52:	4c46      	ldr	r4, [pc, #280]	; (0x4d6c)
    4c54:	5845      	ldr	r5, [r0, r1]
    4c56:	4f43      	ldr	r7, [pc, #268]	; (0x4d64)
    4c58:	4d4d      	ldr	r5, [pc, #308]	; (0x4d90)
    4c5a:	0031      	movs	r1, r6
    4c5c:	466b      	mov	r3, sp
    4c5e:	4f52      	ldr	r7, [pc, #328]	; (0x4da8)
    4c60:	3231      	adds	r2, #49	; 0x31
    4c62:	5f4d      	ldrsh	r5, [r1, r5]
    4c64:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4c66:	465f      	mov	r7, fp
    4c68:	454c      	cmp	r4, r9
    4c6a:	4358      	muls	r0, r3
    4c6c:	4d4f      	ldr	r5, [pc, #316]	; (0x4dac)
    4c6e:	324d      	adds	r2, #77	; 0x4d
    4c70:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4c72:	5246      	strh	r6, [r0, r1]
    4c74:	314f      	adds	r1, #79	; 0x4f
    4c76:	4d32      	ldr	r5, [pc, #200]	; (0x4d40)
    4c78:	745f      	strb	r7, [r3, #17]
    4c7a:	5f6f      	ldrsh	r7, [r5, r5]
    4c7c:	4c46      	ldr	r4, [pc, #280]	; (0x4d98)
    4c7e:	5845      	ldr	r5, [r0, r1]
    4c80:	4f43      	ldr	r7, [pc, #268]	; (0x4d90)
    4c82:	4d4d      	ldr	r5, [pc, #308]	; (0x4db8)
    4c84:	0033      	movs	r3, r6
    4c86:	466b      	mov	r3, sp
    4c88:	4f52      	ldr	r7, [pc, #328]	; (0x4dd4)
    4c8a:	3231      	adds	r2, #49	; 0x31
    4c8c:	5f4d      	ldrsh	r5, [r1, r5]
    4c8e:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4c90:	465f      	mov	r7, fp
    4c92:	454c      	cmp	r4, r9
    4c94:	4358      	muls	r0, r3
    4c96:	4d4f      	ldr	r5, [pc, #316]	; (0x4dd4)
    4c98:	344d      	adds	r4, #77	; 0x4d
    4c9a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4c9c:	5246      	strh	r6, [r0, r1]
    4c9e:	314f      	adds	r1, #79	; 0x4f
    4ca0:	4d32      	ldr	r5, [pc, #200]	; (0x4d6c)
    4ca2:	745f      	strb	r7, [r3, #17]
    4ca4:	5f6f      	ldrsh	r7, [r5, r5]
    4ca6:	4c46      	ldr	r4, [pc, #280]	; (0x4dc0)
    4ca8:	5845      	ldr	r5, [r0, r1]
    4caa:	4f43      	ldr	r7, [pc, #268]	; (0x4db8)
    4cac:	4d4d      	ldr	r5, [pc, #308]	; (0x4de4)
    4cae:	0035      	movs	r5, r6
    4cb0:	466b      	mov	r3, sp
    4cb2:	4f52      	ldr	r7, [pc, #328]	; (0x4dfc)
    4cb4:	3231      	adds	r2, #49	; 0x31
    4cb6:	5f4d      	ldrsh	r5, [r1, r5]
    4cb8:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4cba:	465f      	mov	r7, fp
    4cbc:	454c      	cmp	r4, r9
    4cbe:	4358      	muls	r0, r3
    4cc0:	4d4f      	ldr	r5, [pc, #316]	; (0x4e00)
    4cc2:	364d      	adds	r6, #77	; 0x4d
    4cc4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4cc6:	5246      	strh	r6, [r0, r1]
    4cc8:	314f      	adds	r1, #79	; 0x4f
    4cca:	4d32      	ldr	r5, [pc, #200]	; (0x4d94)
    4ccc:	745f      	strb	r7, [r3, #17]
    4cce:	5f6f      	ldrsh	r7, [r5, r5]
    4cd0:	4c46      	ldr	r4, [pc, #280]	; (0x4dec)
    4cd2:	5845      	ldr	r5, [r0, r1]
    4cd4:	4f43      	ldr	r7, [pc, #268]	; (0x4de4)
    4cd6:	4d4d      	ldr	r5, [pc, #308]	; (0x4e0c)
    4cd8:	0037      	movs	r7, r6
    4cda:	4f50      	ldr	r7, [pc, #320]	; (0x4e1c)
    4cdc:	4557      	cmp	r7, sl
    4cde:	5f52      	ldrsh	r2, [r2, r5]
    4ce0:	6e45      	ldr	r5, [r0, #100]	; 0x64
    4ce2:	6574      	str	r4, [r6, #84]	; 0x54
    4ce4:	4c72      	ldr	r4, [pc, #456]	; (0x4eb0)
    4ce6:	776f      	strb	r7, [r5, #29]
    4ce8:	6f50      	ldr	r0, [r2, #116]	; 0x74
    4cea:	6577      	str	r7, [r6, #84]	; 0x54
    4cec:	0072      	lsls	r2, r6, #1
    4cee:	666c      	str	r4, [r5, #100]	; 0x64
    4cf0:	675f      	str	r7, [r3, #116]	; 0x74
    4cf2:	7465      	strb	r5, [r4, #17]
    4cf4:	645f      	str	r7, [r3, #68]	; 0x44
    4cf6:	6565      	str	r5, [r4, #84]	; 0x54
    4cf8:	7370      	strb	r0, [r6, #13]
    4cfa:	656c      	str	r4, [r5, #84]	; 0x54
    4cfc:	7065      	strb	r5, [r4, #1]
    4cfe:	635f      	str	r7, [r3, #52]	; 0x34
    4d00:	726f      	strb	r7, [r5, #9]
    4d02:	5f65      	ldrsh	r5, [r4, r5]
    4d04:	7573      	strb	r3, [r6, #21]
    4d06:	7070      	strb	r0, [r6, #1]
    4d08:	796c      	ldrb	r4, [r5, #5]
    4d0a:	635f      	str	r7, [r3, #52]	; 0x34
    4d0c:	6766      	str	r6, [r4, #116]	; 0x74
    4d0e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4d10:	7453      	strb	r3, [r2, #17]
    4d12:	7461      	strb	r1, [r4, #17]
    4d14:	7375      	strb	r5, [r6, #13]
    4d16:	7247      	strb	r7, [r0, #9]
    4d18:	756f      	strb	r7, [r5, #21]
    4d1a:	5f70      	ldrsh	r0, [r6, r5]
    4d1c:	494c      	ldr	r1, [pc, #304]	; (0x4e50)
    4d1e:	5453      	strb	r3, [r2, r1]
    4d20:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4d22:	5845      	ldr	r5, [r0, r1]
    4d24:	5f54      	ldrsh	r4, [r2, r5]
    4d26:	4c43      	ldr	r4, [pc, #268]	; (0x4e34)
    4d28:	5f4b      	ldrsh	r3, [r1, r5]
    4d2a:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4d2c:	4d5f      	ldr	r5, [pc, #380]	; (0x4eac)
    4d2e:	4941      	ldr	r1, [pc, #260]	; (0x4e34)
    4d30:	5f4e      	ldrsh	r6, [r1, r5]
    4d32:	4c43      	ldr	r4, [pc, #268]	; (0x4e40)
    4d34:	004b      	lsls	r3, r1, #1
    4d36:	7570      	strb	r0, [r6, #21]
    4d38:	6c6c      	ldr	r4, [r5, #68]	; 0x44
    4d3a:	755f      	strb	r7, [r3, #21]
    4d3c:	5f70      	ldrsh	r0, [r6, r5]
    4d3e:	616d      	str	r5, [r5, #20]
    4d40:	6b73      	ldr	r3, [r6, #52]	; 0x34
    4d42:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4d44:	7453      	strb	r3, [r2, #17]
    4d46:	7461      	strb	r1, [r4, #17]
    4d48:	7375      	strb	r5, [r6, #13]
    4d4a:	7247      	strb	r7, [r0, #9]
    4d4c:	756f      	strb	r7, [r5, #21]
    4d4e:	5f70      	ldrsh	r0, [r6, r5]
    4d50:	4c46      	ldr	r4, [pc, #280]	; (0x4e6c)
    4d52:	5845      	ldr	r5, [r0, r1]
    4d54:	4f43      	ldr	r7, [pc, #268]	; (0x4e64)
    4d56:	4d4d      	ldr	r5, [pc, #308]	; (0x4e8c)
    4d58:	495f      	ldr	r1, [pc, #380]	; (0x4ed8)
    4d5a:	4332      	orrs	r2, r6
    4d5c:	5500      	strb	r0, [r0, r4]
    4d5e:	4253      	negs	r3, r2
    4d60:	5348      	strh	r0, [r1, r5]
    4d62:	505f      	str	r7, [r3, r1]
    4d64:	5948      	ldr	r0, [r1, r5]
    4d66:	435f      	muls	r7, r3
    4d68:	5254      	strh	r4, [r2, r1]
    4d6a:	004c      	lsls	r4, r1, #1
    4d6c:	436b      	muls	r3, r5
    4d6e:	4f4c      	ldr	r7, [pc, #304]	; (0x4ea0)
    4d70:	4b43      	ldr	r3, [pc, #268]	; (0x4e80)
    4d72:	535f      	strh	r7, [r3, r5]
    4d74:	6964      	ldr	r4, [r4, #20]
    4d76:	006f      	lsls	r7, r5, #1
    4d78:	5f56      	ldrsh	r6, [r2, r5]
    4d7a:	4f41      	ldr	r7, [pc, #260]	; (0x4e80)
    4d7c:	305f      	adds	r0, #95	; 0x5f
    4d7e:	3850      	subs	r0, #80	; 0x50
    4d80:	3537      	adds	r5, #55	; 0x37
    4d82:	4400      	add	r0, r0
    4d84:	4343      	muls	r3, r0
    4d86:	564d      	ldrsb	r5, [r1, r1]
    4d88:	4341      	muls	r1, r0
    4d8a:	4600      	mov	r0, r0
    4d8c:	414c      	adcs	r4, r1
    4d8e:	4853      	ldr	r0, [pc, #332]	; (0x4edc)
    4d90:	4352      	muls	r2, r2
    4d92:	4b4c      	ldr	r3, [pc, #304]	; (0x4ec4)
    4d94:	4553      	cmp	r3, sl
    4d96:	004c      	lsls	r4, r1, #1
    4d98:	5f56      	ldrsh	r6, [r2, r5]
    4d9a:	4544      	cmp	r4, r8
    4d9c:	5045      	str	r5, [r0, r1]
    4d9e:	4c53      	ldr	r4, [pc, #332]	; (0x4eec)
    4da0:	4545      	cmp	r5, r8
    4da2:	5f50      	ldrsh	r0, [r2, r5]
    4da4:	5030      	str	r0, [r6, r0]
    4da6:	3239      	adds	r2, #57	; 0x39
    4da8:	0035      	movs	r5, r6
    4daa:	425f      	negs	r7, r3
    4dac:	6f6f      	ldr	r7, [r5, #116]	; 0x74
    4dae:	006c      	lsls	r4, r5, #1
    4db0:	436b      	muls	r3, r5
    4db2:	4f4c      	ldr	r7, [pc, #304]	; (0x4ee4)
    4db4:	4b43      	ldr	r3, [pc, #268]	; (0x4ec4)
    4db6:	4f5f      	ldr	r7, [pc, #380]	; (0x4f34)
    4db8:	5473      	strb	r3, [r6, r1]
    4dba:	6d69      	ldr	r1, [r5, #84]	; 0x54
    4dbc:	7265      	strb	r5, [r4, #9]
    4dbe:	0030      	movs	r0, r6
    4dc0:	4c46      	ldr	r4, [pc, #280]	; (0x4edc)
    4dc2:	5845      	ldr	r5, [r0, r1]
    4dc4:	5246      	strh	r6, [r0, r1]
    4dc6:	3447      	adds	r4, #71	; 0x47
    4dc8:	5443      	strb	r3, [r0, r1]
    4dca:	4c52      	ldr	r4, [pc, #328]	; (0x4f14)
    4dcc:	4400      	add	r0, r0
    4dce:	4343      	muls	r3, r0
    4dd0:	564d      	ldrsb	r5, [r1, r1]
    4dd2:	5541      	strb	r1, [r0, r5]
    4dd4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4dd6:	4f4e      	ldr	r7, [pc, #312]	; (0x4f10)
    4dd8:	454e      	cmp	r6, r9
    4dda:	745f      	strb	r7, [r3, #17]
    4ddc:	5f6f      	ldrsh	r7, [r5, r5]
    4dde:	4353      	muls	r3, r2
    4de0:	5f54      	ldrsh	r4, [r2, r5]
    4de2:	4c43      	ldr	r4, [pc, #268]	; (0x4ef0)
    4de4:	004b      	lsls	r3, r1, #1
    4de6:	466b      	mov	r3, sp
    4de8:	4f52      	ldr	r7, [pc, #328]	; (0x4f34)
    4dea:	485f      	ldr	r0, [pc, #380]	; (0x4f68)
    4dec:	5f46      	ldrsh	r6, [r0, r5]
    4dee:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4df0:	435f      	muls	r7, r3
    4df2:	4954      	ldr	r1, [pc, #336]	; (0x4f44)
    4df4:	454d      	cmp	r5, r9
    4df6:	3052      	adds	r0, #82	; 0x52
    4df8:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4dfa:	5246      	strh	r6, [r0, r1]
    4dfc:	5f4f      	ldrsh	r7, [r1, r5]
    4dfe:	4648      	mov	r0, r9
    4e00:	745f      	strb	r7, [r3, #17]
    4e02:	5f6f      	ldrsh	r7, [r5, r5]
    4e04:	5443      	strb	r3, [r0, r1]
    4e06:	4d49      	ldr	r5, [pc, #292]	; (0x4f2c)
    4e08:	5245      	strh	r5, [r0, r1]
    4e0a:	0031      	movs	r1, r6
    4e0c:	466b      	mov	r3, sp
    4e0e:	4f52      	ldr	r7, [pc, #328]	; (0x4f58)
    4e10:	485f      	ldr	r0, [pc, #380]	; (0x4f90)
    4e12:	5f46      	ldrsh	r6, [r0, r5]
    4e14:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4e16:	435f      	muls	r7, r3
    4e18:	4954      	ldr	r1, [pc, #336]	; (0x4f6c)
    4e1a:	454d      	cmp	r5, r9
    4e1c:	3252      	adds	r2, #82	; 0x52
    4e1e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4e20:	5246      	strh	r6, [r0, r1]
    4e22:	5f4f      	ldrsh	r7, [r1, r5]
    4e24:	4648      	mov	r0, r9
    4e26:	745f      	strb	r7, [r3, #17]
    4e28:	5f6f      	ldrsh	r7, [r5, r5]
    4e2a:	5443      	strb	r3, [r0, r1]
    4e2c:	4d49      	ldr	r5, [pc, #292]	; (0x4f54)
    4e2e:	5245      	strh	r5, [r0, r1]
    4e30:	0033      	movs	r3, r6
    4e32:	436b      	muls	r3, r5
    4e34:	4f4c      	ldr	r7, [pc, #304]	; (0x4f68)
    4e36:	4b43      	ldr	r3, [pc, #268]	; (0x4f44)
    4e38:	495f      	ldr	r1, [pc, #380]	; (0x4fb8)
    4e3a:	636f      	str	r7, [r5, #52]	; 0x34
    4e3c:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    4e3e:	5000      	str	r0, [r0, r0]
    4e40:	574f      	ldrsb	r7, [r1, r5]
    4e42:	5245      	strh	r5, [r0, r1]
    4e44:	585f      	ldr	r7, [r3, r1]
    4e46:	6174      	str	r4, [r6, #20]
    4e48:	336c      	adds	r3, #108	; 0x6c
    4e4a:	6b32      	ldr	r2, [r6, #48]	; 0x30
    4e4c:	7a68      	ldrb	r0, [r5, #9]
    4e4e:	6143      	str	r3, [r0, #20]
    4e50:	6170      	str	r0, [r6, #20]
    4e52:	6162      	str	r2, [r4, #20]
    4e54:	6b6e      	ldr	r6, [r5, #52]	; 0x34
    4e56:	7254      	strb	r4, [r2, #9]
    4e58:	6d69      	ldr	r1, [r5, #84]	; 0x54
    4e5a:	5000      	str	r0, [r0, r0]
    4e5c:	5344      	strh	r4, [r0, r5]
    4e5e:	454c      	cmp	r4, r9
    4e60:	5045      	str	r5, [r0, r1]
    4e62:	4643      	mov	r3, r8
    4e64:	3047      	adds	r0, #71	; 0x47
    4e66:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4e68:	5246      	strh	r6, [r0, r1]
    4e6a:	314f      	adds	r1, #79	; 0x4f
    4e6c:	5f4d      	ldrsh	r5, [r1, r5]
    4e6e:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4e70:	435f      	muls	r7, r3
    4e72:	4954      	ldr	r1, [pc, #336]	; (0x4fc4)
    4e74:	454d      	cmp	r5, r9
    4e76:	3052      	adds	r0, #82	; 0x52
    4e78:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4e7a:	5246      	strh	r6, [r0, r1]
    4e7c:	314f      	adds	r1, #79	; 0x4f
    4e7e:	5f4d      	ldrsh	r5, [r1, r5]
    4e80:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4e82:	435f      	muls	r7, r3
    4e84:	4954      	ldr	r1, [pc, #336]	; (0x4fd8)
    4e86:	454d      	cmp	r5, r9
    4e88:	3152      	adds	r1, #82	; 0x52
    4e8a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4e8c:	5246      	strh	r6, [r0, r1]
    4e8e:	314f      	adds	r1, #79	; 0x4f
    4e90:	5f4d      	ldrsh	r5, [r1, r5]
    4e92:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4e94:	435f      	muls	r7, r3
    4e96:	4954      	ldr	r1, [pc, #336]	; (0x4fe8)
    4e98:	454d      	cmp	r5, r9
    4e9a:	3252      	adds	r2, #82	; 0x52
    4e9c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4e9e:	5246      	strh	r6, [r0, r1]
    4ea0:	314f      	adds	r1, #79	; 0x4f
    4ea2:	5f4d      	ldrsh	r5, [r1, r5]
    4ea4:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4ea6:	435f      	muls	r7, r3
    4ea8:	4954      	ldr	r1, [pc, #336]	; (0x4ffc)
    4eaa:	454d      	cmp	r5, r9
    4eac:	3352      	adds	r3, #82	; 0x52
    4eae:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4eb0:	5246      	strh	r6, [r0, r1]
    4eb2:	314f      	adds	r1, #79	; 0x4f
    4eb4:	5f4d      	ldrsh	r5, [r1, r5]
    4eb6:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4eb8:	435f      	muls	r7, r3
    4eba:	4954      	ldr	r1, [pc, #336]	; (0x500c)
    4ebc:	454d      	cmp	r5, r9
    4ebe:	3452      	adds	r4, #82	; 0x52
    4ec0:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4ec2:	7453      	strb	r3, [r2, #17]
    4ec4:	7461      	strb	r1, [r4, #17]
    4ec6:	7375      	strb	r5, [r6, #13]
    4ec8:	7247      	strb	r7, [r0, #9]
    4eca:	756f      	strb	r7, [r5, #21]
    4ecc:	5f70      	ldrsh	r0, [r6, r5]
    4ece:	4553      	cmp	r3, sl
    4ed0:	4952      	ldr	r1, [pc, #328]	; (0x501c)
    4ed2:	4c41      	ldr	r4, [pc, #260]	; (0x4fd8)
    4ed4:	414d      	adcs	r5, r1
    4ed6:	414e      	adcs	r6, r1
    4ed8:	4547      	cmp	r7, r8
    4eda:	0052      	lsls	r2, r2, #1
    4edc:	4c50      	ldr	r4, [pc, #320]	; (0x5020)
    4ede:	314c      	adds	r1, #76	; 0x4c
    4ee0:	5443      	strb	r3, [r0, r1]
    4ee2:	4c52      	ldr	r4, [pc, #328]	; (0x502c)
    4ee4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4ee6:	5845      	ldr	r5, [r0, r1]
    4ee8:	5f54      	ldrsh	r4, [r2, r5]
    4eea:	4c43      	ldr	r4, [pc, #268]	; (0x4ff8)
    4eec:	5f4b      	ldrsh	r3, [r1, r5]
    4eee:	6f74      	ldr	r4, [r6, #116]	; 0x74
    4ef0:	535f      	strh	r7, [r3, r5]
    4ef2:	5443      	strb	r3, [r0, r1]
    4ef4:	435f      	muls	r7, r3
    4ef6:	4b4c      	ldr	r3, [pc, #304]	; (0x5028)
    4ef8:	4900      	ldr	r1, [pc, #0]	; (0x4efc)
    4efa:	5f44      	ldrsh	r4, [r0, r5]
    4efc:	4644      	mov	r4, r8
    4efe:	0052      	lsls	r2, r2, #1
    4f00:	6f70      	ldr	r0, [r6, #116]	; 0x74
    4f02:	6577      	str	r7, [r6, #84]	; 0x54
    4f04:	5f72      	ldrsh	r2, [r6, r5]
    4f06:	7963      	ldrb	r3, [r4, #5]
    4f08:	6c63      	ldr	r3, [r4, #68]	; 0x44
    4f0a:	5f65      	ldrsh	r5, [r4, r5]
    4f0c:	7063      	strb	r3, [r4, #1]
    4f0e:	5f75      	ldrsh	r5, [r6, r5]
    4f10:	6e61      	ldr	r1, [r4, #100]	; 0x64
    4f12:	5f64      	ldrsh	r4, [r4, r5]
    4f14:	6c66      	ldr	r6, [r4, #68]	; 0x44
    4f16:	7361      	strb	r1, [r4, #13]
    4f18:	0068      	lsls	r0, r5, #1
    4f1a:	4f42      	ldr	r7, [pc, #264]	; (0x5024)
    4f1c:	5f44      	ldrsh	r4, [r0, r5]
    4f1e:	4344      	muls	r4, r0
    4f20:	4344      	muls	r4, r0
    4f22:	495f      	ldr	r1, [pc, #380]	; (0x50a0)
    4f24:	544e      	strb	r6, [r1, r1]
    4f26:	435f      	muls	r7, r3
    4f28:	5254      	strh	r4, [r2, r1]
    4f2a:	004c      	lsls	r4, r1, #1
    4f2c:	536b      	strh	r3, [r5, r5]
    4f2e:	6174      	str	r4, [r6, #20]
    4f30:	7574      	strb	r4, [r6, #21]
    4f32:	4773      	bx	lr
    4f34:	6f72      	ldr	r2, [r6, #116]	; 0x74
    4f36:	7075      	strb	r5, [r6, #1]
    4f38:	455f      	cmp	r7, fp
    4f3a:	4d44      	ldr	r5, [pc, #272]	; (0x504c)
    4f3c:	0041      	lsls	r1, r0, #1
    4f3e:	5443      	strb	r3, [r0, r1]
    4f40:	4c52      	ldr	r4, [pc, #328]	; (0x508c)
    4f42:	5300      	strh	r0, [r0, r4]
    4f44:	4e45      	ldr	r6, [pc, #276]	; (0x505c)
    4f46:	4553      	cmp	r3, sl
    4f48:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4f4a:	4c43      	ldr	r4, [pc, #268]	; (0x5058)
    4f4c:	434f      	muls	r7, r1
    4f4e:	5f4b      	ldrsh	r3, [r1, r5]
    4f50:	6143      	str	r3, [r0, #20]
    4f52:	7073      	strb	r3, [r6, #1]
    4f54:	7265      	strb	r5, [r4, #9]
    4f56:	5200      	strh	r0, [r0, r0]
    4f58:	4553      	cmp	r3, sl
    4f5a:	5652      	ldrsb	r2, [r2, r1]
    4f5c:	4445      	add	r5, r8
    4f5e:	0031      	movs	r1, r6
    4f60:	436b      	muls	r3, r5
    4f62:	4f4c      	ldr	r7, [pc, #304]	; (0x5094)
    4f64:	4b43      	ldr	r3, [pc, #268]	; (0x5074)
    4f66:	465f      	mov	r7, fp
    4f68:	656c      	str	r4, [r5, #84]	; 0x54
    4f6a:	4378      	muls	r0, r7
    4f6c:	6d6f      	ldr	r7, [r5, #84]	; 0x54
    4f6e:	306d      	adds	r0, #109	; 0x6d
    4f70:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4f72:	4c43      	ldr	r4, [pc, #268]	; (0x5080)
    4f74:	434f      	muls	r7, r1
    4f76:	5f4b      	ldrsh	r3, [r1, r5]
    4f78:	6c46      	ldr	r6, [r0, #68]	; 0x44
    4f7a:	7865      	ldrb	r5, [r4, #1]
    4f7c:	6f43      	ldr	r3, [r0, #116]	; 0x74
    4f7e:	6d6d      	ldr	r5, [r5, #84]	; 0x54
    4f80:	0031      	movs	r1, r6
    4f82:	436b      	muls	r3, r5
    4f84:	4f4c      	ldr	r7, [pc, #304]	; (0x50b8)
    4f86:	4b43      	ldr	r3, [pc, #268]	; (0x5094)
    4f88:	465f      	mov	r7, fp
    4f8a:	656c      	str	r4, [r5, #84]	; 0x54
    4f8c:	4378      	muls	r0, r7
    4f8e:	6d6f      	ldr	r7, [r5, #84]	; 0x54
    4f90:	326d      	adds	r2, #109	; 0x6d
    4f92:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4f94:	4c43      	ldr	r4, [pc, #268]	; (0x50a4)
    4f96:	434f      	muls	r7, r1
    4f98:	5f4b      	ldrsh	r3, [r1, r5]
    4f9a:	6c46      	ldr	r6, [r0, #68]	; 0x44
    4f9c:	7865      	ldrb	r5, [r4, #1]
    4f9e:	6f43      	ldr	r3, [r0, #116]	; 0x74
    4fa0:	6d6d      	ldr	r5, [r5, #84]	; 0x54
    4fa2:	0033      	movs	r3, r6
    4fa4:	436b      	muls	r3, r5
    4fa6:	4f4c      	ldr	r7, [pc, #304]	; (0x50d8)
    4fa8:	4b43      	ldr	r3, [pc, #268]	; (0x50b8)
    4faa:	465f      	mov	r7, fp
    4fac:	656c      	str	r4, [r5, #84]	; 0x54
    4fae:	4378      	muls	r0, r7
    4fb0:	6d6f      	ldr	r7, [r5, #84]	; 0x54
    4fb2:	346d      	adds	r4, #109	; 0x6d
    4fb4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4fb6:	4c43      	ldr	r4, [pc, #268]	; (0x50c4)
    4fb8:	434f      	muls	r7, r1
    4fba:	5f4b      	ldrsh	r3, [r1, r5]
    4fbc:	6c46      	ldr	r6, [r0, #68]	; 0x44
    4fbe:	7865      	ldrb	r5, [r4, #1]
    4fc0:	6f43      	ldr	r3, [r0, #116]	; 0x74
    4fc2:	6d6d      	ldr	r5, [r5, #84]	; 0x54
    4fc4:	0035      	movs	r5, r6
    4fc6:	436b      	muls	r3, r5
    4fc8:	4f4c      	ldr	r7, [pc, #304]	; (0x50fc)
    4fca:	4b43      	ldr	r3, [pc, #268]	; (0x50d8)
    4fcc:	465f      	mov	r7, fp
    4fce:	656c      	str	r4, [r5, #84]	; 0x54
    4fd0:	4378      	muls	r0, r7
    4fd2:	6d6f      	ldr	r7, [r5, #84]	; 0x54
    4fd4:	366d      	adds	r6, #109	; 0x6d
    4fd6:	6b00      	ldr	r0, [r0, #48]	; 0x30
    4fd8:	4c43      	ldr	r4, [pc, #268]	; (0x50e8)
    4fda:	434f      	muls	r7, r1
    4fdc:	5f4b      	ldrsh	r3, [r1, r5]
    4fde:	6c46      	ldr	r6, [r0, #68]	; 0x44
    4fe0:	7865      	ldrb	r5, [r4, #1]
    4fe2:	6f43      	ldr	r3, [r0, #116]	; 0x74
    4fe4:	6d6d      	ldr	r5, [r5, #84]	; 0x54
    4fe6:	0037      	movs	r7, r6
    4fe8:	3875      	subs	r0, #117	; 0x75
    4fea:	4549      	cmp	r1, r9
    4fec:	5843      	ldr	r3, [r0, r1]
    4fee:	6e69      	ldr	r1, [r5, #100]	; 0x64
    4ff0:	6143      	str	r3, [r0, #20]
    4ff2:	4370      	muls	r0, r6
    4ff4:	6c61      	ldr	r1, [r4, #68]	; 0x44
    4ff6:	7036      	strb	r6, [r6, #0]
    4ff8:	0046      	lsls	r6, r0, #1
    4ffa:	536b      	strh	r3, [r5, r5]
    4ffc:	6174      	str	r4, [r6, #20]
    4ffe:	7574      	strb	r4, [r6, #21]
    5000:	4773      	bx	lr
    5002:	6f72      	ldr	r2, [r6, #116]	; 0x74
    5004:	7075      	strb	r5, [r6, #1]
    5006:	4f5f      	ldr	r7, [pc, #380]	; (0x5184)
    5008:	4153      	adcs	r3, r2
    500a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    500c:	7453      	strb	r3, [r2, #17]
    500e:	7461      	strb	r1, [r4, #17]
    5010:	7375      	strb	r5, [r6, #13]
    5012:	7247      	strb	r7, [r0, #9]
    5014:	756f      	strb	r7, [r5, #21]
    5016:	5f70      	ldrsh	r0, [r6, r5]
    5018:	4453      	add	r3, sl
    501a:	5053      	str	r3, [r2, r1]
    501c:	0049      	lsls	r1, r1, #1
    501e:	4f49      	ldr	r7, [pc, #292]	; (0x5144)
    5020:	4f43      	ldr	r7, [pc, #268]	; (0x5130)
    5022:	5f4e      	ldrsh	r6, [r1, r5]
    5024:	7954      	ldrb	r4, [r2, #5]
    5026:	6570      	str	r0, [r6, #84]	; 0x54
    5028:	4900      	ldr	r1, [pc, #0]	; (0x502c)
    502a:	5f44      	ldrsh	r4, [r0, r5]
    502c:	5349      	strh	r1, [r1, r5]
    502e:	5241      	strh	r1, [r0, r1]
    5030:	7500      	strb	r0, [r0, #20]
    5032:	4938      	ldr	r1, [pc, #224]	; (0x5114)
    5034:	4345      	muls	r5, r0
    5036:	6f58      	ldr	r0, [r3, #116]	; 0x74
    5038:	7475      	strb	r5, [r6, #17]
    503a:	6143      	str	r3, [r0, #20]
    503c:	4370      	muls	r0, r6
    503e:	6c61      	ldr	r1, [r4, #68]	; 0x44
    5040:	7038      	strb	r0, [r7, #0]
    5042:	0046      	lsls	r6, r0, #1
    5044:	5254      	strh	r4, [r2, r1]
    5046:	4341      	muls	r1, r0
    5048:	4345      	muls	r5, r0
    504a:	4b4c      	ldr	r3, [pc, #304]	; (0x517c)
    504c:	4553      	cmp	r3, sl
    504e:	004c      	lsls	r4, r1, #1
    5050:	536b      	strh	r3, [r5, r5]
    5052:	6174      	str	r4, [r6, #20]
    5054:	7574      	strb	r4, [r6, #21]
    5056:	4773      	bx	lr
    5058:	6f72      	ldr	r2, [r6, #116]	; 0x74
    505a:	7075      	strb	r5, [r6, #1]
    505c:	445f      	add	r7, fp
    505e:	5053      	str	r3, [r2, r1]
    5060:	0049      	lsls	r1, r1, #1
    5062:	4f50      	ldr	r7, [pc, #320]	; (0x51a4)
    5064:	4557      	cmp	r7, sl
    5066:	5f52      	ldrsh	r2, [r2, r5]
    5068:	7943      	ldrb	r3, [r0, #5]
    506a:	6c63      	ldr	r3, [r4, #68]	; 0x44
    506c:	4365      	muls	r5, r4
    506e:	7570      	strb	r0, [r6, #21]
    5070:	6e41      	ldr	r1, [r0, #100]	; 0x64
    5072:	4664      	mov	r4, ip
    5074:	616c      	str	r4, [r5, #20]
    5076:	6873      	ldr	r3, [r6, #4]
    5078:	5600      	ldrsb	r0, [r0, r0]
    507a:	445f      	add	r7, fp
    507c:	4545      	cmp	r5, r8
    507e:	5350      	strh	r0, [r2, r5]
    5080:	454c      	cmp	r4, r9
    5082:	5045      	str	r5, [r0, r1]
    5084:	305f      	adds	r0, #95	; 0x5f
    5086:	3950      	subs	r1, #80	; 0x50
    5088:	3035      	adds	r0, #53	; 0x35
    508a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    508c:	4450      	add	r0, sl
    508e:	5552      	strb	r2, [r2, r5]
    5090:	434e      	muls	r6, r1
    5092:	4746      	bx	r8
    5094:	505f      	str	r7, [r3, r1]
    5096:	5f44      	ldrsh	r4, [r0, r5]
    5098:	5458      	strb	r0, [r3, r1]
    509a:	4c41      	ldr	r4, [pc, #260]	; (0x51a0)
    509c:	3233      	adds	r2, #51	; 0x33
    509e:	004b      	lsls	r3, r1, #1
    50a0:	506b      	str	r3, [r5, r1]
    50a2:	5244      	strh	r4, [r0, r1]
    50a4:	4e55      	ldr	r6, [pc, #340]	; (0x51fc)
    50a6:	4643      	mov	r3, r8
    50a8:	5f47      	ldrsh	r7, [r0, r5]
    50aa:	4450      	add	r0, sl
    50ac:	585f      	ldr	r7, [r3, r1]
    50ae:	4154      	adcs	r4, r2
    50b0:	334c      	adds	r3, #76	; 0x4c
    50b2:	4d32      	ldr	r5, [pc, #200]	; (0x517c)
    50b4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    50b6:	4c43      	ldr	r4, [pc, #268]	; (0x51c4)
    50b8:	434f      	muls	r7, r1
    50ba:	5f4b      	ldrsh	r3, [r1, r5]
    50bc:	634d      	str	r5, [r1, #52]	; 0x34
    50be:	6b6c      	ldr	r4, [r5, #52]	; 0x34
    50c0:	4100      	asrs	r0, r0
    50c2:	4248      	negs	r0, r1
    50c4:	4c43      	ldr	r4, [pc, #268]	; (0x51d4)
    50c6:	434b      	muls	r3, r1
    50c8:	5254      	strh	r4, [r2, r1]
    50ca:	004c      	lsls	r4, r1, #1
    50cc:	7063      	strb	r3, [r4, #1]
    50ce:	3075      	adds	r0, #117	; 0x75
    50d0:	695f      	ldr	r7, [r3, #20]
    50d2:	746e      	strb	r6, [r5, #17]
    50d4:	655f      	str	r7, [r3, #84]	; 0x54
    50d6:	616e      	str	r6, [r5, #20]
    50d8:	6c62      	ldr	r2, [r4, #68]	; 0x44
    50da:	5f65      	ldrsh	r5, [r4, r5]
    50dc:	0030      	movs	r0, r6
    50de:	7063      	strb	r3, [r4, #1]
    50e0:	3075      	adds	r0, #117	; 0x75
    50e2:	695f      	ldr	r7, [r3, #20]
    50e4:	746e      	strb	r6, [r5, #17]
    50e6:	655f      	str	r7, [r3, #84]	; 0x54
    50e8:	616e      	str	r6, [r5, #20]
    50ea:	6c62      	ldr	r2, [r4, #68]	; 0x44
    50ec:	5f65      	ldrsh	r5, [r4, r5]
    50ee:	0031      	movs	r1, r6
    50f0:	536b      	strh	r3, [r5, r5]
    50f2:	6174      	str	r4, [r6, #20]
    50f4:	7574      	strb	r4, [r6, #21]
    50f6:	4773      	bx	lr
    50f8:	6f72      	ldr	r2, [r6, #116]	; 0x74
    50fa:	7075      	strb	r5, [r6, #1]
    50fc:	4f5f      	ldr	r7, [pc, #380]	; (0x527c)
    50fe:	5054      	str	r4, [r2, r1]
    5100:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5102:	4c43      	ldr	r4, [pc, #268]	; (0x5210)
    5104:	434f      	muls	r7, r1
    5106:	5f4b      	ldrsh	r3, [r1, r5]
    5108:	6c46      	ldr	r6, [r0, #68]	; 0x44
    510a:	7865      	ldrb	r5, [r4, #1]
    510c:	6f63      	ldr	r3, [r4, #116]	; 0x74
    510e:	6d6d      	ldr	r5, [r5, #84]	; 0x54
    5110:	0030      	movs	r0, r6
    5112:	5a45      	ldrh	r5, [r0, r1]
    5114:	4948      	ldr	r1, [pc, #288]	; (0x5238)
    5116:	544e      	strb	r6, [r1, r1]
    5118:	6b00      	ldr	r0, [r0, #48]	; 0x30
    511a:	4c43      	ldr	r4, [pc, #268]	; (0x5228)
    511c:	434f      	muls	r7, r1
    511e:	5f4b      	ldrsh	r3, [r1, r5]
    5120:	6c46      	ldr	r6, [r0, #68]	; 0x44
    5122:	7865      	ldrb	r5, [r4, #1]
    5124:	6f63      	ldr	r3, [r4, #116]	; 0x74
    5126:	6d6d      	ldr	r5, [r5, #84]	; 0x54
    5128:	0032      	movs	r2, r6
    512a:	436b      	muls	r3, r5
    512c:	4f4c      	ldr	r7, [pc, #304]	; (0x5260)
    512e:	4b43      	ldr	r3, [pc, #268]	; (0x523c)
    5130:	465f      	mov	r7, fp
    5132:	656c      	str	r4, [r5, #84]	; 0x54
    5134:	6378      	str	r0, [r7, #52]	; 0x34
    5136:	6d6f      	ldr	r7, [r5, #84]	; 0x54
    5138:	336d      	adds	r3, #109	; 0x6d
    513a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    513c:	4c43      	ldr	r4, [pc, #268]	; (0x524c)
    513e:	434f      	muls	r7, r1
    5140:	5f4b      	ldrsh	r3, [r1, r5]
    5142:	6c46      	ldr	r6, [r0, #68]	; 0x44
    5144:	7865      	ldrb	r5, [r4, #1]
    5146:	6f63      	ldr	r3, [r4, #116]	; 0x74
    5148:	6d6d      	ldr	r5, [r5, #84]	; 0x54
    514a:	0034      	movs	r4, r6
    514c:	436b      	muls	r3, r5
    514e:	4f4c      	ldr	r7, [pc, #304]	; (0x5280)
    5150:	4b43      	ldr	r3, [pc, #268]	; (0x5260)
    5152:	465f      	mov	r7, fp
    5154:	656c      	str	r4, [r5, #84]	; 0x54
    5156:	6378      	str	r0, [r7, #52]	; 0x34
    5158:	6d6f      	ldr	r7, [r5, #84]	; 0x54
    515a:	356d      	adds	r5, #109	; 0x6d
    515c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    515e:	4c43      	ldr	r4, [pc, #268]	; (0x526c)
    5160:	434f      	muls	r7, r1
    5162:	5f4b      	ldrsh	r3, [r1, r5]
    5164:	6c46      	ldr	r6, [r0, #68]	; 0x44
    5166:	7865      	ldrb	r5, [r4, #1]
    5168:	6f63      	ldr	r3, [r4, #116]	; 0x74
    516a:	6d6d      	ldr	r5, [r5, #84]	; 0x54
    516c:	0036      	movs	r6, r6
    516e:	436b      	muls	r3, r5
    5170:	4f4c      	ldr	r7, [pc, #304]	; (0x52a4)
    5172:	4b43      	ldr	r3, [pc, #268]	; (0x5280)
    5174:	465f      	mov	r7, fp
    5176:	656c      	str	r4, [r5, #84]	; 0x54
    5178:	6378      	str	r0, [r7, #52]	; 0x34
    517a:	6d6f      	ldr	r7, [r5, #84]	; 0x54
    517c:	376d      	adds	r7, #109	; 0x6d
    517e:	5500      	strb	r0, [r0, r4]
    5180:	4253      	negs	r3, r2
    5182:	4330      	orrs	r0, r6
    5184:	4b4c      	ldr	r3, [pc, #304]	; (0x52b8)
    5186:	4944      	ldr	r1, [pc, #272]	; (0x5298)
    5188:	0056      	lsls	r6, r2, #1
    518a:	4d6b      	ldr	r5, [pc, #428]	; (0x5338)
    518c:	4941      	ldr	r1, [pc, #260]	; (0x5294)
    518e:	5f4e      	ldrsh	r6, [r1, r5]
    5190:	4c43      	ldr	r4, [pc, #268]	; (0x52a0)
    5192:	5f4b      	ldrsh	r3, [r1, r5]
    5194:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5196:	535f      	strh	r7, [r3, r5]
    5198:	4944      	ldr	r1, [pc, #272]	; (0x52ac)
    519a:	5f4f      	ldrsh	r7, [r1, r5]
    519c:	4c43      	ldr	r4, [pc, #268]	; (0x52ac)
    519e:	004b      	lsls	r3, r1, #1
    51a0:	766c      	strb	r4, [r5, #25]
    51a2:	6c5f      	ldr	r7, [r3, #68]	; 0x44
    51a4:	6f64      	ldr	r4, [r4, #116]	; 0x74
    51a6:	615f      	str	r7, [r3, #20]
    51a8:	5f6f      	ldrsh	r7, [r5, r5]
    51aa:	766d      	strb	r5, [r5, #25]
    51ac:	4600      	mov	r0, r0
    51ae:	454c      	cmp	r4, r9
    51b0:	4658      	mov	r0, fp
    51b2:	4752      	bx	sl
    51b4:	4331      	orrs	r1, r6
    51b6:	5254      	strh	r4, [r2, r1]
    51b8:	004c      	lsls	r4, r1, #1
    51ba:	536b      	strh	r3, [r5, r5]
    51bc:	6174      	str	r4, [r6, #20]
    51be:	7574      	strb	r4, [r6, #21]
    51c0:	4773      	bx	lr
    51c2:	6f72      	ldr	r2, [r6, #116]	; 0x74
    51c4:	7075      	strb	r5, [r6, #1]
    51c6:	485f      	ldr	r0, [pc, #380]	; (0x5344)
    51c8:	4c41      	ldr	r4, [pc, #260]	; (0x52d0)
    51ca:	495f      	ldr	r1, [pc, #380]	; (0x5348)
    51cc:	4332      	orrs	r2, r6
    51ce:	6b00      	ldr	r0, [r0, #48]	; 0x30
    51d0:	4c43      	ldr	r4, [pc, #268]	; (0x52e0)
    51d2:	434f      	muls	r7, r1
    51d4:	5f4b      	ldrsh	r3, [r1, r5]
    51d6:	6353      	str	r3, [r2, #52]	; 0x34
    51d8:	3074      	adds	r0, #116	; 0x74
    51da:	4900      	ldr	r1, [pc, #0]	; (0x51dc)
    51dc:	4543      	cmp	r3, r8
    51de:	0052      	lsls	r2, r2, #1
    51e0:	536b      	strh	r3, [r5, r5]
    51e2:	6174      	str	r4, [r6, #20]
    51e4:	7574      	strb	r4, [r6, #21]
    51e6:	4773      	bx	lr
    51e8:	6f72      	ldr	r2, [r6, #116]	; 0x74
    51ea:	7075      	strb	r5, [r6, #1]
    51ec:	4c5f      	ldr	r4, [pc, #380]	; (0x536c)
    51ee:	4350      	muls	r0, r2
    51f0:	495f      	ldr	r1, [pc, #380]	; (0x5370)
    51f2:	4332      	orrs	r2, r6
    51f4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    51f6:	7453      	strb	r3, [r2, #17]
    51f8:	7461      	strb	r1, [r4, #17]
    51fa:	7375      	strb	r5, [r6, #13]
    51fc:	7247      	strb	r7, [r0, #9]
    51fe:	756f      	strb	r7, [r5, #21]
    5200:	5f70      	ldrsh	r0, [r6, r5]
    5202:	4453      	add	r3, sl
    5204:	4152      	adcs	r2, r2
    5206:	434d      	muls	r5, r1
    5208:	6b00      	ldr	r0, [r0, #48]	; 0x30
    520a:	4c43      	ldr	r4, [pc, #268]	; (0x5318)
    520c:	434f      	muls	r7, r1
    520e:	5f4b      	ldrsh	r3, [r1, r5]
    5210:	6944      	ldr	r4, [r0, #20]
    5212:	4d76      	ldr	r5, [pc, #472]	; (0x53ec)
    5214:	6c43      	ldr	r3, [r0, #68]	; 0x44
    5216:	006b      	lsls	r3, r5, #1
    5218:	436b      	muls	r3, r5
    521a:	4f4c      	ldr	r7, [pc, #304]	; (0x534c)
    521c:	4b43      	ldr	r3, [pc, #268]	; (0x532c)
    521e:	425f      	negs	r7, r3
    5220:	7375      	strb	r5, [r6, #13]
    5222:	6c43      	ldr	r3, [r0, #68]	; 0x44
    5224:	006b      	lsls	r3, r5, #1
    5226:	5953      	ldr	r3, [r2, r5]
    5228:	5453      	strb	r3, [r2, r1]
    522a:	4349      	muls	r1, r1
    522c:	434b      	muls	r3, r1
    522e:	4b4c      	ldr	r3, [pc, #304]	; (0x5360)
    5230:	4944      	ldr	r1, [pc, #272]	; (0x5344)
    5232:	3056      	adds	r0, #86	; 0x56
    5234:	5300      	strh	r0, [r0, r4]
    5236:	5359      	strh	r1, [r3, r5]
    5238:	4954      	ldr	r1, [pc, #336]	; (0x538c)
    523a:	4b43      	ldr	r3, [pc, #268]	; (0x5348)
    523c:	4c43      	ldr	r4, [pc, #268]	; (0x534c)
    523e:	444b      	add	r3, r9
    5240:	5649      	ldrsb	r1, [r1, r1]
    5242:	0031      	movs	r1, r6
    5244:	5043      	str	r3, [r0, r1]
    5246:	4355      	muls	r5, r2
    5248:	4746      	bx	r8
    524a:	7000      	strb	r0, [r0, #0]
    524c:	3369      	adds	r3, #105	; 0x69
    524e:	5f32      	ldrsh	r2, [r6, r4]
    5250:	3233      	adds	r2, #51	; 0x33
    5252:	666b      	str	r3, [r5, #100]	; 0x64
    5254:	7458      	strb	r0, [r3, #17]
    5256:	6c61      	ldr	r1, [r4, #68]	; 0x44
    5258:	504e      	str	r6, [r1, r1]
    525a:	6263      	str	r3, [r4, #36]	; 0x24
    525c:	6150      	str	r0, [r2, #20]
    525e:	4372      	muls	r2, r6
    5260:	7061      	strb	r1, [r4, #1]
    5262:	4670      	mov	r0, lr
    5264:	785f      	ldrb	r7, [r3, #1]
    5266:	3031      	adds	r0, #49	; 0x31
    5268:	0030      	movs	r0, r6
    526a:	4f6b      	ldr	r7, [pc, #428]	; (0x5418)
    526c:	4353      	muls	r3, r2
    526e:	3233      	adds	r2, #51	; 0x33
    5270:	5f4b      	ldrsh	r3, [r1, r5]
    5272:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5274:	485f      	ldr	r0, [pc, #380]	; (0x53f4)
    5276:	4c53      	ldr	r4, [pc, #332]	; (0x53c4)
    5278:	5053      	str	r3, [r2, r1]
    527a:	0049      	lsls	r1, r1, #1
    527c:	4841      	ldr	r0, [pc, #260]	; (0x5384)
    527e:	4342      	muls	r2, r0
    5280:	4b4c      	ldr	r3, [pc, #304]	; (0x53b4)
    5282:	5443      	strb	r3, [r0, r1]
    5284:	4c52      	ldr	r4, [pc, #328]	; (0x53d0)
    5286:	4553      	cmp	r3, sl
    5288:	0054      	lsls	r4, r2, #1
    528a:	4d6b      	ldr	r5, [pc, #428]	; (0x5438)
    528c:	4941      	ldr	r1, [pc, #260]	; (0x5394)
    528e:	5f4e      	ldrsh	r6, [r1, r5]
    5290:	4c43      	ldr	r4, [pc, #268]	; (0x53a0)
    5292:	5f4b      	ldrsh	r3, [r1, r5]
    5294:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5296:	485f      	ldr	r0, [pc, #380]	; (0x5414)
    5298:	4c53      	ldr	r4, [pc, #332]	; (0x53e8)
    529a:	5053      	str	r3, [r2, r1]
    529c:	0049      	lsls	r1, r1, #1
    529e:	436b      	muls	r3, r5
    52a0:	4f4c      	ldr	r7, [pc, #304]	; (0x53d4)
    52a2:	4b43      	ldr	r3, [pc, #268]	; (0x53b0)
    52a4:	485f      	ldr	r0, [pc, #380]	; (0x5424)
    52a6:	5f73      	ldrsh	r3, [r6, r5]
    52a8:	734c      	strb	r4, [r1, #13]
    52aa:	6970      	ldr	r0, [r6, #20]
    52ac:	5000      	str	r0, [r0, r0]
    52ae:	4c4c      	ldr	r4, [pc, #304]	; (0x53e0)
    52b0:	4d31      	ldr	r5, [pc, #196]	; (0x5378)
    52b2:	4544      	cmp	r4, r8
    52b4:	0043      	lsls	r3, r0, #1
    52b6:	5f56      	ldrsh	r6, [r2, r5]
    52b8:	4544      	cmp	r4, r8
    52ba:	5045      	str	r5, [r0, r1]
    52bc:	4c53      	ldr	r4, [pc, #332]	; (0x540c)
    52be:	4545      	cmp	r5, r8
    52c0:	5f50      	ldrsh	r0, [r2, r5]
    52c2:	5030      	str	r0, [r6, r0]
    52c4:	3739      	adds	r7, #57	; 0x39
    52c6:	0035      	movs	r5, r6
    52c8:	436b      	muls	r3, r5
    52ca:	4f4c      	ldr	r7, [pc, #304]	; (0x53fc)
    52cc:	4b43      	ldr	r3, [pc, #268]	; (0x53dc)
    52ce:	445f      	add	r7, fp
    52d0:	7669      	strb	r1, [r5, #25]
    52d2:	6453      	str	r3, [r2, #68]	; 0x44
    52d4:	6f69      	ldr	r1, [r5, #116]	; 0x74
    52d6:	6c43      	ldr	r3, [r0, #68]	; 0x44
    52d8:	006b      	lsls	r3, r5, #1
    52da:	6e69      	ldr	r1, [r5, #100]	; 0x64
    52dc:	3374      	adds	r3, #116	; 0x74
    52de:	5f32      	ldrsh	r2, [r6, r4]
    52e0:	0074      	lsls	r4, r6, #1
    52e2:	5f73      	ldrsh	r3, [r6, r5]
    52e4:	6f6c      	ldr	r4, [r5, #116]	; 0x74
    52e6:	7077      	strb	r7, [r6, #1]
    52e8:	776f      	strb	r7, [r5, #29]
    52ea:	7265      	strb	r5, [r4, #9]
    52ec:	7244      	strb	r4, [r0, #9]
    52ee:	7669      	strb	r1, [r5, #25]
    52f0:	7265      	strb	r5, [r4, #9]
    52f2:	7300      	strb	r0, [r0, #12]
    52f4:	7465      	strb	r5, [r4, #17]
    52f6:	6c5f      	ldr	r7, [r3, #68]	; 0x44
    52f8:	776f      	strb	r7, [r5, #29]
    52fa:	6f70      	ldr	r0, [r6, #116]	; 0x74
    52fc:	6577      	str	r7, [r6, #84]	; 0x54
    52fe:	5f72      	ldrsh	r2, [r6, r5]
    5300:	6f6d      	ldr	r5, [r5, #116]	; 0x74
    5302:	6564      	str	r4, [r4, #84]	; 0x54
    5304:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5306:	7453      	strb	r3, [r2, #17]
    5308:	7461      	strb	r1, [r4, #17]
    530a:	7375      	strb	r5, [r6, #13]
    530c:	7247      	strb	r7, [r0, #9]
    530e:	756f      	strb	r7, [r5, #21]
    5310:	5f70      	ldrsh	r0, [r6, r5]
    5312:	4149      	adcs	r1, r1
    5314:	0050      	lsls	r0, r2, #1
    5316:	536b      	strh	r3, [r5, r5]
    5318:	6174      	str	r4, [r6, #20]
    531a:	7574      	strb	r4, [r6, #21]
    531c:	4773      	bx	lr
    531e:	6f72      	ldr	r2, [r6, #116]	; 0x74
    5320:	7075      	strb	r5, [r6, #1]
    5322:	535f      	strh	r7, [r3, r5]
    5324:	4743      	bx	r8
    5326:	4300      	orrs	r0, r0
    5328:	5550      	strb	r0, [r2, r5]
    532a:	5431      	strb	r1, [r6, r0]
    532c:	4b43      	ldr	r3, [pc, #268]	; (0x543c)
    532e:	4143      	adcs	r3, r0
    5330:	004c      	lsls	r4, r1, #1
    5332:	4f6b      	ldr	r7, [pc, #428]	; (0x54e0)
    5334:	4353      	muls	r3, r2
    5336:	3233      	adds	r2, #51	; 0x33
    5338:	5f4b      	ldrsh	r3, [r1, r5]
    533a:	6f74      	ldr	r4, [r6, #116]	; 0x74
    533c:	465f      	mov	r7, fp
    533e:	454c      	cmp	r4, r9
    5340:	4358      	muls	r0, r3
    5342:	4d4f      	ldr	r5, [pc, #316]	; (0x5480)
    5344:	304d      	adds	r0, #77	; 0x4d
    5346:	5000      	str	r0, [r0, r0]
    5348:	4c4c      	ldr	r4, [pc, #304]	; (0x547c)
    534a:	5f30      	ldrsh	r0, [r6, r4]
    534c:	4554      	cmp	r4, sl
    534e:	5453      	strb	r3, [r2, r1]
    5350:	5453      	strb	r3, [r2, r1]
    5352:	5441      	strb	r1, [r0, r1]
    5354:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5356:	534f      	strh	r7, [r1, r5]
    5358:	3343      	adds	r3, #67	; 0x43
    535a:	4b32      	ldr	r3, [pc, #200]	; (0x5424)
    535c:	745f      	strb	r7, [r3, #17]
    535e:	5f6f      	ldrsh	r7, [r5, r5]
    5360:	4c46      	ldr	r4, [pc, #280]	; (0x547c)
    5362:	5845      	ldr	r5, [r0, r1]
    5364:	4f43      	ldr	r7, [pc, #268]	; (0x5474)
    5366:	4d4d      	ldr	r5, [pc, #308]	; (0x549c)
    5368:	0032      	movs	r2, r6
    536a:	4f6b      	ldr	r7, [pc, #428]	; (0x5518)
    536c:	4353      	muls	r3, r2
    536e:	3233      	adds	r2, #51	; 0x33
    5370:	5f4b      	ldrsh	r3, [r1, r5]
    5372:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5374:	465f      	mov	r7, fp
    5376:	454c      	cmp	r4, r9
    5378:	4358      	muls	r0, r3
    537a:	4d4f      	ldr	r5, [pc, #316]	; (0x54b8)
    537c:	334d      	adds	r3, #77	; 0x4d
    537e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5380:	534f      	strh	r7, [r1, r5]
    5382:	3343      	adds	r3, #67	; 0x43
    5384:	4b32      	ldr	r3, [pc, #200]	; (0x5450)
    5386:	745f      	strb	r7, [r3, #17]
    5388:	5f6f      	ldrsh	r7, [r5, r5]
    538a:	4c46      	ldr	r4, [pc, #280]	; (0x54a4)
    538c:	5845      	ldr	r5, [r0, r1]
    538e:	4f43      	ldr	r7, [pc, #268]	; (0x549c)
    5390:	4d4d      	ldr	r5, [pc, #308]	; (0x54c8)
    5392:	0034      	movs	r4, r6
    5394:	4f6b      	ldr	r7, [pc, #428]	; (0x5544)
    5396:	4353      	muls	r3, r2
    5398:	3233      	adds	r2, #51	; 0x33
    539a:	5f4b      	ldrsh	r3, [r1, r5]
    539c:	6f74      	ldr	r4, [r6, #116]	; 0x74
    539e:	465f      	mov	r7, fp
    53a0:	454c      	cmp	r4, r9
    53a2:	4358      	muls	r0, r3
    53a4:	4d4f      	ldr	r5, [pc, #316]	; (0x54e4)
    53a6:	354d      	adds	r5, #77	; 0x4d
    53a8:	6b00      	ldr	r0, [r0, #48]	; 0x30
    53aa:	534f      	strh	r7, [r1, r5]
    53ac:	3343      	adds	r3, #67	; 0x43
    53ae:	4b32      	ldr	r3, [pc, #200]	; (0x5478)
    53b0:	745f      	strb	r7, [r3, #17]
    53b2:	5f6f      	ldrsh	r7, [r5, r5]
    53b4:	4c46      	ldr	r4, [pc, #280]	; (0x54d0)
    53b6:	5845      	ldr	r5, [r0, r1]
    53b8:	4f43      	ldr	r7, [pc, #268]	; (0x54c8)
    53ba:	4d4d      	ldr	r5, [pc, #308]	; (0x54f0)
    53bc:	0036      	movs	r6, r6
    53be:	4441      	add	r1, r8
    53c0:	4343      	muls	r3, r0
    53c2:	4b4c      	ldr	r3, [pc, #304]	; (0x54f4)
    53c4:	4553      	cmp	r3, sl
    53c6:	004c      	lsls	r4, r1, #1
    53c8:	4450      	add	r0, sl
    53ca:	5552      	strb	r2, [r2, r5]
    53cc:	434e      	muls	r6, r1
    53ce:	4746      	bx	r8
    53d0:	4c43      	ldr	r4, [pc, #268]	; (0x54e0)
    53d2:	3052      	adds	r0, #82	; 0x52
    53d4:	6800      	ldr	r0, [r0, #0]
    53d6:	7261      	strb	r1, [r4, #9]
    53d8:	7764      	strb	r4, [r4, #29]
    53da:	7261      	strb	r1, [r4, #9]
    53dc:	5f65      	ldrsh	r5, [r4, r5]
    53de:	6177      	str	r7, [r6, #20]
    53e0:	656b      	str	r3, [r5, #84]	; 0x54
    53e2:	635f      	str	r7, [r3, #52]	; 0x34
    53e4:	7274      	strb	r4, [r6, #9]
    53e6:	006c      	lsls	r4, r5, #1
    53e8:	4f6b      	ldr	r7, [pc, #428]	; (0x5598)
    53ea:	4353      	muls	r3, r2
    53ec:	3233      	adds	r2, #51	; 0x33
    53ee:	5f4b      	ldrsh	r3, [r1, r5]
    53f0:	6f74      	ldr	r4, [r6, #116]	; 0x74
    53f2:	535f      	strh	r7, [r3, r5]
    53f4:	5359      	strh	r1, [r3, r5]
    53f6:	4954      	ldr	r1, [pc, #336]	; (0x5548)
    53f8:	4b43      	ldr	r3, [pc, #268]	; (0x5508)
    53fa:	0030      	movs	r0, r6
    53fc:	4f6b      	ldr	r7, [pc, #428]	; (0x55ac)
    53fe:	4353      	muls	r3, r2
    5400:	3233      	adds	r2, #51	; 0x33
    5402:	5f4b      	ldrsh	r3, [r1, r5]
    5404:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5406:	535f      	strh	r7, [r3, r5]
    5408:	5359      	strh	r1, [r3, r5]
    540a:	4954      	ldr	r1, [pc, #336]	; (0x555c)
    540c:	4b43      	ldr	r3, [pc, #268]	; (0x551c)
    540e:	0031      	movs	r1, r6
    5410:	436b      	muls	r3, r5
    5412:	4f4c      	ldr	r7, [pc, #304]	; (0x5544)
    5414:	4b43      	ldr	r3, [pc, #268]	; (0x5524)
    5416:	505f      	str	r7, [r3, r1]
    5418:	6c6c      	ldr	r4, [r5, #68]	; 0x44
    541a:	4f31      	ldr	r7, [pc, #196]	; (0x54e0)
    541c:	7475      	strb	r5, [r6, #17]
    541e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5420:	4f4e      	ldr	r7, [pc, #312]	; (0x555c)
    5422:	454e      	cmp	r6, r9
    5424:	745f      	strb	r7, [r3, #17]
    5426:	5f6f      	ldrsh	r7, [r5, r5]
    5428:	5953      	ldr	r3, [r2, r5]
    542a:	5f53      	ldrsh	r3, [r2, r5]
    542c:	4c43      	ldr	r4, [pc, #268]	; (0x553c)
    542e:	4f4b      	ldr	r7, [pc, #300]	; (0x555c)
    5430:	5455      	strb	r5, [r2, r1]
    5432:	4800      	ldr	r0, [pc, #0]	; (0x5434)
    5434:	5346      	strh	r6, [r0, r5]
    5436:	0052      	lsls	r2, r2, #1
    5438:	4344      	muls	r4, r0
    543a:	4943      	ldr	r1, [pc, #268]	; (0x5548)
    543c:	5753      	ldrsb	r3, [r2, r5]
    543e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5440:	414d      	adcs	r5, r1
    5442:	4e49      	ldr	r6, [pc, #292]	; (0x5568)
    5444:	435f      	muls	r7, r3
    5446:	4b4c      	ldr	r3, [pc, #304]	; (0x5578)
    5448:	745f      	strb	r7, [r3, #17]
    544a:	5f6f      	ldrsh	r7, [r5, r5]
    544c:	4c46      	ldr	r4, [pc, #280]	; (0x5568)
    544e:	5845      	ldr	r5, [r0, r1]
    5450:	4f43      	ldr	r7, [pc, #268]	; (0x5560)
    5452:	4d4d      	ldr	r5, [pc, #308]	; (0x5588)
    5454:	0036      	movs	r6, r6
    5456:	586b      	ldr	r3, [r5, r1]
    5458:	4154      	adcs	r4, r2
    545a:	334c      	adds	r3, #76	; 0x4c
    545c:	4b32      	ldr	r3, [pc, #200]	; (0x5528)
    545e:	745f      	strb	r7, [r3, #17]
    5460:	5f6f      	ldrsh	r7, [r5, r5]
    5462:	534f      	strh	r7, [r1, r5]
    5464:	3343      	adds	r3, #67	; 0x43
    5466:	4b32      	ldr	r3, [pc, #200]	; (0x5530)
    5468:	6b00      	ldr	r0, [r0, #48]	; 0x30
    546a:	414d      	adcs	r5, r1
    546c:	4e49      	ldr	r6, [pc, #292]	; (0x5594)
    546e:	435f      	muls	r7, r3
    5470:	4b4c      	ldr	r3, [pc, #304]	; (0x55a4)
    5472:	745f      	strb	r7, [r3, #17]
    5474:	5f6f      	ldrsh	r7, [r5, r5]
    5476:	4c46      	ldr	r4, [pc, #280]	; (0x5590)
    5478:	5845      	ldr	r5, [r0, r1]
    547a:	4f43      	ldr	r7, [pc, #268]	; (0x5588)
    547c:	4d4d      	ldr	r5, [pc, #308]	; (0x55b4)
    547e:	0037      	movs	r7, r6
    5480:	4e45      	ldr	r6, [pc, #276]	; (0x5598)
    5482:	4941      	ldr	r1, [pc, #260]	; (0x5588)
    5484:	444f      	add	r7, r9
    5486:	4742      	bx	r8
    5488:	6b00      	ldr	r0, [r0, #48]	; 0x30
    548a:	434d      	muls	r5, r1
    548c:	4b4c      	ldr	r3, [pc, #304]	; (0x55c0)
    548e:	745f      	strb	r7, [r3, #17]
    5490:	5f6f      	ldrsh	r7, [r5, r5]
    5492:	4353      	muls	r3, r2
    5494:	5f54      	ldrsh	r4, [r2, r5]
    5496:	4c43      	ldr	r4, [pc, #268]	; (0x55a4)
    5498:	004b      	lsls	r3, r1, #1
    549a:	4d6b      	ldr	r5, [pc, #428]	; (0x5648)
    549c:	4941      	ldr	r1, [pc, #260]	; (0x55a4)
    549e:	5f4e      	ldrsh	r6, [r1, r5]
    54a0:	4c43      	ldr	r4, [pc, #268]	; (0x55b0)
    54a2:	5f4b      	ldrsh	r3, [r1, r5]
    54a4:	6f74      	ldr	r4, [r6, #116]	; 0x74
    54a6:	435f      	muls	r7, r3
    54a8:	4954      	ldr	r1, [pc, #336]	; (0x55fc)
    54aa:	454d      	cmp	r5, r9
    54ac:	3052      	adds	r0, #82	; 0x52
    54ae:	6b00      	ldr	r0, [r0, #48]	; 0x30
    54b0:	414d      	adcs	r5, r1
    54b2:	4e49      	ldr	r6, [pc, #292]	; (0x55d8)
    54b4:	435f      	muls	r7, r3
    54b6:	4b4c      	ldr	r3, [pc, #304]	; (0x55e8)
    54b8:	745f      	strb	r7, [r3, #17]
    54ba:	5f6f      	ldrsh	r7, [r5, r5]
    54bc:	5443      	strb	r3, [r0, r1]
    54be:	4d49      	ldr	r5, [pc, #292]	; (0x55e4)
    54c0:	5245      	strh	r5, [r0, r1]
    54c2:	0031      	movs	r1, r6
    54c4:	4f6b      	ldr	r7, [pc, #428]	; (0x5674)
    54c6:	4353      	muls	r3, r2
    54c8:	3233      	adds	r2, #51	; 0x33
    54ca:	5f4b      	ldrsh	r3, [r1, r5]
    54cc:	6f74      	ldr	r4, [r6, #116]	; 0x74
    54ce:	505f      	str	r7, [r3, r1]
    54d0:	4c4c      	ldr	r4, [pc, #304]	; (0x5604)
    54d2:	0030      	movs	r0, r6
    54d4:	4f6b      	ldr	r7, [pc, #428]	; (0x5684)
    54d6:	4353      	muls	r3, r2
    54d8:	3233      	adds	r2, #51	; 0x33
    54da:	5f4b      	ldrsh	r3, [r1, r5]
    54dc:	6f74      	ldr	r4, [r6, #116]	; 0x74
    54de:	505f      	str	r7, [r3, r1]
    54e0:	4c4c      	ldr	r4, [pc, #304]	; (0x5614)
    54e2:	0031      	movs	r1, r6
    54e4:	4d6b      	ldr	r5, [pc, #428]	; (0x5694)
    54e6:	4941      	ldr	r1, [pc, #260]	; (0x55ec)
    54e8:	5f4e      	ldrsh	r6, [r1, r5]
    54ea:	4c43      	ldr	r4, [pc, #268]	; (0x55f8)
    54ec:	5f4b      	ldrsh	r3, [r1, r5]
    54ee:	6f74      	ldr	r4, [r6, #116]	; 0x74
    54f0:	435f      	muls	r7, r3
    54f2:	4954      	ldr	r1, [pc, #336]	; (0x5644)
    54f4:	454d      	cmp	r5, r9
    54f6:	3452      	adds	r4, #82	; 0x52
    54f8:	4100      	asrs	r0, r0
    54fa:	524f      	strh	r7, [r1, r1]
    54fc:	4745      	bx	r8
    54fe:	0031      	movs	r1, r6
    5500:	4f41      	ldr	r7, [pc, #260]	; (0x5608)
    5502:	4552      	cmp	r2, sl
    5504:	3247      	adds	r2, #71	; 0x47
    5506:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5508:	7453      	strb	r3, [r2, #17]
    550a:	7461      	strb	r1, [r4, #17]
    550c:	7375      	strb	r5, [r6, #13]
    550e:	7247      	strb	r7, [r0, #9]
    5510:	756f      	strb	r7, [r5, #21]
    5512:	5f70      	ldrsh	r0, [r6, r5]
    5514:	4553      	cmp	r3, sl
    5516:	414d      	adcs	r5, r1
    5518:	3234      	adds	r2, #52	; 0x34
    551a:	5600      	ldrsb	r0, [r0, r0]
    551c:	415f      	adcs	r7, r3
    551e:	5f4f      	ldrsh	r7, [r1, r5]
    5520:	5030      	str	r0, [r6, r0]
    5522:	3839      	subs	r0, #57	; 0x39
    5524:	0030      	movs	r0, r6
    5526:	436b      	muls	r3, r5
    5528:	4f4c      	ldr	r7, [pc, #304]	; (0x565c)
    552a:	4b43      	ldr	r3, [pc, #268]	; (0x5638)
    552c:	485f      	ldr	r0, [pc, #380]	; (0x56ac)
    552e:	4c73      	ldr	r4, [pc, #460]	; (0x56fc)
    5530:	7073      	strb	r3, [r6, #1]
    5532:	0069      	lsls	r1, r5, #1
    5534:	436b      	muls	r3, r5
    5536:	4f4c      	ldr	r7, [pc, #304]	; (0x5668)
    5538:	4b43      	ldr	r3, [pc, #268]	; (0x5648)
    553a:	505f      	str	r7, [r3, r1]
    553c:	6e69      	ldr	r1, [r5, #100]	; 0x64
    553e:	0074      	lsls	r4, r6, #1
    5540:	436b      	muls	r3, r5
    5542:	4f4c      	ldr	r7, [pc, #304]	; (0x5674)
    5544:	4b43      	ldr	r3, [pc, #268]	; (0x5654)
    5546:	505f      	str	r7, [r3, r1]
    5548:	756c      	strb	r4, [r5, #21]
    554a:	754c      	strb	r4, [r1, #21]
    554c:	0074      	lsls	r4, r6, #1
    554e:	5869      	ldr	r1, [r5, r1]
    5550:	434f      	muls	r7, r1
    5552:	7061      	strb	r1, [r4, #1]
    5554:	6e49      	ldr	r1, [r1, #100]	; 0x64
    5556:	4670      	mov	r0, lr
    5558:	785f      	ldrb	r7, [r3, #1]
    555a:	3031      	adds	r0, #49	; 0x31
    555c:	0030      	movs	r0, r6
    555e:	436b      	muls	r3, r5
    5560:	4f4c      	ldr	r7, [pc, #304]	; (0x5694)
    5562:	4b43      	ldr	r3, [pc, #268]	; (0x5670)
    5564:	415f      	adcs	r7, r3
    5566:	616e      	str	r6, [r5, #20]
    5568:	6f6c      	ldr	r4, [r5, #116]	; 0x74
    556a:	4367      	muls	r7, r4
    556c:	7274      	strb	r4, [r6, #9]
    556e:	006c      	lsls	r4, r5, #1
    5570:	506b      	str	r3, [r5, r1]
    5572:	4c4c      	ldr	r4, [pc, #304]	; (0x56a4)
    5574:	5f30      	ldrsh	r0, [r6, r4]
    5576:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5578:	535f      	strh	r7, [r3, r5]
    557a:	5443      	strb	r3, [r0, r1]
    557c:	435f      	muls	r7, r3
    557e:	4b4c      	ldr	r3, [pc, #304]	; (0x56b0)
    5580:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5582:	534f      	strh	r7, [r1, r5]
    5584:	3343      	adds	r3, #67	; 0x43
    5586:	4b32      	ldr	r3, [pc, #200]	; (0x5650)
    5588:	745f      	strb	r7, [r3, #17]
    558a:	5f6f      	ldrsh	r7, [r5, r5]
    558c:	414d      	adcs	r5, r1
    558e:	4e49      	ldr	r6, [pc, #292]	; (0x56b4)
    5590:	435f      	muls	r7, r3
    5592:	4b4c      	ldr	r3, [pc, #304]	; (0x56c4)
    5594:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5596:	4c43      	ldr	r4, [pc, #268]	; (0x56a4)
    5598:	434f      	muls	r7, r1
    559a:	5f4b      	ldrsh	r3, [r1, r5]
    559c:	5443      	strb	r3, [r0, r1]
    559e:	696d      	ldr	r5, [r5, #20]
    55a0:	7265      	strb	r5, [r4, #9]
    55a2:	0030      	movs	r0, r6
    55a4:	436b      	muls	r3, r5
    55a6:	4f4c      	ldr	r7, [pc, #304]	; (0x56d8)
    55a8:	4b43      	ldr	r3, [pc, #268]	; (0x56b8)
    55aa:	435f      	muls	r7, r3
    55ac:	6d54      	ldr	r4, [r2, #84]	; 0x54
    55ae:	6569      	str	r1, [r5, #84]	; 0x54
    55b0:	3172      	adds	r1, #114	; 0x72
    55b2:	6b00      	ldr	r0, [r0, #48]	; 0x30
    55b4:	4c43      	ldr	r4, [pc, #268]	; (0x56c4)
    55b6:	434f      	muls	r7, r1
    55b8:	5f4b      	ldrsh	r3, [r1, r5]
    55ba:	5443      	strb	r3, [r0, r1]
    55bc:	696d      	ldr	r5, [r5, #20]
    55be:	7265      	strb	r5, [r4, #9]
    55c0:	0032      	movs	r2, r6
    55c2:	4f58      	ldr	r7, [pc, #352]	; (0x5724)
    55c4:	435f      	muls	r7, r3
    55c6:	4c41      	ldr	r4, [pc, #260]	; (0x56cc)
    55c8:	435f      	muls	r7, r3
    55ca:	4746      	bx	r8
    55cc:	6b00      	ldr	r0, [r0, #48]	; 0x30
    55ce:	4c43      	ldr	r4, [pc, #268]	; (0x56dc)
    55d0:	434f      	muls	r7, r1
    55d2:	5f4b      	ldrsh	r3, [r1, r5]
    55d4:	5443      	strb	r3, [r0, r1]
    55d6:	696d      	ldr	r5, [r5, #20]
    55d8:	7265      	strb	r5, [r4, #9]
    55da:	0034      	movs	r4, r6
    55dc:	506b      	str	r3, [r5, r1]
    55de:	4c4c      	ldr	r4, [pc, #304]	; (0x5710)
    55e0:	5f30      	ldrsh	r0, [r6, r4]
    55e2:	4944      	ldr	r1, [pc, #272]	; (0x56f4)
    55e4:	5f56      	ldrsh	r6, [r2, r5]
    55e6:	6f74      	ldr	r4, [r6, #116]	; 0x74
    55e8:	465f      	mov	r7, fp
    55ea:	454c      	cmp	r4, r9
    55ec:	4358      	muls	r0, r3
    55ee:	4d4f      	ldr	r5, [pc, #316]	; (0x572c)
    55f0:	354d      	adds	r5, #77	; 0x4d
    55f2:	4600      	mov	r0, r0
    55f4:	4343      	muls	r3, r0
    55f6:	4b4c      	ldr	r3, [pc, #304]	; (0x5728)
    55f8:	4553      	cmp	r3, sl
    55fa:	304c      	adds	r0, #76	; 0x4c
    55fc:	4600      	mov	r0, r0
    55fe:	4343      	muls	r3, r0
    5600:	4b4c      	ldr	r3, [pc, #304]	; (0x5734)
    5602:	4553      	cmp	r3, sl
    5604:	314c      	adds	r1, #76	; 0x4c
    5606:	4600      	mov	r0, r0
    5608:	4343      	muls	r3, r0
    560a:	4b4c      	ldr	r3, [pc, #304]	; (0x573c)
    560c:	4553      	cmp	r3, sl
    560e:	324c      	adds	r2, #76	; 0x4c
    5610:	4600      	mov	r0, r0
    5612:	4343      	muls	r3, r0
    5614:	4b4c      	ldr	r3, [pc, #304]	; (0x5748)
    5616:	4553      	cmp	r3, sl
    5618:	334c      	adds	r3, #76	; 0x4c
    561a:	4600      	mov	r0, r0
    561c:	4343      	muls	r3, r0
    561e:	4b4c      	ldr	r3, [pc, #304]	; (0x5750)
    5620:	4553      	cmp	r3, sl
    5622:	344c      	adds	r4, #76	; 0x4c
    5624:	4600      	mov	r0, r0
    5626:	4343      	muls	r3, r0
    5628:	4b4c      	ldr	r3, [pc, #304]	; (0x575c)
    562a:	4553      	cmp	r3, sl
    562c:	354c      	adds	r5, #76	; 0x4c
    562e:	4600      	mov	r0, r0
    5630:	4343      	muls	r3, r0
    5632:	4b4c      	ldr	r3, [pc, #304]	; (0x5764)
    5634:	4553      	cmp	r3, sl
    5636:	364c      	adds	r6, #76	; 0x4c
    5638:	4600      	mov	r0, r0
    563a:	4343      	muls	r3, r0
    563c:	4b4c      	ldr	r3, [pc, #304]	; (0x5770)
    563e:	4553      	cmp	r3, sl
    5640:	374c      	adds	r7, #76	; 0x4c
    5642:	6900      	ldr	r0, [r0, #16]
    5644:	646e      	str	r6, [r5, #68]	; 0x44
    5646:	7865      	ldrb	r5, [r4, #1]
    5648:	6b00      	ldr	r0, [r0, #48]	; 0x30
    564a:	4450      	add	r0, sl
    564c:	5552      	strb	r2, [r2, r5]
    564e:	434e      	muls	r6, r1
    5650:	4746      	bx	r8
    5652:	505f      	str	r7, [r3, r1]
    5654:	5f44      	ldrsh	r4, [r0, r5]
    5656:	444c      	add	r4, r9
    5658:	474f      	bx	r9
    565a:	4150      	adcs	r0, r2
    565c:	4344      	muls	r4, r0
    565e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5660:	4c43      	ldr	r4, [pc, #268]	; (0x5770)
    5662:	434f      	muls	r7, r1
    5664:	5f4b      	ldrsh	r3, [r1, r5]
    5666:	6944      	ldr	r4, [r0, #20]
    5668:	4176      	adcs	r6, r6
    566a:	6d72      	ldr	r2, [r6, #84]	; 0x54
    566c:	7254      	strb	r4, [r2, #9]
    566e:	6c43      	ldr	r3, [r0, #68]	; 0x44
    5670:	446b      	add	r3, sp
    5672:	7669      	strb	r1, [r5, #25]
    5674:	4400      	add	r0, r0
    5676:	4443      	add	r3, r8
    5678:	3043      	adds	r0, #67	; 0x43
    567a:	4400      	add	r0, r0
    567c:	4443      	add	r3, r8
    567e:	3143      	adds	r1, #67	; 0x43
    5680:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5682:	7453      	strb	r3, [r2, #17]
    5684:	7461      	strb	r1, [r4, #17]
    5686:	7375      	strb	r5, [r6, #13]
    5688:	7247      	strb	r7, [r0, #9]
    568a:	756f      	strb	r7, [r5, #21]
    568c:	5f70      	ldrsh	r0, [r6, r5]
    568e:	4153      	adcs	r3, r2
    5690:	0049      	lsls	r1, r1, #1
    5692:	5453      	strb	r3, [r2, r1]
    5694:	5441      	strb	r1, [r0, r1]
    5696:	5355      	strh	r5, [r2, r5]
    5698:	4c43      	ldr	r4, [pc, #268]	; (0x57a8)
    569a:	004b      	lsls	r3, r1, #1
    569c:	536b      	strh	r3, [r5, r5]
    569e:	6174      	str	r4, [r6, #20]
    56a0:	7574      	strb	r4, [r6, #21]
    56a2:	4773      	bx	lr
    56a4:	6f72      	ldr	r2, [r6, #116]	; 0x74
    56a6:	7075      	strb	r5, [r6, #1]
    56a8:	465f      	mov	r7, fp
    56aa:	414c      	adcs	r4, r1
    56ac:	4853      	ldr	r0, [pc, #332]	; (0x57fc)
    56ae:	6b00      	ldr	r0, [r0, #48]	; 0x30
    56b0:	4450      	add	r0, sl
    56b2:	5552      	strb	r2, [r2, r5]
    56b4:	434e      	muls	r6, r1
    56b6:	4746      	bx	r8
    56b8:	505f      	str	r7, [r3, r1]
    56ba:	5f44      	ldrsh	r4, [r0, r5]
    56bc:	4344      	muls	r4, r0
    56be:	4344      	muls	r4, r0
    56c0:	4600      	mov	r0, r0
    56c2:	4343      	muls	r3, r0
    56c4:	4b4c      	ldr	r3, [pc, #304]	; (0x57f8)
    56c6:	4553      	cmp	r3, sl
    56c8:	584c      	ldr	r4, [r1, r1]
    56ca:	6b00      	ldr	r0, [r0, #48]	; 0x30
    56cc:	5246      	strh	r6, [r0, r1]
    56ce:	5f4f      	ldrsh	r7, [r1, r5]
    56d0:	4648      	mov	r0, r9
    56d2:	445f      	add	r7, fp
    56d4:	5649      	ldrsb	r1, [r1, r1]
    56d6:	745f      	strb	r7, [r3, #17]
    56d8:	5f6f      	ldrsh	r7, [r5, r5]
    56da:	4c46      	ldr	r4, [pc, #280]	; (0x57f4)
    56dc:	5845      	ldr	r5, [r0, r1]
    56de:	4f43      	ldr	r7, [pc, #268]	; (0x57ec)
    56e0:	4d4d      	ldr	r5, [pc, #308]	; (0x5818)
    56e2:	0033      	movs	r3, r6
    56e4:	5869      	ldr	r1, [r5, r1]
    56e6:	434f      	muls	r7, r1
    56e8:	7061      	strb	r1, [r4, #1]
    56ea:	754f      	strb	r7, [r1, #21]
    56ec:	7074      	strb	r4, [r6, #1]
    56ee:	5f46      	ldrsh	r6, [r0, r5]
    56f0:	3178      	adds	r1, #120	; 0x78
    56f2:	3030      	adds	r0, #48	; 0x30
    56f4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    56f6:	7453      	strb	r3, [r2, #17]
    56f8:	7461      	strb	r1, [r4, #17]
    56fa:	7375      	strb	r5, [r6, #13]
    56fc:	7247      	strb	r7, [r0, #9]
    56fe:	756f      	strb	r7, [r5, #21]
    5700:	5f70      	ldrsh	r0, [r6, r5]
    5702:	504c      	str	r4, [r1, r1]
    5704:	4155      	adcs	r5, r2
    5706:	5452      	strb	r2, [r2, r1]
    5708:	5300      	strh	r0, [r0, r4]
    570a:	4944      	ldr	r1, [pc, #272]	; (0x581c)
    570c:	434f      	muls	r7, r1
    570e:	4b4c      	ldr	r3, [pc, #304]	; (0x5840)
    5710:	5443      	strb	r3, [r0, r1]
    5712:	4c52      	ldr	r4, [pc, #328]	; (0x585c)
    5714:	5600      	ldrsb	r0, [r0, r0]
    5716:	4f54      	ldr	r7, [pc, #336]	; (0x5868)
    5718:	0052      	lsls	r2, r2, #1
    571a:	466b      	mov	r3, sp
    571c:	4f52      	ldr	r7, [pc, #328]	; (0x5868)
    571e:	485f      	ldr	r0, [pc, #380]	; (0x589c)
    5720:	5f46      	ldrsh	r6, [r0, r5]
    5722:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5724:	415f      	adcs	r7, r3
    5726:	4344      	muls	r4, r0
    5728:	435f      	muls	r7, r3
    572a:	4b4c      	ldr	r3, [pc, #304]	; (0x585c)
    572c:	5000      	str	r0, [r0, r0]
    572e:	4344      	muls	r4, r0
    5730:	5254      	strh	r4, [r2, r1]
    5732:	304c      	adds	r0, #76	; 0x4c
    5734:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5736:	4f4e      	ldr	r7, [pc, #312]	; (0x5870)
    5738:	454e      	cmp	r6, r9
    573a:	745f      	strb	r7, [r3, #17]
    573c:	5f6f      	ldrsh	r7, [r5, r5]
    573e:	4453      	add	r3, sl
    5740:	4f49      	ldr	r7, [pc, #292]	; (0x5868)
    5742:	435f      	muls	r7, r3
    5744:	4b4c      	ldr	r3, [pc, #304]	; (0x5878)
    5746:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5748:	7453      	strb	r3, [r2, #17]
    574a:	7461      	strb	r1, [r4, #17]
    574c:	7375      	strb	r5, [r6, #13]
    574e:	7247      	strb	r7, [r0, #9]
    5750:	756f      	strb	r7, [r5, #21]
    5752:	5f70      	ldrsh	r0, [r6, r5]
    5754:	4d4c      	ldr	r5, [pc, #304]	; (0x5888)
    5756:	4d45      	ldr	r5, [pc, #276]	; (0x586c)
    5758:	5000      	str	r0, [r0, r0]
    575a:	4c4c      	ldr	r4, [pc, #304]	; (0x588c)
    575c:	5330      	strh	r0, [r6, r4]
    575e:	4154      	adcs	r4, r2
    5760:	0054      	lsls	r4, r2, #1
    5762:	466b      	mov	r3, sp
    5764:	4f52      	ldr	r7, [pc, #328]	; (0x58b0)
    5766:	4d31      	ldr	r5, [pc, #196]	; (0x582c)
    5768:	745f      	strb	r7, [r3, #17]
    576a:	5f6f      	ldrsh	r7, [r5, r5]
    576c:	4c50      	ldr	r4, [pc, #320]	; (0x58b0)
    576e:	304c      	adds	r0, #76	; 0x4c
    5770:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5772:	5246      	strh	r6, [r0, r1]
    5774:	314f      	adds	r1, #79	; 0x4f
    5776:	5f4d      	ldrsh	r5, [r1, r5]
    5778:	6f74      	ldr	r4, [r6, #116]	; 0x74
    577a:	415f      	adcs	r7, r3
    577c:	4344      	muls	r4, r0
    577e:	435f      	muls	r7, r3
    5780:	4b4c      	ldr	r3, [pc, #304]	; (0x58b4)
    5782:	4300      	orrs	r0, r0
    5784:	4b4c      	ldr	r3, [pc, #304]	; (0x58b8)
    5786:	554f      	strb	r7, [r1, r5]
    5788:	5354      	strh	r4, [r2, r5]
    578a:	4c45      	ldr	r4, [pc, #276]	; (0x58a0)
    578c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    578e:	4f4e      	ldr	r7, [pc, #312]	; (0x58c8)
    5790:	454e      	cmp	r6, r9
    5792:	745f      	strb	r7, [r3, #17]
    5794:	5f6f      	ldrsh	r7, [r5, r5]
    5796:	5443      	strb	r3, [r0, r1]
    5798:	4d49      	ldr	r5, [pc, #292]	; (0x58c0)
    579a:	5245      	strh	r5, [r0, r1]
    579c:	0030      	movs	r0, r6
    579e:	436b      	muls	r3, r5
    57a0:	4f4c      	ldr	r7, [pc, #304]	; (0x58d4)
    57a2:	4b43      	ldr	r3, [pc, #268]	; (0x58b0)
    57a4:	435f      	muls	r7, r3
    57a6:	6372      	str	r2, [r6, #52]	; 0x34
    57a8:	6b00      	ldr	r0, [r0, #48]	; 0x30
    57aa:	7453      	strb	r3, [r2, #17]
    57ac:	7461      	strb	r1, [r4, #17]
    57ae:	7375      	strb	r5, [r6, #13]
    57b0:	7247      	strb	r7, [r0, #9]
    57b2:	756f      	strb	r7, [r5, #21]
    57b4:	5f70      	ldrsh	r0, [r6, r5]
    57b6:	504c      	str	r4, [r1, r1]
    57b8:	5f43      	ldrsh	r3, [r0, r5]
    57ba:	5355      	strh	r5, [r2, r5]
    57bc:	5241      	strh	r1, [r0, r1]
    57be:	0054      	lsls	r4, r2, #1
    57c0:	4e6b      	ldr	r6, [pc, #428]	; (0x5970)
    57c2:	4e4f      	ldr	r6, [pc, #316]	; (0x5900)
    57c4:	5f45      	ldrsh	r5, [r0, r5]
    57c6:	6f74      	ldr	r4, [r6, #116]	; 0x74
    57c8:	535f      	strh	r7, [r3, r5]
    57ca:	5359      	strh	r1, [r3, r5]
    57cc:	4954      	ldr	r1, [pc, #336]	; (0x5920)
    57ce:	4b43      	ldr	r3, [pc, #268]	; (0x58dc)
    57d0:	0030      	movs	r0, r6
    57d2:	4e6b      	ldr	r6, [pc, #428]	; (0x5980)
    57d4:	4e4f      	ldr	r6, [pc, #316]	; (0x5914)
    57d6:	5f45      	ldrsh	r5, [r0, r5]
    57d8:	6f74      	ldr	r4, [r6, #116]	; 0x74
    57da:	535f      	strh	r7, [r3, r5]
    57dc:	5359      	strh	r1, [r3, r5]
    57de:	4954      	ldr	r1, [pc, #336]	; (0x5930)
    57e0:	4b43      	ldr	r3, [pc, #268]	; (0x58f0)
    57e2:	0031      	movs	r1, r6
    57e4:	5253      	strh	r3, [r2, r1]
    57e6:	4d41      	ldr	r5, [pc, #260]	; (0x58ec)
    57e8:	5341      	strh	r1, [r0, r5]
    57ea:	4953      	ldr	r1, [pc, #332]	; (0x5938)
    57ec:	5453      	strb	r3, [r2, r1]
    57ee:	5443      	strb	r3, [r0, r1]
    57f0:	4c52      	ldr	r4, [pc, #328]	; (0x593c)
    57f2:	0030      	movs	r0, r6
    57f4:	5253      	strh	r3, [r2, r1]
    57f6:	4d41      	ldr	r5, [pc, #260]	; (0x58fc)
    57f8:	5341      	strh	r1, [r0, r5]
    57fa:	4953      	ldr	r1, [pc, #332]	; (0x5948)
    57fc:	5453      	strb	r3, [r2, r1]
    57fe:	5443      	strb	r3, [r0, r1]
    5800:	4c52      	ldr	r4, [pc, #328]	; (0x594c)
    5802:	0031      	movs	r1, r6
    5804:	5544      	strb	r4, [r0, r5]
    5806:	4d4d      	ldr	r5, [pc, #308]	; (0x593c)
    5808:	5359      	strh	r1, [r3, r5]
    580a:	4154      	adcs	r4, r2
    580c:	5554      	strb	r4, [r2, r5]
    580e:	0053      	lsls	r3, r2, #1
    5810:	4c43      	ldr	r4, [pc, #268]	; (0x5920)
    5812:	434f      	muls	r7, r1
    5814:	5f4b      	ldrsh	r3, [r1, r5]
    5816:	6553      	str	r3, [r2, #84]	; 0x54
    5818:	4374      	muls	r4, r6
    581a:	6b6c      	ldr	r4, [r5, #52]	; 0x34
    581c:	6944      	ldr	r4, [r0, #20]
    581e:	0076      	lsls	r6, r6, #1
    5820:	6470      	str	r0, [r6, #68]	; 0x44
    5822:	625f      	str	r7, [r3, #36]	; 0x24
    5824:	7469      	strb	r1, [r5, #17]
    5826:	0073      	lsls	r3, r6, #1
    5828:	4552      	cmp	r2, sl
    582a:	4553      	cmp	r3, sl
    582c:	5652      	ldrsb	r2, [r2, r1]
    582e:	4445      	add	r5, r8
    5830:	315f      	adds	r1, #95	; 0x5f
    5832:	0030      	movs	r0, r6
    5834:	4552      	cmp	r2, sl
    5836:	4553      	cmp	r3, sl
    5838:	5652      	ldrsb	r2, [r2, r1]
    583a:	4445      	add	r5, r8
    583c:	315f      	adds	r1, #95	; 0x5f
    583e:	0031      	movs	r1, r6
    5840:	4552      	cmp	r2, sl
    5842:	4553      	cmp	r3, sl
    5844:	5652      	ldrsb	r2, [r2, r1]
    5846:	4445      	add	r5, r8
    5848:	315f      	adds	r1, #95	; 0x5f
    584a:	0032      	movs	r2, r6
    584c:	4552      	cmp	r2, sl
    584e:	4553      	cmp	r3, sl
    5850:	5652      	ldrsb	r2, [r2, r1]
    5852:	4445      	add	r5, r8
    5854:	315f      	adds	r1, #95	; 0x5f
    5856:	0033      	movs	r3, r6
    5858:	4552      	cmp	r2, sl
    585a:	4553      	cmp	r3, sl
    585c:	5652      	ldrsb	r2, [r2, r1]
    585e:	4445      	add	r5, r8
    5860:	315f      	adds	r1, #95	; 0x5f
    5862:	0034      	movs	r4, r6
    5864:	4552      	cmp	r2, sl
    5866:	4553      	cmp	r3, sl
    5868:	5652      	ldrsb	r2, [r2, r1]
    586a:	4445      	add	r5, r8
    586c:	315f      	adds	r1, #95	; 0x5f
    586e:	0035      	movs	r5, r6
    5870:	4552      	cmp	r2, sl
    5872:	4553      	cmp	r3, sl
    5874:	5652      	ldrsb	r2, [r2, r1]
    5876:	4445      	add	r5, r8
    5878:	315f      	adds	r1, #95	; 0x5f
    587a:	0036      	movs	r6, r6
    587c:	4552      	cmp	r2, sl
    587e:	4553      	cmp	r3, sl
    5880:	5652      	ldrsb	r2, [r2, r1]
    5882:	4445      	add	r5, r8
    5884:	315f      	adds	r1, #95	; 0x5f
    5886:	0037      	movs	r7, r6
    5888:	4552      	cmp	r2, sl
    588a:	4553      	cmp	r3, sl
    588c:	5652      	ldrsb	r2, [r2, r1]
    588e:	4445      	add	r5, r8
    5890:	315f      	adds	r1, #95	; 0x5f
    5892:	0038      	movs	r0, r7
    5894:	5253      	strh	r3, [r2, r1]
    5896:	4d41      	ldr	r5, [pc, #260]	; (0x599c)
    5898:	5443      	strb	r3, [r0, r1]
    589a:	4c52      	ldr	r4, [pc, #328]	; (0x59e4)
    589c:	0030      	movs	r0, r6
    589e:	5253      	strh	r3, [r2, r1]
    58a0:	4d41      	ldr	r5, [pc, #260]	; (0x59a8)
    58a2:	5443      	strb	r3, [r0, r1]
    58a4:	4c52      	ldr	r4, [pc, #328]	; (0x59f0)
    58a6:	0031      	movs	r1, r6
    58a8:	4450      	add	r0, sl
    58aa:	5552      	strb	r2, [r2, r5]
    58ac:	434e      	muls	r6, r1
    58ae:	4746      	bx	r8
    58b0:	4553      	cmp	r3, sl
    58b2:	3054      	adds	r0, #84	; 0x54
    58b4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    58b6:	4c43      	ldr	r4, [pc, #268]	; (0x59c4)
    58b8:	434f      	muls	r7, r1
    58ba:	5f4b      	ldrsh	r3, [r1, r5]
    58bc:	7355      	strb	r5, [r2, #13]
    58be:	6862      	ldr	r2, [r4, #4]
    58c0:	726d      	strb	r5, [r5, #9]
    58c2:	0030      	movs	r0, r6
    58c4:	506b      	str	r3, [r5, r1]
    58c6:	5244      	strh	r4, [r0, r1]
    58c8:	4e55      	ldr	r6, [pc, #340]	; (0x5a20)
    58ca:	4643      	mov	r3, r8
    58cc:	5f47      	ldrsh	r7, [r0, r5]
    58ce:	4450      	add	r0, sl
    58d0:	4c5f      	ldr	r4, [pc, #380]	; (0x5a50)
    58d2:	4f44      	ldr	r7, [pc, #272]	; (0x59e4)
    58d4:	4c46      	ldr	r4, [pc, #280]	; (0x59f0)
    58d6:	5341      	strh	r1, [r0, r5]
    58d8:	4e48      	ldr	r6, [pc, #288]	; (0x59fc)
    58da:	0056      	lsls	r6, r2, #1
    58dc:	4544      	cmp	r4, r8
    58de:	5542      	strb	r2, [r0, r5]
    58e0:	5f47      	ldrsh	r7, [r0, r5]
    58e2:	4546      	cmp	r6, r8
    58e4:	5441      	strb	r1, [r0, r1]
    58e6:	5255      	strh	r5, [r2, r1]
    58e8:	5345      	strh	r5, [r0, r5]
    58ea:	6b00      	ldr	r0, [r0, #48]	; 0x30
    58ec:	7453      	strb	r3, [r2, #17]
    58ee:	7461      	strb	r1, [r4, #17]
    58f0:	7375      	strb	r5, [r6, #13]
    58f2:	7247      	strb	r7, [r0, #9]
    58f4:	756f      	strb	r7, [r5, #21]
    58f6:	5f70      	ldrsh	r0, [r6, r5]
    58f8:	494d      	ldr	r1, [pc, #308]	; (0x5a30)
    58fa:	4950      	ldr	r1, [pc, #320]	; (0x5a3c)
    58fc:	445f      	add	r7, fp
    58fe:	4953      	ldr	r1, [pc, #332]	; (0x5a4c)
    5900:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5902:	5246      	strh	r6, [r0, r1]
    5904:	314f      	adds	r1, #79	; 0x4f
    5906:	4d32      	ldr	r5, [pc, #200]	; (0x59d0)
    5908:	745f      	strb	r7, [r3, #17]
    590a:	5f6f      	ldrsh	r7, [r5, r5]
    590c:	414d      	adcs	r5, r1
    590e:	4e49      	ldr	r6, [pc, #292]	; (0x5a34)
    5910:	435f      	muls	r7, r3
    5912:	4b4c      	ldr	r3, [pc, #304]	; (0x5a44)
    5914:	4400      	add	r0, r0
    5916:	5346      	strh	r6, [r0, r5]
    5918:	0052      	lsls	r2, r2, #1
    591a:	5f5f      	ldrsh	r7, [r3, r5]
    591c:	6964      	ldr	r4, [r4, #20]
    591e:	6173      	str	r3, [r6, #20]
    5920:	6c62      	ldr	r2, [r4, #68]	; 0x44
    5922:	5f65      	ldrsh	r5, [r4, r5]
    5924:	7269      	strb	r1, [r5, #9]
    5926:	0071      	lsls	r1, r6, #1
    5928:	4241      	negs	r1, r0
    592a:	5346      	strh	r6, [r0, r5]
    592c:	0052      	lsls	r2, r2, #1
    592e:	536b      	strh	r3, [r5, r5]
    5930:	6174      	str	r4, [r6, #20]
    5932:	7574      	strb	r4, [r6, #21]
    5934:	4773      	bx	lr
    5936:	6f72      	ldr	r2, [r6, #116]	; 0x74
    5938:	7075      	strb	r5, [r6, #1]
    593a:	455f      	cmp	r7, fp
    593c:	5343      	strh	r3, [r0, r5]
    593e:	4950      	ldr	r1, [pc, #320]	; (0x5a80)
    5940:	5000      	str	r0, [r0, r0]
    5942:	434d      	muls	r5, r1
    5944:	545f      	strb	r7, [r3, r1]
    5946:	7079      	strb	r1, [r7, #1]
    5948:	0065      	lsls	r5, r4, #1
    594a:	635f      	str	r7, [r3, #52]	; 0x34
    594c:	6f6c      	ldr	r4, [r5, #116]	; 0x74
    594e:	6b63      	ldr	r3, [r4, #52]	; 0x34
    5950:	695f      	ldr	r7, [r3, #20]
    5952:	5f70      	ldrsh	r0, [r6, r5]
    5954:	616e      	str	r6, [r5, #20]
    5956:	656d      	str	r5, [r5, #84]	; 0x54
    5958:	6b00      	ldr	r0, [r0, #48]	; 0x30
    595a:	7453      	strb	r3, [r2, #17]
    595c:	7461      	strb	r1, [r4, #17]
    595e:	7375      	strb	r5, [r6, #13]
    5960:	7247      	strb	r7, [r0, #9]
    5962:	756f      	strb	r7, [r5, #21]
    5964:	5f70      	ldrsh	r0, [r6, r5]
    5966:	504c      	str	r4, [r1, r1]
    5968:	3249      	adds	r2, #73	; 0x49
    596a:	0043      	lsls	r3, r0, #1
    596c:	4353      	muls	r3, r2
    596e:	4354      	muls	r4, r2
    5970:	4b4c      	ldr	r3, [pc, #304]	; (0x5aa4)
    5972:	4553      	cmp	r3, sl
    5974:	004c      	lsls	r4, r1, #1
    5976:	506b      	str	r3, [r5, r1]
    5978:	4c4c      	ldr	r4, [pc, #304]	; (0x5aac)
    597a:	5f31      	ldrsh	r1, [r6, r4]
    597c:	6f74      	ldr	r4, [r6, #116]	; 0x74
    597e:	435f      	muls	r7, r3
    5980:	4b4c      	ldr	r3, [pc, #304]	; (0x5ab4)
    5982:	554f      	strb	r7, [r1, r5]
    5984:	0054      	lsls	r4, r2, #1
    5986:	4552      	cmp	r2, sl
    5988:	4553      	cmp	r3, sl
    598a:	5652      	ldrsb	r2, [r2, r1]
    598c:	4445      	add	r5, r8
    598e:	325f      	adds	r2, #95	; 0x5f
    5990:	0030      	movs	r0, r6
    5992:	4552      	cmp	r2, sl
    5994:	4553      	cmp	r3, sl
    5996:	5652      	ldrsb	r2, [r2, r1]
    5998:	4445      	add	r5, r8
    599a:	325f      	adds	r2, #95	; 0x5f
    599c:	0031      	movs	r1, r6
    599e:	4552      	cmp	r2, sl
    59a0:	4553      	cmp	r3, sl
    59a2:	5652      	ldrsb	r2, [r2, r1]
    59a4:	4445      	add	r5, r8
    59a6:	325f      	adds	r2, #95	; 0x5f
    59a8:	0032      	movs	r2, r6
    59aa:	4552      	cmp	r2, sl
    59ac:	4553      	cmp	r3, sl
    59ae:	5652      	ldrsb	r2, [r2, r1]
    59b0:	4445      	add	r5, r8
    59b2:	325f      	adds	r2, #95	; 0x5f
    59b4:	0033      	movs	r3, r6
    59b6:	4552      	cmp	r2, sl
    59b8:	4553      	cmp	r3, sl
    59ba:	5652      	ldrsb	r2, [r2, r1]
    59bc:	4445      	add	r5, r8
    59be:	325f      	adds	r2, #95	; 0x5f
    59c0:	0034      	movs	r4, r6
    59c2:	4552      	cmp	r2, sl
    59c4:	4553      	cmp	r3, sl
    59c6:	5652      	ldrsb	r2, [r2, r1]
    59c8:	4445      	add	r5, r8
    59ca:	325f      	adds	r2, #95	; 0x5f
    59cc:	0035      	movs	r5, r6
    59ce:	4552      	cmp	r2, sl
    59d0:	4553      	cmp	r3, sl
    59d2:	5652      	ldrsb	r2, [r2, r1]
    59d4:	4445      	add	r5, r8
    59d6:	325f      	adds	r2, #95	; 0x5f
    59d8:	0036      	movs	r6, r6
    59da:	4552      	cmp	r2, sl
    59dc:	4553      	cmp	r3, sl
    59de:	5652      	ldrsb	r2, [r2, r1]
    59e0:	4445      	add	r5, r8
    59e2:	325f      	adds	r2, #95	; 0x5f
    59e4:	0037      	movs	r7, r6
    59e6:	4552      	cmp	r2, sl
    59e8:	4553      	cmp	r3, sl
    59ea:	5652      	ldrsb	r2, [r2, r1]
    59ec:	4445      	add	r5, r8
    59ee:	325f      	adds	r2, #95	; 0x5f
    59f0:	0038      	movs	r0, r7
    59f2:	4f52      	ldr	r7, [pc, #328]	; (0x5b3c)
    59f4:	434d      	muls	r5, r1
    59f6:	0052      	lsls	r2, r2, #1
    59f8:	4449      	add	r1, r9
    59fa:	505f      	str	r7, [r3, r1]
    59fc:	5246      	strh	r6, [r0, r1]
    59fe:	5000      	str	r0, [r0, r0]
    5a00:	4c4c      	ldr	r4, [pc, #304]	; (0x5b34)
    5a02:	4330      	orrs	r0, r6
    5a04:	4b4c      	ldr	r3, [pc, #304]	; (0x5b38)
    5a06:	4553      	cmp	r3, sl
    5a08:	004c      	lsls	r4, r1, #1
    5a0a:	546b      	strb	r3, [r5, r1]
    5a0c:	4152      	adcs	r2, r2
    5a0e:	4543      	cmp	r3, r8
    5a10:	445f      	add	r7, fp
    5a12:	5649      	ldrsb	r1, [r1, r1]
    5a14:	745f      	strb	r7, [r3, #17]
    5a16:	5f6f      	ldrsh	r7, [r5, r5]
    5a18:	5254      	strh	r4, [r2, r1]
    5a1a:	4341      	muls	r1, r0
    5a1c:	0045      	lsls	r5, r0, #1
    5a1e:	4552      	cmp	r2, sl
    5a20:	4553      	cmp	r3, sl
    5a22:	4354      	muls	r4, r2
    5a24:	5541      	strb	r1, [r0, r5]
    5a26:	4553      	cmp	r3, sl
    5a28:	7400      	strb	r0, [r0, #16]
    5a2a:	6d65      	ldr	r5, [r4, #84]	; 0x54
    5a2c:	0070      	lsls	r0, r6, #1
    5a2e:	4552      	cmp	r2, sl
    5a30:	4553      	cmp	r3, sl
    5a32:	5652      	ldrsb	r2, [r2, r1]
    5a34:	4445      	add	r5, r8
    5a36:	335f      	adds	r3, #95	; 0x5f
    5a38:	0030      	movs	r0, r6
    5a3a:	4552      	cmp	r2, sl
    5a3c:	4553      	cmp	r3, sl
    5a3e:	5652      	ldrsb	r2, [r2, r1]
    5a40:	4445      	add	r5, r8
    5a42:	335f      	adds	r3, #95	; 0x5f
    5a44:	0031      	movs	r1, r6
    5a46:	4552      	cmp	r2, sl
    5a48:	4553      	cmp	r3, sl
    5a4a:	5652      	ldrsb	r2, [r2, r1]
    5a4c:	4445      	add	r5, r8
    5a4e:	335f      	adds	r3, #95	; 0x5f
    5a50:	0032      	movs	r2, r6
    5a52:	4552      	cmp	r2, sl
    5a54:	4553      	cmp	r3, sl
    5a56:	5652      	ldrsb	r2, [r2, r1]
    5a58:	4445      	add	r5, r8
    5a5a:	335f      	adds	r3, #95	; 0x5f
    5a5c:	0033      	movs	r3, r6
    5a5e:	4552      	cmp	r2, sl
    5a60:	4553      	cmp	r3, sl
    5a62:	5652      	ldrsb	r2, [r2, r1]
    5a64:	4445      	add	r5, r8
    5a66:	335f      	adds	r3, #95	; 0x5f
    5a68:	0034      	movs	r4, r6
    5a6a:	4552      	cmp	r2, sl
    5a6c:	4553      	cmp	r3, sl
    5a6e:	5652      	ldrsb	r2, [r2, r1]
    5a70:	4445      	add	r5, r8
    5a72:	335f      	adds	r3, #95	; 0x5f
    5a74:	0035      	movs	r5, r6
    5a76:	4552      	cmp	r2, sl
    5a78:	4553      	cmp	r3, sl
    5a7a:	5652      	ldrsb	r2, [r2, r1]
    5a7c:	4445      	add	r5, r8
    5a7e:	335f      	adds	r3, #95	; 0x5f
    5a80:	0036      	movs	r6, r6
    5a82:	4552      	cmp	r2, sl
    5a84:	4553      	cmp	r3, sl
    5a86:	5652      	ldrsb	r2, [r2, r1]
    5a88:	4445      	add	r5, r8
    5a8a:	335f      	adds	r3, #95	; 0x5f
    5a8c:	0037      	movs	r7, r6
    5a8e:	4552      	cmp	r2, sl
    5a90:	4553      	cmp	r3, sl
    5a92:	5652      	ldrsb	r2, [r2, r1]
    5a94:	4445      	add	r5, r8
    5a96:	335f      	adds	r3, #95	; 0x5f
    5a98:	0038      	movs	r0, r7
    5a9a:	4552      	cmp	r2, sl
    5a9c:	4553      	cmp	r3, sl
    5a9e:	5652      	ldrsb	r2, [r2, r1]
    5aa0:	4445      	add	r5, r8
    5aa2:	335f      	adds	r3, #95	; 0x5f
    5aa4:	0039      	movs	r1, r7
    5aa6:	536b      	strh	r3, [r5, r5]
    5aa8:	6174      	str	r4, [r6, #20]
    5aaa:	7574      	strb	r4, [r6, #21]
    5aac:	4773      	bx	lr
    5aae:	6f72      	ldr	r2, [r6, #116]	; 0x74
    5ab0:	7075      	strb	r5, [r6, #1]
    5ab2:	495f      	ldr	r1, [pc, #380]	; (0x5c30)
    5ab4:	5343      	strh	r3, [r0, r5]
    5ab6:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5ab8:	4c43      	ldr	r4, [pc, #268]	; (0x5bc8)
    5aba:	434f      	muls	r7, r1
    5abc:	5f4b      	ldrsh	r3, [r1, r5]
    5abe:	7253      	strb	r3, [r2, #9]
    5ac0:	6d61      	ldr	r1, [r4, #84]	; 0x54
    5ac2:	0033      	movs	r3, r6
    5ac4:	506b      	str	r3, [r5, r1]
    5ac6:	4c4c      	ldr	r4, [pc, #304]	; (0x5bf8)
    5ac8:	5f31      	ldrsh	r1, [r6, r4]
    5aca:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5acc:	4d5f      	ldr	r5, [pc, #380]	; (0x5c4c)
    5ace:	4941      	ldr	r1, [pc, #260]	; (0x5bd4)
    5ad0:	5f4e      	ldrsh	r6, [r1, r5]
    5ad2:	4c43      	ldr	r4, [pc, #268]	; (0x5be0)
    5ad4:	004b      	lsls	r3, r1, #1
    5ad6:	436b      	muls	r3, r5
    5ad8:	4f4c      	ldr	r7, [pc, #304]	; (0x5c0c)
    5ada:	4b43      	ldr	r3, [pc, #268]	; (0x5be8)
    5adc:	415f      	adcs	r7, r3
    5ade:	6364      	str	r4, [r4, #52]	; 0x34
    5ae0:	0030      	movs	r0, r6
    5ae2:	4942      	ldr	r1, [pc, #264]	; (0x5bec)
    5ae4:	5341      	strh	r1, [r0, r5]
    5ae6:	4100      	asrs	r0, r0
    5ae8:	4248      	negs	r0, r1
    5aea:	4350      	muls	r0, r2
    5aec:	0052      	lsls	r2, r2, #1
    5aee:	4552      	cmp	r2, sl
    5af0:	4553      	cmp	r3, sl
    5af2:	5652      	ldrsb	r2, [r2, r1]
    5af4:	4445      	add	r5, r8
    5af6:	305f      	adds	r0, #95	; 0x5f
    5af8:	5200      	strh	r0, [r0, r0]
    5afa:	5345      	strh	r5, [r0, r5]
    5afc:	5245      	strh	r5, [r0, r1]
    5afe:	4556      	cmp	r6, sl
    5b00:	5f44      	ldrsh	r4, [r0, r5]
    5b02:	0031      	movs	r1, r6
    5b04:	4552      	cmp	r2, sl
    5b06:	4553      	cmp	r3, sl
    5b08:	5652      	ldrsb	r2, [r2, r1]
    5b0a:	4445      	add	r5, r8
    5b0c:	325f      	adds	r2, #95	; 0x5f
    5b0e:	5200      	strh	r0, [r0, r0]
    5b10:	5345      	strh	r5, [r0, r5]
    5b12:	5245      	strh	r5, [r0, r1]
    5b14:	4556      	cmp	r6, sl
    5b16:	5f44      	ldrsh	r4, [r0, r5]
    5b18:	0033      	movs	r3, r6
    5b1a:	4552      	cmp	r2, sl
    5b1c:	4553      	cmp	r3, sl
    5b1e:	5652      	ldrsb	r2, [r2, r1]
    5b20:	4445      	add	r5, r8
    5b22:	345f      	adds	r4, #95	; 0x5f
    5b24:	5200      	strh	r0, [r0, r0]
    5b26:	5345      	strh	r5, [r0, r5]
    5b28:	5245      	strh	r5, [r0, r1]
    5b2a:	4556      	cmp	r6, sl
    5b2c:	5f44      	ldrsh	r4, [r0, r5]
    5b2e:	0035      	movs	r5, r6
    5b30:	4552      	cmp	r2, sl
    5b32:	4553      	cmp	r3, sl
    5b34:	5652      	ldrsb	r2, [r2, r1]
    5b36:	4445      	add	r5, r8
    5b38:	365f      	adds	r6, #95	; 0x5f
    5b3a:	5200      	strh	r0, [r0, r0]
    5b3c:	5345      	strh	r5, [r0, r5]
    5b3e:	5245      	strh	r5, [r0, r1]
    5b40:	4556      	cmp	r6, sl
    5b42:	5f44      	ldrsh	r4, [r0, r5]
    5b44:	0037      	movs	r7, r6
    5b46:	4552      	cmp	r2, sl
    5b48:	4553      	cmp	r3, sl
    5b4a:	5652      	ldrsb	r2, [r2, r1]
    5b4c:	4445      	add	r5, r8
    5b4e:	385f      	subs	r0, #95	; 0x5f
    5b50:	5200      	strh	r0, [r0, r0]
    5b52:	5345      	strh	r5, [r0, r5]
    5b54:	5245      	strh	r5, [r0, r1]
    5b56:	4556      	cmp	r6, sl
    5b58:	5f44      	ldrsh	r4, [r0, r5]
    5b5a:	0039      	movs	r1, r7
    5b5c:	6e75      	ldr	r5, [r6, #100]	; 0x64
    5b5e:	6973      	ldr	r3, [r6, #20]
    5b60:	6e67      	ldr	r7, [r4, #100]	; 0x64
    5b62:	6465      	str	r5, [r4, #68]	; 0x44
    5b64:	6320      	str	r0, [r4, #48]	; 0x30
    5b66:	6168      	str	r0, [r5, #20]
    5b68:	0072      	lsls	r2, r6, #1
    5b6a:	4552      	cmp	r2, sl
    5b6c:	4553      	cmp	r3, sl
    5b6e:	5652      	ldrsb	r2, [r2, r1]
    5b70:	4445      	add	r5, r8
    5b72:	345f      	adds	r4, #95	; 0x5f
    5b74:	0030      	movs	r0, r6
    5b76:	4552      	cmp	r2, sl
    5b78:	4553      	cmp	r3, sl
    5b7a:	5652      	ldrsb	r2, [r2, r1]
    5b7c:	4445      	add	r5, r8
    5b7e:	345f      	adds	r4, #95	; 0x5f
    5b80:	0031      	movs	r1, r6
    5b82:	4552      	cmp	r2, sl
    5b84:	4553      	cmp	r3, sl
    5b86:	5652      	ldrsb	r2, [r2, r1]
    5b88:	4445      	add	r5, r8
    5b8a:	345f      	adds	r4, #95	; 0x5f
    5b8c:	0032      	movs	r2, r6
    5b8e:	4552      	cmp	r2, sl
    5b90:	4553      	cmp	r3, sl
    5b92:	5652      	ldrsb	r2, [r2, r1]
    5b94:	4445      	add	r5, r8
    5b96:	345f      	adds	r4, #95	; 0x5f
    5b98:	0033      	movs	r3, r6
    5b9a:	4552      	cmp	r2, sl
    5b9c:	4553      	cmp	r3, sl
    5b9e:	5652      	ldrsb	r2, [r2, r1]
    5ba0:	4445      	add	r5, r8
    5ba2:	345f      	adds	r4, #95	; 0x5f
    5ba4:	0034      	movs	r4, r6
    5ba6:	4552      	cmp	r2, sl
    5ba8:	4553      	cmp	r3, sl
    5baa:	5652      	ldrsb	r2, [r2, r1]
    5bac:	4445      	add	r5, r8
    5bae:	345f      	adds	r4, #95	; 0x5f
    5bb0:	0035      	movs	r5, r6
    5bb2:	4552      	cmp	r2, sl
    5bb4:	4553      	cmp	r3, sl
    5bb6:	5652      	ldrsb	r2, [r2, r1]
    5bb8:	4445      	add	r5, r8
    5bba:	345f      	adds	r4, #95	; 0x5f
    5bbc:	0036      	movs	r6, r6
    5bbe:	4c50      	ldr	r4, [pc, #320]	; (0x5d00)
    5bc0:	304c      	adds	r0, #76	; 0x4c
    5bc2:	4450      	add	r0, sl
    5bc4:	4345      	muls	r5, r0
    5bc6:	4100      	asrs	r0, r0
    5bc8:	4248      	negs	r0, r1
    5bca:	414d      	adcs	r5, r1
    5bcc:	5054      	str	r4, [r2, r1]
    5bce:	4952      	ldr	r1, [pc, #328]	; (0x5d18)
    5bd0:	004f      	lsls	r7, r1, #1
    5bd2:	5f56      	ldrsh	r6, [r2, r5]
    5bd4:	4344      	muls	r4, r0
    5bd6:	4344      	muls	r4, r0
    5bd8:	315f      	adds	r1, #95	; 0x5f
    5bda:	3050      	adds	r0, #80	; 0x50
    5bdc:	3532      	adds	r5, #50	; 0x32
    5bde:	6c00      	ldr	r0, [r0, #64]	; 0x40
    5be0:	6f64      	ldr	r4, [r4, #116]	; 0x74
    5be2:	615f      	str	r7, [r3, #20]
    5be4:	5f6f      	ldrsh	r7, [r5, r5]
    5be6:	7274      	strb	r4, [r6, #9]
    5be8:	6d69      	ldr	r1, [r5, #84]	; 0x54
    5bea:	4300      	orrs	r0, r0
    5bec:	4250      	negs	r0, r2
    5bee:	4f4f      	ldr	r7, [pc, #316]	; (0x5d2c)
    5bf0:	0054      	lsls	r4, r2, #1
    5bf2:	3a43      	subs	r2, #67	; 0x43
    5bf4:	772f      	strb	r7, [r5, #28]
    5bf6:	726f      	strb	r7, [r5, #9]
    5bf8:	736b      	strb	r3, [r5, #13]
    5bfa:	6170      	str	r0, [r6, #20]
    5bfc:	6563      	str	r3, [r4, #84]	; 0x54
    5bfe:	392f      	subs	r1, #47	; 0x2f
    5c00:	5f39      	ldrsh	r1, [r7, r4]
    5c02:	6572      	str	r2, [r6, #84]	; 0x54
    5c04:	6f70      	ldr	r0, [r6, #116]	; 0x74
    5c06:	6d2f      	ldr	r7, [r5, #80]	; 0x50
    5c08:	7563      	strb	r3, [r4, #21]
    5c0a:	732d      	strb	r5, [r5, #12]
    5c0c:	6b64      	ldr	r4, [r4, #52]	; 0x34
    5c0e:	322d      	adds	r2, #45	; 0x2d
    5c10:	302e      	adds	r0, #46	; 0x2e
    5c12:	642f      	str	r7, [r5, #64]	; 0x40
    5c14:	7665      	strb	r5, [r4, #25]
    5c16:	6369      	str	r1, [r5, #52]	; 0x34
    5c18:	7365      	strb	r5, [r4, #13]
    5c1a:	4c2f      	ldr	r4, [pc, #188]	; (0x5cd8)
    5c1c:	4350      	muls	r0, r2
    5c1e:	3535      	adds	r5, #53	; 0x35
    5c20:	3653      	adds	r6, #83	; 0x53
    5c22:	2f39      	cmp	r7, #57	; 0x39
    5c24:	7366      	strb	r6, [r4, #13]
    5c26:	5f6c      	ldrsh	r4, [r5, r5]
    5c28:	6f70      	ldr	r0, [r6, #116]	; 0x74
    5c2a:	6577      	str	r7, [r6, #84]	; 0x54
    5c2c:	5f72      	ldrsh	r2, [r6, r5]
    5c2e:	696c      	ldr	r4, [r5, #20]
    5c30:	2f62      	cmp	r7, #98	; 0x62
    5c32:	7366      	strb	r6, [r4, #13]
    5c34:	5f6c      	ldrsh	r4, [r5, r5]
    5c36:	6f70      	ldr	r0, [r6, #116]	; 0x74
    5c38:	6577      	str	r7, [r6, #84]	; 0x54
    5c3a:	5f72      	ldrsh	r2, [r6, r5]
    5c3c:	696c      	ldr	r4, [r5, #20]
    5c3e:	2e62      	cmp	r6, #98	; 0x62
    5c40:	0063      	lsls	r3, r4, #1
    5c42:	4552      	cmp	r2, sl
    5c44:	4646      	mov	r6, r8
    5c46:	5341      	strh	r1, [r0, r5]
    5c48:	5754      	ldrsb	r4, [r2, r5]
    5c4a:	554b      	strb	r3, [r1, r5]
    5c4c:	0050      	lsls	r0, r2, #1
    5c4e:	436b      	muls	r3, r5
    5c50:	4f4c      	ldr	r7, [pc, #304]	; (0x5d84)
    5c52:	4b43      	ldr	r3, [pc, #268]	; (0x5d60)
    5c54:	465f      	mov	r7, fp
    5c56:	6572      	str	r2, [r6, #84]	; 0x54
    5c58:	6d71      	ldr	r1, [r6, #84]	; 0x54
    5c5a:	0065      	lsls	r5, r4, #1
    5c5c:	4944      	ldr	r1, [pc, #272]	; (0x5d70)
    5c5e:	4945      	ldr	r1, [pc, #276]	; (0x5d74)
    5c60:	0044      	lsls	r4, r0, #1
    5c62:	5f70      	ldrsh	r0, [r6, r5]
    5c64:	706c      	strb	r4, [r5, #1]
    5c66:	6d5f      	ldr	r7, [r3, #84]	; 0x54
    5c68:	646f      	str	r7, [r5, #68]	; 0x44
    5c6a:	0065      	lsls	r5, r4, #1
    5c6c:	436b      	muls	r3, r5
    5c6e:	4f4c      	ldr	r7, [pc, #304]	; (0x5da0)
    5c70:	4b43      	ldr	r3, [pc, #268]	; (0x5d80)
    5c72:	475f      	bx	fp
    5c74:	6970      	ldr	r0, [r6, #20]
    5c76:	5f6f      	ldrsh	r7, [r5, r5]
    5c78:	6553      	str	r3, [r2, #84]	; 0x54
    5c7a:	0063      	lsls	r3, r4, #1
    5c7c:	4450      	add	r0, sl
    5c7e:	5552      	strb	r2, [r2, r5]
    5c80:	434e      	muls	r6, r1
    5c82:	4746      	bx	r8
    5c84:	0030      	movs	r0, r6
    5c86:	3875      	subs	r0, #117	; 0x75
    5c88:	4549      	cmp	r1, r9
    5c8a:	5843      	ldr	r3, [r0, r1]
    5c8c:	6e69      	ldr	r1, [r5, #100]	; 0x64
    5c8e:	6143      	str	r3, [r0, #20]
    5c90:	4370      	muls	r0, r6
    5c92:	6c61      	ldr	r1, [r4, #68]	; 0x44
    5c94:	7038      	strb	r0, [r7, #0]
    5c96:	0046      	lsls	r6, r0, #1
    5c98:	5453      	strb	r3, [r2, r1]
    5c9a:	5241      	strh	r1, [r0, r1]
    5c9c:	4554      	cmp	r4, sl
    5c9e:	0052      	lsls	r2, r2, #1
    5ca0:	4f50      	ldr	r7, [pc, #320]	; (0x5de4)
    5ca2:	4557      	cmp	r7, sl
    5ca4:	5f52      	ldrsh	r2, [r2, r5]
    5ca6:	6e45      	ldr	r5, [r0, #100]	; 0x64
    5ca8:	6574      	str	r4, [r6, #84]	; 0x54
    5caa:	5372      	strh	r2, [r6, r5]
    5cac:	656c      	str	r4, [r5, #84]	; 0x54
    5cae:	7065      	strb	r5, [r4, #1]
    5cb0:	5000      	str	r0, [r0, r0]
    5cb2:	574f      	ldrsb	r7, [r1, r5]
    5cb4:	5245      	strh	r5, [r0, r1]
    5cb6:	455f      	cmp	r7, fp
    5cb8:	746e      	strb	r6, [r5, #17]
    5cba:	7265      	strb	r5, [r4, #9]
    5cbc:	6f50      	ldr	r0, [r2, #116]	; 0x74
    5cbe:	6577      	str	r7, [r6, #84]	; 0x54
    5cc0:	4472      	add	r2, lr
    5cc2:	776f      	strb	r7, [r5, #29]
    5cc4:	006e      	lsls	r6, r5, #1
    5cc6:	466b      	mov	r3, sp
    5cc8:	4f52      	ldr	r7, [pc, #328]	; (0x5e14)
    5cca:	4d31      	ldr	r5, [pc, #196]	; (0x5d90)
    5ccc:	745f      	strb	r7, [r3, #17]
    5cce:	5f6f      	ldrsh	r7, [r5, r5]
    5cd0:	5348      	strh	r0, [r1, r5]
    5cd2:	534c      	strh	r4, [r1, r5]
    5cd4:	4950      	ldr	r1, [pc, #320]	; (0x5e18)
    5cd6:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5cd8:	7453      	strb	r3, [r2, #17]
    5cda:	7461      	strb	r1, [r4, #17]
    5cdc:	7375      	strb	r5, [r6, #13]
    5cde:	7247      	strb	r7, [r0, #9]
    5ce0:	756f      	strb	r7, [r5, #21]
    5ce2:	5f70      	ldrsh	r0, [r6, r5]
    5ce4:	4c46      	ldr	r4, [pc, #280]	; (0x5e00)
    5ce6:	5845      	ldr	r5, [r0, r1]
    5ce8:	4f49      	ldr	r7, [pc, #292]	; (0x5e10)
    5cea:	435f      	muls	r7, r3
    5cec:	4d41      	ldr	r5, [pc, #260]	; (0x5df4)
    5cee:	5245      	strh	r5, [r0, r1]
    5cf0:	0041      	lsls	r1, r0, #1
    5cf2:	4f58      	ldr	r7, [pc, #352]	; (0x5e54)
    5cf4:	435f      	muls	r7, r3
    5cf6:	4c41      	ldr	r4, [pc, #260]	; (0x5dfc)
    5cf8:	435f      	muls	r7, r3
    5cfa:	444d      	add	r5, r9
    5cfc:	5f00      	ldrsh	r0, [r0, r4]
    5cfe:	6c63      	ldr	r3, [r4, #68]	; 0x44
    5d00:	636f      	str	r7, [r5, #52]	; 0x34
    5d02:	5f6b      	ldrsh	r3, [r5, r5]
    5d04:	7461      	strb	r1, [r4, #17]
    5d06:	6174      	str	r4, [r6, #20]
    5d08:	6863      	ldr	r3, [r4, #4]
    5d0a:	695f      	ldr	r7, [r3, #20]
    5d0c:	0064      	lsls	r4, r4, #1
    5d0e:	4f42      	ldr	r7, [pc, #264]	; (0x5e18)
    5d10:	4344      	muls	r4, r0
    5d12:	524f      	strh	r7, [r1, r1]
    5d14:	0045      	lsls	r5, r0, #1
    5d16:	4d4e      	ldr	r5, [pc, #312]	; (0x5e50)
    5d18:	5349      	strh	r1, [r1, r5]
    5d1a:	4352      	muls	r2, r2
    5d1c:	6900      	ldr	r0, [r0, #16]
    5d1e:	5862      	ldr	r2, [r4, r1]
    5d20:	6e69      	ldr	r1, [r5, #100]	; 0x64
    5d22:	4900      	ldr	r1, [pc, #0]	; (0x5d24)
    5d24:	5043      	str	r3, [r0, r1]
    5d26:	0052      	lsls	r2, r2, #1
    5d28:	434d      	muls	r5, r1
    5d2a:	4b4c      	ldr	r3, [pc, #304]	; (0x5e5c)
    5d2c:	4c43      	ldr	r4, [pc, #268]	; (0x5e3c)
    5d2e:	534b      	strh	r3, [r1, r5]
    5d30:	4c45      	ldr	r4, [pc, #276]	; (0x5e48)
    5d32:	4300      	orrs	r0, r0
    5d34:	5550      	strb	r0, [r2, r5]
    5d36:	5443      	strb	r3, [r0, r1]
    5d38:	4c52      	ldr	r4, [pc, #328]	; (0x5e84)
    5d3a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5d3c:	5246      	strh	r6, [r0, r1]
    5d3e:	5f4f      	ldrsh	r7, [r1, r5]
    5d40:	4648      	mov	r0, r9
    5d42:	445f      	add	r7, fp
    5d44:	5649      	ldrsb	r1, [r1, r1]
    5d46:	745f      	strb	r7, [r3, #17]
    5d48:	5f6f      	ldrsh	r7, [r5, r5]
    5d4a:	5348      	strh	r0, [r1, r5]
    5d4c:	534c      	strh	r4, [r1, r5]
    5d4e:	4950      	ldr	r1, [pc, #320]	; (0x5e90)
    5d50:	5000      	str	r0, [r0, r0]
    5d52:	4c4c      	ldr	r4, [pc, #304]	; (0x5e84)
    5d54:	4e30      	ldr	r6, [pc, #192]	; (0x5e18)
    5d56:	4544      	cmp	r4, r8
    5d58:	0043      	lsls	r3, r0, #1
    5d5a:	6975      	ldr	r5, [r6, #20]
    5d5c:	746e      	strb	r6, [r5, #17]
    5d5e:	3436      	adds	r4, #54	; 0x36
    5d60:	745f      	strb	r7, [r3, #17]
    5d62:	5f00      	ldrsh	r0, [r0, r4]
    5d64:	735f      	strb	r7, [r3, #13]
    5d66:	7465      	strb	r5, [r4, #17]
    5d68:	505f      	str	r7, [r3, r1]
    5d6a:	4952      	ldr	r1, [pc, #328]	; (0x5eb4)
    5d6c:	414d      	adcs	r5, r1
    5d6e:	4b53      	ldr	r3, [pc, #332]	; (0x5ebc)
    5d70:	5400      	strb	r0, [r0, r0]
    5d72:	4d49      	ldr	r5, [pc, #292]	; (0x5e98)
    5d74:	5245      	strh	r5, [r0, r1]
    5d76:	4f43      	ldr	r7, [pc, #268]	; (0x5e84)
    5d78:	4e55      	ldr	r6, [pc, #340]	; (0x5ed0)
    5d7a:	0054      	lsls	r4, r2, #1
    5d7c:	466b      	mov	r3, sp
    5d7e:	4f52      	ldr	r7, [pc, #328]	; (0x5ec8)
    5d80:	3231      	adds	r2, #49	; 0x31
    5d82:	5f4d      	ldrsh	r5, [r1, r5]
    5d84:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5d86:	505f      	str	r7, [r3, r1]
    5d88:	4c4c      	ldr	r4, [pc, #304]	; (0x5ebc)
    5d8a:	0030      	movs	r0, r6
    5d8c:	466b      	mov	r3, sp
    5d8e:	4f52      	ldr	r7, [pc, #328]	; (0x5ed8)
    5d90:	3231      	adds	r2, #49	; 0x31
    5d92:	5f4d      	ldrsh	r5, [r1, r5]
    5d94:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5d96:	505f      	str	r7, [r3, r1]
    5d98:	4c4c      	ldr	r4, [pc, #304]	; (0x5ecc)
    5d9a:	0031      	movs	r1, r6
    5d9c:	4d6b      	ldr	r5, [pc, #428]	; (0x5f4c)
    5d9e:	4941      	ldr	r1, [pc, #260]	; (0x5ea4)
    5da0:	5f4e      	ldrsh	r6, [r1, r5]
    5da2:	4c43      	ldr	r4, [pc, #268]	; (0x5eb0)
    5da4:	5f4b      	ldrsh	r3, [r1, r5]
    5da6:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5da8:	555f      	strb	r7, [r3, r5]
    5daa:	4253      	negs	r3, r2
    5dac:	5f30      	ldrsh	r0, [r6, r4]
    5dae:	4c43      	ldr	r4, [pc, #268]	; (0x5ebc)
    5db0:	004b      	lsls	r3, r1, #1
    5db2:	4f50      	ldr	r7, [pc, #320]	; (0x5ef4)
    5db4:	4557      	cmp	r7, sl
    5db6:	4352      	muls	r2, r2
    5db8:	4359      	muls	r1, r3
    5dba:	454c      	cmp	r4, r9
    5dbc:	5000      	str	r0, [r0, r0]
    5dbe:	574f      	ldrsb	r7, [r1, r5]
    5dc0:	5245      	strh	r5, [r0, r1]
    5dc2:	455f      	cmp	r7, fp
    5dc4:	746e      	strb	r6, [r5, #17]
    5dc6:	7265      	strb	r5, [r4, #9]
    5dc8:	6544      	str	r4, [r0, #84]	; 0x54
    5dca:	7065      	strb	r5, [r4, #1]
    5dcc:	6f50      	ldr	r0, [r2, #116]	; 0x74
    5dce:	6577      	str	r7, [r6, #84]	; 0x54
    5dd0:	4472      	add	r2, lr
    5dd2:	776f      	strb	r7, [r5, #29]
    5dd4:	006e      	lsls	r6, r5, #1
    5dd6:	4c43      	ldr	r4, [pc, #268]	; (0x5ee4)
    5dd8:	434f      	muls	r7, r1
    5dda:	5f4b      	ldrsh	r3, [r1, r5]
    5ddc:	3875      	subs	r0, #117	; 0x75
    5dde:	734f      	strb	r7, [r1, #13]
    5de0:	4363      	muls	r3, r4
    5de2:	7061      	strb	r1, [r4, #1]
    5de4:	6f43      	ldr	r3, [r0, #116]	; 0x74
    5de6:	766e      	strb	r6, [r5, #25]
    5de8:	7265      	strb	r5, [r4, #9]
    5dea:	0074      	lsls	r4, r6, #1
    5dec:	5355      	strh	r5, [r2, r5]
    5dee:	3042      	adds	r0, #66	; 0x42
    5df0:	4c43      	ldr	r4, [pc, #268]	; (0x5f00)
    5df2:	434b      	muls	r3, r1
    5df4:	5254      	strh	r4, [r2, r1]
    5df6:	004c      	lsls	r4, r1, #1
    5df8:	536b      	strh	r3, [r5, r5]
    5dfa:	6174      	str	r4, [r6, #20]
    5dfc:	7574      	strb	r4, [r6, #21]
    5dfe:	4773      	bx	lr
    5e00:	6f72      	ldr	r2, [r6, #116]	; 0x74
    5e02:	7075      	strb	r5, [r6, #1]
    5e04:	535f      	strh	r7, [r3, r5]
    5e06:	4450      	add	r0, sl
    5e08:	4649      	mov	r1, r9
    5e0a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5e0c:	4f4e      	ldr	r7, [pc, #312]	; (0x5f48)
    5e0e:	454e      	cmp	r6, r9
    5e10:	745f      	strb	r7, [r3, #17]
    5e12:	5f6f      	ldrsh	r7, [r5, r5]
    5e14:	434d      	muls	r5, r1
    5e16:	4b4c      	ldr	r3, [pc, #304]	; (0x5f48)
    5e18:	5f00      	ldrsh	r0, [r0, r4]
    5e1a:	7865      	ldrb	r5, [r4, #1]
    5e1c:	7469      	strb	r1, [r5, #17]
    5e1e:	6576      	str	r6, [r6, #84]	; 0x54
    5e20:	7463      	strb	r3, [r4, #17]
    5e22:	726f      	strb	r7, [r5, #9]
    5e24:	4600      	mov	r0, r0
    5e26:	4343      	muls	r3, r0
    5e28:	4b4c      	ldr	r3, [pc, #304]	; (0x5f5c)
    5e2a:	4553      	cmp	r3, sl
    5e2c:	004c      	lsls	r4, r1, #1
    5e2e:	5f56      	ldrsh	r6, [r2, r5]
    5e30:	4344      	muls	r4, r0
    5e32:	4344      	muls	r4, r0
    5e34:	315f      	adds	r1, #95	; 0x5f
    5e36:	3050      	adds	r0, #80	; 0x50
    5e38:	3035      	adds	r0, #53	; 0x35
    5e3a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5e3c:	5246      	strh	r6, [r0, r1]
    5e3e:	334f      	adds	r3, #79	; 0x4f
    5e40:	4b32      	ldr	r3, [pc, #200]	; (0x5f0c)
    5e42:	745f      	strb	r7, [r3, #17]
    5e44:	5f6f      	ldrsh	r7, [r5, r5]
    5e46:	534f      	strh	r7, [r1, r5]
    5e48:	3343      	adds	r3, #67	; 0x43
    5e4a:	4b32      	ldr	r3, [pc, #200]	; (0x5f14)
    5e4c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5e4e:	5246      	strh	r6, [r0, r1]
    5e50:	314f      	adds	r1, #79	; 0x4f
    5e52:	5f4d      	ldrsh	r5, [r1, r5]
    5e54:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5e56:	535f      	strh	r7, [r3, r5]
    5e58:	5359      	strh	r1, [r3, r5]
    5e5a:	4954      	ldr	r1, [pc, #336]	; (0x5fac)
    5e5c:	4b43      	ldr	r3, [pc, #268]	; (0x5f6c)
    5e5e:	0030      	movs	r0, r6
    5e60:	4c50      	ldr	r4, [pc, #320]	; (0x5fa4)
    5e62:	314c      	adds	r1, #76	; 0x4c
    5e64:	545f      	strb	r7, [r3, r1]
    5e66:	5345      	strh	r5, [r0, r5]
    5e68:	5354      	strh	r4, [r2, r5]
    5e6a:	4154      	adcs	r4, r2
    5e6c:	0054      	lsls	r4, r2, #1
    5e6e:	444c      	add	r4, r9
    5e70:	554f      	strb	r7, [r1, r5]
    5e72:	4253      	negs	r3, r2
    5e74:	5348      	strh	r0, [r1, r5]
    5e76:	5600      	ldrsb	r0, [r0, r0]
    5e78:	415f      	adcs	r7, r3
    5e7a:	5f4f      	ldrsh	r7, [r1, r5]
    5e7c:	5030      	str	r0, [r6, r0]
    5e7e:	3737      	adds	r7, #55	; 0x37
    5e80:	0035      	movs	r5, r6
    5e82:	466b      	mov	r3, sp
    5e84:	4f52      	ldr	r7, [pc, #328]	; (0x5fd0)
    5e86:	4d31      	ldr	r5, [pc, #196]	; (0x5f4c)
    5e88:	745f      	strb	r7, [r3, #17]
    5e8a:	5f6f      	ldrsh	r7, [r5, r5]
    5e8c:	4c50      	ldr	r4, [pc, #320]	; (0x5fd0)
    5e8e:	314c      	adds	r1, #76	; 0x4c
    5e90:	4600      	mov	r0, r0
    5e92:	454c      	cmp	r4, r9
    5e94:	4658      	mov	r0, fp
    5e96:	4752      	bx	sl
    5e98:	4358      	muls	r0, r3
    5e9a:	5254      	strh	r4, [r2, r1]
    5e9c:	004c      	lsls	r4, r1, #1
    5e9e:	436b      	muls	r3, r5
    5ea0:	4f4c      	ldr	r7, [pc, #304]	; (0x5fd4)
    5ea2:	4b43      	ldr	r3, [pc, #268]	; (0x5fb0)
    5ea4:	555f      	strb	r7, [r3, r5]
    5ea6:	6273      	str	r3, [r6, #36]	; 0x24
    5ea8:	0030      	movs	r0, r6
    5eaa:	436b      	muls	r3, r5
    5eac:	4f4c      	ldr	r7, [pc, #304]	; (0x5fe0)
    5eae:	4b43      	ldr	r3, [pc, #268]	; (0x5fbc)
    5eb0:	555f      	strb	r7, [r3, r5]
    5eb2:	6273      	str	r3, [r6, #36]	; 0x24
    5eb4:	0031      	movs	r1, r6
    5eb6:	5f56      	ldrsh	r6, [r2, r5]
    5eb8:	4344      	muls	r4, r0
    5eba:	4344      	muls	r4, r0
    5ebc:	315f      	adds	r1, #95	; 0x5f
    5ebe:	3150      	adds	r1, #80	; 0x50
    5ec0:	3030      	adds	r0, #48	; 0x30
    5ec2:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5ec4:	7453      	strb	r3, [r2, #17]
    5ec6:	7461      	strb	r1, [r4, #17]
    5ec8:	7375      	strb	r5, [r6, #13]
    5eca:	7247      	strb	r7, [r0, #9]
    5ecc:	756f      	strb	r7, [r5, #21]
    5ece:	5f70      	ldrsh	r0, [r6, r5]
    5ed0:	5345      	strh	r5, [r0, r5]
    5ed2:	4941      	ldr	r1, [pc, #260]	; (0x5fd8)
    5ed4:	6c00      	ldr	r0, [r0, #64]	; 0x40
    5ed6:	5f66      	ldrsh	r6, [r4, r5]
    5ed8:	6177      	str	r7, [r6, #20]
    5eda:	656b      	str	r3, [r5, #84]	; 0x54
    5edc:	7075      	strb	r5, [r6, #1]
    5ede:	695f      	ldr	r7, [r3, #20]
    5ee0:	5f6f      	ldrsh	r7, [r5, r5]
    5ee2:	7463      	strb	r3, [r4, #17]
    5ee4:	6c72      	ldr	r2, [r6, #68]	; 0x44
    5ee6:	5500      	strb	r0, [r0, r4]
    5ee8:	4253      	negs	r3, r2
    5eea:	4331      	orrs	r1, r6
    5eec:	4b4c      	ldr	r3, [pc, #304]	; (0x6020)
    5eee:	5443      	strb	r3, [r0, r1]
    5ef0:	4c52      	ldr	r4, [pc, #328]	; (0x603c)
    5ef2:	4b00      	ldr	r3, [pc, #0]	; (0x5ef4)
    5ef4:	5945      	ldr	r5, [r0, r5]
    5ef6:	425f      	negs	r7, r3
    5ef8:	4f4c      	ldr	r7, [pc, #304]	; (0x602c)
    5efa:	4b43      	ldr	r3, [pc, #268]	; (0x6008)
    5efc:	5500      	strb	r0, [r0, r4]
    5efe:	4253      	negs	r3, r2
    5f00:	4331      	orrs	r1, r6
    5f02:	4b4c      	ldr	r3, [pc, #304]	; (0x6034)
    5f04:	4944      	ldr	r1, [pc, #272]	; (0x6018)
    5f06:	0056      	lsls	r6, r2, #1
    5f08:	436b      	muls	r3, r5
    5f0a:	4f4c      	ldr	r7, [pc, #304]	; (0x603c)
    5f0c:	4b43      	ldr	r3, [pc, #268]	; (0x601c)
    5f0e:	4d5f      	ldr	r5, [pc, #380]	; (0x608c)
    5f10:	6e69      	ldr	r1, [r5, #100]	; 0x64
    5f12:	6155      	str	r5, [r2, #20]
    5f14:	7472      	strb	r2, [r6, #17]
    5f16:	0030      	movs	r0, r6
    5f18:	436b      	muls	r3, r5
    5f1a:	4f4c      	ldr	r7, [pc, #304]	; (0x604c)
    5f1c:	4b43      	ldr	r3, [pc, #268]	; (0x602c)
    5f1e:	4d5f      	ldr	r5, [pc, #380]	; (0x609c)
    5f20:	6e69      	ldr	r1, [r5, #100]	; 0x64
    5f22:	6155      	str	r5, [r2, #20]
    5f24:	7472      	strb	r2, [r6, #17]
    5f26:	0031      	movs	r1, r6
    5f28:	436b      	muls	r3, r5
    5f2a:	4f4c      	ldr	r7, [pc, #304]	; (0x605c)
    5f2c:	4b43      	ldr	r3, [pc, #268]	; (0x603c)
    5f2e:	4d5f      	ldr	r5, [pc, #380]	; (0x60ac)
    5f30:	6e69      	ldr	r1, [r5, #100]	; 0x64
    5f32:	6155      	str	r5, [r2, #20]
    5f34:	7472      	strb	r2, [r6, #17]
    5f36:	0032      	movs	r2, r6
    5f38:	436b      	muls	r3, r5
    5f3a:	4f4c      	ldr	r7, [pc, #304]	; (0x606c)
    5f3c:	4b43      	ldr	r3, [pc, #268]	; (0x604c)
    5f3e:	4d5f      	ldr	r5, [pc, #380]	; (0x60bc)
    5f40:	6e69      	ldr	r1, [r5, #100]	; 0x64
    5f42:	6155      	str	r5, [r2, #20]
    5f44:	7472      	strb	r2, [r6, #17]
    5f46:	0033      	movs	r3, r6
    5f48:	436b      	muls	r3, r5
    5f4a:	4f4c      	ldr	r7, [pc, #304]	; (0x607c)
    5f4c:	4b43      	ldr	r3, [pc, #268]	; (0x605c)
    5f4e:	4d5f      	ldr	r5, [pc, #380]	; (0x60cc)
    5f50:	6e69      	ldr	r1, [r5, #100]	; 0x64
    5f52:	6155      	str	r5, [r2, #20]
    5f54:	7472      	strb	r2, [r6, #17]
    5f56:	0034      	movs	r4, r6
    5f58:	436b      	muls	r3, r5
    5f5a:	4f4c      	ldr	r7, [pc, #304]	; (0x608c)
    5f5c:	4b43      	ldr	r3, [pc, #268]	; (0x606c)
    5f5e:	4d5f      	ldr	r5, [pc, #380]	; (0x60dc)
    5f60:	6e69      	ldr	r1, [r5, #100]	; 0x64
    5f62:	6155      	str	r5, [r2, #20]
    5f64:	7472      	strb	r2, [r6, #17]
    5f66:	0035      	movs	r5, r6
    5f68:	436b      	muls	r3, r5
    5f6a:	4f4c      	ldr	r7, [pc, #304]	; (0x609c)
    5f6c:	4b43      	ldr	r3, [pc, #268]	; (0x607c)
    5f6e:	4d5f      	ldr	r5, [pc, #380]	; (0x60ec)
    5f70:	6e69      	ldr	r1, [r5, #100]	; 0x64
    5f72:	6155      	str	r5, [r2, #20]
    5f74:	7472      	strb	r2, [r6, #17]
    5f76:	0036      	movs	r6, r6
    5f78:	436b      	muls	r3, r5
    5f7a:	4f4c      	ldr	r7, [pc, #304]	; (0x60ac)
    5f7c:	4b43      	ldr	r3, [pc, #268]	; (0x608c)
    5f7e:	4d5f      	ldr	r5, [pc, #380]	; (0x60fc)
    5f80:	6e69      	ldr	r1, [r5, #100]	; 0x64
    5f82:	6155      	str	r5, [r2, #20]
    5f84:	7472      	strb	r2, [r6, #17]
    5f86:	0037      	movs	r7, r6
    5f88:	466b      	mov	r3, sp
    5f8a:	4f52      	ldr	r7, [pc, #328]	; (0x60d4)
    5f8c:	3231      	adds	r2, #49	; 0x31
    5f8e:	5f4d      	ldrsh	r5, [r1, r5]
    5f90:	6f74      	ldr	r4, [r6, #116]	; 0x74
    5f92:	485f      	ldr	r0, [pc, #380]	; (0x6110)
    5f94:	4c53      	ldr	r4, [pc, #332]	; (0x60e4)
    5f96:	5053      	str	r3, [r2, r1]
    5f98:	0049      	lsls	r1, r1, #1
    5f9a:	436b      	muls	r3, r5
    5f9c:	4f4c      	ldr	r7, [pc, #304]	; (0x60d0)
    5f9e:	4b43      	ldr	r3, [pc, #268]	; (0x60ac)
    5fa0:	445f      	add	r7, fp
    5fa2:	7669      	strb	r1, [r5, #25]
    5fa4:	6c46      	ldr	r6, [r0, #68]	; 0x44
    5fa6:	7865      	ldrb	r5, [r4, #1]
    5fa8:	7246      	strb	r6, [r0, #9]
    5faa:	3067      	adds	r0, #103	; 0x67
    5fac:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5fae:	4c43      	ldr	r4, [pc, #268]	; (0x60bc)
    5fb0:	434f      	muls	r7, r1
    5fb2:	5f4b      	ldrsh	r3, [r1, r5]
    5fb4:	6944      	ldr	r4, [r0, #20]
    5fb6:	4676      	mov	r6, lr
    5fb8:	656c      	str	r4, [r5, #84]	; 0x54
    5fba:	4678      	mov	r0, pc
    5fbc:	6772      	str	r2, [r6, #116]	; 0x74
    5fbe:	0031      	movs	r1, r6
    5fc0:	436b      	muls	r3, r5
    5fc2:	4f4c      	ldr	r7, [pc, #304]	; (0x60f4)
    5fc4:	4b43      	ldr	r3, [pc, #268]	; (0x60d4)
    5fc6:	445f      	add	r7, fp
    5fc8:	7669      	strb	r1, [r5, #25]
    5fca:	6c46      	ldr	r6, [r0, #68]	; 0x44
    5fcc:	7865      	ldrb	r5, [r4, #1]
    5fce:	7246      	strb	r6, [r0, #9]
    5fd0:	3267      	adds	r2, #103	; 0x67
    5fd2:	6b00      	ldr	r0, [r0, #48]	; 0x30
    5fd4:	4c43      	ldr	r4, [pc, #268]	; (0x60e4)
    5fd6:	434f      	muls	r7, r1
    5fd8:	5f4b      	ldrsh	r3, [r1, r5]
    5fda:	6944      	ldr	r4, [r0, #20]
    5fdc:	4676      	mov	r6, lr
    5fde:	656c      	str	r4, [r5, #84]	; 0x54
    5fe0:	4678      	mov	r0, pc
    5fe2:	6772      	str	r2, [r6, #116]	; 0x74
    5fe4:	0033      	movs	r3, r6
    5fe6:	436b      	muls	r3, r5
    5fe8:	4f4c      	ldr	r7, [pc, #304]	; (0x611c)
    5fea:	4b43      	ldr	r3, [pc, #268]	; (0x60f8)
    5fec:	445f      	add	r7, fp
    5fee:	7669      	strb	r1, [r5, #25]
    5ff0:	6c46      	ldr	r6, [r0, #68]	; 0x44
    5ff2:	7865      	ldrb	r5, [r4, #1]
    5ff4:	7246      	strb	r6, [r0, #9]
    5ff6:	3467      	adds	r4, #103	; 0x67
    5ff8:	4900      	ldr	r1, [pc, #0]	; (0x5ffc)
    5ffa:	5343      	strh	r3, [r0, r5]
    5ffc:	0052      	lsls	r2, r2, #1
    5ffe:	436b      	muls	r3, r5
    6000:	4f4c      	ldr	r7, [pc, #304]	; (0x6134)
    6002:	4b43      	ldr	r3, [pc, #268]	; (0x6110)
    6004:	445f      	add	r7, fp
    6006:	7669      	strb	r1, [r5, #25]
    6008:	6c46      	ldr	r6, [r0, #68]	; 0x44
    600a:	7865      	ldrb	r5, [r4, #1]
    600c:	7246      	strb	r6, [r0, #9]
    600e:	3667      	adds	r6, #103	; 0x67
    6010:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6012:	4c43      	ldr	r4, [pc, #268]	; (0x6120)
    6014:	434f      	muls	r7, r1
    6016:	5f4b      	ldrsh	r3, [r1, r5]
    6018:	6944      	ldr	r4, [r0, #20]
    601a:	4676      	mov	r6, lr
    601c:	656c      	str	r4, [r5, #84]	; 0x54
    601e:	4678      	mov	r0, pc
    6020:	6772      	str	r2, [r6, #116]	; 0x74
    6022:	0037      	movs	r7, r6
    6024:	506b      	str	r3, [r5, r1]
    6026:	4c4c      	ldr	r4, [pc, #304]	; (0x6158)
    6028:	5f30      	ldrsh	r0, [r6, r4]
    602a:	6f74      	ldr	r4, [r6, #116]	; 0x74
    602c:	535f      	strh	r7, [r3, r5]
    602e:	4944      	ldr	r1, [pc, #272]	; (0x6140)
    6030:	5f4f      	ldrsh	r7, [r1, r5]
    6032:	4c43      	ldr	r4, [pc, #268]	; (0x6140)
    6034:	004b      	lsls	r3, r1, #1
    6036:	466b      	mov	r3, sp
    6038:	4f52      	ldr	r7, [pc, #328]	; (0x6184)
    603a:	485f      	ldr	r0, [pc, #380]	; (0x61b8)
    603c:	5f46      	ldrsh	r6, [r0, r5]
    603e:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6040:	435f      	muls	r7, r3
    6042:	4954      	ldr	r1, [pc, #336]	; (0x6194)
    6044:	454d      	cmp	r5, r9
    6046:	3452      	adds	r4, #82	; 0x52
    6048:	6b00      	ldr	r0, [r0, #48]	; 0x30
    604a:	4c43      	ldr	r4, [pc, #268]	; (0x6158)
    604c:	434f      	muls	r7, r1
    604e:	5f4b      	ldrsh	r3, [r1, r5]
    6050:	7355      	strb	r5, [r2, #13]
    6052:	6862      	ldr	r2, [r4, #4]
    6054:	0031      	movs	r1, r6
    6056:	436b      	muls	r3, r5
    6058:	4f4c      	ldr	r7, [pc, #304]	; (0x618c)
    605a:	4b43      	ldr	r3, [pc, #268]	; (0x6168)
    605c:	465f      	mov	r7, fp
    605e:	6f72      	ldr	r2, [r6, #116]	; 0x74
    6060:	6648      	str	r0, [r1, #100]	; 0x64
    6062:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6064:	414d      	adcs	r5, r1
    6066:	4e49      	ldr	r6, [pc, #292]	; (0x618c)
    6068:	435f      	muls	r7, r3
    606a:	4b4c      	ldr	r3, [pc, #304]	; (0x619c)
    606c:	745f      	strb	r7, [r3, #17]
    606e:	5f6f      	ldrsh	r7, [r5, r5]
    6070:	4c43      	ldr	r4, [pc, #268]	; (0x6180)
    6072:	4f4b      	ldr	r7, [pc, #300]	; (0x61a0)
    6074:	5455      	strb	r5, [r2, r1]
    6076:	5700      	ldrsb	r0, [r0, r4]
    6078:	4b41      	ldr	r3, [pc, #260]	; (0x6180)
    607a:	5545      	strb	r5, [r0, r5]
    607c:	4950      	ldr	r1, [pc, #320]	; (0x61c0)
    607e:	534f      	strh	r7, [r1, r5]
    6080:	4352      	muls	r2, r2
    6082:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6084:	4c50      	ldr	r4, [pc, #320]	; (0x61c8)
    6086:	304c      	adds	r0, #76	; 0x4c
    6088:	745f      	strb	r7, [r3, #17]
    608a:	5f6f      	ldrsh	r7, [r5, r5]
    608c:	4c43      	ldr	r4, [pc, #268]	; (0x619c)
    608e:	4f4b      	ldr	r7, [pc, #300]	; (0x61bc)
    6090:	5455      	strb	r5, [r2, r1]
    6092:	5600      	ldrsb	r0, [r0, r0]
    6094:	445f      	add	r7, fp
    6096:	4443      	add	r3, r8
    6098:	5f43      	ldrsh	r3, [r0, r5]
    609a:	5031      	str	r1, [r6, r0]
    609c:	3730      	adds	r7, #48	; 0x30
    609e:	0035      	movs	r5, r6
    60a0:	436b      	muls	r3, r5
    60a2:	4f4c      	ldr	r7, [pc, #304]	; (0x61d4)
    60a4:	4b43      	ldr	r3, [pc, #268]	; (0x61b4)
    60a6:	445f      	add	r7, fp
    60a8:	7669      	strb	r1, [r5, #25]
    60aa:	6441      	str	r1, [r0, #68]	; 0x44
    60ac:	4163      	adcs	r3, r4
    60ae:	7973      	ldrb	r3, [r6, #5]
    60b0:	636e      	str	r6, [r5, #52]	; 0x34
    60b2:	6c43      	ldr	r3, [r0, #68]	; 0x44
    60b4:	006b      	lsls	r3, r5, #1
    60b6:	536b      	strh	r3, [r5, r5]
    60b8:	6174      	str	r4, [r6, #20]
    60ba:	7574      	strb	r4, [r6, #21]
    60bc:	4773      	bx	lr
    60be:	6f72      	ldr	r2, [r6, #116]	; 0x74
    60c0:	7075      	strb	r5, [r6, #1]
    60c2:	485f      	ldr	r0, [pc, #380]	; (0x6240)
    60c4:	4c41      	ldr	r4, [pc, #260]	; (0x61cc)
    60c6:	555f      	strb	r7, [r3, r5]
    60c8:	5241      	strh	r1, [r0, r1]
    60ca:	0054      	lsls	r4, r2, #1
    60cc:	765f      	strb	r7, [r3, #25]
    60ce:	615f      	str	r7, [r3, #20]
    60d0:	006f      	lsls	r7, r5, #1
    60d2:	5250      	strh	r0, [r2, r1]
    60d4:	5345      	strh	r5, [r0, r5]
    60d6:	5445      	strb	r5, [r0, r1]
    60d8:	5443      	strb	r3, [r0, r1]
    60da:	4c52      	ldr	r4, [pc, #328]	; (0x6224)
    60dc:	4100      	asrs	r0, r0
    60de:	4344      	muls	r4, r0
    60e0:	4c43      	ldr	r4, [pc, #268]	; (0x61f0)
    60e2:	444b      	add	r3, r9
    60e4:	5649      	ldrsb	r1, [r1, r1]
    60e6:	5600      	ldrsb	r0, [r0, r0]
    60e8:	415f      	adcs	r7, r3
    60ea:	5f4f      	ldrsh	r7, [r1, r5]
    60ec:	5030      	str	r0, [r6, r0]
    60ee:	3238      	adds	r2, #56	; 0x38
    60f0:	0035      	movs	r5, r6
    60f2:	4344      	muls	r4, r0
    60f4:	5343      	strh	r3, [r0, r5]
    60f6:	0057      	lsls	r7, r2, #1
    60f8:	5f56      	ldrsh	r6, [r2, r5]
    60fa:	4f41      	ldr	r7, [pc, #260]	; (0x6200)
    60fc:	315f      	adds	r1, #95	; 0x5f
    60fe:	3150      	adds	r1, #80	; 0x50
    6100:	3030      	adds	r0, #48	; 0x30
    6102:	5300      	strh	r0, [r0, r4]
    6104:	4154      	adcs	r4, r2
    6106:	5452      	strb	r2, [r2, r1]
    6108:	5245      	strh	r5, [r0, r1]
    610a:	4553      	cmp	r3, sl
    610c:	0054      	lsls	r4, r2, #1
    610e:	5953      	ldr	r3, [r2, r5]
    6110:	4353      	muls	r3, r2
    6112:	4e4f      	ldr	r6, [pc, #316]	; (0x6250)
    6114:	545f      	strb	r7, [r3, r1]
    6116:	7079      	strb	r1, [r7, #1]
    6118:	0065      	lsls	r5, r4, #1
    611a:	536b      	strh	r3, [r5, r5]
    611c:	6174      	str	r4, [r6, #20]
    611e:	7574      	strb	r4, [r6, #21]
    6120:	4773      	bx	lr
    6122:	6f72      	ldr	r2, [r6, #116]	; 0x74
    6124:	7075      	strb	r5, [r6, #1]
    6126:	465f      	mov	r7, fp
    6128:	454c      	cmp	r4, r9
    612a:	4958      	ldr	r1, [pc, #352]	; (0x628c)
    612c:	5f4f      	ldrsh	r7, [r1, r5]
    612e:	5053      	str	r3, [r2, r1]
    6130:	0049      	lsls	r1, r1, #1
    6132:	436b      	muls	r3, r5
    6134:	4f4c      	ldr	r7, [pc, #304]	; (0x6268)
    6136:	4b43      	ldr	r3, [pc, #268]	; (0x6244)
    6138:	495f      	ldr	r1, [pc, #380]	; (0x62b8)
    613a:	706e      	strb	r6, [r5, #1]
    613c:	7475      	strb	r5, [r6, #17]
    613e:	754d      	strb	r5, [r1, #21]
    6140:	0078      	lsls	r0, r7, #1
    6142:	506b      	str	r3, [r5, r1]
    6144:	5244      	strh	r4, [r0, r1]
    6146:	4e55      	ldr	r6, [pc, #340]	; (0x629c)
    6148:	4643      	mov	r3, r8
    614a:	5f47      	ldrsh	r7, [r0, r5]
    614c:	4450      	add	r0, sl
    614e:	465f      	mov	r7, fp
    6150:	4f52      	ldr	r7, [pc, #328]	; (0x629c)
    6152:	3931      	subs	r1, #49	; 0x31
    6154:	4d32      	ldr	r5, [pc, #200]	; (0x6220)
    6156:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6158:	4c43      	ldr	r4, [pc, #268]	; (0x6268)
    615a:	434f      	muls	r7, r1
    615c:	5f4b      	ldrsh	r3, [r1, r5]
    615e:	7355      	strb	r5, [r2, #13]
    6160:	5262      	strh	r2, [r4, r1]
    6162:	6d61      	ldr	r1, [r4, #84]	; 0x54
    6164:	0031      	movs	r1, r6
    6166:	4c46      	ldr	r4, [pc, #280]	; (0x6280)
    6168:	5845      	ldr	r5, [r0, r1]
    616a:	5246      	strh	r6, [r0, r1]
    616c:	3547      	adds	r5, #71	; 0x47
    616e:	5443      	strb	r3, [r0, r1]
    6170:	4c52      	ldr	r4, [pc, #328]	; (0x62bc)
    6172:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6174:	7453      	strb	r3, [r2, #17]
    6176:	7461      	strb	r1, [r4, #17]
    6178:	7375      	strb	r5, [r6, #13]
    617a:	7247      	strb	r7, [r0, #9]
    617c:	756f      	strb	r7, [r5, #21]
    617e:	5f70      	ldrsh	r0, [r6, r5]
    6180:	5351      	strh	r1, [r2, r5]
    6182:	4950      	ldr	r1, [pc, #320]	; (0x62c4)
    6184:	5600      	ldrsb	r0, [r0, r0]
    6186:	445f      	add	r7, fp
    6188:	4443      	add	r3, r8
    618a:	5f43      	ldrsh	r3, [r0, r5]
    618c:	5031      	str	r1, [r6, r0]
    618e:	3231      	adds	r2, #49	; 0x31
    6190:	0035      	movs	r5, r6
    6192:	4143      	adcs	r3, r0
    6194:	5450      	strb	r0, [r2, r1]
    6196:	4c43      	ldr	r4, [pc, #268]	; (0x62a4)
    6198:	534b      	strh	r3, [r1, r5]
    619a:	4c45      	ldr	r4, [pc, #276]	; (0x62b0)
    619c:	4600      	mov	r0, r0
    619e:	4f52      	ldr	r7, [pc, #328]	; (0x62e8)
    61a0:	3233      	adds	r2, #51	; 0x33
    61a2:	004b      	lsls	r3, r1, #1
    61a4:	5541      	strb	r1, [r0, r5]
    61a6:	5f58      	ldrsh	r0, [r3, r5]
    61a8:	4942      	ldr	r1, [pc, #264]	; (0x62b4)
    61aa:	5341      	strh	r1, [r0, r5]
    61ac:	7500      	strb	r0, [r0, #20]
    61ae:	6e69      	ldr	r1, [r5, #100]	; 0x64
    61b0:	3874      	subs	r0, #116	; 0x74
    61b2:	745f      	strb	r7, [r3, #17]
    61b4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    61b6:	7453      	strb	r3, [r2, #17]
    61b8:	7461      	strb	r1, [r4, #17]
    61ba:	7375      	strb	r5, [r6, #13]
    61bc:	7247      	strb	r7, [r0, #9]
    61be:	756f      	strb	r7, [r5, #21]
    61c0:	5f70      	ldrsh	r0, [r6, r5]
    61c2:	4954      	ldr	r1, [pc, #336]	; (0x6314)
    61c4:	454d      	cmp	r5, r9
    61c6:	4d52      	ldr	r5, [pc, #328]	; (0x6310)
    61c8:	4e41      	ldr	r6, [pc, #260]	; (0x62d0)
    61ca:	4741      	bx	r8
    61cc:	5245      	strh	r5, [r0, r1]
    61ce:	7000      	strb	r0, [r0, #0]
    61d0:	3369      	adds	r3, #105	; 0x69
    61d2:	5f32      	ldrsh	r2, [r6, r4]
    61d4:	3631      	adds	r6, #49	; 0x31
    61d6:	664d      	str	r5, [r1, #100]	; 0x64
    61d8:	7458      	strb	r0, [r3, #17]
    61da:	6c61      	ldr	r1, [r4, #68]	; 0x44
    61dc:	6549      	str	r1, [r1, #84]	; 0x54
    61de:	4c63      	ldr	r4, [pc, #396]	; (0x636c)
    61e0:	616f      	str	r7, [r5, #20]
    61e2:	7064      	strb	r4, [r4, #1]
    61e4:	5f46      	ldrsh	r6, [r0, r5]
    61e6:	3178      	adds	r1, #120	; 0x78
    61e8:	3030      	adds	r0, #48	; 0x30
    61ea:	4100      	asrs	r0, r0
    61ec:	4344      	muls	r4, r0
    61ee:	435f      	muls	r7, r3
    61f0:	5254      	strh	r4, [r2, r1]
    61f2:	004c      	lsls	r4, r1, #1
    61f4:	6169      	str	r1, [r5, #20]
    61f6:	6f58      	ldr	r0, [r3, #116]	; 0x74
    61f8:	7475      	strb	r5, [r6, #17]
    61fa:	785f      	ldrb	r7, [r3, #1]
    61fc:	0034      	movs	r4, r6
    61fe:	5f70      	ldrsh	r0, [r6, r5]
    6200:	6364      	str	r4, [r4, #52]	; 0x34
    6202:	6364      	str	r4, [r4, #52]	; 0x34
    6204:	765f      	strb	r7, [r3, #25]
    6206:	6c6f      	ldr	r7, [r5, #68]	; 0x44
    6208:	6174      	str	r4, [r6, #20]
    620a:	6567      	str	r7, [r4, #84]	; 0x54
    620c:	5800      	ldr	r0, [r0, r0]
    620e:	4154      	adcs	r4, r2
    6210:	334c      	adds	r3, #76	; 0x4c
    6212:	4b32      	ldr	r3, [pc, #200]	; (0x62dc)
    6214:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6216:	7453      	strb	r3, [r2, #17]
    6218:	7461      	strb	r1, [r4, #17]
    621a:	7375      	strb	r5, [r6, #13]
    621c:	7247      	strb	r7, [r0, #9]
    621e:	756f      	strb	r7, [r5, #21]
    6220:	5f70      	ldrsh	r0, [r6, r5]
    6222:	4d44      	ldr	r5, [pc, #272]	; (0x6334)
    6224:	4d41      	ldr	r5, [pc, #260]	; (0x632c)
    6226:	5247      	strh	r7, [r0, r1]
    6228:	6b00      	ldr	r0, [r0, #48]	; 0x30
    622a:	4f4e      	ldr	r7, [pc, #312]	; (0x6364)
    622c:	454e      	cmp	r6, r9
    622e:	745f      	strb	r7, [r3, #17]
    6230:	5f6f      	ldrsh	r7, [r5, r5]
    6232:	5355      	strh	r5, [r2, r5]
    6234:	3042      	adds	r0, #66	; 0x42
    6236:	435f      	muls	r7, r3
    6238:	4b4c      	ldr	r3, [pc, #304]	; (0x636c)
    623a:	6900      	ldr	r0, [r0, #16]
    623c:	5861      	ldr	r1, [r4, r1]
    623e:	6e69      	ldr	r1, [r5, #100]	; 0x64
    6240:	785f      	ldrb	r7, [r3, #1]
    6242:	0034      	movs	r4, r6
    6244:	5343      	strh	r3, [r0, r5]
    6246:	4553      	cmp	r3, sl
    6248:	524c      	strh	r4, [r1, r1]
    624a:	4400      	add	r0, r0
    624c:	4d55      	ldr	r5, [pc, #340]	; (0x63a4)
    624e:	594d      	ldr	r5, [r1, r5]
    6250:	535f      	strh	r7, [r3, r5]
    6252:	4154      	adcs	r4, r2
    6254:	5554      	strb	r4, [r2, r5]
    6256:	0053      	lsls	r3, r2, #1
    6258:	4f43      	ldr	r7, [pc, #268]	; (0x6368)
    625a:	4544      	cmp	r4, r8
    625c:	4553      	cmp	r3, sl
    625e:	5543      	strb	r3, [r0, r5]
    6260:	4952      	ldr	r1, [pc, #328]	; (0x63ac)
    6262:	5954      	ldr	r4, [r2, r5]
    6264:	5250      	strh	r0, [r2, r1]
    6266:	544f      	strb	r7, [r1, r1]
    6268:	5043      	str	r3, [r0, r1]
    626a:	3055      	adds	r0, #85	; 0x55
    626c:	4300      	orrs	r0, r0
    626e:	444f      	add	r7, r9
    6270:	5345      	strh	r5, [r0, r5]
    6272:	4345      	muls	r5, r0
    6274:	5255      	strh	r5, [r2, r1]
    6276:	5449      	strb	r1, [r1, r1]
    6278:	5059      	str	r1, [r3, r1]
    627a:	4f52      	ldr	r7, [pc, #328]	; (0x63c4)
    627c:	4354      	muls	r4, r2
    627e:	5550      	strb	r0, [r2, r5]
    6280:	0031      	movs	r1, r6
    6282:	466b      	mov	r3, sp
    6284:	4f52      	ldr	r7, [pc, #328]	; (0x63d0)
    6286:	485f      	ldr	r0, [pc, #380]	; (0x6404)
    6288:	5f46      	ldrsh	r6, [r0, r5]
    628a:	6f74      	ldr	r4, [r6, #116]	; 0x74
    628c:	4d5f      	ldr	r5, [pc, #380]	; (0x640c)
    628e:	4c43      	ldr	r4, [pc, #268]	; (0x639c)
    6290:	004b      	lsls	r3, r1, #1
    6292:	436b      	muls	r3, r5
    6294:	4f4c      	ldr	r7, [pc, #304]	; (0x63c8)
    6296:	4b43      	ldr	r3, [pc, #268]	; (0x63a4)
    6298:	535f      	strh	r7, [r3, r5]
    629a:	6172      	str	r2, [r6, #20]
    629c:	316d      	adds	r1, #109	; 0x6d
    629e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    62a0:	4c43      	ldr	r4, [pc, #268]	; (0x63b0)
    62a2:	434f      	muls	r7, r1
    62a4:	5f4b      	ldrsh	r3, [r1, r5]
    62a6:	7253      	strb	r3, [r2, #9]
    62a8:	6d61      	ldr	r1, [r4, #84]	; 0x54
    62aa:	0032      	movs	r2, r6
    62ac:	5250      	strh	r0, [r2, r1]
    62ae:	5345      	strh	r5, [r0, r5]
    62b0:	5445      	strb	r5, [r0, r1]
    62b2:	5443      	strb	r3, [r0, r1]
    62b4:	4c52      	ldr	r4, [pc, #328]	; (0x6400)
    62b6:	4553      	cmp	r3, sl
    62b8:	0054      	lsls	r4, r2, #1
    62ba:	436b      	muls	r3, r5
    62bc:	4f4c      	ldr	r7, [pc, #304]	; (0x63f0)
    62be:	4b43      	ldr	r3, [pc, #268]	; (0x63cc)
    62c0:	535f      	strh	r7, [r3, r5]
    62c2:	6172      	str	r2, [r6, #20]
    62c4:	346d      	adds	r4, #109	; 0x6d
    62c6:	5f00      	ldrsh	r0, [r0, r4]
    62c8:	6c63      	ldr	r3, [r4, #68]	; 0x44
    62ca:	636f      	str	r7, [r5, #52]	; 0x34
    62cc:	5f6b      	ldrsh	r3, [r5, r5]
    62ce:	616e      	str	r6, [r5, #20]
    62d0:	656d      	str	r5, [r5, #84]	; 0x54
    62d2:	6b00      	ldr	r0, [r0, #48]	; 0x30
    62d4:	4c43      	ldr	r4, [pc, #268]	; (0x63e4)
    62d6:	434f      	muls	r7, r1
    62d8:	5f4b      	ldrsh	r3, [r1, r5]
    62da:	7455      	strb	r5, [r2, #17]
    62dc:	6369      	str	r1, [r5, #52]	; 0x34
    62de:	306b      	adds	r0, #107	; 0x6b
    62e0:	6b00      	ldr	r0, [r0, #48]	; 0x30
    62e2:	7453      	strb	r3, [r2, #17]
    62e4:	7461      	strb	r1, [r4, #17]
    62e6:	7375      	strb	r5, [r6, #13]
    62e8:	7247      	strb	r7, [r0, #9]
    62ea:	756f      	strb	r7, [r5, #21]
    62ec:	5f70      	ldrsh	r0, [r6, r5]
    62ee:	4148      	adcs	r0, r1
    62f0:	5f4c      	ldrsh	r4, [r1, r5]
    62f2:	5750      	ldrsb	r0, [r2, r5]
    62f4:	004d      	lsls	r5, r1, #1
    62f6:	536b      	strh	r3, [r5, r5]
    62f8:	6174      	str	r4, [r6, #20]
    62fa:	7574      	strb	r4, [r6, #21]
    62fc:	4773      	bx	lr
    62fe:	6f72      	ldr	r2, [r6, #116]	; 0x74
    6300:	7075      	strb	r5, [r6, #1]
    6302:	445f      	add	r7, fp
    6304:	494d      	ldr	r1, [pc, #308]	; (0x643c)
    6306:	0043      	lsls	r3, r0, #1
    6308:	5249      	strh	r1, [r1, r1]
    630a:	4c51      	ldr	r4, [pc, #324]	; (0x6450)
    630c:	5441      	strb	r1, [r0, r1]
    630e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6310:	4c43      	ldr	r4, [pc, #268]	; (0x6420)
    6312:	434f      	muls	r7, r1
    6314:	5f4b      	ldrsh	r3, [r1, r5]
    6316:	744f      	strb	r7, [r1, #17]
    6318:	0070      	lsls	r0, r6, #1
    631a:	436b      	muls	r3, r5
    631c:	4f4c      	ldr	r7, [pc, #304]	; (0x6450)
    631e:	4b43      	ldr	r3, [pc, #268]	; (0x642c)
    6320:	455f      	cmp	r7, fp
    6322:	687a      	ldr	r2, [r7, #4]
    6324:	0061      	lsls	r1, r4, #1
    6326:	436b      	muls	r3, r5
    6328:	4f4c      	ldr	r7, [pc, #304]	; (0x645c)
    632a:	4b43      	ldr	r3, [pc, #268]	; (0x6438)
    632c:	455f      	cmp	r7, fp
    632e:	687a      	ldr	r2, [r7, #4]
    6330:	0062      	lsls	r2, r4, #1
    6332:	5449      	strb	r1, [r1, r1]
    6334:	4d43      	ldr	r5, [pc, #268]	; (0x6444)
    6336:	5243      	strh	r3, [r0, r1]
    6338:	6b00      	ldr	r0, [r0, #48]	; 0x30
    633a:	5246      	strh	r6, [r0, r1]
    633c:	314f      	adds	r1, #79	; 0x4f
    633e:	5f4d      	ldrsh	r5, [r1, r5]
    6340:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6342:	435f      	muls	r7, r3
    6344:	4b4c      	ldr	r3, [pc, #304]	; (0x6478)
    6346:	554f      	strb	r7, [r1, r5]
    6348:	0054      	lsls	r4, r2, #1
    634a:	506b      	str	r3, [r5, r1]
    634c:	5244      	strh	r4, [r0, r1]
    634e:	4e55      	ldr	r6, [pc, #340]	; (0x64a4)
    6350:	4643      	mov	r3, r8
    6352:	5f47      	ldrsh	r7, [r0, r5]
    6354:	4450      	add	r0, sl
    6356:	545f      	strb	r7, [r3, r1]
    6358:	4d45      	ldr	r5, [pc, #276]	; (0x6470)
    635a:	5350      	strh	r0, [r2, r5]
    635c:	4e45      	ldr	r6, [pc, #276]	; (0x6474)
    635e:	0053      	lsls	r3, r2, #1
    6360:	4d6b      	ldr	r5, [pc, #428]	; (0x6510)
    6362:	4c43      	ldr	r4, [pc, #268]	; (0x6470)
    6364:	5f4b      	ldrsh	r3, [r1, r5]
    6366:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6368:	435f      	muls	r7, r3
    636a:	4954      	ldr	r1, [pc, #336]	; (0x64bc)
    636c:	454d      	cmp	r5, r9
    636e:	3052      	adds	r0, #82	; 0x52
    6370:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6372:	434d      	muls	r5, r1
    6374:	4b4c      	ldr	r3, [pc, #304]	; (0x64a8)
    6376:	745f      	strb	r7, [r3, #17]
    6378:	5f6f      	ldrsh	r7, [r5, r5]
    637a:	5443      	strb	r3, [r0, r1]
    637c:	4d49      	ldr	r5, [pc, #292]	; (0x64a4)
    637e:	5245      	strh	r5, [r0, r1]
    6380:	0031      	movs	r1, r6
    6382:	4d6b      	ldr	r5, [pc, #428]	; (0x6530)
    6384:	4c43      	ldr	r4, [pc, #268]	; (0x6494)
    6386:	5f4b      	ldrsh	r3, [r1, r5]
    6388:	6f74      	ldr	r4, [r6, #116]	; 0x74
    638a:	435f      	muls	r7, r3
    638c:	4954      	ldr	r1, [pc, #336]	; (0x64e0)
    638e:	454d      	cmp	r5, r9
    6390:	3252      	adds	r2, #82	; 0x52
    6392:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6394:	434d      	muls	r5, r1
    6396:	4b4c      	ldr	r3, [pc, #304]	; (0x64c8)
    6398:	745f      	strb	r7, [r3, #17]
    639a:	5f6f      	ldrsh	r7, [r5, r5]
    639c:	5443      	strb	r3, [r0, r1]
    639e:	4d49      	ldr	r5, [pc, #292]	; (0x64c4)
    63a0:	5245      	strh	r5, [r0, r1]
    63a2:	0033      	movs	r3, r6
    63a4:	4d6b      	ldr	r5, [pc, #428]	; (0x6554)
    63a6:	4c43      	ldr	r4, [pc, #268]	; (0x64b4)
    63a8:	5f4b      	ldrsh	r3, [r1, r5]
    63aa:	6f74      	ldr	r4, [r6, #116]	; 0x74
    63ac:	435f      	muls	r7, r3
    63ae:	4954      	ldr	r1, [pc, #336]	; (0x6500)
    63b0:	454d      	cmp	r5, r9
    63b2:	3452      	adds	r4, #82	; 0x52
    63b4:	4e00      	ldr	r6, [pc, #0]	; (0x63b8)
    63b6:	4956      	ldr	r1, [pc, #344]	; (0x6510)
    63b8:	5f43      	ldrsh	r3, [r0, r5]
    63ba:	7954      	ldrb	r4, [r2, #5]
    63bc:	6570      	str	r0, [r6, #84]	; 0x54
    63be:	6b00      	ldr	r0, [r0, #48]	; 0x30
    63c0:	4c43      	ldr	r4, [pc, #268]	; (0x64d0)
    63c2:	434f      	muls	r7, r1
    63c4:	5f4b      	ldrsh	r3, [r1, r5]
    63c6:	6d46      	ldr	r6, [r0, #84]	; 0x54
    63c8:	0063      	lsls	r3, r4, #1
    63ca:	5f56      	ldrsh	r6, [r2, r5]
    63cc:	4344      	muls	r4, r0
    63ce:	4344      	muls	r4, r0
    63d0:	315f      	adds	r1, #95	; 0x5f
    63d2:	3150      	adds	r1, #80	; 0x50
    63d4:	3035      	adds	r0, #53	; 0x35
    63d6:	6b00      	ldr	r0, [r0, #48]	; 0x30
    63d8:	5953      	ldr	r3, [r2, r5]
    63da:	5453      	strb	r3, [r2, r1]
    63dc:	4349      	muls	r1, r1
    63de:	5f4b      	ldrsh	r3, [r1, r5]
    63e0:	4944      	ldr	r1, [pc, #272]	; (0x64f4)
    63e2:	3056      	adds	r0, #86	; 0x56
    63e4:	745f      	strb	r7, [r3, #17]
    63e6:	5f6f      	ldrsh	r7, [r5, r5]
    63e8:	5953      	ldr	r3, [r2, r5]
    63ea:	5453      	strb	r3, [r2, r1]
    63ec:	4349      	muls	r1, r1
    63ee:	304b      	adds	r0, #75	; 0x4b
    63f0:	4900      	ldr	r1, [pc, #0]	; (0x63f4)
    63f2:	4943      	ldr	r1, [pc, #268]	; (0x6500)
    63f4:	4c41      	ldr	r4, [pc, #260]	; (0x64fc)
    63f6:	554c      	strb	r4, [r1, r5]
    63f8:	4600      	mov	r0, r0
    63fa:	454c      	cmp	r4, r9
    63fc:	4658      	mov	r0, fp
    63fe:	4752      	bx	sl
    6400:	4332      	orrs	r2, r6
    6402:	5254      	strh	r4, [r2, r1]
    6404:	004c      	lsls	r4, r1, #1
    6406:	5246      	strh	r6, [r0, r1]
    6408:	5145      	str	r5, [r0, r5]
    640a:	4d5f      	ldr	r5, [pc, #380]	; (0x6588)
    640c:	5f45      	ldrsh	r5, [r0, r5]
    640e:	5443      	strb	r3, [r0, r1]
    6410:	4c52      	ldr	r4, [pc, #328]	; (0x655c)
    6412:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6414:	7453      	strb	r3, [r2, #17]
    6416:	7461      	strb	r1, [r4, #17]
    6418:	7375      	strb	r5, [r6, #13]
    641a:	7247      	strb	r7, [r0, #9]
    641c:	756f      	strb	r7, [r5, #21]
    641e:	5f70      	ldrsh	r0, [r6, r5]
    6420:	5053      	str	r3, [r2, r1]
    6422:	0049      	lsls	r1, r1, #1
    6424:	5f56      	ldrsh	r6, [r2, r5]
    6426:	4344      	muls	r4, r0
    6428:	4344      	muls	r4, r0
    642a:	315f      	adds	r1, #95	; 0x5f
    642c:	3250      	adds	r2, #80	; 0x50
    642e:	3030      	adds	r0, #48	; 0x30
    6430:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6432:	4c43      	ldr	r4, [pc, #268]	; (0x6540)
    6434:	434f      	muls	r7, r1
    6436:	5f4b      	ldrsh	r3, [r1, r5]
    6438:	6e49      	ldr	r1, [r1, #100]	; 0x64
    643a:	7570      	strb	r0, [r6, #21]
    643c:	4d74      	ldr	r5, [pc, #464]	; (0x6610)
    643e:	7875      	ldrb	r5, [r6, #1]
    6440:	0031      	movs	r1, r6
    6442:	4552      	cmp	r2, sl
    6444:	4553      	cmp	r3, sl
    6446:	5652      	ldrsb	r2, [r2, r1]
    6448:	4445      	add	r5, r8
    644a:	315f      	adds	r1, #95	; 0x5f
    644c:	0039      	movs	r1, r7
    644e:	6e5f      	ldr	r7, [r3, #100]	; 0x64
    6450:	6d75      	ldr	r5, [r6, #84]	; 0x54
    6452:	6562      	str	r2, [r4, #84]	; 0x54
    6454:	5f72      	ldrsh	r2, [r6, r5]
    6456:	666f      	str	r7, [r5, #100]	; 0x64
    6458:	655f      	str	r7, [r3, #84]	; 0x54
    645a:	6978      	ldr	r0, [r7, #20]
    645c:	5f74      	ldrsh	r4, [r6, r5]
    645e:	7566      	strb	r6, [r4, #21]
    6460:	636e      	str	r6, [r5, #52]	; 0x34
    6462:	6974      	ldr	r4, [r6, #20]
    6464:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    6466:	0073      	lsls	r3, r6, #1
    6468:	6d70      	ldr	r0, [r6, #84]	; 0x54
    646a:	6b73      	ldr	r3, [r6, #52]	; 0x34
    646c:	4300      	orrs	r0, r0
    646e:	4d4f      	ldr	r5, [pc, #316]	; (0x65ac)
    6470:	5f50      	ldrsh	r0, [r2, r5]
    6472:	4e49      	ldr	r6, [pc, #292]	; (0x6598)
    6474:	5f54      	ldrsh	r4, [r2, r5]
    6476:	5453      	strb	r3, [r2, r1]
    6478:	5441      	strb	r1, [r0, r1]
    647a:	5355      	strh	r5, [r2, r5]
    647c:	5f00      	ldrsh	r0, [r0, r4]
    647e:	6c63      	ldr	r3, [r4, #68]	; 0x44
    6480:	636f      	str	r7, [r5, #52]	; 0x34
    6482:	5f6b      	ldrsh	r3, [r5, r5]
    6484:	6964      	ldr	r4, [r4, #20]
    6486:	5f76      	ldrsh	r6, [r6, r5]
    6488:	616e      	str	r6, [r5, #20]
    648a:	656d      	str	r5, [r5, #84]	; 0x54
    648c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    648e:	5246      	strh	r6, [r0, r1]
    6490:	5f4f      	ldrsh	r7, [r1, r5]
    6492:	4648      	mov	r0, r9
    6494:	745f      	strb	r7, [r3, #17]
    6496:	5f6f      	ldrsh	r7, [r5, r5]
    6498:	4453      	add	r3, sl
    649a:	4f49      	ldr	r7, [pc, #292]	; (0x65c0)
    649c:	435f      	muls	r7, r3
    649e:	4b4c      	ldr	r3, [pc, #304]	; (0x65d0)
    64a0:	7500      	strb	r0, [r0, #20]
    64a2:	5838      	ldr	r0, [r7, r0]
    64a4:	534f      	strh	r7, [r1, r5]
    64a6:	616c      	str	r4, [r5, #20]
    64a8:	6576      	str	r6, [r6, #84]	; 0x54
    64aa:	5200      	strh	r0, [r0, r0]
    64ac:	4d4f      	ldr	r5, [pc, #316]	; (0x65ec)
    64ae:	5443      	strb	r3, [r0, r1]
    64b0:	4c52      	ldr	r4, [pc, #328]	; (0x65fc)
    64b2:	6b00      	ldr	r0, [r0, #48]	; 0x30
    64b4:	7453      	strb	r3, [r2, #17]
    64b6:	7461      	strb	r1, [r4, #17]
    64b8:	7375      	strb	r5, [r6, #13]
    64ba:	7247      	strb	r7, [r0, #9]
    64bc:	756f      	strb	r7, [r5, #21]
    64be:	5f70      	ldrsh	r0, [r6, r5]
    64c0:	4148      	adcs	r0, r1
    64c2:	5f4c      	ldrsh	r4, [r1, r5]
    64c4:	4e52      	ldr	r6, [pc, #328]	; (0x6610)
    64c6:	0047      	lsls	r7, r0, #1
    64c8:	506b      	str	r3, [r5, r1]
    64ca:	5244      	strh	r4, [r0, r1]
    64cc:	4e55      	ldr	r6, [pc, #340]	; (0x6624)
    64ce:	4643      	mov	r3, r8
    64d0:	5f47      	ldrsh	r7, [r0, r5]
    64d2:	4450      	add	r0, sl
    64d4:	4c5f      	ldr	r4, [pc, #380]	; (0x6654)
    64d6:	4f44      	ldr	r7, [pc, #272]	; (0x65e8)
    64d8:	4f58      	ldr	r7, [pc, #352]	; (0x663c)
    64da:	3233      	adds	r2, #51	; 0x33
    64dc:	004d      	lsls	r5, r1, #1
    64de:	735f      	strb	r7, [r3, #13]
    64e0:	6174      	str	r4, [r6, #20]
    64e2:	7574      	strb	r4, [r6, #21]
    64e4:	5f73      	ldrsh	r3, [r6, r5]
    64e6:	7267      	strb	r7, [r4, #9]
    64e8:	756f      	strb	r7, [r5, #21]
    64ea:	7370      	strb	r0, [r6, #13]
    64ec:	6b00      	ldr	r0, [r0, #48]	; 0x30
    64ee:	7453      	strb	r3, [r2, #17]
    64f0:	7461      	strb	r1, [r4, #17]
    64f2:	7375      	strb	r5, [r6, #13]
    64f4:	7247      	strb	r7, [r0, #9]
    64f6:	756f      	strb	r7, [r5, #21]
    64f8:	5f70      	ldrsh	r0, [r6, r5]
    64fa:	5258      	strh	r0, [r3, r1]
    64fc:	4344      	muls	r4, r0
    64fe:	5600      	ldrsb	r0, [r0, r0]
    6500:	445f      	add	r7, fp
    6502:	4443      	add	r3, r8
    6504:	5f43      	ldrsh	r3, [r0, r5]
    6506:	5031      	str	r1, [r6, r0]
    6508:	3731      	adds	r7, #49	; 0x31
    650a:	0035      	movs	r5, r6
    650c:	4c50      	ldr	r4, [pc, #320]	; (0x6650)
    650e:	314c      	adds	r1, #76	; 0x4c
    6510:	4c43      	ldr	r4, [pc, #268]	; (0x6620)
    6512:	534b      	strh	r3, [r1, r5]
    6514:	4c45      	ldr	r4, [pc, #276]	; (0x662c)
    6516:	5300      	strh	r0, [r0, r4]
    6518:	5359      	strh	r1, [r3, r5]
    651a:	4954      	ldr	r1, [pc, #336]	; (0x666c)
    651c:	4b43      	ldr	r3, [pc, #268]	; (0x662c)
    651e:	4c43      	ldr	r4, [pc, #268]	; (0x662c)
    6520:	534b      	strh	r3, [r1, r5]
    6522:	4c45      	ldr	r4, [pc, #276]	; (0x6638)
    6524:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6526:	7453      	strb	r3, [r2, #17]
    6528:	7461      	strb	r1, [r4, #17]
    652a:	7375      	strb	r5, [r6, #13]
    652c:	7247      	strb	r7, [r0, #9]
    652e:	756f      	strb	r7, [r5, #21]
    6530:	5f70      	ldrsh	r0, [r6, r5]
    6532:	5549      	strb	r1, [r1, r5]
    6534:	5241      	strh	r1, [r0, r1]
    6536:	0054      	lsls	r4, r2, #1
    6538:	536b      	strh	r3, [r5, r5]
    653a:	6174      	str	r4, [r6, #20]
    653c:	7574      	strb	r4, [r6, #21]
    653e:	4773      	bx	lr
    6540:	6f72      	ldr	r2, [r6, #116]	; 0x74
    6542:	7075      	strb	r5, [r6, #1]
    6544:	435f      	muls	r7, r3
    6546:	4d4f      	ldr	r5, [pc, #316]	; (0x6684)
    6548:	4f4d      	ldr	r7, [pc, #308]	; (0x6680)
    654a:	5f4e      	ldrsh	r6, [r1, r5]
    654c:	4154      	adcs	r4, r2
    654e:	4b53      	ldr	r3, [pc, #332]	; (0x669c)
    6550:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6552:	4c43      	ldr	r4, [pc, #268]	; (0x6660)
    6554:	434f      	muls	r7, r1
    6556:	5f4b      	ldrsh	r3, [r1, r5]
    6558:	7355      	strb	r5, [r2, #13]
    655a:	6462      	str	r2, [r4, #68]	; 0x44
    655c:	0030      	movs	r0, r6
    655e:	436b      	muls	r3, r5
    6560:	4f4c      	ldr	r7, [pc, #304]	; (0x6694)
    6562:	4b43      	ldr	r3, [pc, #268]	; (0x6670)
    6564:	555f      	strb	r7, [r3, r5]
    6566:	6273      	str	r3, [r6, #36]	; 0x24
    6568:	3164      	adds	r1, #100	; 0x64
    656a:	4100      	asrs	r0, r0
    656c:	414e      	adcs	r6, r1
    656e:	5443      	strb	r3, [r0, r1]
    6570:	4c52      	ldr	r4, [pc, #328]	; (0x66bc)
    6572:	545f      	strb	r7, [r3, r1]
    6574:	7079      	strb	r1, [r7, #1]
    6576:	0065      	lsls	r5, r4, #1
    6578:	506b      	str	r3, [r5, r1]
    657a:	5244      	strh	r4, [r0, r1]
    657c:	4e55      	ldr	r6, [pc, #340]	; (0x66d4)
    657e:	4643      	mov	r3, r8
    6580:	5f47      	ldrsh	r7, [r0, r5]
    6582:	4450      	add	r0, sl
    6584:	4c5f      	ldr	r4, [pc, #380]	; (0x6704)
    6586:	4f44      	ldr	r7, [pc, #272]	; (0x6698)
    6588:	4544      	cmp	r4, r8
    658a:	5045      	str	r5, [r0, r1]
    658c:	4c53      	ldr	r4, [pc, #332]	; (0x66dc)
    658e:	4545      	cmp	r5, r8
    6590:	0050      	lsls	r0, r2, #1
    6592:	4f6b      	ldr	r7, [pc, #428]	; (0x6740)
    6594:	4353      	muls	r3, r2
    6596:	3233      	adds	r2, #51	; 0x33
    6598:	5f4b      	ldrsh	r3, [r1, r5]
    659a:	6f74      	ldr	r4, [r6, #116]	; 0x74
    659c:	545f      	strb	r7, [r3, r1]
    659e:	4152      	adcs	r2, r2
    65a0:	4543      	cmp	r3, r8
    65a2:	6b00      	ldr	r0, [r0, #48]	; 0x30
    65a4:	4c43      	ldr	r4, [pc, #268]	; (0x66b4)
    65a6:	434f      	muls	r7, r1
    65a8:	5f4b      	ldrsh	r3, [r1, r5]
    65aa:	6f43      	ldr	r3, [r0, #116]	; 0x74
    65ac:	706d      	strb	r5, [r5, #1]
    65ae:	5600      	ldrsb	r0, [r0, r0]
    65b0:	445f      	add	r7, fp
    65b2:	4545      	cmp	r5, r8
    65b4:	5350      	strh	r0, [r2, r5]
    65b6:	454c      	cmp	r4, r9
    65b8:	5045      	str	r5, [r0, r1]
    65ba:	315f      	adds	r1, #95	; 0x5f
    65bc:	3050      	adds	r0, #80	; 0x50
    65be:	3030      	adds	r0, #48	; 0x30
    65c0:	6b00      	ldr	r0, [r0, #48]	; 0x30
    65c2:	7453      	strb	r3, [r2, #17]
    65c4:	7461      	strb	r1, [r4, #17]
    65c6:	7375      	strb	r5, [r6, #13]
    65c8:	7247      	strb	r7, [r0, #9]
    65ca:	756f      	strb	r7, [r5, #21]
    65cc:	5f70      	ldrsh	r0, [r6, r5]
    65ce:	4453      	add	r3, sl
    65d0:	4d4d      	ldr	r5, [pc, #308]	; (0x6708)
    65d2:	0043      	lsls	r3, r0, #1
    65d4:	766c      	strb	r4, [r5, #25]
    65d6:	765f      	strb	r7, [r3, #25]
    65d8:	6c5f      	ldr	r7, [r3, #68]	; 0x44
    65da:	6f64      	ldr	r4, [r4, #116]	; 0x74
    65dc:	705f      	strb	r7, [r3, #1]
    65de:	756d      	strb	r5, [r5, #21]
    65e0:	625f      	str	r7, [r3, #36]	; 0x24
    65e2:	6f6f      	ldr	r7, [r5, #116]	; 0x74
    65e4:	7473      	strb	r3, [r6, #17]
    65e6:	6b00      	ldr	r0, [r0, #48]	; 0x30
    65e8:	4c50      	ldr	r4, [pc, #320]	; (0x672c)
    65ea:	304c      	adds	r0, #76	; 0x4c
    65ec:	745f      	strb	r7, [r3, #17]
    65ee:	5f6f      	ldrsh	r7, [r5, r5]
    65f0:	414d      	adcs	r5, r1
    65f2:	4e49      	ldr	r6, [pc, #292]	; (0x6718)
    65f4:	435f      	muls	r7, r3
    65f6:	4b4c      	ldr	r3, [pc, #304]	; (0x6728)
    65f8:	5300      	strh	r0, [r0, r4]
    65fa:	4348      	muls	r0, r1
    65fc:	5253      	strh	r3, [r2, r1]
    65fe:	5200      	strh	r0, [r0, r0]
    6600:	5345      	strh	r5, [r0, r5]
    6602:	5245      	strh	r5, [r0, r1]
    6604:	4556      	cmp	r6, sl
    6606:	5f44      	ldrsh	r4, [r0, r5]
    6608:	3932      	subs	r1, #50	; 0x32
    660a:	4300      	orrs	r0, r0
    660c:	5550      	strb	r0, [r2, r5]
    660e:	4552      	cmp	r2, sl
    6610:	4354      	muls	r4, r2
    6612:	5254      	strh	r4, [r2, r1]
    6614:	004c      	lsls	r4, r1, #1
    6616:	536b      	strh	r3, [r5, r5]
    6618:	6174      	str	r4, [r6, #20]
    661a:	7574      	strb	r4, [r6, #21]
    661c:	4773      	bx	lr
    661e:	6f72      	ldr	r2, [r6, #116]	; 0x74
    6620:	7075      	strb	r5, [r6, #1]
    6622:	415f      	adcs	r7, r3
    6624:	7070      	strb	r0, [r6, #1]
    6626:	696c      	ldr	r4, [r5, #20]
    6628:	6163      	str	r3, [r4, #20]
    662a:	6974      	ldr	r4, [r6, #20]
    662c:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    662e:	6152      	str	r2, [r2, #20]
    6630:	676e      	str	r6, [r5, #116]	; 0x74
    6632:	5365      	strh	r5, [r4, r5]
    6634:	6174      	str	r4, [r6, #20]
    6636:	7472      	strb	r2, [r6, #17]
    6638:	6b00      	ldr	r0, [r0, #48]	; 0x30
    663a:	414d      	adcs	r5, r1
    663c:	4e49      	ldr	r6, [pc, #292]	; (0x6764)
    663e:	435f      	muls	r7, r3
    6640:	4b4c      	ldr	r3, [pc, #304]	; (0x6774)
    6642:	745f      	strb	r7, [r3, #17]
    6644:	5f6f      	ldrsh	r7, [r5, r5]
    6646:	4353      	muls	r3, r2
    6648:	5f54      	ldrsh	r4, [r2, r5]
    664a:	4c43      	ldr	r4, [pc, #268]	; (0x6758)
    664c:	004b      	lsls	r3, r1, #1
    664e:	536b      	strh	r3, [r5, r5]
    6650:	6174      	str	r4, [r6, #20]
    6652:	7574      	strb	r4, [r6, #21]
    6654:	4773      	bx	lr
    6656:	6f72      	ldr	r2, [r6, #116]	; 0x74
    6658:	7075      	strb	r5, [r6, #1]
    665a:	545f      	strb	r7, [r3, r1]
    665c:	4752      	bx	sl
    665e:	554d      	strb	r5, [r1, r5]
    6660:	0058      	lsls	r0, r3, #1
    6662:	4550      	cmp	r0, sl
    6664:	4952      	ldr	r1, [pc, #328]	; (0x67b0)
    6666:	4850      	ldr	r0, [pc, #320]	; (0x67a8)
    6668:	4e45      	ldr	r6, [pc, #276]	; (0x6780)
    666a:	4643      	mov	r3, r8
    666c:	0047      	lsls	r7, r0, #1
    666e:	4d46      	ldr	r5, [pc, #280]	; (0x6788)
    6670:	4643      	mov	r3, r8
    6672:	554c      	strb	r4, [r1, r5]
    6674:	4853      	ldr	r0, [pc, #332]	; (0x67c4)
    6676:	5300      	strh	r0, [r0, r4]
    6678:	4152      	adcs	r2, r2
    667a:	434d      	muls	r5, r1
    667c:	5254      	strh	r4, [r2, r1]
    667e:	004c      	lsls	r4, r1, #1
    6680:	766c      	strb	r4, [r5, #25]
    6682:	645f      	str	r7, [r3, #68]	; 0x44
    6684:	6463      	str	r3, [r4, #68]	; 0x44
    6686:	5f63      	ldrsh	r3, [r4, r5]
    6688:	766d      	strb	r5, [r5, #25]
    668a:	5600      	ldrsb	r0, [r0, r0]
    668c:	415f      	adcs	r7, r3
    668e:	5f4f      	ldrsh	r7, [r1, r5]
    6690:	5031      	str	r1, [r6, r0]
    6692:	3030      	adds	r0, #48	; 0x30
    6694:	0030      	movs	r0, r6
    6696:	536b      	strh	r3, [r5, r5]
    6698:	6174      	str	r4, [r6, #20]
    669a:	7574      	strb	r4, [r6, #21]
    669c:	4773      	bx	lr
    669e:	6f72      	ldr	r2, [r6, #116]	; 0x74
    66a0:	7075      	strb	r5, [r6, #1]
    66a2:	4c5f      	ldr	r4, [pc, #380]	; (0x6820)
    66a4:	5350      	strh	r0, [r2, r5]
    66a6:	4943      	ldr	r1, [pc, #268]	; (0x67b4)
    66a8:	4600      	mov	r0, r0
    66aa:	4f52      	ldr	r7, [pc, #328]	; (0x67f4)
    66ac:	4648      	mov	r0, r9
    66ae:	4944      	ldr	r1, [pc, #272]	; (0x67c0)
    66b0:	0056      	lsls	r6, r2, #1
    66b2:	436b      	muls	r3, r5
    66b4:	4f4c      	ldr	r7, [pc, #304]	; (0x67e8)
    66b6:	4b43      	ldr	r3, [pc, #268]	; (0x67c4)
    66b8:	475f      	bx	fp
    66ba:	6970      	ldr	r0, [r6, #20]
    66bc:	306f      	adds	r0, #111	; 0x6f
    66be:	6b00      	ldr	r0, [r0, #48]	; 0x30
    66c0:	4c43      	ldr	r4, [pc, #268]	; (0x67d0)
    66c2:	434f      	muls	r7, r1
    66c4:	5f4b      	ldrsh	r3, [r1, r5]
    66c6:	7047      	strb	r7, [r0, #1]
    66c8:	6f69      	ldr	r1, [r5, #116]	; 0x74
    66ca:	0031      	movs	r1, r6
    66cc:	436b      	muls	r3, r5
    66ce:	4f4c      	ldr	r7, [pc, #304]	; (0x6800)
    66d0:	4b43      	ldr	r3, [pc, #268]	; (0x67e0)
    66d2:	475f      	bx	fp
    66d4:	6970      	ldr	r0, [r6, #20]
    66d6:	326f      	adds	r2, #111	; 0x6f
    66d8:	6b00      	ldr	r0, [r0, #48]	; 0x30
    66da:	4c43      	ldr	r4, [pc, #268]	; (0x67e8)
    66dc:	434f      	muls	r7, r1
    66de:	5f4b      	ldrsh	r3, [r1, r5]
    66e0:	7047      	strb	r7, [r0, #1]
    66e2:	6f69      	ldr	r1, [r5, #116]	; 0x74
    66e4:	0033      	movs	r3, r6
    66e6:	436b      	muls	r3, r5
    66e8:	4f4c      	ldr	r7, [pc, #304]	; (0x681c)
    66ea:	4b43      	ldr	r3, [pc, #268]	; (0x67f8)
    66ec:	475f      	bx	fp
    66ee:	6970      	ldr	r0, [r6, #20]
    66f0:	346f      	adds	r4, #111	; 0x6f
    66f2:	6b00      	ldr	r0, [r0, #48]	; 0x30
    66f4:	4c43      	ldr	r4, [pc, #268]	; (0x6804)
    66f6:	434f      	muls	r7, r1
    66f8:	5f4b      	ldrsh	r3, [r1, r5]
    66fa:	7047      	strb	r7, [r0, #1]
    66fc:	6f69      	ldr	r1, [r5, #116]	; 0x74
    66fe:	0035      	movs	r5, r6
    6700:	695f      	ldr	r7, [r3, #20]
    6702:	746e      	strb	r6, [r5, #17]
    6704:	7265      	strb	r5, [r4, #9]
    6706:	7572      	strb	r2, [r6, #21]
    6708:	7470      	strb	r0, [r6, #17]
    670a:	5f73      	ldrsh	r3, [r6, r5]
    670c:	666f      	str	r7, [r5, #100]	; 0x64
    670e:	0066      	lsls	r6, r4, #1
    6710:	5452      	strb	r2, [r2, r1]
    6712:	4f43      	ldr	r7, [pc, #268]	; (0x6820)
    6714:	4353      	muls	r3, r2
    6716:	3233      	adds	r2, #51	; 0x33
    6718:	004b      	lsls	r3, r1, #1
    671a:	5f56      	ldrsh	r6, [r2, r5]
    671c:	4f41      	ldr	r7, [pc, #260]	; (0x6824)
    671e:	315f      	adds	r1, #95	; 0x5f
    6720:	3050      	adds	r0, #80	; 0x50
    6722:	3031      	adds	r0, #49	; 0x31
    6724:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6726:	7453      	strb	r3, [r2, #17]
    6728:	7461      	strb	r1, [r4, #17]
    672a:	7375      	strb	r5, [r6, #13]
    672c:	7247      	strb	r7, [r0, #9]
    672e:	756f      	strb	r7, [r5, #21]
    6730:	5f70      	ldrsh	r0, [r6, r5]
    6732:	504c      	str	r4, [r1, r1]
    6734:	5f43      	ldrsh	r3, [r0, r5]
    6736:	3249      	adds	r2, #73	; 0x49
    6738:	5f43      	ldrsh	r3, [r0, r5]
    673a:	0031      	movs	r1, r6
    673c:	5f56      	ldrsh	r6, [r2, r5]
    673e:	4544      	cmp	r4, r8
    6740:	5045      	str	r5, [r0, r1]
    6742:	4c53      	ldr	r4, [pc, #332]	; (0x6890)
    6744:	4545      	cmp	r5, r8
    6746:	5f50      	ldrsh	r0, [r2, r5]
    6748:	5031      	str	r1, [r6, r0]
    674a:	3230      	adds	r2, #48	; 0x30
    674c:	0035      	movs	r5, r6
    674e:	5355      	strh	r5, [r2, r5]
    6750:	3042      	adds	r0, #66	; 0x42
    6752:	4c43      	ldr	r4, [pc, #268]	; (0x6860)
    6754:	534b      	strh	r3, [r1, r5]
    6756:	4c45      	ldr	r4, [pc, #276]	; (0x686c)
    6758:	6400      	str	r0, [r0, #64]	; 0x40
    675a:	6463      	str	r3, [r4, #68]	; 0x44
    675c:	5f63      	ldrsh	r3, [r4, r5]
    675e:	6f76      	ldr	r6, [r6, #116]	; 0x74
    6760:	746c      	strb	r4, [r5, #17]
    6762:	6761      	str	r1, [r4, #116]	; 0x74
    6764:	0065      	lsls	r5, r4, #1
    6766:	5541      	strb	r1, [r0, r5]
    6768:	4f54      	ldr	r7, [pc, #336]	; (0x68bc)
    676a:	4c43      	ldr	r4, [pc, #268]	; (0x6878)
    676c:	474b      	bx	r9
    676e:	5441      	strb	r1, [r0, r1]
    6770:	4f45      	ldr	r7, [pc, #276]	; (0x6888)
    6772:	4556      	cmp	r6, sl
    6774:	5252      	strh	r2, [r2, r1]
    6776:	4449      	add	r1, r9
    6778:	0045      	lsls	r5, r0, #1
    677a:	4941      	ldr	r1, [pc, #260]	; (0x6880)
    677c:	4352      	muls	r2, r2
    677e:	0052      	lsls	r2, r2, #1
    6780:	4c46      	ldr	r4, [pc, #280]	; (0x689c)
    6782:	5341      	strh	r1, [r0, r5]
    6784:	4248      	negs	r0, r1
    6786:	4e41      	ldr	r6, [pc, #260]	; (0x688c)
    6788:	454b      	cmp	r3, r9
    678a:	414e      	adcs	r6, r1
    678c:	4c42      	ldr	r4, [pc, #264]	; (0x6898)
    678e:	0045      	lsls	r5, r0, #1
    6790:	3875      	subs	r0, #117	; 0x75
    6792:	734f      	strb	r7, [r1, #13]
    6794:	4363      	muls	r3, r4
    6796:	7061      	strb	r1, [r4, #1]
    6798:	4300      	orrs	r0, r0
    679a:	444f      	add	r7, r9
    679c:	5345      	strh	r5, [r0, r5]
    679e:	4345      	muls	r5, r0
    67a0:	5255      	strh	r5, [r2, r1]
    67a2:	5449      	strb	r1, [r1, r1]
    67a4:	5059      	str	r1, [r3, r1]
    67a6:	4f52      	ldr	r7, [pc, #328]	; (0x68f0)
    67a8:	5454      	strb	r4, [r2, r1]
    67aa:	5345      	strh	r5, [r0, r5]
    67ac:	0054      	lsls	r4, r2, #1
    67ae:	444c      	add	r4, r9
    67b0:	444f      	add	r7, r9
    67b2:	4545      	cmp	r5, r8
    67b4:	5350      	strh	r0, [r2, r5]
    67b6:	454c      	cmp	r4, r9
    67b8:	5045      	str	r5, [r0, r1]
    67ba:	5600      	ldrsb	r0, [r0, r0]
    67bc:	415f      	adcs	r7, r3
    67be:	5f4f      	ldrsh	r7, [r1, r5]
    67c0:	5031      	str	r1, [r6, r0]
    67c2:	3230      	adds	r2, #48	; 0x30
    67c4:	0030      	movs	r0, r6
    67c6:	4d6b      	ldr	r5, [pc, #428]	; (0x6974)
    67c8:	4941      	ldr	r1, [pc, #260]	; (0x68d0)
    67ca:	5f4e      	ldrsh	r6, [r1, r5]
    67cc:	4c43      	ldr	r4, [pc, #268]	; (0x68dc)
    67ce:	5f4b      	ldrsh	r3, [r1, r5]
    67d0:	6f74      	ldr	r4, [r6, #116]	; 0x74
    67d2:	4d5f      	ldr	r5, [pc, #380]	; (0x6950)
    67d4:	4c43      	ldr	r4, [pc, #268]	; (0x68e4)
    67d6:	004b      	lsls	r3, r1, #1
    67d8:	4f50      	ldr	r7, [pc, #320]	; (0x691c)
    67da:	4557      	cmp	r7, sl
    67dc:	4452      	add	r2, sl
    67de:	574f      	ldrsb	r7, [r1, r5]
    67e0:	534e      	strh	r6, [r1, r5]
    67e2:	4641      	mov	r1, r8
    67e4:	5445      	strb	r5, [r0, r1]
    67e6:	0059      	lsls	r1, r3, #1
    67e8:	436b      	muls	r3, r5
    67ea:	4f4c      	ldr	r7, [pc, #304]	; (0x691c)
    67ec:	4b43      	ldr	r3, [pc, #268]	; (0x68fc)
    67ee:	535f      	strh	r7, [r3, r5]
    67f0:	7463      	strb	r3, [r4, #17]
    67f2:	4300      	orrs	r0, r0
    67f4:	4d4f      	ldr	r5, [pc, #316]	; (0x6934)
    67f6:	0050      	lsls	r0, r2, #1
    67f8:	4c50      	ldr	r4, [pc, #320]	; (0x693c)
    67fa:	314c      	adds	r1, #76	; 0x4c
    67fc:	5453      	strb	r3, [r2, r1]
    67fe:	5441      	strb	r1, [r0, r1]
    6800:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6802:	4c43      	ldr	r4, [pc, #268]	; (0x6910)
    6804:	434f      	muls	r7, r1
    6806:	5f4b      	ldrsh	r3, [r1, r5]
    6808:	7550      	strb	r0, [r2, #21]
    680a:	0066      	lsls	r6, r4, #1
    680c:	656d      	str	r5, [r5, #84]	; 0x54
    680e:	736d      	strb	r5, [r5, #13]
    6810:	7465      	strb	r5, [r4, #17]
    6812:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6814:	4450      	add	r0, sl
    6816:	5552      	strb	r2, [r2, r5]
    6818:	434e      	muls	r6, r1
    681a:	4746      	bx	r8
    681c:	465f      	mov	r7, fp
    681e:	726f      	strb	r7, [r5, #9]
    6820:	6563      	str	r3, [r4, #84]	; 0x54
    6822:	6e55      	ldr	r5, [r2, #100]	; 0x64
    6824:	6973      	ldr	r3, [r6, #20]
    6826:	6e67      	ldr	r7, [r4, #100]	; 0x64
    6828:	6465      	str	r5, [r4, #68]	; 0x44
    682a:	7200      	strb	r0, [r0, #8]
    682c:	7365      	strb	r5, [r4, #13]
    682e:	6c75      	ldr	r5, [r6, #68]	; 0x44
    6830:	0074      	lsls	r4, r6, #1
    6832:	4344      	muls	r4, r0
    6834:	4943      	ldr	r1, [pc, #268]	; (0x6944)
    6836:	564d      	ldrsb	r5, [r1, r1]
    6838:	4341      	muls	r1, r0
    683a:	4200      	tst	r0, r0
    683c:	4655      	mov	r5, sl
    683e:	4546      	cmp	r6, r8
    6840:	4952      	ldr	r1, [pc, #328]	; (0x698c)
    6842:	474e      	bx	r9
    6844:	4841      	ldr	r0, [pc, #260]	; (0x694c)
    6846:	3242      	adds	r2, #66	; 0x42
    6848:	5056      	str	r6, [r2, r1]
    684a:	3142      	adds	r1, #66	; 0x42
    684c:	5600      	ldrsb	r0, [r0, r0]
    684e:	415f      	adcs	r7, r3
    6850:	5f4f      	ldrsh	r7, [r1, r5]
    6852:	5031      	str	r1, [r6, r0]
    6854:	3330      	adds	r3, #48	; 0x30
    6856:	0030      	movs	r0, r6
    6858:	6970      	ldr	r0, [r6, #20]
    685a:	3233      	adds	r2, #51	; 0x33
    685c:	315f      	adds	r1, #95	; 0x5f
    685e:	4d36      	ldr	r5, [pc, #216]	; (0x6938)
    6860:	5866      	ldr	r6, [r4, r1]
    6862:	6174      	str	r4, [r6, #20]
    6864:	4e6c      	ldr	r6, [pc, #432]	; (0x6a18)
    6866:	6350      	str	r0, [r2, #52]	; 0x34
    6868:	5062      	str	r2, [r4, r1]
    686a:	7261      	strb	r1, [r4, #9]
    686c:	6143      	str	r3, [r0, #20]
    686e:	7070      	strb	r0, [r6, #1]
    6870:	5f46      	ldrsh	r6, [r0, r5]
    6872:	3178      	adds	r1, #120	; 0x78
    6874:	3030      	adds	r0, #48	; 0x30
    6876:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6878:	4450      	add	r0, sl
    687a:	5552      	strb	r2, [r2, r5]
    687c:	434e      	muls	r6, r1
    687e:	4746      	bx	r8
    6880:	505f      	str	r7, [r3, r1]
    6882:	5f44      	ldrsh	r4, [r0, r5]
    6884:	5355      	strh	r5, [r2, r5]
    6886:	3142      	adds	r1, #66	; 0x42
    6888:	505f      	str	r7, [r3, r1]
    688a:	5948      	ldr	r0, [r1, r5]
    688c:	4900      	ldr	r1, [pc, #0]	; (0x6890)
    688e:	5f44      	ldrsh	r4, [r0, r5]
    6890:	4d4d      	ldr	r5, [pc, #308]	; (0x69c8)
    6892:	5246      	strh	r6, [r0, r1]
    6894:	5600      	ldrsb	r0, [r0, r0]
    6896:	445f      	add	r7, fp
    6898:	4443      	add	r3, r8
    689a:	5f43      	ldrsh	r3, [r0, r5]
    689c:	5031      	str	r1, [r6, r0]
    689e:	3030      	adds	r0, #48	; 0x30
    68a0:	0030      	movs	r0, r6
    68a2:	436b      	muls	r3, r5
    68a4:	4f4c      	ldr	r7, [pc, #304]	; (0x69d8)
    68a6:	4b43      	ldr	r3, [pc, #268]	; (0x69b4)
    68a8:	535f      	strh	r7, [r3, r5]
    68aa:	7379      	strb	r1, [r7, #13]
    68ac:	6974      	ldr	r4, [r6, #20]
    68ae:	6b63      	ldr	r3, [r4, #52]	; 0x34
    68b0:	0030      	movs	r0, r6
    68b2:	436b      	muls	r3, r5
    68b4:	4f4c      	ldr	r7, [pc, #304]	; (0x69e8)
    68b6:	4b43      	ldr	r3, [pc, #268]	; (0x69c4)
    68b8:	535f      	strh	r7, [r3, r5]
    68ba:	7379      	strb	r1, [r7, #13]
    68bc:	6974      	ldr	r4, [r6, #20]
    68be:	6b63      	ldr	r3, [r4, #52]	; 0x34
    68c0:	0031      	movs	r1, r6
    68c2:	436b      	muls	r3, r5
    68c4:	4f4c      	ldr	r7, [pc, #304]	; (0x69f8)
    68c6:	4b43      	ldr	r3, [pc, #268]	; (0x69d4)
    68c8:	505f      	str	r7, [r3, r1]
    68ca:	7476      	strb	r6, [r6, #17]
    68cc:	4800      	ldr	r0, [pc, #0]	; (0x68d0)
    68ce:	5757      	ldrsb	r7, [r2, r5]
    68d0:	4b41      	ldr	r3, [pc, #260]	; (0x69d8)
    68d2:	0045      	lsls	r5, r0, #1
    68d4:	4d6b      	ldr	r5, [pc, #428]	; (0x6a84)
    68d6:	4941      	ldr	r1, [pc, #260]	; (0x69dc)
    68d8:	5f4e      	ldrsh	r6, [r1, r5]
    68da:	4c43      	ldr	r4, [pc, #268]	; (0x69e8)
    68dc:	5f4b      	ldrsh	r3, [r1, r5]
    68de:	6f74      	ldr	r4, [r6, #116]	; 0x74
    68e0:	435f      	muls	r7, r3
    68e2:	4954      	ldr	r1, [pc, #336]	; (0x6a34)
    68e4:	454d      	cmp	r5, r9
    68e6:	3252      	adds	r2, #82	; 0x52
    68e8:	4500      	cmp	r0, r0
    68ea:	5546      	strb	r6, [r0, r5]
    68ec:	4553      	cmp	r3, sl
    68ee:	4c43      	ldr	r4, [pc, #268]	; (0x69fc)
    68f0:	434b      	muls	r3, r1
    68f2:	5254      	strh	r4, [r2, r1]
    68f4:	004c      	lsls	r4, r1, #1
    68f6:	4d6b      	ldr	r5, [pc, #428]	; (0x6aa4)
    68f8:	4941      	ldr	r1, [pc, #260]	; (0x6a00)
    68fa:	5f4e      	ldrsh	r6, [r1, r5]
    68fc:	4c43      	ldr	r4, [pc, #268]	; (0x6a0c)
    68fe:	5f4b      	ldrsh	r3, [r1, r5]
    6900:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6902:	435f      	muls	r7, r3
    6904:	4954      	ldr	r1, [pc, #336]	; (0x6a58)
    6906:	454d      	cmp	r5, r9
    6908:	3352      	adds	r3, #82	; 0x52
    690a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    690c:	4c43      	ldr	r4, [pc, #268]	; (0x6a1c)
    690e:	434f      	muls	r7, r1
    6910:	5f4b      	ldrsh	r3, [r1, r5]
    6912:	6d44      	ldr	r4, [r0, #84]	; 0x54
    6914:	3061      	adds	r0, #97	; 0x61
    6916:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6918:	4c43      	ldr	r4, [pc, #268]	; (0x6a28)
    691a:	434f      	muls	r7, r1
    691c:	5f4b      	ldrsh	r3, [r1, r5]
    691e:	6d44      	ldr	r4, [r0, #84]	; 0x54
    6920:	3161      	adds	r1, #97	; 0x61
    6922:	4600      	mov	r0, r0
    6924:	4f52      	ldr	r7, [pc, #328]	; (0x6a70)
    6926:	3931      	subs	r1, #49	; 0x31
    6928:	4d32      	ldr	r5, [pc, #200]	; (0x69f4)
    692a:	535f      	strh	r7, [r3, r5]
    692c:	4154      	adcs	r4, r2
    692e:	5554      	strb	r4, [r2, r5]
    6930:	0053      	lsls	r3, r2, #1
    6932:	536b      	strh	r3, [r5, r5]
    6934:	6174      	str	r4, [r6, #20]
    6936:	7574      	strb	r4, [r6, #21]
    6938:	4773      	bx	lr
    693a:	6f72      	ldr	r2, [r6, #116]	; 0x74
    693c:	7075      	strb	r5, [r6, #1]
    693e:	4e5f      	ldr	r6, [pc, #380]	; (0x6abc)
    6940:	544f      	strb	r7, [r1, r1]
    6942:	4649      	mov	r1, r9
    6944:	4549      	cmp	r1, r9
    6946:	0052      	lsls	r2, r2, #1
    6948:	5f56      	ldrsh	r6, [r2, r5]
    694a:	4f41      	ldr	r7, [pc, #260]	; (0x6a50)
    694c:	315f      	adds	r1, #95	; 0x5f
    694e:	3050      	adds	r0, #80	; 0x50
    6950:	3034      	adds	r0, #52	; 0x34
    6952:	4c00      	ldr	r4, [pc, #0]	; (0x6954)
    6954:	4f44      	ldr	r7, [pc, #272]	; (0x6a68)
    6956:	585f      	ldr	r7, [r3, r1]
    6958:	334f      	adds	r3, #79	; 0x4f
    695a:	4d32      	ldr	r5, [pc, #200]	; (0x6a24)
    695c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    695e:	4c43      	ldr	r4, [pc, #268]	; (0x6a6c)
    6960:	434f      	muls	r7, r1
    6962:	5f4b      	ldrsh	r3, [r1, r5]
    6964:	7953      	ldrb	r3, [r2, #5]
    6966:	6373      	str	r3, [r6, #52]	; 0x34
    6968:	6c74      	ldr	r4, [r6, #68]	; 0x44
    696a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    696c:	4c43      	ldr	r4, [pc, #268]	; (0x6a7c)
    696e:	434f      	muls	r7, r1
    6970:	5f4b      	ldrsh	r3, [r1, r5]
    6972:	6c46      	ldr	r6, [r0, #68]	; 0x44
    6974:	7361      	strb	r1, [r4, #13]
    6976:	0068      	lsls	r0, r5, #1
    6978:	4d46      	ldr	r5, [pc, #280]	; (0x6a94)
    697a:	4343      	muls	r3, r0
    697c:	0052      	lsls	r2, r2, #1
    697e:	436b      	muls	r3, r5
    6980:	4f4c      	ldr	r7, [pc, #304]	; (0x6ab4)
    6982:	4b43      	ldr	r3, [pc, #268]	; (0x6a90)
    6984:	555f      	strb	r7, [r3, r5]
    6986:	6273      	str	r3, [r6, #36]	; 0x24
    6988:	4331      	orrs	r1, r6
    698a:	6b6c      	ldr	r4, [r5, #52]	; 0x34
    698c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    698e:	4c43      	ldr	r4, [pc, #268]	; (0x6a9c)
    6990:	434f      	muls	r7, r1
    6992:	5f4b      	ldrsh	r3, [r1, r5]
    6994:	6148      	str	r0, [r1, #20]
    6996:	6873      	ldr	r3, [r6, #4]
    6998:	7243      	strb	r3, [r0, #9]
    699a:	7079      	strb	r1, [r7, #1]
    699c:	0074      	lsls	r4, r6, #1
    699e:	7063      	strb	r3, [r4, #1]
    69a0:	5f75      	ldrsh	r5, [r6, r5]
    69a2:	6572      	str	r2, [r6, #84]	; 0x54
    69a4:	6574      	str	r4, [r6, #84]	; 0x54
    69a6:	746e      	strb	r6, [r5, #17]
    69a8:	6f69      	ldr	r1, [r5, #116]	; 0x74
    69aa:	5f6e      	ldrsh	r6, [r5, r5]
    69ac:	7463      	strb	r3, [r4, #17]
    69ae:	6c72      	ldr	r2, [r6, #68]	; 0x44
    69b0:	6b00      	ldr	r0, [r0, #48]	; 0x30
    69b2:	4f4e      	ldr	r7, [pc, #312]	; (0x6aec)
    69b4:	454e      	cmp	r6, r9
    69b6:	745f      	strb	r7, [r3, #17]
    69b8:	5f6f      	ldrsh	r7, [r5, r5]
    69ba:	4c46      	ldr	r4, [pc, #280]	; (0x6ad4)
    69bc:	5845      	ldr	r5, [r0, r1]
    69be:	4f43      	ldr	r7, [pc, #268]	; (0x6acc)
    69c0:	4d4d      	ldr	r5, [pc, #308]	; (0x6af8)
    69c2:	0030      	movs	r0, r6
    69c4:	4157      	adcs	r7, r2
    69c6:	454b      	cmp	r3, r9
    69c8:	5055      	str	r5, [r2, r1]
    69ca:	4f49      	ldr	r7, [pc, #292]	; (0x6af0)
    69cc:	5443      	strb	r3, [r0, r1]
    69ce:	4c52      	ldr	r4, [pc, #328]	; (0x6b18)
    69d0:	4100      	asrs	r0, r0
    69d2:	4248      	negs	r0, r1
    69d4:	4353      	muls	r3, r2
    69d6:	0052      	lsls	r2, r2, #1
    69d8:	4e6b      	ldr	r6, [pc, #428]	; (0x6b88)
    69da:	4e4f      	ldr	r6, [pc, #316]	; (0x6b18)
    69dc:	5f45      	ldrsh	r5, [r0, r5]
    69de:	6f74      	ldr	r4, [r6, #116]	; 0x74
    69e0:	465f      	mov	r7, fp
    69e2:	454c      	cmp	r4, r9
    69e4:	4358      	muls	r0, r3
    69e6:	4d4f      	ldr	r5, [pc, #316]	; (0x6b24)
    69e8:	334d      	adds	r3, #77	; 0x4d
    69ea:	6b00      	ldr	r0, [r0, #48]	; 0x30
    69ec:	4f4e      	ldr	r7, [pc, #312]	; (0x6b28)
    69ee:	454e      	cmp	r6, r9
    69f0:	745f      	strb	r7, [r3, #17]
    69f2:	5f6f      	ldrsh	r7, [r5, r5]
    69f4:	4c46      	ldr	r4, [pc, #280]	; (0x6b10)
    69f6:	5845      	ldr	r5, [r0, r1]
    69f8:	4f43      	ldr	r7, [pc, #268]	; (0x6b08)
    69fa:	4d4d      	ldr	r5, [pc, #308]	; (0x6b30)
    69fc:	0034      	movs	r4, r6
    69fe:	4e6b      	ldr	r6, [pc, #428]	; (0x6bac)
    6a00:	4e4f      	ldr	r6, [pc, #316]	; (0x6b40)
    6a02:	5f45      	ldrsh	r5, [r0, r5]
    6a04:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6a06:	465f      	mov	r7, fp
    6a08:	454c      	cmp	r4, r9
    6a0a:	4358      	muls	r0, r3
    6a0c:	4d4f      	ldr	r5, [pc, #316]	; (0x6b4c)
    6a0e:	354d      	adds	r5, #77	; 0x4d
    6a10:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6a12:	4f4e      	ldr	r7, [pc, #312]	; (0x6b4c)
    6a14:	454e      	cmp	r6, r9
    6a16:	745f      	strb	r7, [r3, #17]
    6a18:	5f6f      	ldrsh	r7, [r5, r5]
    6a1a:	4c46      	ldr	r4, [pc, #280]	; (0x6b34)
    6a1c:	5845      	ldr	r5, [r0, r1]
    6a1e:	4f43      	ldr	r7, [pc, #268]	; (0x6b2c)
    6a20:	4d4d      	ldr	r5, [pc, #308]	; (0x6b58)
    6a22:	0036      	movs	r6, r6
    6a24:	4e6b      	ldr	r6, [pc, #428]	; (0x6bd4)
    6a26:	4e4f      	ldr	r6, [pc, #316]	; (0x6b64)
    6a28:	5f45      	ldrsh	r5, [r0, r5]
    6a2a:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6a2c:	465f      	mov	r7, fp
    6a2e:	454c      	cmp	r4, r9
    6a30:	4358      	muls	r0, r3
    6a32:	4d4f      	ldr	r5, [pc, #316]	; (0x6b70)
    6a34:	374d      	adds	r7, #77	; 0x4d
    6a36:	5600      	ldrsb	r0, [r0, r0]
    6a38:	415f      	adcs	r7, r3
    6a3a:	5f4f      	ldrsh	r7, [r1, r5]
    6a3c:	5031      	str	r1, [r6, r0]
    6a3e:	3530      	adds	r5, #48	; 0x30
    6a40:	0030      	movs	r0, r6
    6a42:	6970      	ldr	r0, [r6, #20]
    6a44:	3233      	adds	r2, #51	; 0x33
    6a46:	335f      	adds	r3, #95	; 0x5f
    6a48:	6b32      	ldr	r2, [r6, #48]	; 0x30
    6a4a:	5866      	ldr	r6, [r4, r1]
    6a4c:	6174      	str	r4, [r6, #20]
    6a4e:	506c      	str	r4, [r5, r1]
    6a50:	6350      	str	r0, [r2, #52]	; 0x34
    6a52:	5062      	str	r2, [r4, r1]
    6a54:	7261      	strb	r1, [r4, #9]
    6a56:	6143      	str	r3, [r0, #20]
    6a58:	7070      	strb	r0, [r6, #1]
    6a5a:	5f46      	ldrsh	r6, [r0, r5]
    6a5c:	3178      	adds	r1, #120	; 0x78
    6a5e:	3030      	adds	r0, #48	; 0x30
    6a60:	4700      	bx	r0
    6a62:	4950      	ldr	r1, [pc, #320]	; (0x6ba4)
    6a64:	504f      	str	r7, [r1, r1]
    6a66:	5953      	ldr	r3, [r2, r5]
    6a68:	434e      	muls	r6, r1
    6a6a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6a6c:	7453      	strb	r3, [r2, #17]
    6a6e:	7461      	strb	r1, [r4, #17]
    6a70:	7375      	strb	r5, [r6, #13]
    6a72:	7247      	strb	r7, [r0, #9]
    6a74:	756f      	strb	r7, [r5, #21]
    6a76:	5f70      	ldrsh	r0, [r6, r5]
    6a78:	4853      	ldr	r0, [pc, #332]	; (0x6bc8)
    6a7a:	4c45      	ldr	r4, [pc, #276]	; (0x6b90)
    6a7c:	004c      	lsls	r4, r1, #1
    6a7e:	6873      	ldr	r3, [r6, #4]
    6a80:	726f      	strb	r7, [r5, #9]
    6a82:	2074      	movs	r0, #116	; 0x74
    6a84:	6e75      	ldr	r5, [r6, #100]	; 0x64
    6a86:	6973      	ldr	r3, [r6, #20]
    6a88:	6e67      	ldr	r7, [r4, #100]	; 0x64
    6a8a:	6465      	str	r5, [r4, #68]	; 0x44
    6a8c:	6920      	ldr	r0, [r4, #16]
    6a8e:	746e      	strb	r6, [r5, #17]
    6a90:	4200      	tst	r0, r0
    6a92:	4655      	mov	r5, sl
    6a94:	4546      	cmp	r6, r8
    6a96:	4952      	ldr	r1, [pc, #328]	; (0x6be0)
    6a98:	474e      	bx	r9
    6a9a:	4841      	ldr	r0, [pc, #260]	; (0x6ba0)
    6a9c:	3242      	adds	r2, #66	; 0x42
    6a9e:	5056      	str	r6, [r2, r1]
    6aa0:	3042      	adds	r0, #66	; 0x42
    6aa2:	7300      	strb	r0, [r0, #12]
    6aa4:	6769      	str	r1, [r5, #116]	; 0x74
    6aa6:	656e      	str	r6, [r5, #84]	; 0x54
    6aa8:	2064      	movs	r0, #100	; 0x64
    6aaa:	6863      	ldr	r3, [r4, #4]
    6aac:	7261      	strb	r1, [r4, #9]
    6aae:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6ab0:	4450      	add	r0, sl
    6ab2:	5552      	strb	r2, [r2, r5]
    6ab4:	434e      	muls	r6, r1
    6ab6:	4746      	bx	r8
    6ab8:	505f      	str	r7, [r3, r1]
    6aba:	5f44      	ldrsh	r4, [r0, r5]
    6abc:	5246      	strh	r6, [r0, r1]
    6abe:	334f      	adds	r3, #79	; 0x4f
    6ac0:	4b32      	ldr	r3, [pc, #200]	; (0x6b8c)
    6ac2:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6ac4:	5246      	strh	r6, [r0, r1]
    6ac6:	5f4f      	ldrsh	r7, [r1, r5]
    6ac8:	4648      	mov	r0, r9
    6aca:	745f      	strb	r7, [r3, #17]
    6acc:	5f6f      	ldrsh	r7, [r5, r5]
    6ace:	4c43      	ldr	r4, [pc, #268]	; (0x6bdc)
    6ad0:	4f4b      	ldr	r7, [pc, #300]	; (0x6c00)
    6ad2:	5455      	strb	r5, [r2, r1]
    6ad4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6ad6:	4c43      	ldr	r4, [pc, #268]	; (0x6be4)
    6ad8:	434f      	muls	r7, r1
    6ada:	5f4b      	ldrsh	r3, [r1, r5]
    6adc:	6944      	ldr	r4, [r0, #20]
    6ade:	4376      	muls	r6, r6
    6ae0:	6b6c      	ldr	r4, [r5, #52]	; 0x34
    6ae2:	754f      	strb	r7, [r1, #21]
    6ae4:	0074      	lsls	r4, r6, #1
    6ae6:	4544      	cmp	r4, r8
    6ae8:	5542      	strb	r2, [r0, r5]
    6aea:	5f47      	ldrsh	r7, [r0, r5]
    6aec:	4546      	cmp	r6, r8
    6aee:	5441      	strb	r1, [r0, r1]
    6af0:	5255      	strh	r5, [r2, r1]
    6af2:	5345      	strh	r5, [r0, r5]
    6af4:	445f      	add	r7, fp
    6af6:	0050      	lsls	r0, r2, #1
    6af8:	3375      	adds	r3, #117	; 0x75
    6afa:	5832      	ldr	r2, [r6, r0]
    6afc:	544f      	strb	r7, [r1, r1]
    6afe:	6972      	ldr	r2, [r6, #20]
    6b00:	566d      	ldrsb	r5, [r5, r1]
    6b02:	6c61      	ldr	r1, [r4, #68]	; 0x44
    6b04:	6575      	str	r5, [r6, #84]	; 0x54
    6b06:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6b08:	7453      	strb	r3, [r2, #17]
    6b0a:	7461      	strb	r1, [r4, #17]
    6b0c:	7375      	strb	r5, [r6, #13]
    6b0e:	7247      	strb	r7, [r0, #9]
    6b10:	756f      	strb	r7, [r5, #21]
    6b12:	5f70      	ldrsh	r0, [r6, r5]
    6b14:	454c      	cmp	r4, r9
    6b16:	0044      	lsls	r4, r0, #1
    6b18:	4f58      	ldr	r7, [pc, #352]	; (0x6c7c)
    6b1a:	435f      	muls	r7, r3
    6b1c:	4c41      	ldr	r4, [pc, #260]	; (0x6c24)
    6b1e:	535f      	strh	r7, [r3, r5]
    6b20:	4154      	adcs	r4, r2
    6b22:	5554      	strb	r4, [r2, r5]
    6b24:	0053      	lsls	r3, r2, #1
    6b26:	506b      	str	r3, [r5, r1]
    6b28:	5244      	strh	r4, [r0, r1]
    6b2a:	4e55      	ldr	r6, [pc, #340]	; (0x6c80)
    6b2c:	4643      	mov	r3, r8
    6b2e:	5f47      	ldrsh	r7, [r0, r5]
    6b30:	4450      	add	r0, sl
    6b32:	4c5f      	ldr	r4, [pc, #380]	; (0x6cb0)
    6b34:	4f44      	ldr	r7, [pc, #272]	; (0x6c48)
    6b36:	5355      	strh	r5, [r2, r5]
    6b38:	4842      	ldr	r0, [pc, #264]	; (0x6c44)
    6b3a:	0053      	lsls	r3, r2, #1
    6b3c:	4f6b      	ldr	r7, [pc, #428]	; (0x6cec)
    6b3e:	4353      	muls	r3, r2
    6b40:	3233      	adds	r2, #51	; 0x33
    6b42:	5f4b      	ldrsh	r3, [r1, r5]
    6b44:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6b46:	435f      	muls	r7, r3
    6b48:	4954      	ldr	r1, [pc, #336]	; (0x6c9c)
    6b4a:	454d      	cmp	r5, r9
    6b4c:	3052      	adds	r0, #82	; 0x52
    6b4e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6b50:	534f      	strh	r7, [r1, r5]
    6b52:	3343      	adds	r3, #67	; 0x43
    6b54:	4b32      	ldr	r3, [pc, #200]	; (0x6c20)
    6b56:	745f      	strb	r7, [r3, #17]
    6b58:	5f6f      	ldrsh	r7, [r5, r5]
    6b5a:	5443      	strb	r3, [r0, r1]
    6b5c:	4d49      	ldr	r5, [pc, #292]	; (0x6c84)
    6b5e:	5245      	strh	r5, [r0, r1]
    6b60:	0031      	movs	r1, r6
    6b62:	4f6b      	ldr	r7, [pc, #428]	; (0x6d10)
    6b64:	4353      	muls	r3, r2
    6b66:	3233      	adds	r2, #51	; 0x33
    6b68:	5f4b      	ldrsh	r3, [r1, r5]
    6b6a:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6b6c:	435f      	muls	r7, r3
    6b6e:	4954      	ldr	r1, [pc, #336]	; (0x6cc0)
    6b70:	454d      	cmp	r5, r9
    6b72:	3252      	adds	r2, #82	; 0x52
    6b74:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6b76:	534f      	strh	r7, [r1, r5]
    6b78:	3343      	adds	r3, #67	; 0x43
    6b7a:	4b32      	ldr	r3, [pc, #200]	; (0x6c44)
    6b7c:	745f      	strb	r7, [r3, #17]
    6b7e:	5f6f      	ldrsh	r7, [r5, r5]
    6b80:	5443      	strb	r3, [r0, r1]
    6b82:	4d49      	ldr	r5, [pc, #292]	; (0x6ca8)
    6b84:	5245      	strh	r5, [r0, r1]
    6b86:	0033      	movs	r3, r6
    6b88:	4f6b      	ldr	r7, [pc, #428]	; (0x6d38)
    6b8a:	4353      	muls	r3, r2
    6b8c:	3233      	adds	r2, #51	; 0x33
    6b8e:	5f4b      	ldrsh	r3, [r1, r5]
    6b90:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6b92:	435f      	muls	r7, r3
    6b94:	4954      	ldr	r1, [pc, #336]	; (0x6ce8)
    6b96:	454d      	cmp	r5, r9
    6b98:	3452      	adds	r4, #82	; 0x52
    6b9a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6b9c:	7453      	strb	r3, [r2, #17]
    6b9e:	7461      	strb	r1, [r4, #17]
    6ba0:	7375      	strb	r5, [r6, #13]
    6ba2:	7247      	strb	r7, [r0, #9]
    6ba4:	756f      	strb	r7, [r5, #21]
    6ba6:	5f70      	ldrsh	r0, [r6, r5]
    6ba8:	4148      	adcs	r0, r1
    6baa:	5f4c      	ldrsh	r4, [r1, r5]
    6bac:	5053      	str	r3, [r2, r1]
    6bae:	0049      	lsls	r1, r1, #1
    6bb0:	4f6b      	ldr	r7, [pc, #428]	; (0x6d60)
    6bb2:	4353      	muls	r3, r2
    6bb4:	3233      	adds	r2, #51	; 0x33
    6bb6:	5f4b      	ldrsh	r3, [r1, r5]
    6bb8:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6bba:	465f      	mov	r7, fp
    6bbc:	454c      	cmp	r4, r9
    6bbe:	4358      	muls	r0, r3
    6bc0:	4d4f      	ldr	r5, [pc, #316]	; (0x6d00)
    6bc2:	314d      	adds	r1, #77	; 0x4d
    6bc4:	5600      	ldrsb	r0, [r0, r0]
    6bc6:	445f      	add	r7, fp
    6bc8:	4545      	cmp	r5, r8
    6bca:	5350      	strh	r0, [r2, r5]
    6bcc:	454c      	cmp	r4, r9
    6bce:	5045      	str	r5, [r0, r1]
    6bd0:	315f      	adds	r1, #95	; 0x5f
    6bd2:	3050      	adds	r0, #80	; 0x50
    6bd4:	3537      	adds	r5, #55	; 0x37
    6bd6:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6bd8:	7453      	strb	r3, [r2, #17]
    6bda:	7461      	strb	r1, [r4, #17]
    6bdc:	7375      	strb	r5, [r6, #13]
    6bde:	7247      	strb	r7, [r0, #9]
    6be0:	756f      	strb	r7, [r5, #21]
    6be2:	5f70      	ldrsh	r0, [r6, r5]
    6be4:	504c      	str	r4, [r1, r1]
    6be6:	5f43      	ldrsh	r3, [r0, r5]
    6be8:	5053      	str	r3, [r2, r1]
    6bea:	0049      	lsls	r1, r1, #1
    6bec:	766c      	strb	r4, [r5, #25]
    6bee:	765f      	strb	r7, [r3, #25]
    6bf0:	6c5f      	ldr	r7, [r3, #68]	; 0x44
    6bf2:	6f64      	ldr	r4, [r4, #116]	; 0x74
    6bf4:	705f      	strb	r7, [r3, #1]
    6bf6:	756d      	strb	r5, [r5, #21]
    6bf8:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6bfa:	534f      	strh	r7, [r1, r5]
    6bfc:	3343      	adds	r3, #67	; 0x43
    6bfe:	4b32      	ldr	r3, [pc, #200]	; (0x6cc8)
    6c00:	745f      	strb	r7, [r3, #17]
    6c02:	5f6f      	ldrsh	r7, [r5, r5]
    6c04:	4c46      	ldr	r4, [pc, #280]	; (0x6d20)
    6c06:	5845      	ldr	r5, [r0, r1]
    6c08:	4f43      	ldr	r7, [pc, #268]	; (0x6d18)
    6c0a:	4d4d      	ldr	r5, [pc, #308]	; (0x6d40)
    6c0c:	0037      	movs	r7, r6
    6c0e:	5453      	strb	r3, [r2, r1]
    6c10:	5441      	strb	r1, [r0, r1]
    6c12:	5355      	strh	r5, [r2, r5]
    6c14:	5000      	str	r0, [r0, r0]
    6c16:	4c4c      	ldr	r4, [pc, #304]	; (0x6d48)
    6c18:	5031      	str	r1, [r6, r0]
    6c1a:	4544      	cmp	r4, r8
    6c1c:	0043      	lsls	r3, r0, #1
    6c1e:	436b      	muls	r3, r5
    6c20:	4f4c      	ldr	r7, [pc, #304]	; (0x6d54)
    6c22:	4b43      	ldr	r3, [pc, #268]	; (0x6d30)
    6c24:	445f      	add	r7, fp
    6c26:	7669      	strb	r1, [r5, #25]
    6c28:	6457      	str	r7, [r2, #68]	; 0x44
    6c2a:	4374      	muls	r4, r6
    6c2c:	6b6c      	ldr	r4, [r5, #52]	; 0x34
    6c2e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6c30:	4c43      	ldr	r4, [pc, #268]	; (0x6d40)
    6c32:	434f      	muls	r7, r1
    6c34:	5f4b      	ldrsh	r3, [r1, r5]
    6c36:	4942      	ldr	r1, [pc, #264]	; (0x6d40)
    6c38:	6332      	str	r2, [r6, #48]	; 0x30
    6c3a:	0030      	movs	r0, r6
    6c3c:	436b      	muls	r3, r5
    6c3e:	4f4c      	ldr	r7, [pc, #304]	; (0x6d70)
    6c40:	4b43      	ldr	r3, [pc, #268]	; (0x6d50)
    6c42:	425f      	negs	r7, r3
    6c44:	3249      	adds	r2, #73	; 0x49
    6c46:	3163      	adds	r1, #99	; 0x63
    6c48:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6c4a:	4c43      	ldr	r4, [pc, #268]	; (0x6d58)
    6c4c:	434f      	muls	r7, r1
    6c4e:	5f4b      	ldrsh	r3, [r1, r5]
    6c50:	4942      	ldr	r1, [pc, #264]	; (0x6d5c)
    6c52:	6332      	str	r2, [r6, #48]	; 0x30
    6c54:	0032      	movs	r2, r6
    6c56:	436b      	muls	r3, r5
    6c58:	4f4c      	ldr	r7, [pc, #304]	; (0x6d8c)
    6c5a:	4b43      	ldr	r3, [pc, #268]	; (0x6d68)
    6c5c:	425f      	negs	r7, r3
    6c5e:	3249      	adds	r2, #73	; 0x49
    6c60:	3363      	adds	r3, #99	; 0x63
    6c62:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6c64:	4c43      	ldr	r4, [pc, #268]	; (0x6d74)
    6c66:	434f      	muls	r7, r1
    6c68:	5f4b      	ldrsh	r3, [r1, r5]
    6c6a:	4942      	ldr	r1, [pc, #264]	; (0x6d74)
    6c6c:	6332      	str	r2, [r6, #48]	; 0x30
    6c6e:	0034      	movs	r4, r6
    6c70:	4f43      	ldr	r7, [pc, #268]	; (0x6d80)
    6c72:	504d      	str	r5, [r1, r1]
    6c74:	495f      	ldr	r1, [pc, #380]	; (0x6df4)
    6c76:	544e      	strb	r6, [r1, r1]
    6c78:	435f      	muls	r7, r3
    6c7a:	5254      	strh	r4, [r2, r1]
    6c7c:	004c      	lsls	r4, r1, #1
    6c7e:	436b      	muls	r3, r5
    6c80:	4f4c      	ldr	r7, [pc, #304]	; (0x6db4)
    6c82:	4b43      	ldr	r3, [pc, #268]	; (0x6d90)
    6c84:	425f      	negs	r7, r3
    6c86:	3249      	adds	r2, #73	; 0x49
    6c88:	3663      	adds	r6, #99	; 0x63
    6c8a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6c8c:	4c43      	ldr	r4, [pc, #268]	; (0x6d9c)
    6c8e:	434f      	muls	r7, r1
    6c90:	5f4b      	ldrsh	r3, [r1, r5]
    6c92:	4942      	ldr	r1, [pc, #264]	; (0x6d9c)
    6c94:	6332      	str	r2, [r6, #48]	; 0x30
    6c96:	0037      	movs	r7, r6
    6c98:	436b      	muls	r3, r5
    6c9a:	4f4c      	ldr	r7, [pc, #304]	; (0x6dcc)
    6c9c:	4b43      	ldr	r3, [pc, #268]	; (0x6dac)
    6c9e:	545f      	strb	r7, [r3, r1]
    6ca0:	6d69      	ldr	r1, [r5, #84]	; 0x54
    6ca2:	7265      	strb	r5, [r4, #9]
    6ca4:	0032      	movs	r2, r6
    6ca6:	7953      	ldrb	r3, [r2, #5]
    6ca8:	7473      	strb	r3, [r6, #17]
    6caa:	6d65      	ldr	r5, [r4, #84]	; 0x54
    6cac:	6f43      	ldr	r3, [r0, #116]	; 0x74
    6cae:	6572      	str	r2, [r6, #84]	; 0x54
    6cb0:	6c43      	ldr	r3, [r0, #68]	; 0x44
    6cb2:	636f      	str	r7, [r5, #52]	; 0x34
    6cb4:	006b      	lsls	r3, r5, #1
    6cb6:	536b      	strh	r3, [r5, r5]
    6cb8:	6174      	str	r4, [r6, #20]
    6cba:	7574      	strb	r4, [r6, #21]
    6cbc:	4773      	bx	lr
    6cbe:	6f72      	ldr	r2, [r6, #116]	; 0x74
    6cc0:	7075      	strb	r5, [r6, #1]
    6cc2:	555f      	strb	r7, [r3, r5]
    6cc4:	5241      	strh	r1, [r0, r1]
    6cc6:	0054      	lsls	r4, r2, #1
    6cc8:	536b      	strh	r3, [r5, r5]
    6cca:	6174      	str	r4, [r6, #20]
    6ccc:	7574      	strb	r4, [r6, #21]
    6cce:	4773      	bx	lr
    6cd0:	6f72      	ldr	r2, [r6, #116]	; 0x74
    6cd2:	7075      	strb	r5, [r6, #1]
    6cd4:	4c5f      	ldr	r4, [pc, #380]	; (0x6e54)
    6cd6:	4350      	muls	r0, r2
    6cd8:	535f      	strh	r7, [r3, r5]
    6cda:	4950      	ldr	r1, [pc, #320]	; (0x6e1c)
    6cdc:	535f      	strh	r7, [r3, r5]
    6cde:	5053      	str	r3, [r2, r1]
    6ce0:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6ce2:	4c43      	ldr	r4, [pc, #268]	; (0x6df0)
    6ce4:	434f      	muls	r7, r1
    6ce6:	5f4b      	ldrsh	r3, [r1, r5]
    6ce8:	6954      	ldr	r4, [r2, #20]
    6cea:	656d      	str	r5, [r5, #84]	; 0x54
    6cec:	3472      	adds	r4, #114	; 0x72
    6cee:	5000      	str	r0, [r0, r0]
    6cf0:	574f      	ldrsb	r7, [r1, r5]
    6cf2:	5245      	strh	r5, [r0, r1]
    6cf4:	585f      	ldr	r7, [r3, r1]
    6cf6:	6174      	str	r4, [r6, #20]
    6cf8:	316c      	adds	r1, #108	; 0x6c
    6cfa:	6d36      	ldr	r6, [r6, #80]	; 0x50
    6cfc:	7a68      	ldrb	r0, [r5, #9]
    6cfe:	6143      	str	r3, [r0, #20]
    6d00:	6170      	str	r0, [r6, #20]
    6d02:	6162      	str	r2, [r4, #20]
    6d04:	6b6e      	ldr	r6, [r5, #52]	; 0x34
    6d06:	7254      	strb	r4, [r2, #9]
    6d08:	6d69      	ldr	r1, [r5, #84]	; 0x54
    6d0a:	7500      	strb	r0, [r0, #20]
    6d0c:	3233      	adds	r2, #51	; 0x33
    6d0e:	6552      	str	r2, [r2, #84]	; 0x54
    6d10:	5667      	ldrsb	r7, [r4, r1]
    6d12:	6c61      	ldr	r1, [r4, #68]	; 0x44
    6d14:	5800      	ldr	r0, [r0, r0]
    6d16:	334f      	adds	r3, #79	; 0x4f
    6d18:	4d32      	ldr	r5, [pc, #200]	; (0x6de4)
    6d1a:	535f      	strh	r7, [r3, r5]
    6d1c:	4154      	adcs	r4, r2
    6d1e:	5554      	strb	r4, [r2, r5]
    6d20:	0053      	lsls	r3, r2, #1
    6d22:	436b      	muls	r3, r5
    6d24:	4f4c      	ldr	r7, [pc, #304]	; (0x6e58)
    6d26:	4b43      	ldr	r3, [pc, #268]	; (0x6e34)
    6d28:	525f      	strh	r7, [r3, r1]
    6d2a:	676e      	str	r6, [r5, #116]	; 0x74
    6d2c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6d2e:	4c43      	ldr	r4, [pc, #268]	; (0x6e3c)
    6d30:	434f      	muls	r7, r1
    6d32:	5f4b      	ldrsh	r3, [r1, r5]
    6d34:	6c43      	ldr	r3, [r0, #68]	; 0x44
    6d36:	636f      	str	r7, [r5, #52]	; 0x34
    6d38:	4f6b      	ldr	r7, [pc, #428]	; (0x6ee8)
    6d3a:	7475      	strb	r5, [r6, #17]
    6d3c:	6c00      	ldr	r0, [r0, #64]	; 0x40
    6d3e:	5f76      	ldrsh	r6, [r6, r5]
    6d40:	646c      	str	r4, [r5, #68]	; 0x44
    6d42:	5f6f      	ldrsh	r7, [r5, r5]
    6d44:	6f61      	ldr	r1, [r4, #116]	; 0x74
    6d46:	625f      	str	r7, [r3, #36]	; 0x24
    6d48:	6f6f      	ldr	r7, [r5, #116]	; 0x74
    6d4a:	7473      	strb	r3, [r6, #17]
    6d4c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6d4e:	7453      	strb	r3, [r2, #17]
    6d50:	7461      	strb	r1, [r4, #17]
    6d52:	7375      	strb	r5, [r6, #13]
    6d54:	7247      	strb	r7, [r0, #9]
    6d56:	756f      	strb	r7, [r5, #21]
    6d58:	5f70      	ldrsh	r0, [r6, r5]
    6d5a:	4c46      	ldr	r4, [pc, #280]	; (0x6e74)
    6d5c:	5845      	ldr	r5, [r0, r1]
    6d5e:	4f49      	ldr	r7, [pc, #292]	; (0x6e84)
    6d60:	4d5f      	ldr	r5, [pc, #380]	; (0x6ee0)
    6d62:	5543      	strb	r3, [r0, r5]
    6d64:	434c      	muls	r4, r1
    6d66:	0044      	lsls	r4, r0, #1
    6d68:	436b      	muls	r3, r5
    6d6a:	4f4c      	ldr	r7, [pc, #304]	; (0x6e9c)
    6d6c:	4b43      	ldr	r3, [pc, #268]	; (0x6e7c)
    6d6e:	575f      	ldrsb	r7, [r3, r5]
    6d70:	7464      	strb	r4, [r4, #17]
    6d72:	6c43      	ldr	r3, [r0, #68]	; 0x44
    6d74:	006b      	lsls	r3, r5, #1
    6d76:	4853      	ldr	r0, [pc, #332]	; (0x6ec4)
    6d78:	5250      	strh	r0, [r2, r1]
    6d7a:	4400      	add	r0, r0
    6d7c:	4354      	muls	r4, r2
    6d7e:	434d      	muls	r5, r1
    6d80:	0052      	lsls	r2, r2, #1
    6d82:	4954      	ldr	r1, [pc, #336]	; (0x6ed4)
    6d84:	454d      	cmp	r5, r9
    6d86:	4352      	muls	r2, r2
    6d88:	4746      	bx	r8
    6d8a:	5600      	ldrsb	r0, [r0, r0]
    6d8c:	415f      	adcs	r7, r3
    6d8e:	5f4f      	ldrsh	r7, [r1, r5]
    6d90:	5031      	str	r1, [r6, r0]
    6d92:	3231      	adds	r2, #49	; 0x31
    6d94:	0030      	movs	r0, r6
    6d96:	564d      	ldrsb	r5, [r1, r1]
    6d98:	5246      	strh	r6, [r0, r1]
    6d9a:	0030      	movs	r0, r6
    6d9c:	564d      	ldrsb	r5, [r1, r1]
    6d9e:	5246      	strh	r6, [r0, r1]
    6da0:	0031      	movs	r1, r6
    6da2:	564d      	ldrsb	r5, [r1, r1]
    6da4:	5246      	strh	r6, [r0, r1]
    6da6:	0032      	movs	r2, r6
    6da8:	5f56      	ldrsh	r6, [r2, r5]
    6daa:	4f41      	ldr	r7, [pc, #260]	; (0x6eb0)
    6dac:	315f      	adds	r1, #95	; 0x5f
    6dae:	3050      	adds	r0, #80	; 0x50
    6db0:	3038      	adds	r0, #56	; 0x38
    6db2:	4c00      	ldr	r4, [pc, #0]	; (0x6db4)
    6db4:	4f44      	ldr	r7, [pc, #272]	; (0x6ec8)
    6db6:	454d      	cmp	r5, r9
    6db8:	004d      	lsls	r5, r1, #1
    6dba:	4f50      	ldr	r7, [pc, #320]	; (0x6efc)
    6dbc:	4557      	cmp	r7, sl
    6dbe:	5f52      	ldrsh	r2, [r2, r5]
    6dc0:	6553      	str	r3, [r2, #84]	; 0x54
    6dc2:	5674      	ldrsb	r4, [r6, r1]
    6dc4:	6c6f      	ldr	r7, [r5, #68]	; 0x44
    6dc6:	6174      	str	r4, [r6, #20]
    6dc8:	6567      	str	r7, [r4, #84]	; 0x54
    6dca:	6f46      	ldr	r6, [r0, #116]	; 0x74
    6dcc:	4672      	mov	r2, lr
    6dce:	6572      	str	r2, [r6, #84]	; 0x54
    6dd0:	0071      	lsls	r1, r6, #1
    6dd2:	536b      	strh	r3, [r5, r5]
    6dd4:	6174      	str	r4, [r6, #20]
    6dd6:	7574      	strb	r4, [r6, #21]
    6dd8:	4773      	bx	lr
    6dda:	6f72      	ldr	r2, [r6, #116]	; 0x74
    6ddc:	7075      	strb	r5, [r6, #1]
    6dde:	475f      	bx	fp
    6de0:	6e65      	ldr	r5, [r4, #100]	; 0x64
    6de2:	7265      	strb	r5, [r4, #9]
    6de4:	6369      	str	r1, [r5, #52]	; 0x34
    6de6:	5000      	str	r0, [r0, r0]
    6de8:	4552      	cmp	r2, sl
    6dea:	4553      	cmp	r3, sl
    6dec:	4354      	muls	r4, r2
    6dee:	5254      	strh	r4, [r2, r1]
    6df0:	304c      	adds	r0, #76	; 0x4c
    6df2:	5000      	str	r0, [r0, r0]
    6df4:	4552      	cmp	r2, sl
    6df6:	4553      	cmp	r3, sl
    6df8:	4354      	muls	r4, r2
    6dfa:	5254      	strh	r4, [r2, r1]
    6dfc:	314c      	adds	r1, #76	; 0x4c
    6dfe:	5000      	str	r0, [r0, r0]
    6e00:	4552      	cmp	r2, sl
    6e02:	4553      	cmp	r3, sl
    6e04:	4354      	muls	r4, r2
    6e06:	5254      	strh	r4, [r2, r1]
    6e08:	324c      	adds	r2, #76	; 0x4c
    6e0a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6e0c:	4c43      	ldr	r4, [pc, #268]	; (0x6f1c)
    6e0e:	434f      	muls	r7, r1
    6e10:	5f4b      	ldrsh	r3, [r1, r5]
    6e12:	6f52      	ldr	r2, [r2, #116]	; 0x74
    6e14:	006d      	lsls	r5, r5, #1
    6e16:	4954      	ldr	r1, [pc, #336]	; (0x6f68)
    6e18:	454d      	cmp	r5, r9
    6e1a:	554f      	strb	r7, [r1, r5]
    6e1c:	0054      	lsls	r4, r2, #1
    6e1e:	4c50      	ldr	r4, [pc, #320]	; (0x6f60)
    6e20:	314c      	adds	r1, #76	; 0x4c
    6e22:	444e      	add	r6, r9
    6e24:	4345      	muls	r5, r0
    6e26:	5000      	str	r0, [r0, r0]
    6e28:	4552      	cmp	r2, sl
    6e2a:	4553      	cmp	r3, sl
    6e2c:	4354      	muls	r4, r2
    6e2e:	5254      	strh	r4, [r2, r1]
    6e30:	584c      	ldr	r4, [r1, r1]
    6e32:	5600      	ldrsb	r0, [r0, r0]
    6e34:	415f      	adcs	r7, r3
    6e36:	5f4f      	ldrsh	r7, [r1, r5]
    6e38:	5031      	str	r1, [r6, r0]
    6e3a:	3331      	adds	r3, #49	; 0x31
    6e3c:	0030      	movs	r0, r6
    6e3e:	506b      	str	r3, [r5, r1]
    6e40:	5244      	strh	r4, [r0, r1]
    6e42:	4e55      	ldr	r6, [pc, #340]	; (0x6f98)
    6e44:	4643      	mov	r3, r8
    6e46:	5f47      	ldrsh	r7, [r0, r5]
    6e48:	4450      	add	r0, sl
    6e4a:	465f      	mov	r7, fp
    6e4c:	4f52      	ldr	r7, [pc, #328]	; (0x6f98)
    6e4e:	4d31      	ldr	r5, [pc, #196]	; (0x6f14)
    6e50:	5600      	ldrsb	r0, [r0, r0]
    6e52:	415f      	adcs	r7, r3
    6e54:	5f4f      	ldrsh	r7, [r1, r5]
    6e56:	5031      	str	r1, [r6, r0]
    6e58:	3930      	subs	r1, #48	; 0x30
    6e5a:	0030      	movs	r0, r6
    6e5c:	6e61      	ldr	r1, [r4, #100]	; 0x64
    6e5e:	6c61      	ldr	r1, [r4, #68]	; 0x44
    6e60:	676f      	str	r7, [r5, #116]	; 0x74
    6e62:	635f      	str	r7, [r3, #52]	; 0x34
    6e64:	7274      	strb	r4, [r6, #9]
    6e66:	5f6c      	ldrsh	r4, [r5, r5]
    6e68:	6572      	str	r2, [r6, #84]	; 0x54
    6e6a:	7367      	strb	r7, [r4, #13]
    6e6c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6e6e:	4c43      	ldr	r4, [pc, #268]	; (0x6f7c)
    6e70:	434f      	muls	r7, r1
    6e72:	5f4b      	ldrsh	r3, [r1, r5]
    6e74:	5443      	strb	r3, [r0, r1]
    6e76:	696d      	ldr	r5, [r5, #20]
    6e78:	7265      	strb	r5, [r4, #9]
    6e7a:	0033      	movs	r3, r6
    6e7c:	5453      	strb	r3, [r2, r1]
    6e7e:	5441      	strb	r1, [r0, r1]
    6e80:	5355      	strh	r5, [r2, r5]
    6e82:	5750      	ldrsb	r0, [r2, r5]
    6e84:	0052      	lsls	r2, r2, #1
    6e86:	4e6b      	ldr	r6, [pc, #428]	; (0x7034)
    6e88:	4e4f      	ldr	r6, [pc, #316]	; (0x6fc8)
    6e8a:	5f45      	ldrsh	r5, [r0, r5]
    6e8c:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6e8e:	505f      	str	r7, [r3, r1]
    6e90:	4c4c      	ldr	r4, [pc, #304]	; (0x6fc4)
    6e92:	0030      	movs	r0, r6
    6e94:	4e6b      	ldr	r6, [pc, #428]	; (0x7044)
    6e96:	4e4f      	ldr	r6, [pc, #316]	; (0x6fd4)
    6e98:	5f45      	ldrsh	r5, [r0, r5]
    6e9a:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6e9c:	505f      	str	r7, [r3, r1]
    6e9e:	4c4c      	ldr	r4, [pc, #304]	; (0x6fd0)
    6ea0:	0031      	movs	r1, r6
    6ea2:	4f50      	ldr	r7, [pc, #320]	; (0x6fe4)
    6ea4:	4557      	cmp	r7, sl
    6ea6:	5f52      	ldrsh	r2, [r2, r5]
    6ea8:	6553      	str	r3, [r2, #84]	; 0x54
    6eaa:	5874      	ldr	r4, [r6, r1]
    6eac:	6174      	str	r4, [r6, #20]
    6eae:	316c      	adds	r1, #108	; 0x6c
    6eb0:	6d36      	ldr	r6, [r6, #80]	; 0x50
    6eb2:	7a68      	ldrb	r0, [r5, #9]
    6eb4:	7254      	strb	r4, [r2, #9]
    6eb6:	6d69      	ldr	r1, [r5, #84]	; 0x54
    6eb8:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6eba:	7453      	strb	r3, [r2, #17]
    6ebc:	7461      	strb	r1, [r4, #17]
    6ebe:	7375      	strb	r5, [r6, #13]
    6ec0:	7247      	strb	r7, [r0, #9]
    6ec2:	756f      	strb	r7, [r5, #21]
    6ec4:	5f70      	ldrsh	r0, [r6, r5]
    6ec6:	4143      	adcs	r3, r0
    6ec8:	4d41      	ldr	r5, [pc, #260]	; (0x6fd0)
    6eca:	6c00      	ldr	r0, [r0, #64]	; 0x40
    6ecc:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    6ece:	2067      	movs	r0, #103	; 0x67
    6ed0:	6e69      	ldr	r1, [r5, #100]	; 0x64
    6ed2:	0074      	lsls	r4, r6, #1
    6ed4:	536b      	strh	r3, [r5, r5]
    6ed6:	6174      	str	r4, [r6, #20]
    6ed8:	7574      	strb	r4, [r6, #21]
    6eda:	4773      	bx	lr
    6edc:	6f72      	ldr	r2, [r6, #116]	; 0x74
    6ede:	7075      	strb	r5, [r6, #1]
    6ee0:	4d5f      	ldr	r5, [pc, #380]	; (0x7060)
    6ee2:	4743      	bx	r8
    6ee4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6ee6:	5246      	strh	r6, [r0, r1]
    6ee8:	5f4f      	ldrsh	r7, [r1, r5]
    6eea:	4648      	mov	r0, r9
    6eec:	745f      	strb	r7, [r3, #17]
    6eee:	5f6f      	ldrsh	r7, [r5, r5]
    6ef0:	5355      	strh	r5, [r2, r5]
    6ef2:	3042      	adds	r0, #66	; 0x42
    6ef4:	435f      	muls	r7, r3
    6ef6:	4b4c      	ldr	r3, [pc, #304]	; (0x7028)
    6ef8:	4f00      	ldr	r7, [pc, #0]	; (0x6efc)
    6efa:	5453      	strb	r3, [r2, r1]
    6efc:	4d49      	ldr	r5, [pc, #292]	; (0x7024)
    6efe:	5245      	strh	r5, [r0, r1]
    6f00:	0072      	lsls	r2, r6, #1
    6f02:	5f56      	ldrsh	r6, [r2, r5]
    6f04:	4f41      	ldr	r7, [pc, #260]	; (0x700c)
    6f06:	315f      	adds	r1, #95	; 0x5f
    6f08:	3150      	adds	r1, #80	; 0x50
    6f0a:	3034      	adds	r0, #52	; 0x34
    6f0c:	5f00      	ldrsh	r0, [r0, r4]
    6f0e:	5f76      	ldrsh	r6, [r6, r5]
    6f10:	6364      	str	r4, [r4, #52]	; 0x34
    6f12:	6364      	str	r4, [r4, #52]	; 0x34
    6f14:	4100      	asrs	r0, r0
    6f16:	4248      	negs	r0, r1
    6f18:	4c43      	ldr	r4, [pc, #268]	; (0x7028)
    6f1a:	444b      	add	r3, r9
    6f1c:	5649      	ldrsb	r1, [r1, r1]
    6f1e:	4300      	orrs	r0, r0
    6f20:	5343      	strh	r3, [r0, r5]
    6f22:	4449      	add	r1, r9
    6f24:	0052      	lsls	r2, r2, #1
    6f26:	436b      	muls	r3, r5
    6f28:	4f4c      	ldr	r7, [pc, #304]	; (0x705c)
    6f2a:	4b43      	ldr	r3, [pc, #268]	; (0x7038)
    6f2c:	4c5f      	ldr	r4, [pc, #380]	; (0x70ac)
    6f2e:	7053      	strb	r3, [r2, #1]
    6f30:	3069      	adds	r0, #105	; 0x69
    6f32:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6f34:	4c43      	ldr	r4, [pc, #268]	; (0x7044)
    6f36:	434f      	muls	r7, r1
    6f38:	5f4b      	ldrsh	r3, [r1, r5]
    6f3a:	534c      	strh	r4, [r1, r5]
    6f3c:	6970      	ldr	r0, [r6, #20]
    6f3e:	0031      	movs	r1, r6
    6f40:	436b      	muls	r3, r5
    6f42:	4f4c      	ldr	r7, [pc, #304]	; (0x7074)
    6f44:	4b43      	ldr	r3, [pc, #268]	; (0x7054)
    6f46:	4c5f      	ldr	r4, [pc, #380]	; (0x70c4)
    6f48:	7053      	strb	r3, [r2, #1]
    6f4a:	3269      	adds	r2, #105	; 0x69
    6f4c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6f4e:	4c43      	ldr	r4, [pc, #268]	; (0x705c)
    6f50:	434f      	muls	r7, r1
    6f52:	5f4b      	ldrsh	r3, [r1, r5]
    6f54:	534c      	strh	r4, [r1, r5]
    6f56:	6970      	ldr	r0, [r6, #20]
    6f58:	0033      	movs	r3, r6
    6f5a:	436b      	muls	r3, r5
    6f5c:	4f4c      	ldr	r7, [pc, #304]	; (0x7090)
    6f5e:	4b43      	ldr	r3, [pc, #268]	; (0x706c)
    6f60:	4c5f      	ldr	r4, [pc, #380]	; (0x70e0)
    6f62:	7053      	strb	r3, [r2, #1]
    6f64:	3469      	adds	r4, #105	; 0x69
    6f66:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6f68:	4c43      	ldr	r4, [pc, #268]	; (0x7078)
    6f6a:	434f      	muls	r7, r1
    6f6c:	5f4b      	ldrsh	r3, [r1, r5]
    6f6e:	534c      	strh	r4, [r1, r5]
    6f70:	6970      	ldr	r0, [r6, #20]
    6f72:	0035      	movs	r5, r6
    6f74:	436b      	muls	r3, r5
    6f76:	4f4c      	ldr	r7, [pc, #304]	; (0x70a8)
    6f78:	4b43      	ldr	r3, [pc, #268]	; (0x7088)
    6f7a:	4c5f      	ldr	r4, [pc, #380]	; (0x70f8)
    6f7c:	7053      	strb	r3, [r2, #1]
    6f7e:	3669      	adds	r6, #105	; 0x69
    6f80:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6f82:	4c43      	ldr	r4, [pc, #268]	; (0x7090)
    6f84:	434f      	muls	r7, r1
    6f86:	5f4b      	ldrsh	r3, [r1, r5]
    6f88:	534c      	strh	r4, [r1, r5]
    6f8a:	6970      	ldr	r0, [r6, #20]
    6f8c:	0037      	movs	r7, r6
    6f8e:	4e41      	ldr	r6, [pc, #260]	; (0x7094)
    6f90:	4c41      	ldr	r4, [pc, #260]	; (0x7098)
    6f92:	474f      	bx	r9
    6f94:	435f      	muls	r7, r3
    6f96:	5254      	strh	r4, [r2, r1]
    6f98:	5f4c      	ldrsh	r4, [r1, r5]
    6f9a:	4643      	mov	r3, r8
    6f9c:	0047      	lsls	r7, r0, #1
    6f9e:	5753      	ldrsb	r3, [r2, r5]
    6fa0:	5f52      	ldrsh	r2, [r2, r5]
    6fa2:	4552      	cmp	r2, sl
    6fa4:	4553      	cmp	r3, sl
    6fa6:	0054      	lsls	r4, r2, #1
    6fa8:	4e41      	ldr	r6, [pc, #260]	; (0x70b0)
    6faa:	4c41      	ldr	r4, [pc, #260]	; (0x70b0)
    6fac:	474f      	bx	r9
    6fae:	435f      	muls	r7, r3
    6fb0:	5254      	strh	r4, [r2, r1]
    6fb2:	5f4c      	ldrsh	r4, [r1, r5]
    6fb4:	5453      	strb	r3, [r2, r1]
    6fb6:	5441      	strb	r1, [r0, r1]
    6fb8:	5355      	strh	r5, [r2, r5]
    6fba:	6b00      	ldr	r0, [r0, #48]	; 0x30
    6fbc:	4c43      	ldr	r4, [pc, #268]	; (0x70cc)
    6fbe:	434f      	muls	r7, r1
    6fc0:	5f4b      	ldrsh	r3, [r1, r5]
    6fc2:	6944      	ldr	r4, [r0, #20]
    6fc4:	4676      	mov	r6, lr
    6fc6:	656c      	str	r4, [r5, #84]	; 0x54
    6fc8:	4678      	mov	r0, pc
    6fca:	6772      	str	r2, [r6, #116]	; 0x74
    6fcc:	0035      	movs	r5, r6
    6fce:	7973      	ldrb	r3, [r6, #5]
    6fd0:	7473      	strb	r3, [r6, #17]
    6fd2:	6d65      	ldr	r5, [r4, #84]	; 0x54
    6fd4:	765f      	strb	r7, [r3, #25]
    6fd6:	6c6f      	ldr	r7, [r5, #68]	; 0x44
    6fd8:	6174      	str	r4, [r6, #20]
    6fda:	6567      	str	r7, [r4, #84]	; 0x54
    6fdc:	6d5f      	ldr	r7, [r3, #84]	; 0x54
    6fde:	0076      	lsls	r6, r6, #1
    6fe0:	536b      	strh	r3, [r5, r5]
    6fe2:	6174      	str	r4, [r6, #20]
    6fe4:	7574      	strb	r4, [r6, #21]
    6fe6:	4773      	bx	lr
    6fe8:	6f72      	ldr	r2, [r6, #116]	; 0x74
    6fea:	7075      	strb	r5, [r6, #1]
    6fec:	4d5f      	ldr	r5, [pc, #380]	; (0x716c)
    6fee:	4143      	adcs	r3, r0
    6ff0:	004e      	lsls	r6, r1, #1
    6ff2:	4d6b      	ldr	r5, [pc, #428]	; (0x71a0)
    6ff4:	4c43      	ldr	r4, [pc, #268]	; (0x7104)
    6ff6:	5f4b      	ldrsh	r3, [r1, r5]
    6ff8:	6f74      	ldr	r4, [r6, #116]	; 0x74
    6ffa:	465f      	mov	r7, fp
    6ffc:	454c      	cmp	r4, r9
    6ffe:	4358      	muls	r0, r3
    7000:	4d4f      	ldr	r5, [pc, #316]	; (0x7140)
    7002:	304d      	adds	r0, #77	; 0x4d
    7004:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7006:	434d      	muls	r5, r1
    7008:	4b4c      	ldr	r3, [pc, #304]	; (0x713c)
    700a:	745f      	strb	r7, [r3, #17]
    700c:	5f6f      	ldrsh	r7, [r5, r5]
    700e:	4c46      	ldr	r4, [pc, #280]	; (0x7128)
    7010:	5845      	ldr	r5, [r0, r1]
    7012:	4f43      	ldr	r7, [pc, #268]	; (0x7120)
    7014:	4d4d      	ldr	r5, [pc, #308]	; (0x714c)
    7016:	0031      	movs	r1, r6
    7018:	4d6b      	ldr	r5, [pc, #428]	; (0x71c8)
    701a:	4c43      	ldr	r4, [pc, #268]	; (0x7128)
    701c:	5f4b      	ldrsh	r3, [r1, r5]
    701e:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7020:	465f      	mov	r7, fp
    7022:	454c      	cmp	r4, r9
    7024:	4358      	muls	r0, r3
    7026:	4d4f      	ldr	r5, [pc, #316]	; (0x7164)
    7028:	324d      	adds	r2, #77	; 0x4d
    702a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    702c:	434d      	muls	r5, r1
    702e:	4b4c      	ldr	r3, [pc, #304]	; (0x7160)
    7030:	745f      	strb	r7, [r3, #17]
    7032:	5f6f      	ldrsh	r7, [r5, r5]
    7034:	4c46      	ldr	r4, [pc, #280]	; (0x7150)
    7036:	5845      	ldr	r5, [r0, r1]
    7038:	4f43      	ldr	r7, [pc, #268]	; (0x7148)
    703a:	4d4d      	ldr	r5, [pc, #308]	; (0x7170)
    703c:	0033      	movs	r3, r6
    703e:	4d6b      	ldr	r5, [pc, #428]	; (0x71ec)
    7040:	4c43      	ldr	r4, [pc, #268]	; (0x7150)
    7042:	5f4b      	ldrsh	r3, [r1, r5]
    7044:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7046:	465f      	mov	r7, fp
    7048:	454c      	cmp	r4, r9
    704a:	4358      	muls	r0, r3
    704c:	4d4f      	ldr	r5, [pc, #316]	; (0x718c)
    704e:	344d      	adds	r4, #77	; 0x4d
    7050:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7052:	434d      	muls	r5, r1
    7054:	4b4c      	ldr	r3, [pc, #304]	; (0x7188)
    7056:	745f      	strb	r7, [r3, #17]
    7058:	5f6f      	ldrsh	r7, [r5, r5]
    705a:	4c46      	ldr	r4, [pc, #280]	; (0x7174)
    705c:	5845      	ldr	r5, [r0, r1]
    705e:	4f43      	ldr	r7, [pc, #268]	; (0x716c)
    7060:	4d4d      	ldr	r5, [pc, #308]	; (0x7198)
    7062:	0035      	movs	r5, r6
    7064:	4d6b      	ldr	r5, [pc, #428]	; (0x7214)
    7066:	4c43      	ldr	r4, [pc, #268]	; (0x7174)
    7068:	5f4b      	ldrsh	r3, [r1, r5]
    706a:	6f74      	ldr	r4, [r6, #116]	; 0x74
    706c:	465f      	mov	r7, fp
    706e:	454c      	cmp	r4, r9
    7070:	4358      	muls	r0, r3
    7072:	4d4f      	ldr	r5, [pc, #316]	; (0x71b0)
    7074:	364d      	adds	r6, #77	; 0x4d
    7076:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7078:	434d      	muls	r5, r1
    707a:	4b4c      	ldr	r3, [pc, #304]	; (0x71ac)
    707c:	745f      	strb	r7, [r3, #17]
    707e:	5f6f      	ldrsh	r7, [r5, r5]
    7080:	4c46      	ldr	r4, [pc, #280]	; (0x719c)
    7082:	5845      	ldr	r5, [r0, r1]
    7084:	4f43      	ldr	r7, [pc, #268]	; (0x7194)
    7086:	4d4d      	ldr	r5, [pc, #308]	; (0x71bc)
    7088:	0037      	movs	r7, r6
    708a:	5453      	strb	r3, [r2, r1]
    708c:	5249      	strh	r1, [r1, r1]
    708e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7090:	4c43      	ldr	r4, [pc, #268]	; (0x71a0)
    7092:	434f      	muls	r7, r1
    7094:	5f4b      	ldrsh	r3, [r1, r5]
    7096:	6353      	str	r3, [r2, #52]	; 0x34
    7098:	6974      	ldr	r4, [r6, #20]
    709a:	7570      	strb	r0, [r6, #21]
    709c:	5600      	ldrsb	r0, [r0, r0]
    709e:	415f      	adcs	r7, r3
    70a0:	5f4f      	ldrsh	r7, [r1, r5]
    70a2:	5031      	str	r1, [r6, r0]
    70a4:	3631      	adds	r6, #49	; 0x31
    70a6:	0030      	movs	r0, r6
    70a8:	5f56      	ldrsh	r6, [r2, r5]
    70aa:	4f41      	ldr	r7, [pc, #260]	; (0x71b0)
    70ac:	315f      	adds	r1, #95	; 0x5f
    70ae:	3150      	adds	r1, #80	; 0x50
    70b0:	3035      	adds	r0, #53	; 0x35
    70b2:	4d00      	ldr	r5, [pc, #0]	; (0x70b4)
    70b4:	4c43      	ldr	r4, [pc, #268]	; (0x71c4)
    70b6:	444b      	add	r3, r9
    70b8:	5649      	ldrsb	r1, [r1, r1]
    70ba:	6b00      	ldr	r0, [r0, #48]	; 0x30
    70bc:	7453      	strb	r3, [r2, #17]
    70be:	7461      	strb	r1, [r4, #17]
    70c0:	7375      	strb	r5, [r6, #13]
    70c2:	7247      	strb	r7, [r0, #9]
    70c4:	756f      	strb	r7, [r5, #21]
    70c6:	5f70      	ldrsh	r0, [r6, r5]
    70c8:	534d      	strh	r5, [r1, r5]
    70ca:	4143      	adcs	r3, r0
    70cc:	004e      	lsls	r6, r1, #1
    70ce:	7865      	ldrb	r5, [r4, #1]
    70d0:	6c63      	ldr	r3, [r4, #68]	; 0x44
    70d2:	6475      	str	r5, [r6, #68]	; 0x44
    70d4:	5f65      	ldrsh	r5, [r4, r5]
    70d6:	7266      	strb	r6, [r4, #9]
    70d8:	6d6f      	ldr	r7, [r5, #84]	; 0x54
    70da:	705f      	strb	r7, [r3, #1]
    70dc:	0064      	lsls	r4, r4, #1
    70de:	7973      	ldrb	r3, [r6, #5]
    70e0:	7473      	strb	r3, [r6, #17]
    70e2:	6d65      	ldr	r5, [r4, #84]	; 0x54
    70e4:	665f      	str	r7, [r3, #100]	; 0x64
    70e6:	6572      	str	r2, [r6, #84]	; 0x54
    70e8:	5f71      	ldrsh	r1, [r6, r5]
    70ea:	7a68      	ldrb	r0, [r5, #9]
    70ec:	6b00      	ldr	r0, [r0, #48]	; 0x30
    70ee:	5246      	strh	r6, [r0, r1]
    70f0:	5f4f      	ldrsh	r7, [r1, r5]
    70f2:	4648      	mov	r0, r9
    70f4:	445f      	add	r7, fp
    70f6:	5649      	ldrsb	r1, [r1, r1]
    70f8:	745f      	strb	r7, [r3, #17]
    70fa:	5f6f      	ldrsh	r7, [r5, r5]
    70fc:	4c46      	ldr	r4, [pc, #280]	; (0x7218)
    70fe:	5845      	ldr	r5, [r0, r1]
    7100:	4f43      	ldr	r7, [pc, #268]	; (0x7210)
    7102:	4d4d      	ldr	r5, [pc, #308]	; (0x7238)
    7104:	0030      	movs	r0, r6
    7106:	466b      	mov	r3, sp
    7108:	4f52      	ldr	r7, [pc, #328]	; (0x7254)
    710a:	485f      	ldr	r0, [pc, #380]	; (0x7288)
    710c:	5f46      	ldrsh	r6, [r0, r5]
    710e:	4944      	ldr	r1, [pc, #272]	; (0x7220)
    7110:	5f56      	ldrsh	r6, [r2, r5]
    7112:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7114:	465f      	mov	r7, fp
    7116:	454c      	cmp	r4, r9
    7118:	4358      	muls	r0, r3
    711a:	4d4f      	ldr	r5, [pc, #316]	; (0x7258)
    711c:	314d      	adds	r1, #77	; 0x4d
    711e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7120:	5246      	strh	r6, [r0, r1]
    7122:	5f4f      	ldrsh	r7, [r1, r5]
    7124:	4648      	mov	r0, r9
    7126:	445f      	add	r7, fp
    7128:	5649      	ldrsb	r1, [r1, r1]
    712a:	745f      	strb	r7, [r3, #17]
    712c:	5f6f      	ldrsh	r7, [r5, r5]
    712e:	4c46      	ldr	r4, [pc, #280]	; (0x7248)
    7130:	5845      	ldr	r5, [r0, r1]
    7132:	4f43      	ldr	r7, [pc, #268]	; (0x7240)
    7134:	4d4d      	ldr	r5, [pc, #308]	; (0x726c)
    7136:	0032      	movs	r2, r6
    7138:	536b      	strh	r3, [r5, r5]
    713a:	6174      	str	r4, [r6, #20]
    713c:	7574      	strb	r4, [r6, #21]
    713e:	4773      	bx	lr
    7140:	6f72      	ldr	r2, [r6, #116]	; 0x74
    7142:	7075      	strb	r5, [r6, #1]
    7144:	4d5f      	ldr	r5, [pc, #380]	; (0x72c4)
    7146:	444d      	add	r5, r9
    7148:	0043      	lsls	r3, r0, #1
    714a:	466b      	mov	r3, sp
    714c:	4f52      	ldr	r7, [pc, #328]	; (0x7298)
    714e:	485f      	ldr	r0, [pc, #380]	; (0x72cc)
    7150:	5f46      	ldrsh	r6, [r0, r5]
    7152:	4944      	ldr	r1, [pc, #272]	; (0x7264)
    7154:	5f56      	ldrsh	r6, [r2, r5]
    7156:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7158:	465f      	mov	r7, fp
    715a:	454c      	cmp	r4, r9
    715c:	4358      	muls	r0, r3
    715e:	4d4f      	ldr	r5, [pc, #316]	; (0x729c)
    7160:	344d      	adds	r4, #77	; 0x4d
    7162:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7164:	5246      	strh	r6, [r0, r1]
    7166:	5f4f      	ldrsh	r7, [r1, r5]
    7168:	4648      	mov	r0, r9
    716a:	445f      	add	r7, fp
    716c:	5649      	ldrsb	r1, [r1, r1]
    716e:	745f      	strb	r7, [r3, #17]
    7170:	5f6f      	ldrsh	r7, [r5, r5]
    7172:	4c46      	ldr	r4, [pc, #280]	; (0x728c)
    7174:	5845      	ldr	r5, [r0, r1]
    7176:	4f43      	ldr	r7, [pc, #268]	; (0x7284)
    7178:	4d4d      	ldr	r5, [pc, #308]	; (0x72b0)
    717a:	0035      	movs	r5, r6
    717c:	466b      	mov	r3, sp
    717e:	4f52      	ldr	r7, [pc, #328]	; (0x72c8)
    7180:	485f      	ldr	r0, [pc, #380]	; (0x7300)
    7182:	5f46      	ldrsh	r6, [r0, r5]
    7184:	4944      	ldr	r1, [pc, #272]	; (0x7298)
    7186:	5f56      	ldrsh	r6, [r2, r5]
    7188:	6f74      	ldr	r4, [r6, #116]	; 0x74
    718a:	465f      	mov	r7, fp
    718c:	454c      	cmp	r4, r9
    718e:	4358      	muls	r0, r3
    7190:	4d4f      	ldr	r5, [pc, #316]	; (0x72d0)
    7192:	364d      	adds	r6, #77	; 0x4d
    7194:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7196:	5246      	strh	r6, [r0, r1]
    7198:	5f4f      	ldrsh	r7, [r1, r5]
    719a:	4648      	mov	r0, r9
    719c:	445f      	add	r7, fp
    719e:	5649      	ldrsb	r1, [r1, r1]
    71a0:	745f      	strb	r7, [r3, #17]
    71a2:	5f6f      	ldrsh	r7, [r5, r5]
    71a4:	4c46      	ldr	r4, [pc, #280]	; (0x72c0)
    71a6:	5845      	ldr	r5, [r0, r1]
    71a8:	4f43      	ldr	r7, [pc, #268]	; (0x72b8)
    71aa:	4d4d      	ldr	r5, [pc, #308]	; (0x72e0)
    71ac:	0037      	movs	r7, r6
    71ae:	6975      	ldr	r5, [r6, #20]
    71b0:	746e      	strb	r6, [r5, #17]
    71b2:	3233      	adds	r2, #51	; 0x33
    71b4:	745f      	strb	r7, [r3, #17]
    71b6:	4900      	ldr	r1, [pc, #0]	; (0x71b8)
    71b8:	4553      	cmp	r3, sl
    71ba:	0052      	lsls	r2, r2, #1
    71bc:	466b      	mov	r3, sp
    71be:	4f52      	ldr	r7, [pc, #328]	; (0x7308)
    71c0:	4d31      	ldr	r5, [pc, #196]	; (0x7288)
    71c2:	745f      	strb	r7, [r3, #17]
    71c4:	5f6f      	ldrsh	r7, [r5, r5]
    71c6:	5953      	ldr	r3, [r2, r5]
    71c8:	5453      	strb	r3, [r2, r1]
    71ca:	4349      	muls	r1, r1
    71cc:	314b      	adds	r1, #75	; 0x4b
    71ce:	5000      	str	r0, [r0, r0]
    71d0:	574f      	ldrsb	r7, [r1, r5]
    71d2:	5245      	strh	r5, [r0, r1]
    71d4:	535f      	strh	r7, [r3, r5]
    71d6:	7465      	strb	r5, [r4, #17]
    71d8:	7458      	strb	r0, [r3, #17]
    71da:	6c61      	ldr	r1, [r4, #68]	; 0x44
    71dc:	3631      	adds	r6, #49	; 0x31
    71de:	686d      	ldr	r5, [r5, #4]
    71e0:	4c7a      	ldr	r4, [pc, #488]	; (0x73cc)
    71e2:	6f64      	ldr	r4, [r4, #116]	; 0x74
    71e4:	7000      	strb	r0, [r0, #0]
    71e6:	3369      	adds	r3, #105	; 0x69
    71e8:	5f32      	ldrsh	r2, [r6, r4]
    71ea:	3233      	adds	r2, #51	; 0x33
    71ec:	666b      	str	r3, [r5, #100]	; 0x64
    71ee:	7458      	strb	r0, [r3, #17]
    71f0:	6c61      	ldr	r1, [r4, #68]	; 0x44
    71f2:	6549      	str	r1, [r1, #84]	; 0x54
    71f4:	4c63      	ldr	r4, [pc, #396]	; (0x7384)
    71f6:	616f      	str	r7, [r5, #20]
    71f8:	7064      	strb	r4, [r4, #1]
    71fa:	5f46      	ldrsh	r6, [r0, r5]
    71fc:	3178      	adds	r1, #120	; 0x78
    71fe:	3030      	adds	r0, #48	; 0x30
    7200:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7202:	7453      	strb	r3, [r2, #17]
    7204:	7461      	strb	r1, [r4, #17]
    7206:	7375      	strb	r5, [r6, #13]
    7208:	7247      	strb	r7, [r0, #9]
    720a:	756f      	strb	r7, [r5, #21]
    720c:	5f70      	ldrsh	r0, [r6, r5]
    720e:	4f50      	ldr	r7, [pc, #320]	; (0x7350)
    7210:	4557      	cmp	r7, sl
    7212:	0052      	lsls	r2, r2, #1
    7214:	436b      	muls	r3, r5
    7216:	4f4c      	ldr	r7, [pc, #304]	; (0x7348)
    7218:	4b43      	ldr	r3, [pc, #268]	; (0x7328)
    721a:	505f      	str	r7, [r3, r1]
    721c:	6c6c      	ldr	r4, [r5, #68]	; 0x44
    721e:	4f30      	ldr	r7, [pc, #192]	; (0x72e0)
    7220:	7475      	strb	r5, [r6, #17]
    7222:	5200      	strh	r0, [r0, r0]
    7224:	4d41      	ldr	r5, [pc, #260]	; (0x732c)
    7226:	4953      	ldr	r1, [pc, #332]	; (0x7374)
    7228:	455a      	cmp	r2, fp
    722a:	4643      	mov	r3, r8
    722c:	0047      	lsls	r7, r0, #1
    722e:	506b      	str	r3, [r5, r1]
    7230:	5244      	strh	r4, [r0, r1]
    7232:	4e55      	ldr	r6, [pc, #340]	; (0x7388)
    7234:	4643      	mov	r3, r8
    7236:	5f47      	ldrsh	r7, [r0, r5]
    7238:	4450      	add	r0, sl
    723a:	525f      	strh	r7, [r3, r1]
    723c:	474e      	bx	r9
    723e:	5600      	ldrsb	r0, [r0, r0]
    7240:	4c4f      	ldr	r4, [pc, #316]	; (0x7380)
    7242:	4154      	adcs	r4, r2
    7244:	4547      	cmp	r7, r8
    7246:	4400      	add	r0, r0
    7248:	4349      	muls	r1, r1
    724a:	5f45      	ldrsh	r5, [r0, r5]
    724c:	4552      	cmp	r2, sl
    724e:	3047      	adds	r0, #71	; 0x47
    7250:	4400      	add	r0, r0
    7252:	4349      	muls	r1, r1
    7254:	5f45      	ldrsh	r5, [r0, r5]
    7256:	4552      	cmp	r2, sl
    7258:	3147      	adds	r1, #71	; 0x47
    725a:	4400      	add	r0, r0
    725c:	4349      	muls	r1, r1
    725e:	5f45      	ldrsh	r5, [r0, r5]
    7260:	4552      	cmp	r2, sl
    7262:	3247      	adds	r2, #71	; 0x47
    7264:	4600      	mov	r0, r0
    7266:	4f52      	ldr	r7, [pc, #328]	; (0x73b0)
    7268:	3931      	subs	r1, #49	; 0x31
    726a:	4d32      	ldr	r5, [pc, #200]	; (0x7334)
    726c:	435f      	muls	r7, r3
    726e:	5254      	strh	r4, [r2, r1]
    7270:	004c      	lsls	r4, r1, #1
    7272:	4944      	ldr	r1, [pc, #272]	; (0x7384)
    7274:	4543      	cmp	r3, r8
    7276:	525f      	strh	r7, [r3, r1]
    7278:	4745      	bx	r8
    727a:	0034      	movs	r4, r6
    727c:	4944      	ldr	r1, [pc, #272]	; (0x7390)
    727e:	4543      	cmp	r3, r8
    7280:	525f      	strh	r7, [r3, r1]
    7282:	4745      	bx	r8
    7284:	0035      	movs	r5, r6
    7286:	4944      	ldr	r1, [pc, #272]	; (0x7398)
    7288:	4543      	cmp	r3, r8
    728a:	525f      	strh	r7, [r3, r1]
    728c:	4745      	bx	r8
    728e:	0036      	movs	r6, r6
    7290:	4944      	ldr	r1, [pc, #272]	; (0x73a4)
    7292:	4543      	cmp	r3, r8
    7294:	525f      	strh	r7, [r3, r1]
    7296:	4745      	bx	r8
    7298:	0037      	movs	r7, r6
    729a:	6c63      	ldr	r3, [r4, #68]	; 0x44
    729c:	636f      	str	r7, [r5, #52]	; 0x34
    729e:	5f6b      	ldrsh	r3, [r5, r5]
    72a0:	7069      	strb	r1, [r5, #1]
    72a2:	6e5f      	ldr	r7, [r3, #100]	; 0x64
    72a4:	6d61      	ldr	r1, [r4, #84]	; 0x54
    72a6:	5f65      	ldrsh	r5, [r4, r5]
    72a8:	0074      	lsls	r4, r6, #1
    72aa:	5f56      	ldrsh	r6, [r2, r5]
    72ac:	4f41      	ldr	r7, [pc, #260]	; (0x73b4)
    72ae:	305f      	adds	r0, #95	; 0x5f
    72b0:	3950      	subs	r1, #80	; 0x50
    72b2:	3036      	adds	r0, #54	; 0x36
    72b4:	4600      	mov	r0, r0
    72b6:	454c      	cmp	r4, r9
    72b8:	4658      	mov	r0, fp
    72ba:	4752      	bx	sl
    72bc:	4336      	orrs	r6, r6
    72be:	5254      	strh	r4, [r2, r1]
    72c0:	004c      	lsls	r4, r1, #1
    72c2:	506b      	str	r3, [r5, r1]
    72c4:	4c4c      	ldr	r4, [pc, #304]	; (0x73f8)
    72c6:	5f30      	ldrsh	r0, [r6, r4]
    72c8:	4944      	ldr	r1, [pc, #272]	; (0x73dc)
    72ca:	5f56      	ldrsh	r6, [r2, r5]
    72cc:	6f74      	ldr	r4, [r6, #116]	; 0x74
    72ce:	465f      	mov	r7, fp
    72d0:	454c      	cmp	r4, r9
    72d2:	4358      	muls	r0, r3
    72d4:	4d4f      	ldr	r5, [pc, #316]	; (0x7414)
    72d6:	304d      	adds	r0, #77	; 0x4d
    72d8:	6b00      	ldr	r0, [r0, #48]	; 0x30
    72da:	4c50      	ldr	r4, [pc, #320]	; (0x741c)
    72dc:	304c      	adds	r0, #76	; 0x4c
    72de:	445f      	add	r7, fp
    72e0:	5649      	ldrsb	r1, [r1, r1]
    72e2:	745f      	strb	r7, [r3, #17]
    72e4:	5f6f      	ldrsh	r7, [r5, r5]
    72e6:	4c46      	ldr	r4, [pc, #280]	; (0x7400)
    72e8:	5845      	ldr	r5, [r0, r1]
    72ea:	4f43      	ldr	r7, [pc, #268]	; (0x73f8)
    72ec:	4d4d      	ldr	r5, [pc, #308]	; (0x7424)
    72ee:	0031      	movs	r1, r6
    72f0:	506b      	str	r3, [r5, r1]
    72f2:	4c4c      	ldr	r4, [pc, #304]	; (0x7424)
    72f4:	5f30      	ldrsh	r0, [r6, r4]
    72f6:	4944      	ldr	r1, [pc, #272]	; (0x7408)
    72f8:	5f56      	ldrsh	r6, [r2, r5]
    72fa:	6f74      	ldr	r4, [r6, #116]	; 0x74
    72fc:	465f      	mov	r7, fp
    72fe:	454c      	cmp	r4, r9
    7300:	4358      	muls	r0, r3
    7302:	4d4f      	ldr	r5, [pc, #316]	; (0x7440)
    7304:	324d      	adds	r2, #77	; 0x4d
    7306:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7308:	4c50      	ldr	r4, [pc, #320]	; (0x744c)
    730a:	304c      	adds	r0, #76	; 0x4c
    730c:	445f      	add	r7, fp
    730e:	5649      	ldrsb	r1, [r1, r1]
    7310:	745f      	strb	r7, [r3, #17]
    7312:	5f6f      	ldrsh	r7, [r5, r5]
    7314:	4c46      	ldr	r4, [pc, #280]	; (0x7430)
    7316:	5845      	ldr	r5, [r0, r1]
    7318:	4f43      	ldr	r7, [pc, #268]	; (0x7428)
    731a:	4d4d      	ldr	r5, [pc, #308]	; (0x7450)
    731c:	0033      	movs	r3, r6
    731e:	506b      	str	r3, [r5, r1]
    7320:	4c4c      	ldr	r4, [pc, #304]	; (0x7454)
    7322:	5f30      	ldrsh	r0, [r6, r4]
    7324:	4944      	ldr	r1, [pc, #272]	; (0x7438)
    7326:	5f56      	ldrsh	r6, [r2, r5]
    7328:	6f74      	ldr	r4, [r6, #116]	; 0x74
    732a:	465f      	mov	r7, fp
    732c:	454c      	cmp	r4, r9
    732e:	4358      	muls	r0, r3
    7330:	4d4f      	ldr	r5, [pc, #316]	; (0x7470)
    7332:	344d      	adds	r4, #77	; 0x4d
    7334:	7700      	strb	r0, [r0, #28]
    7336:	6b61      	ldr	r1, [r4, #52]	; 0x34
    7338:	7565      	strb	r5, [r4, #21]
    733a:	5f70      	ldrsh	r0, [r6, r5]
    733c:	6f69      	ldr	r1, [r5, #116]	; 0x74
    733e:	635f      	str	r7, [r3, #52]	; 0x34
    7340:	7274      	strb	r4, [r6, #9]
    7342:	006c      	lsls	r4, r5, #1
    7344:	506b      	str	r3, [r5, r1]
    7346:	4c4c      	ldr	r4, [pc, #304]	; (0x7478)
    7348:	5f30      	ldrsh	r0, [r6, r4]
    734a:	4944      	ldr	r1, [pc, #272]	; (0x745c)
    734c:	5f56      	ldrsh	r6, [r2, r5]
    734e:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7350:	465f      	mov	r7, fp
    7352:	454c      	cmp	r4, r9
    7354:	4358      	muls	r0, r3
    7356:	4d4f      	ldr	r5, [pc, #316]	; (0x7494)
    7358:	364d      	adds	r6, #77	; 0x4d
    735a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    735c:	4c50      	ldr	r4, [pc, #320]	; (0x74a0)
    735e:	304c      	adds	r0, #76	; 0x4c
    7360:	445f      	add	r7, fp
    7362:	5649      	ldrsb	r1, [r1, r1]
    7364:	745f      	strb	r7, [r3, #17]
    7366:	5f6f      	ldrsh	r7, [r5, r5]
    7368:	4c46      	ldr	r4, [pc, #280]	; (0x7484)
    736a:	5845      	ldr	r5, [r0, r1]
    736c:	4f43      	ldr	r7, [pc, #268]	; (0x747c)
    736e:	4d4d      	ldr	r5, [pc, #308]	; (0x74a4)
    7370:	0037      	movs	r7, r6
    7372:	506b      	str	r3, [r5, r1]
    7374:	4c4c      	ldr	r4, [pc, #304]	; (0x74a8)
    7376:	5f30      	ldrsh	r0, [r6, r4]
    7378:	6f74      	ldr	r4, [r6, #116]	; 0x74
    737a:	4d5f      	ldr	r5, [pc, #380]	; (0x74f8)
    737c:	4c43      	ldr	r4, [pc, #268]	; (0x748c)
    737e:	004b      	lsls	r3, r1, #1
    7380:	414d      	adcs	r5, r1
    7382:	4e49      	ldr	r6, [pc, #292]	; (0x74a8)
    7384:	4c43      	ldr	r4, [pc, #268]	; (0x7494)
    7386:	534b      	strh	r3, [r1, r5]
    7388:	4641      	mov	r1, r8
    738a:	5445      	strb	r5, [r0, r1]
    738c:	0059      	lsls	r1, r3, #1
    738e:	436b      	muls	r3, r5
    7390:	4f4c      	ldr	r7, [pc, #304]	; (0x74c4)
    7392:	4b43      	ldr	r3, [pc, #268]	; (0x74a0)
    7394:	465f      	mov	r7, fp
    7396:	656c      	str	r4, [r5, #84]	; 0x54
    7398:	6378      	str	r0, [r7, #52]	; 0x34
    739a:	6d6f      	ldr	r7, [r5, #84]	; 0x54
    739c:	316d      	adds	r1, #109	; 0x6d
    739e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    73a0:	7453      	strb	r3, [r2, #17]
    73a2:	7461      	strb	r1, [r4, #17]
    73a4:	7375      	strb	r5, [r6, #13]
    73a6:	7247      	strb	r7, [r0, #9]
    73a8:	756f      	strb	r7, [r5, #21]
    73aa:	5f70      	ldrsh	r0, [r6, r5]
    73ac:	504c      	str	r4, [r1, r1]
    73ae:	5053      	str	r3, [r2, r1]
    73b0:	0049      	lsls	r1, r1, #1
    73b2:	436b      	muls	r3, r5
    73b4:	4f4c      	ldr	r7, [pc, #304]	; (0x74e8)
    73b6:	4b43      	ldr	r3, [pc, #268]	; (0x74c4)
    73b8:	495f      	ldr	r1, [pc, #380]	; (0x7538)
    73ba:	4970      	ldr	r1, [pc, #448]	; (0x757c)
    73bc:	766e      	strb	r6, [r5, #25]
    73be:	6c61      	ldr	r1, [r4, #68]	; 0x44
    73c0:	6469      	str	r1, [r5, #68]	; 0x44
    73c2:	6b00      	ldr	r0, [r0, #48]	; 0x30
    73c4:	4c43      	ldr	r4, [pc, #268]	; (0x74d4)
    73c6:	434f      	muls	r7, r1
    73c8:	5f4b      	ldrsh	r3, [r1, r5]
    73ca:	6944      	ldr	r4, [r0, #20]
    73cc:	4176      	adcs	r6, r6
    73ce:	6268      	str	r0, [r5, #36]	; 0x24
    73d0:	6c43      	ldr	r3, [r0, #68]	; 0x44
    73d2:	006b      	lsls	r3, r5, #1
    73d4:	4157      	adcs	r7, r2
    73d6:	454b      	cmp	r3, r9
    73d8:	5055      	str	r5, [r2, r1]
    73da:	5253      	strh	r3, [r2, r1]
    73dc:	0043      	lsls	r3, r0, #1
    73de:	436b      	muls	r3, r5
    73e0:	4f4c      	ldr	r7, [pc, #304]	; (0x7514)
    73e2:	4b43      	ldr	r3, [pc, #268]	; (0x74f0)
    73e4:	525f      	strh	r7, [r3, r1]
    73e6:	6374      	str	r4, [r6, #52]	; 0x34
    73e8:	4100      	asrs	r0, r0
    73ea:	4248      	negs	r0, r1
    73ec:	4c43      	ldr	r4, [pc, #268]	; (0x74fc)
    73ee:	434b      	muls	r3, r1
    73f0:	5254      	strh	r4, [r2, r1]
    73f2:	434c      	muls	r4, r1
    73f4:	524c      	strh	r4, [r1, r1]
    73f6:	6b00      	ldr	r0, [r0, #48]	; 0x30
    73f8:	7453      	strb	r3, [r2, #17]
    73fa:	7461      	strb	r1, [r4, #17]
    73fc:	7375      	strb	r5, [r6, #13]
    73fe:	7247      	strb	r7, [r0, #9]
    7400:	756f      	strb	r7, [r5, #21]
    7402:	5f70      	ldrsh	r0, [r6, r5]
    7404:	4d53      	ldr	r5, [pc, #332]	; (0x7554)
    7406:	5241      	strh	r1, [r0, r1]
    7408:	4354      	muls	r4, r2
    740a:	5241      	strh	r1, [r0, r1]
    740c:	0044      	lsls	r4, r0, #1
    740e:	5f56      	ldrsh	r6, [r2, r5]
    7410:	4f41      	ldr	r7, [pc, #260]	; (0x7518)
    7412:	315f      	adds	r1, #95	; 0x5f
    7414:	3250      	adds	r2, #80	; 0x50
    7416:	3032      	adds	r0, #50	; 0x32
    7418:	6b00      	ldr	r0, [r0, #48]	; 0x30
    741a:	4c43      	ldr	r4, [pc, #268]	; (0x7528)
    741c:	434f      	muls	r7, r1
    741e:	5f4b      	ldrsh	r3, [r1, r5]
    7420:	7355      	strb	r5, [r2, #13]
    7422:	6862      	ldr	r2, [r4, #4]
    7424:	6c73      	ldr	r3, [r6, #68]	; 0x44
    7426:	0030      	movs	r0, r6
    7428:	436b      	muls	r3, r5
    742a:	4f4c      	ldr	r7, [pc, #304]	; (0x755c)
    742c:	4b43      	ldr	r3, [pc, #268]	; (0x753c)
    742e:	475f      	bx	fp
    7430:	6970      	ldr	r0, [r6, #20]
    7432:	5f6f      	ldrsh	r7, [r5, r5]
    7434:	6573      	str	r3, [r6, #84]	; 0x54
    7436:	5f63      	ldrsh	r3, [r4, r5]
    7438:	6e49      	ldr	r1, [r1, #100]	; 0x64
    743a:	0074      	lsls	r4, r6, #1
    743c:	4c50      	ldr	r4, [pc, #320]	; (0x7580)
    743e:	304c      	adds	r0, #76	; 0x4c
    7440:	545f      	strb	r7, [r3, r1]
    7442:	5345      	strh	r5, [r0, r5]
    7444:	4354      	muls	r4, r2
    7446:	5254      	strh	r4, [r2, r1]
    7448:	004c      	lsls	r4, r1, #1
    744a:	434d      	muls	r5, r1
    744c:	4b4c      	ldr	r3, [pc, #304]	; (0x7580)
    744e:	4f49      	ldr	r7, [pc, #292]	; (0x7574)
    7450:	4d00      	ldr	r5, [pc, #0]	; (0x7454)
    7452:	4941      	ldr	r1, [pc, #260]	; (0x7558)
    7454:	434e      	muls	r6, r1
    7456:	4b4c      	ldr	r3, [pc, #304]	; (0x7588)
    7458:	4553      	cmp	r3, sl
    745a:	414c      	adcs	r4, r1
    745c:	4d00      	ldr	r5, [pc, #0]	; (0x7460)
    745e:	4941      	ldr	r1, [pc, #260]	; (0x7564)
    7460:	434e      	muls	r6, r1
    7462:	4b4c      	ldr	r3, [pc, #304]	; (0x7594)
    7464:	4553      	cmp	r3, sl
    7466:	424c      	negs	r4, r1
    7468:	5500      	strb	r0, [r0, r4]
    746a:	4253      	negs	r3, r2
    746c:	4331      	orrs	r1, r6
    746e:	4b4c      	ldr	r3, [pc, #304]	; (0x75a0)
    7470:	4553      	cmp	r3, sl
    7472:	004c      	lsls	r4, r1, #1
    7474:	506b      	str	r3, [r5, r1]
    7476:	5244      	strh	r4, [r0, r1]
    7478:	4e55      	ldr	r6, [pc, #340]	; (0x75d0)
    747a:	4643      	mov	r3, r8
    747c:	5f47      	ldrsh	r7, [r0, r5]
    747e:	4450      	add	r0, sl
    7480:	425f      	negs	r7, r3
    7482:	444f      	add	r7, r9
    7484:	4256      	negs	r6, r2
    7486:	5441      	strb	r1, [r0, r1]
    7488:	5600      	ldrsb	r0, [r0, r0]
    748a:	415f      	adcs	r7, r3
    748c:	5f4f      	ldrsh	r7, [r1, r5]
    748e:	5030      	str	r0, [r6, r0]
    7490:	3739      	adds	r7, #57	; 0x39
    7492:	0030      	movs	r0, r6
    7494:	5254      	strh	r4, [r2, r1]
    7496:	4341      	muls	r1, r0
    7498:	4345      	muls	r5, r0
    749a:	4b4c      	ldr	r3, [pc, #304]	; (0x75cc)
    749c:	4944      	ldr	r1, [pc, #272]	; (0x75b0)
    749e:	0056      	lsls	r6, r2, #1
    74a0:	536b      	strh	r3, [r5, r5]
    74a2:	6174      	str	r4, [r6, #20]
    74a4:	7574      	strb	r4, [r6, #21]
    74a6:	4773      	bx	lr
    74a8:	6f72      	ldr	r2, [r6, #116]	; 0x74
    74aa:	7075      	strb	r5, [r6, #1]
    74ac:	485f      	ldr	r0, [pc, #380]	; (0x762c)
    74ae:	4c41      	ldr	r4, [pc, #260]	; (0x75b4)
    74b0:	545f      	strb	r7, [r3, r1]
    74b2:	4d49      	ldr	r5, [pc, #292]	; (0x75d8)
    74b4:	5245      	strh	r5, [r0, r1]
    74b6:	6b00      	ldr	r0, [r0, #48]	; 0x30
    74b8:	4c43      	ldr	r4, [pc, #268]	; (0x75c8)
    74ba:	434f      	muls	r7, r1
    74bc:	5f4b      	ldrsh	r3, [r1, r5]
    74be:	6f43      	ldr	r3, [r0, #116]	; 0x74
    74c0:	6572      	str	r2, [r6, #84]	; 0x54
    74c2:	7953      	ldrb	r3, [r2, #5]
    74c4:	4373      	muls	r3, r6
    74c6:	6b6c      	ldr	r4, [r5, #52]	; 0x34
    74c8:	4300      	orrs	r0, r0
    74ca:	494c      	ldr	r1, [pc, #304]	; (0x75fc)
    74cc:	5244      	strh	r4, [r0, r1]
    74ce:	4300      	orrs	r0, r0
    74d0:	5550      	strb	r0, [r2, r5]
    74d2:	5330      	strh	r0, [r6, r4]
    74d4:	4354      	muls	r4, r2
    74d6:	434b      	muls	r3, r1
    74d8:	4c41      	ldr	r4, [pc, #260]	; (0x75e0)
    74da:	4300      	orrs	r0, r0
    74dc:	5350      	strh	r0, [r2, r5]
    74de:	4154      	adcs	r4, r2
    74e0:	0054      	lsls	r4, r2, #1
    74e2:	3375      	adds	r3, #117	; 0x75
    74e4:	5632      	ldrsb	r2, [r6, r0]
    74e6:	6c61      	ldr	r1, [r4, #68]	; 0x44
    74e8:	6575      	str	r5, [r6, #84]	; 0x54
    74ea:	6b00      	ldr	r0, [r0, #48]	; 0x30
    74ec:	4c43      	ldr	r4, [pc, #268]	; (0x75fc)
    74ee:	434f      	muls	r7, r1
    74f0:	5f4b      	ldrsh	r3, [r1, r5]
    74f2:	6944      	ldr	r4, [r0, #20]
    74f4:	5376      	strh	r6, [r6, r5]
    74f6:	7463      	strb	r3, [r4, #17]
    74f8:	6c43      	ldr	r3, [r0, #68]	; 0x44
    74fa:	006b      	lsls	r3, r5, #1
    74fc:	536b      	strh	r3, [r5, r5]
    74fe:	6174      	str	r4, [r6, #20]
    7500:	7574      	strb	r4, [r6, #21]
    7502:	4773      	bx	lr
    7504:	6f72      	ldr	r2, [r6, #116]	; 0x74
    7506:	7075      	strb	r5, [r6, #1]
    7508:	535f      	strh	r7, [r3, r5]
    750a:	4d45      	ldr	r5, [pc, #276]	; (0x7620)
    750c:	0043      	lsls	r3, r0, #1
    750e:	5043      	str	r3, [r0, r1]
    7510:	3055      	adds	r0, #85	; 0x55
    7512:	534e      	strh	r6, [r1, r5]
    7514:	4354      	muls	r4, r2
    7516:	434b      	muls	r3, r1
    7518:	4c41      	ldr	r4, [pc, #260]	; (0x7620)
    751a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    751c:	7453      	strb	r3, [r2, #17]
    751e:	7461      	strb	r1, [r4, #17]
    7520:	7375      	strb	r5, [r6, #13]
    7522:	7247      	strb	r7, [r0, #9]
    7524:	756f      	strb	r7, [r5, #21]
    7526:	5f70      	ldrsh	r0, [r6, r5]
    7528:	4c46      	ldr	r4, [pc, #280]	; (0x7644)
    752a:	5845      	ldr	r5, [r0, r1]
    752c:	5053      	str	r3, [r2, r1]
    752e:	0049      	lsls	r1, r1, #1
    7530:	436b      	muls	r3, r5
    7532:	4f4c      	ldr	r7, [pc, #304]	; (0x7664)
    7534:	4b43      	ldr	r3, [pc, #268]	; (0x7644)
    7536:	575f      	ldrsb	r7, [r3, r5]
    7538:	6477      	str	r7, [r6, #68]	; 0x44
    753a:	0074      	lsls	r4, r6, #1
    753c:	456b      	cmp	r3, sp
    753e:	5458      	strb	r0, [r3, r1]
    7540:	435f      	muls	r7, r3
    7542:	4b4c      	ldr	r3, [pc, #304]	; (0x7674)
    7544:	745f      	strb	r7, [r3, #17]
    7546:	5f6f      	ldrsh	r7, [r5, r5]
    7548:	4c43      	ldr	r4, [pc, #268]	; (0x7658)
    754a:	4f4b      	ldr	r7, [pc, #300]	; (0x7678)
    754c:	5455      	strb	r5, [r2, r1]
    754e:	5300      	strh	r0, [r0, r4]
    7550:	4243      	negs	r3, r0
    7552:	545f      	strb	r7, [r3, r1]
    7554:	7079      	strb	r1, [r7, #1]
    7556:	0065      	lsls	r5, r4, #1
    7558:	4c46      	ldr	r4, [pc, #280]	; (0x7674)
    755a:	5845      	ldr	r5, [r0, r1]
    755c:	5246      	strh	r6, [r0, r1]
    755e:	3347      	adds	r3, #71	; 0x47
    7560:	5443      	strb	r3, [r0, r1]
    7562:	4c52      	ldr	r4, [pc, #328]	; (0x76ac)
    7564:	4c00      	ldr	r4, [pc, #0]	; (0x7568)
    7566:	4350      	muls	r0, r2
    7568:	4c5f      	ldr	r4, [pc, #380]	; (0x76e8)
    756a:	574f      	ldrsb	r7, [r1, r5]
    756c:	4f50      	ldr	r7, [pc, #320]	; (0x76b0)
    756e:	4557      	cmp	r7, sl
    7570:	5f52      	ldrsh	r2, [r2, r5]
    7572:	0054      	lsls	r4, r2, #1
    7574:	4643      	mov	r3, r8
    7576:	5253      	strh	r3, [r2, r1]
    7578:	6b00      	ldr	r0, [r0, #48]	; 0x30
    757a:	4c50      	ldr	r4, [pc, #320]	; (0x76bc)
    757c:	304c      	adds	r0, #76	; 0x4c
    757e:	745f      	strb	r7, [r3, #17]
    7580:	5f6f      	ldrsh	r7, [r5, r5]
    7582:	5355      	strh	r5, [r2, r5]
    7584:	3042      	adds	r0, #66	; 0x42
    7586:	435f      	muls	r7, r3
    7588:	4b4c      	ldr	r3, [pc, #304]	; (0x76bc)
    758a:	5200      	strh	r0, [r0, r0]
    758c:	4e49      	ldr	r6, [pc, #292]	; (0x76b4)
    758e:	4f47      	ldr	r7, [pc, #284]	; (0x76ac)
    7590:	5f32      	ldrsh	r2, [r6, r4]
    7592:	5443      	strb	r3, [r0, r1]
    7594:	4c52      	ldr	r4, [pc, #328]	; (0x76e0)
    7596:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7598:	4f4e      	ldr	r7, [pc, #312]	; (0x76d4)
    759a:	454e      	cmp	r6, r9
    759c:	745f      	strb	r7, [r3, #17]
    759e:	5f6f      	ldrsh	r7, [r5, r5]
    75a0:	5443      	strb	r3, [r0, r1]
    75a2:	4d49      	ldr	r5, [pc, #292]	; (0x76c8)
    75a4:	5245      	strh	r5, [r0, r1]
    75a6:	0031      	movs	r1, r6
    75a8:	4e6b      	ldr	r6, [pc, #428]	; (0x7758)
    75aa:	4e4f      	ldr	r6, [pc, #316]	; (0x76e8)
    75ac:	5f45      	ldrsh	r5, [r0, r5]
    75ae:	6f74      	ldr	r4, [r6, #116]	; 0x74
    75b0:	435f      	muls	r7, r3
    75b2:	4954      	ldr	r1, [pc, #336]	; (0x7704)
    75b4:	454d      	cmp	r5, r9
    75b6:	3252      	adds	r2, #82	; 0x52
    75b8:	6b00      	ldr	r0, [r0, #48]	; 0x30
    75ba:	4f4e      	ldr	r7, [pc, #312]	; (0x76f4)
    75bc:	454e      	cmp	r6, r9
    75be:	745f      	strb	r7, [r3, #17]
    75c0:	5f6f      	ldrsh	r7, [r5, r5]
    75c2:	5443      	strb	r3, [r0, r1]
    75c4:	4d49      	ldr	r5, [pc, #292]	; (0x76ec)
    75c6:	5245      	strh	r5, [r0, r1]
    75c8:	0033      	movs	r3, r6
    75ca:	4e6b      	ldr	r6, [pc, #428]	; (0x7778)
    75cc:	4e4f      	ldr	r6, [pc, #316]	; (0x770c)
    75ce:	5f45      	ldrsh	r5, [r0, r5]
    75d0:	6f74      	ldr	r4, [r6, #116]	; 0x74
    75d2:	435f      	muls	r7, r3
    75d4:	4954      	ldr	r1, [pc, #336]	; (0x7728)
    75d6:	454d      	cmp	r5, r9
    75d8:	3452      	adds	r4, #82	; 0x52
    75da:	6b00      	ldr	r0, [r0, #48]	; 0x30
    75dc:	7453      	strb	r3, [r2, #17]
    75de:	7461      	strb	r1, [r4, #17]
    75e0:	7375      	strb	r5, [r6, #13]
    75e2:	7247      	strb	r7, [r0, #9]
    75e4:	756f      	strb	r7, [r5, #21]
    75e6:	5f70      	ldrsh	r0, [r6, r5]
    75e8:	4453      	add	r3, sl
    75ea:	4348      	muls	r0, r1
    75ec:	6b00      	ldr	r0, [r0, #48]	; 0x30
    75ee:	7453      	strb	r3, [r2, #17]
    75f0:	7461      	strb	r1, [r4, #17]
    75f2:	7375      	strb	r5, [r6, #13]
    75f4:	7247      	strb	r7, [r0, #9]
    75f6:	756f      	strb	r7, [r5, #21]
    75f8:	5f70      	ldrsh	r0, [r6, r5]
    75fa:	5053      	str	r3, [r2, r1]
    75fc:	4649      	mov	r1, r9
    75fe:	0049      	lsls	r1, r1, #1
    7600:	506b      	str	r3, [r5, r1]
    7602:	5244      	strh	r4, [r0, r1]
    7604:	4e55      	ldr	r6, [pc, #340]	; (0x775c)
    7606:	4643      	mov	r3, r8
    7608:	5f47      	ldrsh	r7, [r0, r5]
    760a:	4450      	add	r0, sl
    760c:	525f      	strh	r7, [r3, r1]
    760e:	4d4f      	ldr	r5, [pc, #316]	; (0x774c)
    7610:	4e00      	ldr	r6, [pc, #0]	; (0x7614)
    7612:	4153      	adcs	r3, r2
    7614:	5243      	strh	r3, [r0, r1]
    7616:	4c00      	ldr	r4, [pc, #0]	; (0x7618)
    7618:	776f      	strb	r7, [r5, #29]
    761a:	6f70      	ldr	r0, [r6, #116]	; 0x74
    761c:	6577      	str	r7, [r6, #84]	; 0x54
    761e:	4472      	add	r2, lr
    7620:	6972      	ldr	r2, [r6, #20]
    7622:	6576      	str	r6, [r6, #84]	; 0x54
    7624:	4972      	ldr	r1, [pc, #456]	; (0x77f0)
    7626:	746e      	strb	r6, [r5, #17]
    7628:	7265      	strb	r5, [r4, #9]
    762a:	6166      	str	r6, [r4, #20]
    762c:	6563      	str	r3, [r4, #84]	; 0x54
    762e:	4900      	ldr	r1, [pc, #0]	; (0x7630)
    7630:	5f44      	ldrsh	r4, [r0, r5]
    7632:	4441      	add	r1, r8
    7634:	0052      	lsls	r2, r2, #1
    7636:	5355      	strh	r5, [r2, r5]
    7638:	3042      	adds	r0, #66	; 0x42
    763a:	4c43      	ldr	r4, [pc, #268]	; (0x7748)
    763c:	534b      	strh	r3, [r1, r5]
    763e:	4154      	adcs	r4, r2
    7640:	0054      	lsls	r4, r2, #1
    7642:	506b      	str	r3, [r5, r1]
    7644:	5244      	strh	r4, [r0, r1]
    7646:	4e55      	ldr	r6, [pc, #340]	; (0x779c)
    7648:	4643      	mov	r3, r8
    764a:	5f47      	ldrsh	r7, [r0, r5]
    764c:	4450      	add	r0, sl
    764e:	425f      	negs	r7, r3
    7650:	4149      	adcs	r1, r1
    7652:	0053      	lsls	r3, r2, #1
    7654:	5544      	strb	r4, [r0, r5]
    7656:	4d4d      	ldr	r5, [pc, #308]	; (0x778c)
    7658:	5f59      	ldrsh	r1, [r3, r5]
    765a:	5443      	strb	r3, [r0, r1]
    765c:	4c52      	ldr	r4, [pc, #328]	; (0x77a8)
    765e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7660:	4c43      	ldr	r4, [pc, #268]	; (0x7770)
    7662:	434f      	muls	r7, r1
    7664:	5f4b      	ldrsh	r3, [r1, r5]
    7666:	6c46      	ldr	r6, [r0, #68]	; 0x44
    7668:	7865      	ldrb	r5, [r4, #1]
    766a:	3249      	adds	r2, #73	; 0x49
    766c:	3073      	adds	r0, #115	; 0x73
    766e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7670:	4c43      	ldr	r4, [pc, #268]	; (0x7780)
    7672:	434f      	muls	r7, r1
    7674:	5f4b      	ldrsh	r3, [r1, r5]
    7676:	6944      	ldr	r4, [r0, #20]
    7678:	4676      	mov	r6, lr
    767a:	6f72      	ldr	r2, [r6, #116]	; 0x74
    767c:	6668      	str	r0, [r5, #100]	; 0x64
    767e:	6c43      	ldr	r3, [r0, #68]	; 0x44
    7680:	006b      	lsls	r3, r5, #1
    7682:	4c50      	ldr	r4, [pc, #320]	; (0x77c4)
    7684:	304c      	adds	r0, #76	; 0x4c
    7686:	5443      	strb	r3, [r0, r1]
    7688:	4c52      	ldr	r4, [pc, #328]	; (0x77d4)
    768a:	5200      	strh	r0, [r0, r0]
    768c:	4e49      	ldr	r6, [pc, #292]	; (0x77b4)
    768e:	4f47      	ldr	r7, [pc, #284]	; (0x77ac)
    7690:	5f31      	ldrsh	r1, [r6, r4]
    7692:	5443      	strb	r3, [r0, r1]
    7694:	4c52      	ldr	r4, [pc, #328]	; (0x77e0)
    7696:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7698:	7453      	strb	r3, [r2, #17]
    769a:	7461      	strb	r1, [r4, #17]
    769c:	7375      	strb	r5, [r6, #13]
    769e:	7247      	strb	r7, [r0, #9]
    76a0:	756f      	strb	r7, [r5, #21]
    76a2:	5f70      	ldrsh	r0, [r6, r5]
    76a4:	4453      	add	r3, sl
    76a6:	4649      	mov	r1, r9
    76a8:	6b00      	ldr	r0, [r0, #48]	; 0x30
    76aa:	7453      	strb	r3, [r2, #17]
    76ac:	7461      	strb	r1, [r4, #17]
    76ae:	7375      	strb	r5, [r6, #13]
    76b0:	7247      	strb	r7, [r0, #9]
    76b2:	756f      	strb	r7, [r5, #21]
    76b4:	5f70      	ldrsh	r0, [r6, r5]
    76b6:	4344      	muls	r4, r0
    76b8:	0050      	lsls	r0, r2, #1
    76ba:	4d6b      	ldr	r5, [pc, #428]	; (0x7868)
    76bc:	4941      	ldr	r1, [pc, #260]	; (0x77c4)
    76be:	5f4e      	ldrsh	r6, [r1, r5]
    76c0:	4c43      	ldr	r4, [pc, #268]	; (0x77d0)
    76c2:	5f4b      	ldrsh	r3, [r1, r5]
    76c4:	6f74      	ldr	r4, [r6, #116]	; 0x74
    76c6:	465f      	mov	r7, fp
    76c8:	454c      	cmp	r4, r9
    76ca:	4358      	muls	r0, r3
    76cc:	4d4f      	ldr	r5, [pc, #316]	; (0x780c)
    76ce:	304d      	adds	r0, #77	; 0x4d
    76d0:	6b00      	ldr	r0, [r0, #48]	; 0x30
    76d2:	414d      	adcs	r5, r1
    76d4:	4e49      	ldr	r6, [pc, #292]	; (0x77fc)
    76d6:	435f      	muls	r7, r3
    76d8:	4b4c      	ldr	r3, [pc, #304]	; (0x780c)
    76da:	745f      	strb	r7, [r3, #17]
    76dc:	5f6f      	ldrsh	r7, [r5, r5]
    76de:	4c46      	ldr	r4, [pc, #280]	; (0x77f8)
    76e0:	5845      	ldr	r5, [r0, r1]
    76e2:	4f43      	ldr	r7, [pc, #268]	; (0x77f0)
    76e4:	4d4d      	ldr	r5, [pc, #308]	; (0x781c)
    76e6:	0031      	movs	r1, r6
    76e8:	4d6b      	ldr	r5, [pc, #428]	; (0x7898)
    76ea:	4941      	ldr	r1, [pc, #260]	; (0x77f0)
    76ec:	5f4e      	ldrsh	r6, [r1, r5]
    76ee:	4c43      	ldr	r4, [pc, #268]	; (0x77fc)
    76f0:	5f4b      	ldrsh	r3, [r1, r5]
    76f2:	6f74      	ldr	r4, [r6, #116]	; 0x74
    76f4:	465f      	mov	r7, fp
    76f6:	454c      	cmp	r4, r9
    76f8:	4358      	muls	r0, r3
    76fa:	4d4f      	ldr	r5, [pc, #316]	; (0x7838)
    76fc:	324d      	adds	r2, #77	; 0x4d
    76fe:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7700:	414d      	adcs	r5, r1
    7702:	4e49      	ldr	r6, [pc, #292]	; (0x7828)
    7704:	435f      	muls	r7, r3
    7706:	4b4c      	ldr	r3, [pc, #304]	; (0x7838)
    7708:	745f      	strb	r7, [r3, #17]
    770a:	5f6f      	ldrsh	r7, [r5, r5]
    770c:	4c46      	ldr	r4, [pc, #280]	; (0x7828)
    770e:	5845      	ldr	r5, [r0, r1]
    7710:	4f43      	ldr	r7, [pc, #268]	; (0x7820)
    7712:	4d4d      	ldr	r5, [pc, #308]	; (0x7848)
    7714:	0033      	movs	r3, r6
    7716:	4d6b      	ldr	r5, [pc, #428]	; (0x78c4)
    7718:	4941      	ldr	r1, [pc, #260]	; (0x7820)
    771a:	5f4e      	ldrsh	r6, [r1, r5]
    771c:	4c43      	ldr	r4, [pc, #268]	; (0x782c)
    771e:	5f4b      	ldrsh	r3, [r1, r5]
    7720:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7722:	465f      	mov	r7, fp
    7724:	454c      	cmp	r4, r9
    7726:	4358      	muls	r0, r3
    7728:	4d4f      	ldr	r5, [pc, #316]	; (0x7868)
    772a:	344d      	adds	r4, #77	; 0x4d
    772c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    772e:	414d      	adcs	r5, r1
    7730:	4e49      	ldr	r6, [pc, #292]	; (0x7858)
    7732:	435f      	muls	r7, r3
    7734:	4b4c      	ldr	r3, [pc, #304]	; (0x7868)
    7736:	745f      	strb	r7, [r3, #17]
    7738:	5f6f      	ldrsh	r7, [r5, r5]
    773a:	4c46      	ldr	r4, [pc, #280]	; (0x7854)
    773c:	5845      	ldr	r5, [r0, r1]
    773e:	4f43      	ldr	r7, [pc, #268]	; (0x784c)
    7740:	4d4d      	ldr	r5, [pc, #308]	; (0x7878)
    7742:	0035      	movs	r5, r6
    7744:	436b      	muls	r3, r5
    7746:	4f4c      	ldr	r7, [pc, #304]	; (0x7878)
    7748:	4b43      	ldr	r3, [pc, #268]	; (0x7858)
    774a:	545f      	strb	r7, [r3, r1]
    774c:	6d69      	ldr	r1, [r5, #84]	; 0x54
    774e:	7265      	strb	r5, [r4, #9]
    7750:	0030      	movs	r0, r6
    7752:	436b      	muls	r3, r5
    7754:	4f4c      	ldr	r7, [pc, #304]	; (0x7888)
    7756:	4b43      	ldr	r3, [pc, #268]	; (0x7864)
    7758:	545f      	strb	r7, [r3, r1]
    775a:	6d69      	ldr	r1, [r5, #84]	; 0x54
    775c:	7265      	strb	r5, [r4, #9]
    775e:	0031      	movs	r1, r6
    7760:	534f      	strh	r7, [r1, r5]
    7762:	5f43      	ldrsh	r3, [r0, r5]
    7764:	4554      	cmp	r4, sl
    7766:	5453      	strb	r3, [r2, r1]
    7768:	5542      	strb	r2, [r0, r5]
    776a:	0053      	lsls	r3, r2, #1
    776c:	436b      	muls	r3, r5
    776e:	4f4c      	ldr	r7, [pc, #304]	; (0x78a0)
    7770:	4b43      	ldr	r3, [pc, #268]	; (0x7880)
    7772:	545f      	strb	r7, [r3, r1]
    7774:	6d69      	ldr	r1, [r5, #84]	; 0x54
    7776:	7265      	strb	r5, [r4, #9]
    7778:	0033      	movs	r3, r6
    777a:	5443      	strb	r3, [r0, r1]
    777c:	4d49      	ldr	r5, [pc, #292]	; (0x78a4)
    777e:	5245      	strh	r5, [r0, r1]
    7780:	4c43      	ldr	r4, [pc, #268]	; (0x7890)
    7782:	534b      	strh	r3, [r1, r5]
    7784:	4c45      	ldr	r4, [pc, #276]	; (0x789c)
    7786:	0030      	movs	r0, r6
    7788:	5443      	strb	r3, [r0, r1]
    778a:	4d49      	ldr	r5, [pc, #292]	; (0x78b0)
    778c:	5245      	strh	r5, [r0, r1]
    778e:	4c43      	ldr	r4, [pc, #268]	; (0x789c)
    7790:	534b      	strh	r3, [r1, r5]
    7792:	4c45      	ldr	r4, [pc, #276]	; (0x78a8)
    7794:	0031      	movs	r1, r6
    7796:	5443      	strb	r3, [r0, r1]
    7798:	4d49      	ldr	r5, [pc, #292]	; (0x78c0)
    779a:	5245      	strh	r5, [r0, r1]
    779c:	4c43      	ldr	r4, [pc, #268]	; (0x78ac)
    779e:	534b      	strh	r3, [r1, r5]
    77a0:	4c45      	ldr	r4, [pc, #276]	; (0x78b8)
    77a2:	0032      	movs	r2, r6
    77a4:	5443      	strb	r3, [r0, r1]
    77a6:	4d49      	ldr	r5, [pc, #292]	; (0x78cc)
    77a8:	5245      	strh	r5, [r0, r1]
    77aa:	4c43      	ldr	r4, [pc, #268]	; (0x78b8)
    77ac:	534b      	strh	r3, [r1, r5]
    77ae:	4c45      	ldr	r4, [pc, #276]	; (0x78c4)
    77b0:	0033      	movs	r3, r6
    77b2:	5443      	strb	r3, [r0, r1]
    77b4:	4d49      	ldr	r5, [pc, #292]	; (0x78dc)
    77b6:	5245      	strh	r5, [r0, r1]
    77b8:	4c43      	ldr	r4, [pc, #268]	; (0x78c8)
    77ba:	534b      	strh	r3, [r1, r5]
    77bc:	4c45      	ldr	r4, [pc, #276]	; (0x78d4)
    77be:	0034      	movs	r4, r6
    77c0:	456b      	cmp	r3, sp
    77c2:	5458      	strb	r0, [r3, r1]
    77c4:	435f      	muls	r7, r3
    77c6:	4b4c      	ldr	r3, [pc, #304]	; (0x78f8)
    77c8:	745f      	strb	r7, [r3, #17]
    77ca:	5f6f      	ldrsh	r7, [r5, r5]
    77cc:	4c50      	ldr	r4, [pc, #320]	; (0x7910)
    77ce:	304c      	adds	r0, #76	; 0x4c
    77d0:	6b00      	ldr	r0, [r0, #48]	; 0x30
    77d2:	5845      	ldr	r5, [r0, r1]
    77d4:	5f54      	ldrsh	r4, [r2, r5]
    77d6:	4c43      	ldr	r4, [pc, #268]	; (0x78e4)
    77d8:	5f4b      	ldrsh	r3, [r1, r5]
    77da:	6f74      	ldr	r4, [r6, #116]	; 0x74
    77dc:	505f      	str	r7, [r3, r1]
    77de:	4c4c      	ldr	r4, [pc, #304]	; (0x7910)
    77e0:	0031      	movs	r1, r6
    77e2:	4952      	ldr	r1, [pc, #328]	; (0x792c)
    77e4:	474e      	bx	r9
    77e6:	304f      	adds	r0, #79	; 0x4f
    77e8:	435f      	muls	r7, r3
    77ea:	5254      	strh	r4, [r2, r1]
    77ec:	004c      	lsls	r4, r1, #1
    77ee:	5355      	strh	r5, [r2, r5]
    77f0:	3142      	adds	r1, #66	; 0x42
    77f2:	4c43      	ldr	r4, [pc, #268]	; (0x7900)
    77f4:	534b      	strh	r3, [r1, r5]
    77f6:	4154      	adcs	r4, r2
    77f8:	0054      	lsls	r4, r2, #1
    77fa:	506b      	str	r3, [r5, r1]
    77fc:	4c4c      	ldr	r4, [pc, #304]	; (0x7930)
    77fe:	5f31      	ldrsh	r1, [r6, r4]
    7800:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7802:	535f      	strh	r7, [r3, r5]
    7804:	4944      	ldr	r1, [pc, #272]	; (0x7918)
    7806:	5f4f      	ldrsh	r7, [r1, r5]
    7808:	4c43      	ldr	r4, [pc, #268]	; (0x7918)
    780a:	004b      	lsls	r3, r1, #1
    780c:	4641      	mov	r1, r8
    780e:	5253      	strh	r3, [r2, r1]
    7810:	4d00      	ldr	r5, [pc, #0]	; (0x7814)
    7812:	5349      	strh	r1, [r1, r5]
    7814:	4343      	muls	r3, r0
    7816:	5254      	strh	r4, [r2, r1]
    7818:	004c      	lsls	r4, r1, #1
    781a:	5443      	strb	r3, [r0, r1]
    781c:	4d49      	ldr	r5, [pc, #292]	; (0x7944)
    781e:	5245      	strh	r5, [r0, r1]
    7820:	4c43      	ldr	r4, [pc, #268]	; (0x7930)
    7822:	534b      	strh	r3, [r1, r5]
    7824:	4c45      	ldr	r4, [pc, #276]	; (0x793c)
    7826:	0058      	lsls	r0, r3, #1
    7828:	4f6b      	ldr	r7, [pc, #428]	; (0x79d8)
    782a:	4353      	muls	r3, r2
    782c:	3233      	adds	r2, #51	; 0x33
    782e:	5f4b      	ldrsh	r3, [r1, r5]
    7830:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7832:	435f      	muls	r7, r3
    7834:	4b4c      	ldr	r3, [pc, #304]	; (0x7968)
    7836:	554f      	strb	r7, [r1, r5]
    7838:	0054      	lsls	r4, r2, #1
    783a:	436b      	muls	r3, r5
    783c:	4f4c      	ldr	r7, [pc, #304]	; (0x7970)
    783e:	4b43      	ldr	r3, [pc, #268]	; (0x794c)
    7840:	415f      	adcs	r7, r3
    7842:	6364      	str	r4, [r4, #52]	; 0x34
    7844:	5300      	strh	r0, [r0, r4]
    7846:	4944      	ldr	r1, [pc, #272]	; (0x7958)
    7848:	434f      	muls	r7, r1
    784a:	4b4c      	ldr	r3, [pc, #304]	; (0x797c)
    784c:	4944      	ldr	r1, [pc, #272]	; (0x7960)
    784e:	0056      	lsls	r6, r2, #1
    7850:	466b      	mov	r3, sp
    7852:	4f52      	ldr	r7, [pc, #328]	; (0x799c)
    7854:	4d31      	ldr	r5, [pc, #196]	; (0x791c)
    7856:	745f      	strb	r7, [r3, #17]
    7858:	5f6f      	ldrsh	r7, [r5, r5]
    785a:	414d      	adcs	r5, r1
    785c:	4e49      	ldr	r6, [pc, #292]	; (0x7984)
    785e:	435f      	muls	r7, r3
    7860:	4b4c      	ldr	r3, [pc, #304]	; (0x7994)
    7862:	4300      	orrs	r0, r0
    7864:	5350      	strh	r0, [r2, r5]
    7866:	4154      	adcs	r4, r2
    7868:	4b43      	ldr	r3, [pc, #268]	; (0x7978)
    786a:	4400      	add	r0, r0
    786c:	4245      	negs	r5, r0
    786e:	4755      	bx	sl
    7870:	4c5f      	ldr	r4, [pc, #380]	; (0x79f0)
    7872:	434f      	muls	r7, r1
    7874:	5f4b      	ldrsh	r3, [r1, r5]
    7876:	4e45      	ldr	r6, [pc, #276]	; (0x798c)
    7878:	6400      	str	r0, [r0, #64]	; 0x40
    787a:	756f      	strb	r7, [r5, #21]
    787c:	6c62      	ldr	r2, [r4, #68]	; 0x44
    787e:	0065      	lsls	r5, r4, #1
    7880:	506b      	str	r3, [r5, r1]
    7882:	5244      	strh	r4, [r0, r1]
    7884:	4e55      	ldr	r6, [pc, #340]	; (0x79dc)
    7886:	4643      	mov	r3, r8
    7888:	5f47      	ldrsh	r7, [r0, r5]
    788a:	4450      	add	r0, sl
    788c:	4c5f      	ldr	r4, [pc, #380]	; (0x7a0c)
    788e:	4f44      	ldr	r7, [pc, #272]	; (0x79a0)
    7890:	454d      	cmp	r5, r9
    7892:	004d      	lsls	r5, r1, #1
    7894:	454d      	cmp	r5, r9
    7896:	4f4d      	ldr	r7, [pc, #308]	; (0x79cc)
    7898:	5952      	ldr	r2, [r2, r5]
    789a:	4552      	cmp	r2, sl
    789c:	414d      	adcs	r5, r1
    789e:	0050      	lsls	r0, r2, #1
    78a0:	4f50      	ldr	r7, [pc, #320]	; (0x79e4)
    78a2:	4557      	cmp	r7, sl
    78a4:	5f52      	ldrsh	r2, [r2, r5]
    78a6:	6e45      	ldr	r5, [r0, #100]	; 0x64
    78a8:	6574      	str	r4, [r6, #84]	; 0x54
    78aa:	4472      	add	r2, lr
    78ac:	6565      	str	r5, [r4, #84]	; 0x54
    78ae:	5370      	strh	r0, [r6, r5]
    78b0:	656c      	str	r4, [r5, #84]	; 0x54
    78b2:	7065      	strb	r5, [r4, #1]
    78b4:	6c00      	ldr	r0, [r0, #64]	; 0x40
    78b6:	776f      	strb	r7, [r5, #29]
    78b8:	6f70      	ldr	r0, [r6, #116]	; 0x74
    78ba:	6577      	str	r7, [r6, #84]	; 0x54
    78bc:	5f72      	ldrsh	r2, [r6, r5]
    78be:	7264      	strb	r4, [r4, #9]
    78c0:	7669      	strb	r1, [r5, #25]
    78c2:	7265      	strb	r5, [r4, #9]
    78c4:	695f      	ldr	r7, [r3, #20]
    78c6:	746e      	strb	r6, [r5, #17]
    78c8:	7265      	strb	r5, [r4, #9]
    78ca:	6166      	str	r6, [r4, #20]
    78cc:	6563      	str	r3, [r4, #84]	; 0x54
    78ce:	745f      	strb	r7, [r3, #17]
    78d0:	6b00      	ldr	r0, [r0, #48]	; 0x30
    78d2:	4c50      	ldr	r4, [pc, #320]	; (0x7a14)
    78d4:	304c      	adds	r0, #76	; 0x4c
    78d6:	445f      	add	r7, fp
    78d8:	5649      	ldrsb	r1, [r1, r1]
    78da:	745f      	strb	r7, [r3, #17]
    78dc:	5f6f      	ldrsh	r7, [r5, r5]
    78de:	5348      	strh	r0, [r1, r5]
    78e0:	534c      	strh	r4, [r1, r5]
    78e2:	4950      	ldr	r1, [pc, #320]	; (0x7a24)
    78e4:	4600      	mov	r0, r0
    78e6:	454c      	cmp	r4, r9
    78e8:	4658      	mov	r0, fp
    78ea:	4752      	bx	sl
    78ec:	4330      	orrs	r0, r6
    78ee:	5254      	strh	r4, [r2, r1]
    78f0:	004c      	lsls	r4, r1, #1
    78f2:	506b      	str	r3, [r5, r1]
    78f4:	5244      	strh	r4, [r0, r1]
    78f6:	4e55      	ldr	r6, [pc, #340]	; (0x7a4c)
    78f8:	4643      	mov	r3, r8
    78fa:	5f47      	ldrsh	r7, [r0, r5]
    78fc:	4450      	add	r0, sl
    78fe:	555f      	strb	r7, [r3, r5]
    7900:	4253      	negs	r3, r2
    7902:	5f30      	ldrsh	r0, [r6, r4]
    7904:	4850      	ldr	r0, [pc, #320]	; (0x7a48)
    7906:	0059      	lsls	r1, r3, #1
    7908:	765f      	strb	r7, [r3, #25]
    790a:	645f      	str	r7, [r3, #68]	; 0x44
    790c:	6565      	str	r5, [r4, #84]	; 0x54
    790e:	7370      	strb	r0, [r6, #13]
    7910:	656c      	str	r4, [r5, #84]	; 0x54
    7912:	7065      	strb	r5, [r4, #1]
    7914:	7500      	strb	r0, [r0, #20]
    7916:	3233      	adds	r2, #51	; 0x33
    7918:	614d      	str	r5, [r1, #20]
    791a:	6b73      	ldr	r3, [r6, #52]	; 0x34
    791c:	4c00      	ldr	r4, [pc, #0]	; (0x7920)
    791e:	4f44      	ldr	r7, [pc, #272]	; (0x7a30)
    7920:	4c46      	ldr	r4, [pc, #280]	; (0x7a3c)
    7922:	5341      	strh	r1, [r0, r5]
    7924:	4e48      	ldr	r6, [pc, #288]	; (0x7a48)
    7926:	0056      	lsls	r6, r2, #1
    7928:	466b      	mov	r3, sp
    792a:	4f52      	ldr	r7, [pc, #328]	; (0x7a74)
    792c:	485f      	ldr	r0, [pc, #380]	; (0x7aac)
    792e:	5f46      	ldrsh	r6, [r0, r5]
    7930:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7932:	535f      	strh	r7, [r3, r5]
    7934:	5443      	strb	r3, [r0, r1]
    7936:	435f      	muls	r7, r3
    7938:	4b4c      	ldr	r3, [pc, #304]	; (0x7a6c)
    793a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    793c:	7453      	strb	r3, [r2, #17]
    793e:	7461      	strb	r1, [r4, #17]
    7940:	7375      	strb	r5, [r6, #13]
    7942:	7247      	strb	r7, [r0, #9]
    7944:	756f      	strb	r7, [r5, #21]
    7946:	5f70      	ldrsh	r0, [r6, r5]
    7948:	5355      	strh	r5, [r2, r5]
    794a:	4844      	ldr	r0, [pc, #272]	; (0x7a5c)
    794c:	0043      	lsls	r3, r0, #1
    794e:	5953      	ldr	r3, [r2, r5]
    7950:	5453      	strb	r3, [r2, r1]
    7952:	4349      	muls	r1, r1
    7954:	434b      	muls	r3, r1
    7956:	4b4c      	ldr	r3, [pc, #304]	; (0x7a88)
    7958:	4553      	cmp	r3, sl
    795a:	304c      	adds	r0, #76	; 0x4c
    795c:	5300      	strh	r0, [r0, r4]
    795e:	5359      	strh	r1, [r3, r5]
    7960:	4954      	ldr	r1, [pc, #336]	; (0x7ab4)
    7962:	4b43      	ldr	r3, [pc, #268]	; (0x7a70)
    7964:	4c43      	ldr	r4, [pc, #268]	; (0x7a74)
    7966:	534b      	strh	r3, [r1, r5]
    7968:	4c45      	ldr	r4, [pc, #276]	; (0x7a80)
    796a:	0031      	movs	r1, r6
    796c:	4f58      	ldr	r7, [pc, #352]	; (0x7ad0)
    796e:	3233      	adds	r2, #51	; 0x33
    7970:	5f4d      	ldrsh	r5, [r1, r5]
    7972:	5443      	strb	r3, [r0, r1]
    7974:	4c52      	ldr	r4, [pc, #328]	; (0x7ac0)
    7976:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7978:	4c43      	ldr	r4, [pc, #268]	; (0x7a88)
    797a:	434f      	muls	r7, r1
    797c:	5f4b      	ldrsh	r3, [r1, r5]
    797e:	6944      	ldr	r4, [r0, #20]
    7980:	5076      	str	r6, [r6, r1]
    7982:	6c6c      	ldr	r4, [r5, #68]	; 0x44
    7984:	4330      	orrs	r0, r6
    7986:	6b6c      	ldr	r4, [r5, #52]	; 0x34
    7988:	4800      	ldr	r0, [pc, #0]	; (0x798c)
    798a:	4c53      	ldr	r4, [pc, #332]	; (0x7ad8)
    798c:	5053      	str	r3, [r2, r1]
    798e:	4349      	muls	r1, r1
    7990:	4b4c      	ldr	r3, [pc, #304]	; (0x7ac4)
    7992:	4553      	cmp	r3, sl
    7994:	004c      	lsls	r4, r1, #1
    7996:	4157      	adcs	r7, r2
    7998:	454b      	cmp	r3, r9
    799a:	5055      	str	r5, [r2, r1]
    799c:	4e49      	ldr	r6, [pc, #292]	; (0x7ac4)
    799e:	0054      	lsls	r4, r2, #1
    79a0:	536b      	strh	r3, [r5, r5]
    79a2:	6174      	str	r4, [r6, #20]
    79a4:	7574      	strb	r4, [r6, #21]
    79a6:	4773      	bx	lr
    79a8:	6f72      	ldr	r2, [r6, #116]	; 0x74
    79aa:	7075      	strb	r5, [r6, #1]
    79ac:	4c5f      	ldr	r4, [pc, #380]	; (0x7b2c)
    79ae:	4354      	muls	r4, r2
    79b0:	4100      	asrs	r0, r0
    79b2:	5855      	ldr	r5, [r2, r1]
    79b4:	545f      	strb	r7, [r3, r1]
    79b6:	5345      	strh	r5, [r0, r5]
    79b8:	4254      	negs	r4, r2
    79ba:	5355      	strh	r5, [r2, r5]
    79bc:	5300      	strh	r0, [r0, r4]
    79be:	5359      	strh	r1, [r3, r5]
    79c0:	4954      	ldr	r1, [pc, #336]	; (0x7b14)
    79c2:	4b43      	ldr	r3, [pc, #268]	; (0x7ad0)
    79c4:	4c43      	ldr	r4, [pc, #268]	; (0x7ad4)
    79c6:	534b      	strh	r3, [r1, r5]
    79c8:	4c45      	ldr	r4, [pc, #276]	; (0x7ae0)
    79ca:	0058      	lsls	r0, r3, #1
    79cc:	4544      	cmp	r4, r8
    79ce:	4956      	ldr	r1, [pc, #344]	; (0x7b28)
    79d0:	4543      	cmp	r3, r8
    79d2:	495f      	ldr	r1, [pc, #380]	; (0x7b50)
    79d4:	3044      	adds	r0, #68	; 0x44
    79d6:	4600      	mov	r0, r0
    79d8:	4f52      	ldr	r7, [pc, #328]	; (0x7b24)
    79da:	4d31      	ldr	r5, [pc, #196]	; (0x7aa0)
    79dc:	6b00      	ldr	r0, [r0, #48]	; 0x30
    79de:	4c43      	ldr	r4, [pc, #268]	; (0x7aec)
    79e0:	434f      	muls	r7, r1
    79e2:	5f4b      	ldrsh	r3, [r1, r5]
    79e4:	6c46      	ldr	r6, [r0, #68]	; 0x44
    79e6:	7865      	ldrb	r5, [r4, #1]
    79e8:	3249      	adds	r2, #73	; 0x49
    79ea:	3173      	adds	r1, #115	; 0x73
    79ec:	6b00      	ldr	r0, [r0, #48]	; 0x30
    79ee:	4c43      	ldr	r4, [pc, #268]	; (0x7afc)
    79f0:	434f      	muls	r7, r1
    79f2:	5f4b      	ldrsh	r3, [r1, r5]
    79f4:	6c46      	ldr	r6, [r0, #68]	; 0x44
    79f6:	7865      	ldrb	r5, [r4, #1]
    79f8:	3249      	adds	r2, #73	; 0x49
    79fa:	3273      	adds	r2, #115	; 0x73
    79fc:	6b00      	ldr	r0, [r0, #48]	; 0x30
    79fe:	4c43      	ldr	r4, [pc, #268]	; (0x7b0c)
    7a00:	434f      	muls	r7, r1
    7a02:	5f4b      	ldrsh	r3, [r1, r5]
    7a04:	6c46      	ldr	r6, [r0, #68]	; 0x44
    7a06:	7865      	ldrb	r5, [r4, #1]
    7a08:	3249      	adds	r2, #73	; 0x49
    7a0a:	3373      	adds	r3, #115	; 0x73
    7a0c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7a0e:	4c43      	ldr	r4, [pc, #268]	; (0x7b1c)
    7a10:	434f      	muls	r7, r1
    7a12:	5f4b      	ldrsh	r3, [r1, r5]
    7a14:	6c46      	ldr	r6, [r0, #68]	; 0x44
    7a16:	7865      	ldrb	r5, [r4, #1]
    7a18:	3249      	adds	r2, #73	; 0x49
    7a1a:	3473      	adds	r4, #115	; 0x73
    7a1c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7a1e:	4c43      	ldr	r4, [pc, #268]	; (0x7b2c)
    7a20:	434f      	muls	r7, r1
    7a22:	5f4b      	ldrsh	r3, [r1, r5]
    7a24:	6c46      	ldr	r6, [r0, #68]	; 0x44
    7a26:	7865      	ldrb	r5, [r4, #1]
    7a28:	3249      	adds	r2, #73	; 0x49
    7a2a:	3573      	adds	r5, #115	; 0x73
    7a2c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7a2e:	4c43      	ldr	r4, [pc, #268]	; (0x7b3c)
    7a30:	434f      	muls	r7, r1
    7a32:	5f4b      	ldrsh	r3, [r1, r5]
    7a34:	6c46      	ldr	r6, [r0, #68]	; 0x44
    7a36:	7865      	ldrb	r5, [r4, #1]
    7a38:	3249      	adds	r2, #73	; 0x49
    7a3a:	3673      	adds	r6, #115	; 0x73
    7a3c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7a3e:	4c43      	ldr	r4, [pc, #268]	; (0x7b4c)
    7a40:	434f      	muls	r7, r1
    7a42:	5f4b      	ldrsh	r3, [r1, r5]
    7a44:	6c46      	ldr	r6, [r0, #68]	; 0x44
    7a46:	7865      	ldrb	r5, [r4, #1]
    7a48:	3249      	adds	r2, #73	; 0x49
    7a4a:	3773      	adds	r7, #115	; 0x73
    7a4c:	4300      	orrs	r0, r0
    7a4e:	4b4c      	ldr	r3, [pc, #304]	; (0x7b80)
    7a50:	554f      	strb	r7, [r1, r5]
    7a52:	4454      	add	r4, sl
    7a54:	5649      	ldrsb	r1, [r1, r1]
    7a56:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7a58:	4c43      	ldr	r4, [pc, #268]	; (0x7b68)
    7a5a:	434f      	muls	r7, r1
    7a5c:	5f4b      	ldrsh	r3, [r1, r5]
    7a5e:	6947      	ldr	r7, [r0, #20]
    7a60:	746e      	strb	r6, [r5, #17]
    7a62:	5600      	ldrsb	r0, [r0, r0]
    7a64:	445f      	add	r7, fp
    7a66:	4545      	cmp	r5, r8
    7a68:	5350      	strh	r0, [r2, r5]
    7a6a:	454c      	cmp	r4, r9
    7a6c:	5045      	str	r5, [r0, r1]
    7a6e:	315f      	adds	r1, #95	; 0x5f
    7a70:	3050      	adds	r0, #80	; 0x50
    7a72:	3035      	adds	r0, #53	; 0x35
    7a74:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7a76:	4c43      	ldr	r4, [pc, #268]	; (0x7b84)
    7a78:	434f      	muls	r7, r1
    7a7a:	5f4b      	ldrsh	r3, [r1, r5]
    7a7c:	6944      	ldr	r4, [r0, #20]
    7a7e:	5376      	strh	r6, [r6, r5]
    7a80:	7379      	strb	r1, [r7, #13]
    7a82:	6974      	ldr	r4, [r6, #20]
    7a84:	6b63      	ldr	r3, [r4, #52]	; 0x34
    7a86:	6c43      	ldr	r3, [r0, #68]	; 0x44
    7a88:	316b      	adds	r1, #107	; 0x6b
    7a8a:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7a8c:	7453      	strb	r3, [r2, #17]
    7a8e:	7461      	strb	r1, [r4, #17]
    7a90:	7375      	strb	r5, [r6, #13]
    7a92:	7247      	strb	r7, [r0, #9]
    7a94:	756f      	strb	r7, [r5, #21]
    7a96:	5f70      	ldrsh	r0, [r6, r5]
    7a98:	4453      	add	r3, sl
    7a9a:	414d      	adcs	r5, r1
    7a9c:	7500      	strb	r0, [r0, #20]
    7a9e:	5838      	ldr	r0, [r7, r0]
    7aa0:	434f      	muls	r7, r1
    7aa2:	7061      	strb	r1, [r4, #1]
    7aa4:	754f      	strb	r7, [r1, #21]
    7aa6:	4374      	muls	r4, r6
    7aa8:	7274      	strb	r4, [r6, #9]
    7aaa:	006c      	lsls	r4, r5, #1
    7aac:	536b      	strh	r3, [r5, r5]
    7aae:	6174      	str	r4, [r6, #20]
    7ab0:	7574      	strb	r4, [r6, #21]
    7ab2:	4773      	bx	lr
    7ab4:	6f72      	ldr	r2, [r6, #116]	; 0x74
    7ab6:	7075      	strb	r5, [r6, #1]
    7ab8:	485f      	ldr	r0, [pc, #380]	; (0x7c38)
    7aba:	5341      	strh	r1, [r0, r5]
    7abc:	4348      	muls	r0, r1
    7abe:	5952      	ldr	r2, [r2, r5]
    7ac0:	5450      	strb	r0, [r2, r1]
    7ac2:	5200      	strh	r0, [r0, r0]
    7ac4:	5345      	strh	r5, [r0, r5]
    7ac6:	5245      	strh	r5, [r0, r1]
    7ac8:	4556      	cmp	r6, sl
    7aca:	3044      	adds	r0, #68	; 0x44
    7acc:	5200      	strh	r0, [r0, r0]
    7ace:	5345      	strh	r5, [r0, r5]
    7ad0:	5245      	strh	r5, [r0, r1]
    7ad2:	4556      	cmp	r6, sl
    7ad4:	3244      	adds	r2, #68	; 0x44
    7ad6:	5200      	strh	r0, [r0, r0]
    7ad8:	5345      	strh	r5, [r0, r5]
    7ada:	5245      	strh	r5, [r0, r1]
    7adc:	4556      	cmp	r6, sl
    7ade:	3344      	adds	r3, #68	; 0x44
    7ae0:	5200      	strh	r0, [r0, r0]
    7ae2:	5345      	strh	r5, [r0, r5]
    7ae4:	5245      	strh	r5, [r0, r1]
    7ae6:	4556      	cmp	r6, sl
    7ae8:	3444      	adds	r4, #68	; 0x44
    7aea:	5200      	strh	r0, [r0, r0]
    7aec:	5345      	strh	r5, [r0, r5]
    7aee:	5245      	strh	r5, [r0, r1]
    7af0:	4556      	cmp	r6, sl
    7af2:	3544      	adds	r5, #68	; 0x44
    7af4:	5200      	strh	r0, [r0, r0]
    7af6:	5345      	strh	r5, [r0, r5]
    7af8:	5245      	strh	r5, [r0, r1]
    7afa:	4556      	cmp	r6, sl
    7afc:	3644      	adds	r6, #68	; 0x44
    7afe:	5200      	strh	r0, [r0, r0]
    7b00:	5345      	strh	r5, [r0, r5]
    7b02:	5245      	strh	r5, [r0, r1]
    7b04:	4556      	cmp	r6, sl
    7b06:	3744      	adds	r7, #68	; 0x44
    7b08:	5200      	strh	r0, [r0, r0]
    7b0a:	5345      	strh	r5, [r0, r5]
    7b0c:	5245      	strh	r5, [r0, r1]
    7b0e:	4556      	cmp	r6, sl
    7b10:	3844      	subs	r0, #68	; 0x44
    7b12:	5600      	ldrsb	r0, [r0, r0]
    7b14:	415f      	adcs	r7, r3
    7b16:	5f4f      	ldrsh	r7, [r1, r5]
    7b18:	5030      	str	r0, [r6, r0]
    7b1a:	3037      	adds	r0, #55	; 0x37
    7b1c:	0030      	movs	r0, r6
    7b1e:	5f70      	ldrsh	r0, [r6, r5]
    7b20:	6177      	str	r7, [r6, #20]
    7b22:	656b      	str	r3, [r5, #84]	; 0x54
    7b24:	7075      	strb	r5, [r6, #1]
    7b26:	695f      	ldr	r7, [r3, #20]
    7b28:	5f6f      	ldrsh	r7, [r5, r5]
    7b2a:	7463      	strb	r3, [r4, #17]
    7b2c:	6c72      	ldr	r2, [r6, #68]	; 0x44
    7b2e:	7700      	strb	r0, [r0, #28]
    7b30:	6b61      	ldr	r1, [r4, #52]	; 0x34
    7b32:	7565      	strb	r5, [r4, #21]
    7b34:	5f70      	ldrsh	r0, [r6, r5]
    7b36:	7273      	strb	r3, [r6, #9]
    7b38:	5f63      	ldrsh	r3, [r4, r5]
    7b3a:	6e69      	ldr	r1, [r5, #100]	; 0x64
    7b3c:	0074      	lsls	r4, r6, #1
    7b3e:	4f42      	ldr	r7, [pc, #264]	; (0x7c48)
    7b40:	5f44      	ldrsh	r4, [r0, r5]
    7b42:	4344      	muls	r4, r0
    7b44:	4344      	muls	r4, r0
    7b46:	495f      	ldr	r1, [pc, #380]	; (0x7cc4)
    7b48:	544e      	strb	r6, [r1, r1]
    7b4a:	535f      	strh	r7, [r3, r5]
    7b4c:	4154      	adcs	r4, r2
    7b4e:	5554      	strb	r4, [r2, r5]
    7b50:	0053      	lsls	r3, r2, #1
    7b52:	536b      	strh	r3, [r5, r5]
    7b54:	6174      	str	r4, [r6, #20]
    7b56:	7574      	strb	r4, [r6, #21]
    7b58:	4773      	bx	lr
    7b5a:	6f72      	ldr	r2, [r6, #116]	; 0x74
    7b5c:	7075      	strb	r5, [r6, #1]
    7b5e:	485f      	ldr	r0, [pc, #380]	; (0x7cdc)
    7b60:	4c41      	ldr	r4, [pc, #260]	; (0x7c68)
    7b62:	465f      	mov	r7, fp
    7b64:	414c      	adcs	r4, r1
    7b66:	4853      	ldr	r0, [pc, #332]	; (0x7cb4)
    7b68:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7b6a:	4f4e      	ldr	r7, [pc, #312]	; (0x7ca4)
    7b6c:	454e      	cmp	r6, r9
    7b6e:	745f      	strb	r7, [r3, #17]
    7b70:	5f6f      	ldrsh	r7, [r5, r5]
    7b72:	4c46      	ldr	r4, [pc, #280]	; (0x7c8c)
    7b74:	5845      	ldr	r5, [r0, r1]
    7b76:	4f43      	ldr	r7, [pc, #268]	; (0x7c84)
    7b78:	4d4d      	ldr	r5, [pc, #308]	; (0x7cb0)
    7b7a:	0031      	movs	r1, r6
    7b7c:	4e6b      	ldr	r6, [pc, #428]	; (0x7d2c)
    7b7e:	4e4f      	ldr	r6, [pc, #316]	; (0x7cbc)
    7b80:	5f45      	ldrsh	r5, [r0, r5]
    7b82:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7b84:	465f      	mov	r7, fp
    7b86:	454c      	cmp	r4, r9
    7b88:	4358      	muls	r0, r3
    7b8a:	4d4f      	ldr	r5, [pc, #316]	; (0x7cc8)
    7b8c:	324d      	adds	r2, #77	; 0x4d
    7b8e:	4900      	ldr	r1, [pc, #0]	; (0x7b90)
    7b90:	5053      	str	r3, [r2, r1]
    7b92:	0052      	lsls	r2, r2, #1
    7b94:	766c      	strb	r4, [r5, #25]
    7b96:	645f      	str	r7, [r3, #68]	; 0x44
    7b98:	6463      	str	r3, [r4, #68]	; 0x44
    7b9a:	0063      	lsls	r3, r4, #1
    7b9c:	4353      	muls	r3, r2
    7b9e:	4354      	muls	r4, r2
    7ba0:	4b4c      	ldr	r3, [pc, #304]	; (0x7cd4)
    7ba2:	4944      	ldr	r1, [pc, #272]	; (0x7cb4)
    7ba4:	0056      	lsls	r6, r2, #1
    7ba6:	436b      	muls	r3, r5
    7ba8:	4f4c      	ldr	r7, [pc, #304]	; (0x7cdc)
    7baa:	4b43      	ldr	r3, [pc, #268]	; (0x7cb8)
    7bac:	425f      	negs	r7, r3
    7bae:	3249      	adds	r2, #73	; 0x49
    7bb0:	3563      	adds	r5, #99	; 0x63
    7bb2:	5300      	strh	r0, [r0, r4]
    7bb4:	4944      	ldr	r1, [pc, #272]	; (0x7cc8)
    7bb6:	434f      	muls	r7, r1
    7bb8:	4b4c      	ldr	r3, [pc, #304]	; (0x7cec)
    7bba:	4553      	cmp	r3, sl
    7bbc:	004c      	lsls	r4, r1, #1
    7bbe:	3875      	subs	r0, #117	; 0x75
    7bc0:	4f58      	ldr	r7, [pc, #352]	; (0x7d24)
    7bc2:	6143      	str	r3, [r0, #20]
    7bc4:	4970      	ldr	r1, [pc, #448]	; (0x7d88)
    7bc6:	436e      	muls	r6, r5
    7bc8:	7274      	strb	r4, [r6, #9]
    7bca:	006c      	lsls	r4, r5, #1
    7bcc:	4c50      	ldr	r4, [pc, #320]	; (0x7d10)
    7bce:	304c      	adds	r0, #76	; 0x4c
    7bd0:	4c43      	ldr	r4, [pc, #268]	; (0x7ce0)
    7bd2:	444b      	add	r3, r9
    7bd4:	5649      	ldrsb	r1, [r1, r1]
    7bd6:	4300      	orrs	r0, r0
    7bd8:	4f4c      	ldr	r7, [pc, #304]	; (0x7d0c)
    7bda:	4b43      	ldr	r3, [pc, #268]	; (0x7ce8)
    7bdc:	455f      	cmp	r7, fp
    7bde:	616e      	str	r6, [r5, #20]
    7be0:	6c62      	ldr	r2, [r4, #68]	; 0x44
    7be2:	4365      	muls	r5, r4
    7be4:	6f6c      	ldr	r4, [r5, #116]	; 0x74
    7be6:	6b63      	ldr	r3, [r4, #52]	; 0x34
    7be8:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7bea:	414d      	adcs	r5, r1
    7bec:	4e49      	ldr	r6, [pc, #292]	; (0x7d14)
    7bee:	435f      	muls	r7, r3
    7bf0:	4b4c      	ldr	r3, [pc, #304]	; (0x7d24)
    7bf2:	745f      	strb	r7, [r3, #17]
    7bf4:	5f6f      	ldrsh	r7, [r5, r5]
    7bf6:	4441      	add	r1, r8
    7bf8:	5f43      	ldrsh	r3, [r0, r5]
    7bfa:	4c43      	ldr	r4, [pc, #268]	; (0x7d08)
    7bfc:	004b      	lsls	r3, r1, #1
    7bfe:	5043      	str	r3, [r0, r1]
    7c00:	4341      	muls	r1, r0
    7c02:	0052      	lsls	r2, r2, #1
    7c04:	5449      	strb	r1, [r1, r1]
    7c06:	5f4d      	ldrsh	r5, [r1, r5]
    7c08:	7852      	ldrb	r2, [r2, #1]
    7c0a:	7542      	strb	r2, [r0, #21]
    7c0c:	6666      	str	r6, [r4, #100]	; 0x64
    7c0e:	7265      	strb	r5, [r4, #9]
    7c10:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7c12:	7453      	strb	r3, [r2, #17]
    7c14:	7461      	strb	r1, [r4, #17]
    7c16:	7375      	strb	r5, [r6, #13]
    7c18:	7247      	strb	r7, [r0, #9]
    7c1a:	756f      	strb	r7, [r5, #21]
    7c1c:	5f70      	ldrsh	r0, [r6, r5]
    7c1e:	5845      	ldr	r5, [r0, r1]
    7c20:	4554      	cmp	r4, sl
    7c22:	4e52      	ldr	r6, [pc, #328]	; (0x7d6c)
    7c24:	455f      	cmp	r7, fp
    7c26:	5045      	str	r5, [r0, r1]
    7c28:	4f52      	ldr	r7, [pc, #328]	; (0x7d74)
    7c2a:	004d      	lsls	r5, r1, #1
    7c2c:	6f6c      	ldr	r4, [r5, #116]	; 0x74
    7c2e:	676e      	str	r6, [r5, #116]	; 0x74
    7c30:	6c20      	ldr	r0, [r4, #64]	; 0x40
    7c32:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    7c34:	2067      	movs	r0, #103	; 0x67
    7c36:	6e75      	ldr	r5, [r6, #100]	; 0x64
    7c38:	6973      	ldr	r3, [r6, #20]
    7c3a:	6e67      	ldr	r7, [r4, #100]	; 0x64
    7c3c:	6465      	str	r5, [r4, #68]	; 0x44
    7c3e:	6920      	ldr	r0, [r4, #16]
    7c40:	746e      	strb	r6, [r5, #17]
    7c42:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7c44:	5953      	ldr	r3, [r2, r5]
    7c46:	5453      	strb	r3, [r2, r1]
    7c48:	4349      	muls	r1, r1
    7c4a:	5f4b      	ldrsh	r3, [r1, r5]
    7c4c:	4944      	ldr	r1, [pc, #272]	; (0x7d60)
    7c4e:	3156      	adds	r1, #86	; 0x56
    7c50:	745f      	strb	r7, [r3, #17]
    7c52:	5f6f      	ldrsh	r7, [r5, r5]
    7c54:	5953      	ldr	r3, [r2, r5]
    7c56:	5453      	strb	r3, [r2, r1]
    7c58:	4349      	muls	r1, r1
    7c5a:	314b      	adds	r1, #75	; 0x4b
    7c5c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7c5e:	4c50      	ldr	r4, [pc, #320]	; (0x7da0)
    7c60:	304c      	adds	r0, #76	; 0x4c
    7c62:	745f      	strb	r7, [r3, #17]
    7c64:	5f6f      	ldrsh	r7, [r5, r5]
    7c66:	5443      	strb	r3, [r0, r1]
    7c68:	4d49      	ldr	r5, [pc, #292]	; (0x7d90)
    7c6a:	5245      	strh	r5, [r0, r1]
    7c6c:	0030      	movs	r0, r6
    7c6e:	506b      	str	r3, [r5, r1]
    7c70:	4c4c      	ldr	r4, [pc, #304]	; (0x7da4)
    7c72:	5f30      	ldrsh	r0, [r6, r4]
    7c74:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7c76:	435f      	muls	r7, r3
    7c78:	4954      	ldr	r1, [pc, #336]	; (0x7dcc)
    7c7a:	454d      	cmp	r5, r9
    7c7c:	3152      	adds	r1, #82	; 0x52
    7c7e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7c80:	4c50      	ldr	r4, [pc, #320]	; (0x7dc4)
    7c82:	304c      	adds	r0, #76	; 0x4c
    7c84:	745f      	strb	r7, [r3, #17]
    7c86:	5f6f      	ldrsh	r7, [r5, r5]
    7c88:	5443      	strb	r3, [r0, r1]
    7c8a:	4d49      	ldr	r5, [pc, #292]	; (0x7db0)
    7c8c:	5245      	strh	r5, [r0, r1]
    7c8e:	0032      	movs	r2, r6
    7c90:	506b      	str	r3, [r5, r1]
    7c92:	4c4c      	ldr	r4, [pc, #304]	; (0x7dc4)
    7c94:	5f30      	ldrsh	r0, [r6, r4]
    7c96:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7c98:	435f      	muls	r7, r3
    7c9a:	4954      	ldr	r1, [pc, #336]	; (0x7dec)
    7c9c:	454d      	cmp	r5, r9
    7c9e:	3352      	adds	r3, #82	; 0x52
    7ca0:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7ca2:	4c50      	ldr	r4, [pc, #320]	; (0x7de4)
    7ca4:	304c      	adds	r0, #76	; 0x4c
    7ca6:	745f      	strb	r7, [r3, #17]
    7ca8:	5f6f      	ldrsh	r7, [r5, r5]
    7caa:	5443      	strb	r3, [r0, r1]
    7cac:	4d49      	ldr	r5, [pc, #292]	; (0x7dd4)
    7cae:	5245      	strh	r5, [r0, r1]
    7cb0:	0034      	movs	r4, r6
    7cb2:	4954      	ldr	r1, [pc, #336]	; (0x7e04)
    7cb4:	454d      	cmp	r5, r9
    7cb6:	554f      	strb	r7, [r1, r5]
    7cb8:	4554      	cmp	r4, sl
    7cba:	4556      	cmp	r6, sl
    7cbc:	544e      	strb	r6, [r1, r1]
    7cbe:	0053      	lsls	r3, r2, #1
    7cc0:	466b      	mov	r3, sp
    7cc2:	4f52      	ldr	r7, [pc, #328]	; (0x7e0c)
    7cc4:	4d31      	ldr	r5, [pc, #196]	; (0x7d8c)
    7cc6:	745f      	strb	r7, [r3, #17]
    7cc8:	5f6f      	ldrsh	r7, [r5, r5]
    7cca:	4c46      	ldr	r4, [pc, #280]	; (0x7de4)
    7ccc:	5845      	ldr	r5, [r0, r1]
    7cce:	4f43      	ldr	r7, [pc, #268]	; (0x7ddc)
    7cd0:	4d4d      	ldr	r5, [pc, #308]	; (0x7e08)
    7cd2:	0030      	movs	r0, r6
    7cd4:	466b      	mov	r3, sp
    7cd6:	4f52      	ldr	r7, [pc, #328]	; (0x7e20)
    7cd8:	4d31      	ldr	r5, [pc, #196]	; (0x7da0)
    7cda:	745f      	strb	r7, [r3, #17]
    7cdc:	5f6f      	ldrsh	r7, [r5, r5]
    7cde:	4c46      	ldr	r4, [pc, #280]	; (0x7df8)
    7ce0:	5845      	ldr	r5, [r0, r1]
    7ce2:	4f43      	ldr	r7, [pc, #268]	; (0x7df0)
    7ce4:	4d4d      	ldr	r5, [pc, #308]	; (0x7e1c)
    7ce6:	0031      	movs	r1, r6
    7ce8:	466b      	mov	r3, sp
    7cea:	4f52      	ldr	r7, [pc, #328]	; (0x7e34)
    7cec:	4d31      	ldr	r5, [pc, #196]	; (0x7db4)
    7cee:	745f      	strb	r7, [r3, #17]
    7cf0:	5f6f      	ldrsh	r7, [r5, r5]
    7cf2:	4c46      	ldr	r4, [pc, #280]	; (0x7e0c)
    7cf4:	5845      	ldr	r5, [r0, r1]
    7cf6:	4f43      	ldr	r7, [pc, #268]	; (0x7e04)
    7cf8:	4d4d      	ldr	r5, [pc, #308]	; (0x7e30)
    7cfa:	0032      	movs	r2, r6
    7cfc:	466b      	mov	r3, sp
    7cfe:	4f52      	ldr	r7, [pc, #328]	; (0x7e48)
    7d00:	4d31      	ldr	r5, [pc, #196]	; (0x7dc8)
    7d02:	745f      	strb	r7, [r3, #17]
    7d04:	5f6f      	ldrsh	r7, [r5, r5]
    7d06:	4c46      	ldr	r4, [pc, #280]	; (0x7e20)
    7d08:	5845      	ldr	r5, [r0, r1]
    7d0a:	4f43      	ldr	r7, [pc, #268]	; (0x7e18)
    7d0c:	4d4d      	ldr	r5, [pc, #308]	; (0x7e44)
    7d0e:	0033      	movs	r3, r6
    7d10:	466b      	mov	r3, sp
    7d12:	4f52      	ldr	r7, [pc, #328]	; (0x7e5c)
    7d14:	4d31      	ldr	r5, [pc, #196]	; (0x7ddc)
    7d16:	745f      	strb	r7, [r3, #17]
    7d18:	5f6f      	ldrsh	r7, [r5, r5]
    7d1a:	4c46      	ldr	r4, [pc, #280]	; (0x7e34)
    7d1c:	5845      	ldr	r5, [r0, r1]
    7d1e:	4f43      	ldr	r7, [pc, #268]	; (0x7e2c)
    7d20:	4d4d      	ldr	r5, [pc, #308]	; (0x7e58)
    7d22:	0034      	movs	r4, r6
    7d24:	466b      	mov	r3, sp
    7d26:	4f52      	ldr	r7, [pc, #328]	; (0x7e70)
    7d28:	4d31      	ldr	r5, [pc, #196]	; (0x7df0)
    7d2a:	745f      	strb	r7, [r3, #17]
    7d2c:	5f6f      	ldrsh	r7, [r5, r5]
    7d2e:	4c46      	ldr	r4, [pc, #280]	; (0x7e48)
    7d30:	5845      	ldr	r5, [r0, r1]
    7d32:	4f43      	ldr	r7, [pc, #268]	; (0x7e40)
    7d34:	4d4d      	ldr	r5, [pc, #308]	; (0x7e6c)
    7d36:	0035      	movs	r5, r6
    7d38:	466b      	mov	r3, sp
    7d3a:	4f52      	ldr	r7, [pc, #328]	; (0x7e84)
    7d3c:	4d31      	ldr	r5, [pc, #196]	; (0x7e04)
    7d3e:	745f      	strb	r7, [r3, #17]
    7d40:	5f6f      	ldrsh	r7, [r5, r5]
    7d42:	4c46      	ldr	r4, [pc, #280]	; (0x7e5c)
    7d44:	5845      	ldr	r5, [r0, r1]
    7d46:	4f43      	ldr	r7, [pc, #268]	; (0x7e54)
    7d48:	4d4d      	ldr	r5, [pc, #308]	; (0x7e80)
    7d4a:	0036      	movs	r6, r6
    7d4c:	466b      	mov	r3, sp
    7d4e:	4f52      	ldr	r7, [pc, #328]	; (0x7e98)
    7d50:	4d31      	ldr	r5, [pc, #196]	; (0x7e18)
    7d52:	745f      	strb	r7, [r3, #17]
    7d54:	5f6f      	ldrsh	r7, [r5, r5]
    7d56:	4c46      	ldr	r4, [pc, #280]	; (0x7e70)
    7d58:	5845      	ldr	r5, [r0, r1]
    7d5a:	4f43      	ldr	r7, [pc, #268]	; (0x7e68)
    7d5c:	4d4d      	ldr	r5, [pc, #308]	; (0x7e94)
    7d5e:	0037      	movs	r7, r6
    7d60:	5f56      	ldrsh	r6, [r2, r5]
    7d62:	4f41      	ldr	r7, [pc, #260]	; (0x7e68)
    7d64:	305f      	adds	r0, #95	; 0x5f
    7d66:	3750      	adds	r7, #80	; 0x50
    7d68:	3532      	adds	r5, #50	; 0x32
    7d6a:	4900      	ldr	r1, [pc, #0]	; (0x7d6c)
    7d6c:	4241      	negs	r1, r0
    7d6e:	0052      	lsls	r2, r2, #1
    7d70:	5f56      	ldrsh	r6, [r2, r5]
    7d72:	4344      	muls	r4, r0
    7d74:	4344      	muls	r4, r0
    7d76:	305f      	adds	r0, #95	; 0x5f
    7d78:	3950      	subs	r1, #80	; 0x50
    7d7a:	3035      	adds	r0, #53	; 0x35
    7d7c:	4300      	orrs	r0, r0
    7d7e:	4f4c      	ldr	r7, [pc, #304]	; (0x7eb0)
    7d80:	4b43      	ldr	r3, [pc, #268]	; (0x7e90)
    7d82:	415f      	adcs	r7, r3
    7d84:	7474      	strb	r4, [r6, #17]
    7d86:	6361      	str	r1, [r4, #52]	; 0x34
    7d88:	4368      	muls	r0, r5
    7d8a:	6b6c      	ldr	r4, [r5, #52]	; 0x34
    7d8c:	5700      	ldrsb	r0, [r0, r4]
    7d8e:	5444      	strb	r4, [r0, r1]
    7d90:	4c43      	ldr	r4, [pc, #268]	; (0x7ea0)
    7d92:	444b      	add	r3, r9
    7d94:	5649      	ldrsb	r1, [r1, r1]
    7d96:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7d98:	4f4e      	ldr	r7, [pc, #312]	; (0x7ed4)
    7d9a:	454e      	cmp	r6, r9
    7d9c:	745f      	strb	r7, [r3, #17]
    7d9e:	5f6f      	ldrsh	r7, [r5, r5]
    7da0:	4f4e      	ldr	r7, [pc, #312]	; (0x7edc)
    7da2:	454e      	cmp	r6, r9
    7da4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7da6:	4f4e      	ldr	r7, [pc, #312]	; (0x7ee0)
    7da8:	454e      	cmp	r6, r9
    7daa:	745f      	strb	r7, [r3, #17]
    7dac:	5f6f      	ldrsh	r7, [r5, r5]
    7dae:	4441      	add	r1, r8
    7db0:	5f43      	ldrsh	r3, [r0, r5]
    7db2:	4c43      	ldr	r4, [pc, #268]	; (0x7ec0)
    7db4:	004b      	lsls	r3, r1, #1
    7db6:	4c50      	ldr	r4, [pc, #320]	; (0x7ef8)
    7db8:	314c      	adds	r1, #76	; 0x4c
    7dba:	545f      	strb	r7, [r3, r1]
    7dbc:	5345      	strh	r5, [r0, r5]
    7dbe:	4354      	muls	r4, r2
    7dc0:	5254      	strh	r4, [r2, r1]
    7dc2:	004c      	lsls	r4, r1, #1
    7dc4:	5043      	str	r3, [r0, r1]
    7dc6:	4955      	ldr	r1, [pc, #340]	; (0x7f1c)
    7dc8:	0044      	lsls	r4, r0, #1
    7dca:	5253      	strh	r3, [r2, r1]
    7dcc:	4d41      	ldr	r5, [pc, #260]	; (0x7ed4)
    7dce:	4552      	cmp	r2, sl
    7dd0:	4354      	muls	r4, r2
    7dd2:	5254      	strh	r4, [r2, r1]
    7dd4:	004c      	lsls	r4, r1, #1
    7dd6:	466b      	mov	r3, sp
    7dd8:	4f52      	ldr	r7, [pc, #328]	; (0x7f24)
    7dda:	4d31      	ldr	r5, [pc, #196]	; (0x7ea0)
    7ddc:	745f      	strb	r7, [r3, #17]
    7dde:	5f6f      	ldrsh	r7, [r5, r5]
    7de0:	434d      	muls	r5, r1
    7de2:	4b4c      	ldr	r3, [pc, #304]	; (0x7f14)
    7de4:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7de6:	7453      	strb	r3, [r2, #17]
    7de8:	7461      	strb	r1, [r4, #17]
    7dea:	7375      	strb	r5, [r6, #13]
    7dec:	7247      	strb	r7, [r0, #9]
    7dee:	756f      	strb	r7, [r5, #21]
    7df0:	5f70      	ldrsh	r0, [r6, r5]
    7df2:	5542      	strb	r2, [r0, r5]
    7df4:	5454      	strb	r4, [r2, r1]
    7df6:	4e4f      	ldr	r6, [pc, #316]	; (0x7f34)
    7df8:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7dfa:	7453      	strb	r3, [r2, #17]
    7dfc:	7461      	strb	r1, [r4, #17]
    7dfe:	7375      	strb	r5, [r6, #13]
    7e00:	7247      	strb	r7, [r0, #9]
    7e02:	756f      	strb	r7, [r5, #21]
    7e04:	5f70      	ldrsh	r0, [r6, r5]
    7e06:	534d      	strh	r5, [r1, r5]
    7e08:	0047      	lsls	r7, r0, #1
    7e0a:	436b      	muls	r3, r5
    7e0c:	4f4c      	ldr	r7, [pc, #304]	; (0x7f40)
    7e0e:	4b43      	ldr	r3, [pc, #268]	; (0x7f1c)
    7e10:	445f      	add	r7, fp
    7e12:	7669      	strb	r1, [r5, #25]
    7e14:	7953      	ldrb	r3, [r2, #5]
    7e16:	7473      	strb	r3, [r6, #17]
    7e18:	6369      	str	r1, [r5, #52]	; 0x34
    7e1a:	436b      	muls	r3, r5
    7e1c:	6b6c      	ldr	r4, [r5, #52]	; 0x34
    7e1e:	0030      	movs	r0, r6
    7e20:	4c50      	ldr	r4, [pc, #320]	; (0x7f64)
    7e22:	304c      	adds	r0, #76	; 0x4c
    7e24:	5353      	strh	r3, [r2, r5]
    7e26:	4743      	bx	r8
    7e28:	0030      	movs	r0, r6
    7e2a:	4c50      	ldr	r4, [pc, #320]	; (0x7f6c)
    7e2c:	304c      	adds	r0, #76	; 0x4c
    7e2e:	5353      	strh	r3, [r2, r5]
    7e30:	4743      	bx	r8
    7e32:	0031      	movs	r1, r6
    7e34:	3875      	subs	r0, #117	; 0x75
    7e36:	4549      	cmp	r1, r9
    7e38:	5843      	ldr	r3, [r0, r1]
    7e3a:	756f      	strb	r7, [r5, #21]
    7e3c:	4374      	muls	r4, r6
    7e3e:	7061      	strb	r1, [r4, #1]
    7e40:	6143      	str	r3, [r0, #20]
    7e42:	366c      	adds	r6, #108	; 0x6c
    7e44:	4670      	mov	r0, lr
    7e46:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7e48:	7453      	strb	r3, [r2, #17]
    7e4a:	7461      	strb	r1, [r4, #17]
    7e4c:	7375      	strb	r5, [r6, #13]
    7e4e:	7247      	strb	r7, [r0, #9]
    7e50:	756f      	strb	r7, [r5, #21]
    7e52:	5f70      	ldrsh	r0, [r6, r5]
    7e54:	4c46      	ldr	r4, [pc, #280]	; (0x7f70)
    7e56:	5845      	ldr	r5, [r0, r1]
    7e58:	4f49      	ldr	r7, [pc, #292]	; (0x7f80)
    7e5a:	495f      	ldr	r1, [pc, #380]	; (0x7fd8)
    7e5c:	4332      	orrs	r2, r6
    7e5e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7e60:	7453      	strb	r3, [r2, #17]
    7e62:	7461      	strb	r1, [r4, #17]
    7e64:	7375      	strb	r5, [r6, #13]
    7e66:	7247      	strb	r7, [r0, #9]
    7e68:	756f      	strb	r7, [r5, #21]
    7e6a:	5f70      	ldrsh	r0, [r6, r5]
    7e6c:	4148      	adcs	r0, r1
    7e6e:	5f4c      	ldrsh	r4, [r1, r5]
    7e70:	5047      	str	r7, [r0, r1]
    7e72:	4f49      	ldr	r7, [pc, #292]	; (0x7f98)
    7e74:	5500      	strb	r0, [r0, r4]
    7e76:	4253      	negs	r3, r2
    7e78:	5348      	strh	r0, [r1, r5]
    7e7a:	505f      	str	r7, [r3, r1]
    7e7c:	5948      	ldr	r0, [r1, r5]
    7e7e:	545f      	strb	r7, [r3, r1]
    7e80:	4952      	ldr	r1, [pc, #328]	; (0x7fcc)
    7e82:	004d      	lsls	r5, r1, #1
    7e84:	4e6b      	ldr	r6, [pc, #428]	; (0x8034)
    7e86:	4e4f      	ldr	r6, [pc, #316]	; (0x7fc4)
    7e88:	5f45      	ldrsh	r5, [r0, r5]
    7e8a:	6f74      	ldr	r4, [r6, #116]	; 0x74
    7e8c:	545f      	strb	r7, [r3, r1]
    7e8e:	4152      	adcs	r2, r2
    7e90:	4543      	cmp	r3, r8
    7e92:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7e94:	7453      	strb	r3, [r2, #17]
    7e96:	7461      	strb	r1, [r4, #17]
    7e98:	7375      	strb	r5, [r6, #13]
    7e9a:	7247      	strb	r7, [r0, #9]
    7e9c:	756f      	strb	r7, [r5, #21]
    7e9e:	5f70      	ldrsh	r0, [r6, r5]
    7ea0:	4c46      	ldr	r4, [pc, #280]	; (0x7fbc)
    7ea2:	5845      	ldr	r5, [r0, r1]
    7ea4:	4f49      	ldr	r7, [pc, #292]	; (0x7fcc)
    7ea6:	495f      	ldr	r1, [pc, #380]	; (0x8024)
    7ea8:	5332      	strh	r2, [r6, r4]
    7eaa:	4900      	ldr	r1, [pc, #0]	; (0x7eac)
    7eac:	4e54      	ldr	r6, [pc, #336]	; (0x8000)
    7eae:	0053      	lsls	r3, r2, #1
    7eb0:	466b      	mov	r3, sp
    7eb2:	4f52      	ldr	r7, [pc, #328]	; (0x7ffc)
    7eb4:	4d31      	ldr	r5, [pc, #196]	; (0x7f7c)
    7eb6:	745f      	strb	r7, [r3, #17]
    7eb8:	5f6f      	ldrsh	r7, [r5, r5]
    7eba:	5254      	strh	r4, [r2, r1]
    7ebc:	4341      	muls	r1, r0
    7ebe:	0045      	lsls	r5, r0, #1
    7ec0:	5f56      	ldrsh	r6, [r2, r5]
    7ec2:	4344      	muls	r4, r0
    7ec4:	4344      	muls	r4, r0
    7ec6:	305f      	adds	r0, #95	; 0x5f
    7ec8:	3950      	subs	r1, #80	; 0x50
    7eca:	3537      	adds	r5, #55	; 0x37
    7ecc:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7ece:	4450      	add	r0, sl
    7ed0:	5552      	strb	r2, [r2, r5]
    7ed2:	434e      	muls	r6, r1
    7ed4:	4746      	bx	r8
    7ed6:	505f      	str	r7, [r3, r1]
    7ed8:	5f44      	ldrsh	r4, [r0, r5]
    7eda:	4c50      	ldr	r4, [pc, #320]	; (0x801c)
    7edc:	304c      	adds	r0, #76	; 0x4c
    7ede:	535f      	strh	r7, [r3, r5]
    7ee0:	4353      	muls	r3, r2
    7ee2:	0047      	lsls	r7, r0, #1
    7ee4:	436b      	muls	r3, r5
    7ee6:	4f4c      	ldr	r7, [pc, #304]	; (0x8018)
    7ee8:	4b43      	ldr	r3, [pc, #268]	; (0x7ff8)
    7eea:	4d5f      	ldr	r5, [pc, #380]	; (0x8068)
    7eec:	6961      	ldr	r1, [r4, #20]
    7eee:	626c      	str	r4, [r5, #36]	; 0x24
    7ef0:	786f      	ldrb	r7, [r5, #1]
    7ef2:	7600      	strb	r0, [r0, #24]
    7ef4:	6c6f      	ldr	r7, [r5, #68]	; 0x44
    7ef6:	6174      	str	r4, [r6, #20]
    7ef8:	6567      	str	r7, [r4, #84]	; 0x54
    7efa:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7efc:	5246      	strh	r6, [r0, r1]
    7efe:	5f4f      	ldrsh	r7, [r1, r5]
    7f00:	4648      	mov	r0, r9
    7f02:	745f      	strb	r7, [r3, #17]
    7f04:	5f6f      	ldrsh	r7, [r5, r5]
    7f06:	414d      	adcs	r5, r1
    7f08:	4e49      	ldr	r6, [pc, #292]	; (0x8030)
    7f0a:	435f      	muls	r7, r3
    7f0c:	4b4c      	ldr	r3, [pc, #304]	; (0x8040)
    7f0e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7f10:	7453      	strb	r3, [r2, #17]
    7f12:	7461      	strb	r1, [r4, #17]
    7f14:	7375      	strb	r5, [r6, #13]
    7f16:	7247      	strb	r7, [r0, #9]
    7f18:	756f      	strb	r7, [r5, #21]
    7f1a:	5f70      	ldrsh	r0, [r6, r5]
    7f1c:	4e45      	ldr	r6, [pc, #276]	; (0x8034)
    7f1e:	5445      	strb	r5, [r0, r1]
    7f20:	4900      	ldr	r1, [pc, #0]	; (0x7f24)
    7f22:	564e      	ldrsb	r6, [r1, r1]
    7f24:	5245      	strh	r5, [r0, r1]
    7f26:	4d54      	ldr	r5, [pc, #336]	; (0x8078)
    7f28:	4941      	ldr	r1, [pc, #260]	; (0x8030)
    7f2a:	434e      	muls	r6, r1
    7f2c:	4b4c      	ldr	r3, [pc, #304]	; (0x8060)
    7f2e:	5600      	ldrsb	r0, [r0, r0]
    7f30:	415f      	adcs	r7, r3
    7f32:	5f4f      	ldrsh	r7, [r1, r5]
    7f34:	5030      	str	r0, [r6, r0]
    7f36:	3537      	adds	r5, #55	; 0x37
    7f38:	0030      	movs	r0, r6
    7f3a:	4c43      	ldr	r4, [pc, #268]	; (0x8048)
    7f3c:	434f      	muls	r7, r1
    7f3e:	5f4b      	ldrsh	r3, [r1, r5]
    7f40:	5443      	strb	r3, [r0, r1]
    7f42:	4c52      	ldr	r4, [pc, #328]	; (0x808c)
    7f44:	4200      	tst	r0, r0
    7f46:	444f      	add	r7, r9
    7f48:	4256      	negs	r6, r2
    7f4a:	5441      	strb	r1, [r0, r1]
    7f4c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7f4e:	4450      	add	r0, sl
    7f50:	5552      	strb	r2, [r2, r5]
    7f52:	434e      	muls	r6, r1
    7f54:	4746      	bx	r8
    7f56:	505f      	str	r7, [r3, r1]
    7f58:	5f44      	ldrsh	r4, [r0, r5]
    7f5a:	5047      	str	r7, [r0, r1]
    7f5c:	4441      	add	r1, r8
    7f5e:	0043      	lsls	r3, r0, #1
    7f60:	5453      	strb	r3, [r2, r1]
    7f62:	5241      	strh	r1, [r0, r1]
    7f64:	4554      	cmp	r4, sl
    7f66:	4352      	muls	r2, r2
    7f68:	524c      	strh	r4, [r1, r1]
    7f6a:	6c00      	ldr	r0, [r0, #64]	; 0x40
    7f6c:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    7f6e:	2067      	movs	r0, #103	; 0x67
    7f70:	6f6c      	ldr	r4, [r5, #116]	; 0x74
    7f72:	676e      	str	r6, [r5, #116]	; 0x74
    7f74:	6920      	ldr	r0, [r4, #16]
    7f76:	746e      	strb	r6, [r5, #17]
    7f78:	4400      	add	r0, r0
    7f7a:	4245      	negs	r5, r0
    7f7c:	4755      	bx	sl
    7f7e:	415f      	adcs	r7, r3
    7f80:	5455      	strb	r5, [r2, r1]
    7f82:	5f48      	ldrsh	r0, [r1, r5]
    7f84:	4353      	muls	r3, r2
    7f86:	4152      	adcs	r2, r2
    7f88:	4354      	muls	r4, r2
    7f8a:	0048      	lsls	r0, r1, #1
    7f8c:	536b      	strh	r3, [r5, r5]
    7f8e:	6174      	str	r4, [r6, #20]
    7f90:	7574      	strb	r4, [r6, #21]
    7f92:	4773      	bx	lr
    7f94:	6f72      	ldr	r2, [r6, #116]	; 0x74
    7f96:	7075      	strb	r5, [r6, #1]
    7f98:	445f      	add	r7, fp
    7f9a:	414d      	adcs	r5, r1
    7f9c:	5000      	str	r0, [r0, r0]
    7f9e:	574f      	ldrsb	r7, [r1, r5]
    7fa0:	5245      	strh	r5, [r0, r1]
    7fa2:	475f      	bx	fp
    7fa4:	7465      	strb	r5, [r4, #17]
    7fa6:	694c      	ldr	r4, [r1, #20]
    7fa8:	5662      	ldrsb	r2, [r4, r1]
    7faa:	7265      	strb	r5, [r4, #9]
    7fac:	6973      	ldr	r3, [r6, #20]
    7fae:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    7fb0:	4300      	orrs	r0, r0
    7fb2:	4954      	ldr	r1, [pc, #336]	; (0x8104)
    7fb4:	454d      	cmp	r5, r9
    7fb6:	4352      	muls	r2, r2
    7fb8:	4b4c      	ldr	r3, [pc, #304]	; (0x80ec)
    7fba:	4553      	cmp	r3, sl
    7fbc:	004c      	lsls	r4, r1, #1
    7fbe:	536b      	strh	r3, [r5, r5]
    7fc0:	6174      	str	r4, [r6, #20]
    7fc2:	7574      	strb	r4, [r6, #21]
    7fc4:	4773      	bx	lr
    7fc6:	6f72      	ldr	r2, [r6, #116]	; 0x74
    7fc8:	7075      	strb	r5, [r6, #1]
    7fca:	435f      	muls	r7, r3
    7fcc:	4953      	ldr	r1, [pc, #332]	; (0x811c)
    7fce:	4400      	add	r0, r0
    7fd0:	4943      	ldr	r1, [pc, #268]	; (0x80e0)
    7fd2:	564d      	ldrsb	r5, [r1, r1]
    7fd4:	4341      	muls	r1, r0
    7fd6:	6b00      	ldr	r0, [r0, #48]	; 0x30
    7fd8:	4c43      	ldr	r4, [pc, #268]	; (0x80e8)
    7fda:	434f      	muls	r7, r1
    7fdc:	5f4b      	ldrsh	r3, [r1, r5]
    7fde:	7246      	strb	r6, [r0, #9]
    7fe0:	316f      	adds	r1, #111	; 0x6f
    7fe2:	4d32      	ldr	r5, [pc, #200]	; (0x80ac)
    7fe4:	5600      	ldrsb	r0, [r0, r0]
    7fe6:	415f      	adcs	r7, r3
    7fe8:	5f4f      	ldrsh	r7, [r1, r5]
    7fea:	5030      	str	r0, [r6, r0]
    7fec:	3038      	adds	r0, #56	; 0x38
    7fee:	0030      	movs	r0, r6
    7ff0:	436b      	muls	r3, r5
    7ff2:	4f4c      	ldr	r7, [pc, #304]	; (0x8124)
    7ff4:	4b43      	ldr	r3, [pc, #268]	; (0x8104)
    7ff6:	455f      	cmp	r7, fp
    7ff8:	7478      	strb	r0, [r7, #17]
    7ffa:	6c43      	ldr	r3, [r0, #68]	; 0x44
    7ffc:	006b      	lsls	r3, r5, #1
    7ffe:	4344      	muls	r4, r0
    8000:	5349      	strh	r1, [r1, r5]
    8002:	0057      	lsls	r7, r2, #1
    8004:	4841      	ldr	r0, [pc, #260]	; (0x810c)
    8006:	4342      	muls	r2, r0
    8008:	4b4c      	ldr	r3, [pc, #304]	; (0x813c)
    800a:	5443      	strb	r3, [r0, r1]
    800c:	4c52      	ldr	r4, [pc, #328]	; (0x8158)
    800e:	0030      	movs	r0, r6
    8010:	4841      	ldr	r0, [pc, #260]	; (0x8118)
    8012:	4342      	muls	r2, r0
    8014:	4b4c      	ldr	r3, [pc, #304]	; (0x8148)
    8016:	5443      	strb	r3, [r0, r1]
    8018:	4c52      	ldr	r4, [pc, #328]	; (0x8164)
    801a:	0031      	movs	r1, r6
    801c:	4841      	ldr	r0, [pc, #260]	; (0x8124)
    801e:	4342      	muls	r2, r0
    8020:	4b4c      	ldr	r3, [pc, #304]	; (0x8154)
    8022:	5443      	strb	r3, [r0, r1]
    8024:	4c52      	ldr	r4, [pc, #328]	; (0x8170)
    8026:	0032      	movs	r2, r6
    8028:	536b      	strh	r3, [r5, r5]
    802a:	6174      	str	r4, [r6, #20]
    802c:	7574      	strb	r4, [r6, #21]
    802e:	4773      	bx	lr
    8030:	6f72      	ldr	r2, [r6, #116]	; 0x74
    8032:	7075      	strb	r5, [r6, #1]
    8034:	465f      	mov	r7, fp
    8036:	454c      	cmp	r4, r9
    8038:	4358      	muls	r0, r3
    803a:	4e41      	ldr	r6, [pc, #260]	; (0x8140)
    803c:	6b00      	ldr	r0, [r0, #48]	; 0x30
    803e:	7453      	strb	r3, [r2, #17]
    8040:	7461      	strb	r1, [r4, #17]
    8042:	7375      	strb	r5, [r6, #13]
    8044:	7247      	strb	r7, [r0, #9]
    8046:	756f      	strb	r7, [r5, #21]
    8048:	5f70      	ldrsh	r0, [r6, r5]
    804a:	4450      	add	r0, sl
    804c:	004d      	lsls	r5, r1, #1
    804e:	6269      	str	r1, [r5, #36]	; 0x24
    8050:	6f58      	ldr	r0, [r3, #116]	; 0x74
    8052:	7475      	strb	r5, [r6, #17]
    8054:	4600      	mov	r0, r0
    8056:	454c      	cmp	r4, r9
    8058:	4658      	mov	r0, fp
    805a:	4752      	bx	sl
    805c:	5443      	strb	r3, [r0, r1]
    805e:	4c52      	ldr	r4, [pc, #328]	; (0x81a8)
    8060:	6b00      	ldr	r0, [r0, #48]	; 0x30
    8062:	4c43      	ldr	r4, [pc, #268]	; (0x8170)
    8064:	434f      	muls	r7, r1
    8066:	5f4b      	ldrsh	r3, [r1, r5]
    8068:	7355      	strb	r5, [r2, #13]
    806a:	5462      	strb	r2, [r4, r1]
    806c:	7079      	strb	r1, [r7, #1]
    806e:	0063      	lsls	r3, r4, #1
    8070:	436b      	muls	r3, r5
    8072:	4f4c      	ldr	r7, [pc, #304]	; (0x81a4)
    8074:	4b43      	ldr	r3, [pc, #268]	; (0x8184)
    8076:	465f      	mov	r7, fp
    8078:	656c      	str	r4, [r5, #84]	; 0x54
    807a:	4978      	ldr	r1, [pc, #480]	; (0x825c)
    807c:	5332      	strh	r2, [r6, r4]
    807e:	4100      	asrs	r0, r0
    8080:	4248      	negs	r0, r1
    8082:	4c43      	ldr	r4, [pc, #268]	; (0x8190)
    8084:	434b      	muls	r3, r1
    8086:	5254      	strh	r4, [r2, r1]
    8088:	584c      	ldr	r4, [r1, r1]
    808a:	5700      	ldrsb	r0, [r0, r4]
    808c:	4b41      	ldr	r3, [pc, #260]	; (0x8194)
    808e:	4945      	ldr	r1, [pc, #276]	; (0x81a4)
    8090:	434f      	muls	r7, r1
    8092:	5541      	strb	r1, [r0, r5]
    8094:	4553      	cmp	r3, sl
    8096:	6b00      	ldr	r0, [r0, #48]	; 0x30
    8098:	4c43      	ldr	r4, [pc, #268]	; (0x81a8)
    809a:	434f      	muls	r7, r1
    809c:	5f4b      	ldrsh	r3, [r1, r5]
    809e:	4453      	add	r3, sl
    80a0:	6f69      	ldr	r1, [r5, #116]	; 0x74
    80a2:	6b00      	ldr	r0, [r0, #48]	; 0x30
    80a4:	7453      	strb	r3, [r2, #17]
    80a6:	7461      	strb	r1, [r4, #17]
    80a8:	7375      	strb	r5, [r6, #13]
    80aa:	7247      	strb	r7, [r0, #9]
    80ac:	756f      	strb	r7, [r5, #21]
    80ae:	5f70      	ldrsh	r0, [r6, r5]
    80b0:	4c46      	ldr	r4, [pc, #280]	; (0x81cc)
    80b2:	5845      	ldr	r5, [r0, r1]
    80b4:	4f49      	ldr	r7, [pc, #292]	; (0x81dc)
    80b6:	555f      	strb	r7, [r3, r5]
    80b8:	5241      	strh	r1, [r0, r1]
    80ba:	0054      	lsls	r4, r2, #1
    80bc:	436b      	muls	r3, r5
    80be:	4f4c      	ldr	r7, [pc, #304]	; (0x81f0)
    80c0:	4b43      	ldr	r3, [pc, #268]	; (0x81d0)
    80c2:	445f      	add	r7, fp
    80c4:	7669      	strb	r1, [r5, #25]
    80c6:	7355      	strb	r5, [r2, #13]
    80c8:	3062      	adds	r0, #98	; 0x62
    80ca:	6c43      	ldr	r3, [r0, #68]	; 0x44
    80cc:	006b      	lsls	r3, r5, #1
    80ce:	4148      	adcs	r0, r1
    80d0:	4452      	add	r2, sl
    80d2:	4157      	adcs	r7, r2
    80d4:	4552      	cmp	r2, sl
    80d6:	4c53      	ldr	r4, [pc, #332]	; (0x8224)
    80d8:	4545      	cmp	r5, r8
    80da:	0050      	lsls	r0, r2, #1
    80dc:	4944      	ldr	r1, [pc, #272]	; (0x81f0)
    80de:	4543      	cmp	r3, r8
    80e0:	525f      	strh	r7, [r3, r1]
    80e2:	4745      	bx	r8
    80e4:	0033      	movs	r3, r6
    80e6:	6970      	ldr	r0, [r6, #20]
    80e8:	3233      	adds	r2, #51	; 0x33
    80ea:	315f      	adds	r1, #95	; 0x5f
    80ec:	4d36      	ldr	r5, [pc, #216]	; (0x81c8)
    80ee:	5866      	ldr	r6, [r4, r1]
    80f0:	6174      	str	r4, [r6, #20]
    80f2:	506c      	str	r4, [r5, r1]
    80f4:	6350      	str	r0, [r2, #52]	; 0x34
    80f6:	5062      	str	r2, [r4, r1]
    80f8:	7261      	strb	r1, [r4, #9]
    80fa:	6143      	str	r3, [r0, #20]
    80fc:	7070      	strb	r0, [r6, #1]
    80fe:	5f46      	ldrsh	r6, [r0, r5]
    8100:	3178      	adds	r1, #120	; 0x78
    8102:	3030      	adds	r0, #48	; 0x30
    8104:	7500      	strb	r0, [r0, #20]
    8106:	4338      	orrs	r0, r7
    8108:	7061      	strb	r1, [r4, #1]
    810a:	6142      	str	r2, [r0, #20]
    810c:	6b6e      	ldr	r6, [r5, #52]	; 0x34
    810e:	6944      	ldr	r4, [r0, #20]
    8110:	6373      	str	r3, [r6, #52]	; 0x34
    8112:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    8114:	6974      	ldr	r4, [r6, #20]
    8116:	756e      	strb	r6, [r5, #21]
    8118:	7469      	strb	r1, [r5, #17]
    811a:	0079      	lsls	r1, r7, #1
    811c:	536b      	strh	r3, [r5, r5]
    811e:	6174      	str	r4, [r6, #20]
    8120:	7574      	strb	r4, [r6, #21]
    8122:	4773      	bx	lr
    8124:	6f72      	ldr	r2, [r6, #116]	; 0x74
    8126:	7075      	strb	r5, [r6, #1]
    8128:	445f      	add	r7, fp
    812a:	6265      	str	r5, [r4, #36]	; 0x24
    812c:	6775      	str	r5, [r6, #116]	; 0x74
    812e:	6f43      	ldr	r3, [r0, #116]	; 0x74
    8130:	736e      	strb	r6, [r5, #13]
    8132:	6c6f      	ldr	r7, [r5, #68]	; 0x44
    8134:	0065      	lsls	r5, r4, #1
    8136:	7270      	strb	r0, [r6, #9]
    8138:	4d69      	ldr	r5, [pc, #420]	; (0x82e0)
    813a:	7361      	strb	r1, [r4, #13]
    813c:	006b      	lsls	r3, r5, #1
    813e:	5250      	strh	r0, [r2, r1]
    8140:	5345      	strh	r5, [r0, r5]
    8142:	5445      	strb	r5, [r0, r1]
    8144:	5443      	strb	r3, [r0, r1]
    8146:	4c52      	ldr	r4, [pc, #328]	; (0x8290)
    8148:	4c43      	ldr	r4, [pc, #268]	; (0x8258)
    814a:	0052      	lsls	r2, r2, #1
    814c:	4642      	mov	r2, r8
    814e:	5241      	strh	r1, [r0, r1]
    8150:	6b00      	ldr	r0, [r0, #48]	; 0x30
    8152:	7453      	strb	r3, [r2, #17]
    8154:	7461      	strb	r1, [r4, #17]
    8156:	7375      	strb	r5, [r6, #13]
    8158:	7247      	strb	r7, [r0, #9]
    815a:	756f      	strb	r7, [r5, #21]
    815c:	5f70      	ldrsh	r0, [r6, r5]
    815e:	4c46      	ldr	r4, [pc, #280]	; (0x8278)
    8160:	5341      	strh	r1, [r0, r5]
    8162:	4948      	ldr	r1, [pc, #288]	; (0x8284)
    8164:	5041      	str	r1, [r0, r1]
    8166:	5600      	ldrsb	r0, [r0, r0]
    8168:	415f      	adcs	r7, r3
    816a:	5f4f      	ldrsh	r7, [r1, r5]
    816c:	5031      	str	r1, [r6, r0]
    816e:	3630      	adds	r6, #48	; 0x30
    8170:	0030      	movs	r0, r6
    8172:	696e      	ldr	r6, [r5, #20]
    8174:	5f6f      	ldrsh	r7, [r5, r5]
    8176:	6573      	str	r3, [r6, #84]	; 0x54
    8178:	5f74      	ldrsh	r4, [r6, r5]
    817a:	7973      	ldrb	r3, [r6, #5]
    817c:	7473      	strb	r3, [r6, #17]
    817e:	6d65      	ldr	r5, [r4, #84]	; 0x54
    8180:	765f      	strb	r7, [r3, #25]
    8182:	6c6f      	ldr	r7, [r5, #68]	; 0x44
    8184:	6174      	str	r4, [r6, #20]
    8186:	6567      	str	r7, [r4, #84]	; 0x54
    8188:	6b00      	ldr	r0, [r0, #48]	; 0x30
    818a:	4c43      	ldr	r4, [pc, #268]	; (0x8298)
    818c:	434f      	muls	r7, r1
    818e:	5f4b      	ldrsh	r3, [r1, r5]
    8190:	6f50      	ldr	r0, [r2, #116]	; 0x74
    8192:	6577      	str	r7, [r6, #84]	; 0x54
    8194:	5172      	str	r2, [r6, r5]
    8196:	6175      	str	r5, [r6, #20]
    8198:	0064      	lsls	r4, r4, #1
    819a:	536b      	strh	r3, [r5, r5]
    819c:	6174      	str	r4, [r6, #20]
    819e:	7574      	strb	r4, [r6, #21]
    81a0:	4773      	bx	lr
    81a2:	6f72      	ldr	r2, [r6, #116]	; 0x74
    81a4:	7075      	strb	r5, [r6, #1]
    81a6:	495f      	ldr	r1, [pc, #380]	; (0x8324)
    81a8:	4332      	orrs	r2, r6
    81aa:	6b00      	ldr	r0, [r0, #48]	; 0x30
    81ac:	4c50      	ldr	r4, [pc, #320]	; (0x82f0)
    81ae:	314c      	adds	r1, #76	; 0x4c
    81b0:	745f      	strb	r7, [r3, #17]
    81b2:	5f6f      	ldrsh	r7, [r5, r5]
    81b4:	5355      	strh	r5, [r2, r5]
    81b6:	3042      	adds	r0, #66	; 0x42
    81b8:	435f      	muls	r7, r3
    81ba:	4b4c      	ldr	r3, [pc, #304]	; (0x82ec)
    81bc:	6b00      	ldr	r0, [r0, #48]	; 0x30
    81be:	4450      	add	r0, sl
    81c0:	5552      	strb	r2, [r2, r5]
    81c2:	434e      	muls	r6, r1
    81c4:	4746      	bx	r8
    81c6:	505f      	str	r7, [r3, r1]
    81c8:	5f44      	ldrsh	r4, [r0, r5]
    81ca:	4c50      	ldr	r4, [pc, #320]	; (0x830c)
    81cc:	304c      	adds	r0, #76	; 0x4c
    81ce:	6b00      	ldr	r0, [r0, #48]	; 0x30
    81d0:	4450      	add	r0, sl
    81d2:	5552      	strb	r2, [r2, r5]
    81d4:	434e      	muls	r6, r1
    81d6:	4746      	bx	r8
    81d8:	505f      	str	r7, [r3, r1]
    81da:	5f44      	ldrsh	r4, [r0, r5]
    81dc:	4c50      	ldr	r4, [pc, #320]	; (0x8320)
    81de:	314c      	adds	r1, #76	; 0x4c
    81e0:	6b00      	ldr	r0, [r0, #48]	; 0x30
    81e2:	7453      	strb	r3, [r2, #17]
    81e4:	7461      	strb	r1, [r4, #17]
    81e6:	7375      	strb	r5, [r6, #13]
    81e8:	7247      	strb	r7, [r0, #9]
    81ea:	756f      	strb	r7, [r5, #21]
    81ec:	5f70      	ldrsh	r0, [r6, r5]
    81ee:	3249      	adds	r2, #73	; 0x49
    81f0:	0053      	lsls	r3, r2, #1
    81f2:	7273      	strb	r3, [r6, #9]
    81f4:	6d61      	ldr	r1, [r4, #84]	; 0x54
    81f6:	725f      	strb	r7, [r3, #9]
    81f8:	7465      	strb	r5, [r4, #17]
    81fa:	6e65      	ldr	r5, [r4, #100]	; 0x64
    81fc:	6974      	ldr	r4, [r6, #20]
    81fe:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    8200:	635f      	str	r7, [r3, #52]	; 0x34
    8202:	7274      	strb	r4, [r6, #9]
    8204:	006c      	lsls	r4, r5, #1
    8206:	5f56      	ldrsh	r6, [r2, r5]
    8208:	4f41      	ldr	r7, [pc, #260]	; (0x8310)
    820a:	305f      	adds	r0, #95	; 0x5f
    820c:	3950      	subs	r1, #80	; 0x50
    820e:	3039      	adds	r0, #57	; 0x39
    8210:	6b00      	ldr	r0, [r0, #48]	; 0x30
    8212:	7453      	strb	r3, [r2, #17]
    8214:	7461      	strb	r1, [r4, #17]
    8216:	7375      	strb	r5, [r6, #13]
    8218:	7247      	strb	r7, [r0, #9]
    821a:	756f      	strb	r7, [r5, #21]
    821c:	5f70      	ldrsh	r0, [r6, r5]
    821e:	454d      	cmp	r5, r9
    8220:	5f4d      	ldrsh	r5, [r1, r5]
    8222:	414d      	adcs	r5, r1
    8224:	414e      	adcs	r6, r1
    8226:	4547      	cmp	r7, r8
    8228:	0052      	lsls	r2, r2, #1
    822a:	5546      	strb	r6, [r0, r5]
    822c:	434e      	muls	r6, r1
    822e:	4552      	cmp	r2, sl
    8230:	4554      	cmp	r4, sl
    8232:	544e      	strb	r6, [r1, r1]
    8234:	4f49      	ldr	r7, [pc, #292]	; (0x835c)
    8236:	434e      	muls	r6, r1
    8238:	5254      	strh	r4, [r2, r1]
    823a:	004c      	lsls	r4, r1, #1
    823c:	7063      	strb	r3, [r4, #1]
    823e:	3075      	adds	r0, #117	; 0x75
    8240:	6e5f      	ldr	r7, [r3, #100]	; 0x64
    8242:	696d      	ldr	r5, [r5, #20]
    8244:	655f      	str	r7, [r3, #84]	; 0x54
    8246:	616e      	str	r6, [r5, #20]
    8248:	6c62      	ldr	r2, [r4, #68]	; 0x44
    824a:	0065      	lsls	r5, r4, #1
    824c:	4d50      	ldr	r5, [pc, #320]	; (0x8390)
    824e:	5455      	strb	r5, [r2, r1]
    8250:	5345      	strh	r5, [r0, r5]
    8252:	4254      	negs	r4, r2
    8254:	5355      	strh	r5, [r2, r5]
    8256:	5200      	strh	r0, [r0, r0]
    8258:	5345      	strh	r5, [r0, r5]
    825a:	5445      	strb	r5, [r0, r1]
    825c:	5443      	strb	r3, [r0, r1]
    825e:	4c52      	ldr	r4, [pc, #328]	; (0x83a8)
    8260:	4700      	bx	r0
    8262:	554e      	strb	r6, [r1, r5]
    8264:	4320      	orrs	r0, r4
    8266:	3939      	subs	r1, #57	; 0x39
    8268:	3720      	adds	r7, #32
    826a:	332e      	adds	r3, #46	; 0x2e
    826c:	312e      	adds	r1, #46	; 0x2e
    826e:	3220      	adds	r2, #32
    8270:	3130      	adds	r1, #48	; 0x30
    8272:	3038      	adds	r0, #56	; 0x38
    8274:	3236      	adds	r2, #54	; 0x36
    8276:	2032      	movs	r0, #50	; 0x32
    8278:	7228      	strb	r0, [r5, #8]
    827a:	6c65      	ldr	r5, [r4, #68]	; 0x44
    827c:	6165      	str	r5, [r4, #20]
    827e:	6573      	str	r3, [r6, #84]	; 0x54
    8280:	2029      	movs	r0, #41	; 0x29
    8282:	415b      	adcs	r3, r3
    8284:	4d52      	ldr	r5, [pc, #328]	; (0x83d0)
    8286:	652f      	str	r7, [r5, #80]	; 0x50
    8288:	626d      	str	r5, [r5, #36]	; 0x24
    828a:	6465      	str	r5, [r4, #68]	; 0x44
    828c:	6564      	str	r4, [r4, #84]	; 0x54
    828e:	2d64      	cmp	r5, #100	; 0x64
    8290:	2d37      	cmp	r5, #55	; 0x37
    8292:	7262      	strb	r2, [r4, #9]
    8294:	6e61      	ldr	r1, [r4, #100]	; 0x64
    8296:	6863      	ldr	r3, [r4, #4]
    8298:	7220      	strb	r0, [r4, #8]
    829a:	7665      	strb	r5, [r4, #25]
    829c:	7369      	strb	r1, [r5, #13]
    829e:	6f69      	ldr	r1, [r5, #116]	; 0x74
    82a0:	206e      	movs	r0, #110	; 0x6e
    82a2:	3632      	adds	r6, #50	; 0x32
    82a4:	3931      	subs	r1, #49	; 0x31
    82a6:	3730      	adds	r7, #48	; 0x30
    82a8:	205d      	movs	r0, #93	; 0x5d
    82aa:	6d2d      	ldr	r5, [r5, #80]	; 0x50
    82ac:	7063      	strb	r3, [r4, #1]
    82ae:	3d75      	subs	r5, #117	; 0x75
    82b0:	6f63      	ldr	r3, [r4, #116]	; 0x74
    82b2:	7472      	strb	r2, [r6, #17]
    82b4:	7865      	ldrb	r5, [r4, #1]
    82b6:	6d2d      	ldr	r5, [r5, #80]	; 0x50
    82b8:	3333      	adds	r3, #51	; 0x33
    82ba:	2d20      	cmp	r5, #32
    82bc:	666d      	str	r5, [r5, #100]	; 0x64
    82be:	7570      	strb	r0, [r6, #21]
    82c0:	663d      	str	r5, [r7, #96]	; 0x60
    82c2:	7670      	strb	r0, [r6, #25]
    82c4:	2d35      	cmp	r5, #53	; 0x35
    82c6:	7073      	strb	r3, [r6, #1]
    82c8:	642d      	str	r5, [r5, #64]	; 0x40
    82ca:	3631      	adds	r6, #49	; 0x31
    82cc:	2d20      	cmp	r5, #32
    82ce:	666d      	str	r5, [r5, #100]	; 0x64
    82d0:	6f6c      	ldr	r4, [r5, #116]	; 0x74
    82d2:	7461      	strb	r1, [r4, #17]
    82d4:	612d      	str	r5, [r5, #16]
    82d6:	6962      	ldr	r2, [r4, #20]
    82d8:	683d      	ldr	r5, [r7, #0]
    82da:	7261      	strb	r1, [r4, #9]
    82dc:	2064      	movs	r0, #100	; 0x64
    82de:	6d2d      	ldr	r5, [r5, #80]	; 0x50
    82e0:	6874      	ldr	r4, [r6, #4]
    82e2:	6d75      	ldr	r5, [r6, #84]	; 0x54
    82e4:	2062      	movs	r0, #98	; 0x62
    82e6:	672d      	str	r5, [r5, #112]	; 0x70
    82e8:	2d20      	cmp	r5, #32
    82ea:	734f      	strb	r7, [r1, #13]
    82ec:	2d20      	cmp	r5, #32
    82ee:	7473      	strb	r3, [r6, #17]
    82f0:	3d64      	subs	r5, #100	; 0x64
    82f2:	3963      	subs	r1, #99	; 0x63
    82f4:	2039      	movs	r0, #57	; 0x39
    82f6:	662d      	str	r5, [r5, #96]	; 0x60
    82f8:	6f6e      	ldr	r6, [r5, #116]	; 0x74
    82fa:	632d      	str	r5, [r5, #48]	; 0x30
    82fc:	6d6f      	ldr	r7, [r5, #84]	; 0x54
    82fe:	6f6d      	ldr	r5, [r5, #116]	; 0x74
    8300:	206e      	movs	r0, #110	; 0x6e
    8302:	662d      	str	r5, [r5, #96]	; 0x60
    8304:	656d      	str	r5, [r5, #84]	; 0x54
    8306:	7373      	strb	r3, [r6, #13]
    8308:	6761      	str	r1, [r4, #116]	; 0x74
    830a:	2d65      	cmp	r5, #101	; 0x65
    830c:	656c      	str	r4, [r5, #84]	; 0x54
    830e:	676e      	str	r6, [r5, #116]	; 0x74
    8310:	6874      	ldr	r4, [r6, #4]
    8312:	303d      	adds	r0, #61	; 0x3d
    8314:	2d20      	cmp	r5, #32
    8316:	6e66      	ldr	r6, [r4, #100]	; 0x64
    8318:	2d6f      	cmp	r5, #111	; 0x6f
    831a:	7562      	strb	r2, [r4, #21]
    831c:	6c69      	ldr	r1, [r5, #68]	; 0x44
    831e:	6974      	ldr	r4, [r6, #20]
    8320:	206e      	movs	r0, #110	; 0x6e
    8322:	662d      	str	r5, [r5, #96]	; 0x60
    8324:	7566      	strb	r6, [r4, #21]
    8326:	636e      	str	r6, [r5, #52]	; 0x34
    8328:	6974      	ldr	r4, [r6, #20]
    832a:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    832c:	732d      	strb	r5, [r5, #12]
    832e:	6365      	str	r5, [r4, #52]	; 0x34
    8330:	6974      	ldr	r4, [r6, #20]
    8332:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    8334:	2073      	movs	r0, #115	; 0x73
    8336:	662d      	str	r5, [r5, #96]	; 0x60
    8338:	6164      	str	r4, [r4, #20]
    833a:	6174      	str	r4, [r6, #20]
    833c:	732d      	strb	r5, [r5, #12]
    833e:	6365      	str	r5, [r4, #52]	; 0x34
    8340:	6974      	ldr	r4, [r6, #20]
    8342:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    8344:	2073      	movs	r0, #115	; 0x73
    8346:	662d      	str	r5, [r5, #96]	; 0x60
    8348:	6973      	ldr	r3, [r6, #20]
    834a:	676e      	str	r6, [r5, #116]	; 0x74
    834c:	656c      	str	r4, [r5, #84]	; 0x54
    834e:	702d      	strb	r5, [r5, #0]
    8350:	6572      	str	r2, [r6, #84]	; 0x54
    8352:	6963      	ldr	r3, [r4, #20]
    8354:	6973      	ldr	r3, [r6, #20]
    8356:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    8358:	632d      	str	r5, [r5, #48]	; 0x30
    835a:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    835c:	7473      	strb	r3, [r6, #17]
    835e:	6e61      	ldr	r1, [r4, #100]	; 0x64
    8360:	0074      	lsls	r4, r6, #1
    8362:	6e75      	ldr	r5, [r6, #100]	; 0x64
    8364:	6973      	ldr	r3, [r6, #20]
    8366:	6e67      	ldr	r7, [r4, #100]	; 0x64
    8368:	6465      	str	r5, [r4, #68]	; 0x44
    836a:	6920      	ldr	r0, [r4, #16]
    836c:	746e      	strb	r6, [r5, #17]
    836e:	5500      	strb	r0, [r0, r4]
    8370:	4253      	negs	r3, r2
    8372:	5348      	strh	r0, [r1, r5]
    8374:	505f      	str	r7, [r3, r1]
    8376:	5948      	ldr	r0, [r1, r5]
    8378:	535f      	strh	r7, [r3, r5]
    837a:	4154      	adcs	r4, r2
    837c:	5554      	strb	r4, [r2, r5]
    837e:	0053      	lsls	r3, r2, #1
    8380:	5f70      	ldrsh	r0, [r6, r5]
    8382:	6f6c      	ldr	r4, [r5, #116]	; 0x74
    8384:	7077      	strb	r7, [r6, #1]
    8386:	776f      	strb	r7, [r5, #29]
    8388:	7265      	strb	r5, [r4, #9]
    838a:	635f      	str	r7, [r3, #52]	; 0x34
    838c:	6766      	str	r6, [r4, #116]	; 0x74
    838e:	4300      	orrs	r0, r0
    8390:	4e4f      	ldr	r6, [pc, #316]	; (0x84d0)
    8392:	4946      	ldr	r1, [pc, #280]	; (0x84ac)
    8394:	4c47      	ldr	r4, [pc, #284]	; (0x84b4)
    8396:	434f      	muls	r7, r1
    8398:	4f4b      	ldr	r7, [pc, #300]	; (0x84c8)
    839a:	5455      	strb	r5, [r2, r1]
    839c:	5f00      	ldrsh	r0, [r0, r4]
    839e:	675f      	str	r7, [r3, #116]	; 0x74
    83a0:	7465      	strb	r5, [r4, #17]
    83a2:	505f      	str	r7, [r3, r1]
    83a4:	4952      	ldr	r1, [pc, #328]	; (0x84f0)
    83a6:	414d      	adcs	r5, r1
    83a8:	4b53      	ldr	r3, [pc, #332]	; (0x84f8)
    83aa:	4300      	orrs	r0, r0
    83ac:	5041      	str	r1, [r0, r1]
    83ae:	4354      	muls	r4, r2
    83b0:	4b4c      	ldr	r3, [pc, #304]	; (0x84e4)
    83b2:	4944      	ldr	r1, [pc, #272]	; (0x84c4)
    83b4:	0056      	lsls	r6, r2, #1
    83b6:	4c46      	ldr	r4, [pc, #280]	; (0x84d0)
    83b8:	5845      	ldr	r5, [r0, r1]
    83ba:	5246      	strh	r6, [r0, r1]
    83bc:	3747      	adds	r7, #71	; 0x47
    83be:	5443      	strb	r3, [r0, r1]
    83c0:	4c52      	ldr	r4, [pc, #328]	; (0x850c)
    83c2:	4d00      	ldr	r5, [pc, #0]	; (0x83c4)
    83c4:	464d      	mov	r5, r9
    83c6:	5241      	strh	r1, [r0, r1]
    83c8:	4300      	orrs	r0, r0
    83ca:	4341      	muls	r1, r0
    83cc:	0052      	lsls	r2, r2, #1
    83ce:	4c43      	ldr	r4, [pc, #268]	; (0x84dc)
    83d0:	434f      	muls	r7, r1
    83d2:	474b      	bx	r9
    83d4:	4e45      	ldr	r6, [pc, #276]	; (0x84ec)
    83d6:	5055      	str	r5, [r2, r1]
    83d8:	4144      	adcs	r4, r0
    83da:	4554      	cmp	r4, sl
    83dc:	4f4c      	ldr	r7, [pc, #304]	; (0x8510)
    83de:	4b43      	ldr	r3, [pc, #268]	; (0x84ec)
    83e0:	554f      	strb	r7, [r1, r5]
    83e2:	0054      	lsls	r4, r2, #1
    83e4:	5f56      	ldrsh	r6, [r2, r5]
    83e6:	4f41      	ldr	r7, [pc, #260]	; (0x84ec)
    83e8:	315f      	adds	r1, #95	; 0x5f
    83ea:	3150      	adds	r1, #80	; 0x50
    83ec:	3031      	adds	r0, #49	; 0x31
    83ee:	6b00      	ldr	r0, [r0, #48]	; 0x30
    83f0:	4c50      	ldr	r4, [pc, #320]	; (0x8534)
    83f2:	304c      	adds	r0, #76	; 0x4c
    83f4:	745f      	strb	r7, [r3, #17]
    83f6:	5f6f      	ldrsh	r7, [r5, r5]
    83f8:	4441      	add	r1, r8
    83fa:	5f43      	ldrsh	r3, [r0, r5]
    83fc:	4c43      	ldr	r4, [pc, #268]	; (0x850c)
    83fe:	004b      	lsls	r3, r1, #1
    8400:	5f56      	ldrsh	r6, [r2, r5]
    8402:	4f41      	ldr	r7, [pc, #260]	; (0x8508)
    8404:	315f      	adds	r1, #95	; 0x5f
    8406:	3050      	adds	r0, #80	; 0x50
    8408:	3037      	adds	r0, #55	; 0x37
    840a:	7300      	strb	r0, [r0, #12]
    840c:	6f68      	ldr	r0, [r5, #116]	; 0x74
    840e:	7472      	strb	r2, [r6, #17]
    8410:	6920      	ldr	r0, [r4, #16]
    8412:	746e      	strb	r6, [r5, #17]
    8414:	4900      	ldr	r1, [pc, #0]	; (0x8418)
    8416:	4943      	ldr	r1, [pc, #268]	; (0x8524)
    8418:	564d      	ldrsb	r5, [r1, r1]
    841a:	5541      	strb	r1, [r0, r5]
    841c:	7700      	strb	r0, [r0, #28]
    841e:	6b61      	ldr	r1, [r4, #52]	; 0x34
    8420:	7565      	strb	r5, [r4, #21]
    8422:	5f70      	ldrsh	r0, [r6, r5]
    8424:	6e69      	ldr	r1, [r5, #100]	; 0x64
    8426:	6574      	str	r4, [r6, #84]	; 0x54
    8428:	7272      	strb	r2, [r6, #9]
    842a:	7075      	strb	r5, [r6, #1]
    842c:	7374      	strb	r4, [r6, #13]
    842e:	6b00      	ldr	r0, [r0, #48]	; 0x30
    8430:	4450      	add	r0, sl
    8432:	5552      	strb	r2, [r2, r5]
    8434:	434e      	muls	r6, r1
    8436:	4746      	bx	r8
    8438:	505f      	str	r7, [r3, r1]
    843a:	5f44      	ldrsh	r4, [r0, r5]
    843c:	4f42      	ldr	r7, [pc, #264]	; (0x8548)
    843e:	4344      	muls	r4, r0
    8440:	524f      	strh	r7, [r1, r1]
    8442:	0045      	lsls	r5, r0, #1
    8444:	536b      	strh	r3, [r5, r5]
    8446:	6174      	str	r4, [r6, #20]
    8448:	7574      	strb	r4, [r6, #21]
    844a:	4773      	bx	lr
    844c:	6f72      	ldr	r2, [r6, #116]	; 0x74
    844e:	7075      	strb	r5, [r6, #1]
    8450:	4c5f      	ldr	r4, [pc, #380]	; (0x85d0)
    8452:	4350      	muls	r0, r2
    8454:	4d5f      	ldr	r5, [pc, #380]	; (0x85d4)
    8456:	4e49      	ldr	r6, [pc, #292]	; (0x857c)
    8458:	5349      	strh	r1, [r1, r5]
    845a:	4950      	ldr	r1, [pc, #320]	; (0x859c)
    845c:	6c00      	ldr	r0, [r0, #64]	; 0x40
    845e:	5f76      	ldrsh	r6, [r6, r5]
    8460:	646c      	str	r4, [r5, #68]	; 0x44
    8462:	5f6f      	ldrsh	r7, [r5, r5]
    8464:	6f61      	ldr	r1, [r4, #116]	; 0x74
    8466:	4600      	mov	r0, r0
    8468:	414c      	adcs	r4, r1
    846a:	4853      	ldr	r0, [pc, #332]	; (0x85b8)
    846c:	4953      	ldr	r1, [pc, #332]	; (0x85bc)
    846e:	455a      	cmp	r2, fp
    8470:	4643      	mov	r3, r8
    8472:	0047      	lsls	r7, r0, #1
    8474:	536b      	strh	r3, [r5, r5]
    8476:	6174      	str	r4, [r6, #20]
    8478:	7574      	strb	r4, [r6, #21]
    847a:	4773      	bx	lr
    847c:	6f72      	ldr	r2, [r6, #116]	; 0x74
    847e:	7075      	strb	r5, [r6, #1]
    8480:	505f      	str	r7, [r3, r1]
    8482:	5948      	ldr	r0, [r1, r5]
    8484:	6b00      	ldr	r0, [r0, #48]	; 0x30
    8486:	4450      	add	r0, sl
    8488:	5552      	strb	r2, [r2, r5]
    848a:	434e      	muls	r6, r1
    848c:	4746      	bx	r8
    848e:	505f      	str	r7, [r3, r1]
    8490:	5f44      	ldrsh	r4, [r0, r5]
    8492:	4f43      	ldr	r7, [pc, #268]	; (0x85a0)
    8494:	504d      	str	r5, [r1, r1]
    8496:	5600      	ldrsb	r0, [r0, r0]
    8498:	415f      	adcs	r7, r3
    849a:	5f4f      	ldrsh	r7, [r1, r5]
    849c:	5030      	str	r0, [r6, r0]
    849e:	3538      	adds	r5, #56	; 0x38
    84a0:	0030      	movs	r0, r6
    84a2:	5f56      	ldrsh	r6, [r2, r5]
    84a4:	4544      	cmp	r4, r8
    84a6:	5045      	str	r5, [r0, r1]
    84a8:	4c53      	ldr	r4, [pc, #332]	; (0x85f8)
    84aa:	4545      	cmp	r5, r8
    84ac:	5f50      	ldrsh	r0, [r2, r5]
    84ae:	5030      	str	r0, [r6, r0]
    84b0:	3039      	adds	r0, #57	; 0x39
    84b2:	0030      	movs	r0, r6
    84b4:	6177      	str	r7, [r6, #20]
    84b6:	656b      	str	r3, [r5, #84]	; 0x54
    84b8:	755f      	strb	r7, [r3, #21]
    84ba:	5f70      	ldrsh	r0, [r6, r5]
    84bc:	7974      	ldrb	r4, [r6, #5]
    84be:	6570      	str	r0, [r6, #84]	; 0x54
    84c0:	6c00      	ldr	r0, [r0, #64]	; 0x40
    84c2:	5f76      	ldrsh	r6, [r6, r5]
    84c4:	6f6c      	ldr	r4, [r5, #116]	; 0x74
    84c6:	5f77      	ldrsh	r7, [r6, r5]
    84c8:	6f70      	ldr	r0, [r6, #116]	; 0x74
    84ca:	6577      	str	r7, [r6, #84]	; 0x54
    84cc:	5f72      	ldrsh	r2, [r6, r5]
    84ce:	6f6d      	ldr	r5, [r5, #116]	; 0x74
    84d0:	6564      	str	r4, [r4, #84]	; 0x54
    84d2:	635f      	str	r7, [r3, #52]	; 0x34
    84d4:	6766      	str	r6, [r4, #116]	; 0x74
    84d6:	0000      	movs	r0, r0
    84d8:	4347      	muls	r7, r0
    84da:	3a43      	subs	r2, #67	; 0x43
    84dc:	2820      	cmp	r0, #32
    84de:	4e47      	ldr	r6, [pc, #284]	; (0x85fc)
    84e0:	2055      	movs	r0, #85	; 0x55
    84e2:	6f54      	ldr	r4, [r2, #116]	; 0x74
    84e4:	6c6f      	ldr	r7, [r5, #68]	; 0x44
    84e6:	2073      	movs	r0, #115	; 0x73
    84e8:	6f66      	ldr	r6, [r4, #116]	; 0x74
    84ea:	2072      	movs	r0, #114	; 0x72
    84ec:	7241      	strb	r1, [r0, #9]
    84ee:	206d      	movs	r0, #109	; 0x6d
    84f0:	6d45      	ldr	r5, [r0, #84]	; 0x54
    84f2:	6562      	str	r2, [r4, #84]	; 0x54
    84f4:	6464      	str	r4, [r4, #68]	; 0x44
    84f6:	6465      	str	r5, [r4, #68]	; 0x44
    84f8:	5020      	str	r0, [r4, r0]
    84fa:	6f72      	ldr	r2, [r6, #116]	; 0x74
    84fc:	6563      	str	r3, [r4, #84]	; 0x54
    84fe:	7373      	strb	r3, [r6, #13]
    8500:	726f      	strb	r7, [r5, #9]
    8502:	2073      	movs	r0, #115	; 0x73
    8504:	2d37      	cmp	r5, #55	; 0x37
    8506:	3032      	adds	r0, #50	; 0x32
    8508:	3831      	subs	r0, #49	; 0x31
    850a:	712d      	strb	r5, [r5, #4]
    850c:	2d32      	cmp	r5, #50	; 0x32
    850e:	7075      	strb	r5, [r6, #1]
    8510:	6164      	str	r4, [r4, #20]
    8512:	6574      	str	r4, [r6, #84]	; 0x54
    8514:	2029      	movs	r0, #41	; 0x29
    8516:	2e37      	cmp	r6, #55	; 0x37
    8518:	2e33      	cmp	r6, #51	; 0x33
    851a:	2031      	movs	r0, #49	; 0x31
    851c:	3032      	adds	r0, #50	; 0x32
    851e:	3831      	subs	r0, #49	; 0x31
    8520:	3630      	adds	r6, #48	; 0x30
    8522:	3232      	adds	r2, #50	; 0x32
    8524:	2820      	cmp	r0, #32
    8526:	6572      	str	r2, [r6, #84]	; 0x54
    8528:	656c      	str	r4, [r5, #84]	; 0x54
    852a:	7361      	strb	r1, [r4, #13]
    852c:	2965      	cmp	r1, #101	; 0x65
    852e:	5b20      	ldrh	r0, [r4, r4]
    8530:	5241      	strh	r1, [r0, r1]
    8532:	2f4d      	cmp	r7, #77	; 0x4d
    8534:	6d65      	ldr	r5, [r4, #84]	; 0x54
    8536:	6562      	str	r2, [r4, #84]	; 0x54
    8538:	6464      	str	r4, [r4, #68]	; 0x44
    853a:	6465      	str	r5, [r4, #68]	; 0x44
    853c:	372d      	adds	r7, #45	; 0x2d
    853e:	622d      	str	r5, [r5, #32]
    8540:	6172      	str	r2, [r6, #20]
    8542:	636e      	str	r6, [r5, #52]	; 0x34
    8544:	2068      	movs	r0, #104	; 0x68
    8546:	6572      	str	r2, [r6, #84]	; 0x54
    8548:	6976      	ldr	r6, [r6, #20]
    854a:	6973      	ldr	r3, [r6, #20]
    854c:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    854e:	3220      	adds	r2, #32
    8550:	3136      	adds	r1, #54	; 0x36
    8552:	3039      	adds	r0, #57	; 0x39
    8554:	5d37      	ldrb	r7, [r6, r4]
    8556:	0000      	movs	r0, r0
    8558:	000c      	movs	r4, r1
    855a:	0000      	movs	r0, r0
    855c:	ffff ffff 			; <UNDEFINED> instruction: 0xffffffff
    8560:	0001      	movs	r1, r0
    8562:	7c02      	ldrb	r2, [r0, #16]
    8564:	0c0e      	lsrs	r6, r1, #16
    8566:	000d      	movs	r5, r1
    8568:	0018      	movs	r0, r3
	...
    8572:	0000      	movs	r0, r0
    8574:	008c      	lsls	r4, r1, #2
    8576:	0000      	movs	r0, r0
    8578:	0e41      	lsrs	r1, r0, #25
    857a:	8410      	strh	r0, [r2, #32]
    857c:	8504      	strh	r4, [r0, #40]	; 0x28
    857e:	8603      	strh	r3, [r0, #48]	; 0x30
    8580:	8e02      	ldrh	r2, [r0, #48]	; 0x30
    8582:	0001      	movs	r1, r0
    8584:	000c      	movs	r4, r1
	...
    858e:	0000      	movs	r0, r0
    8590:	000c      	movs	r4, r1
    8592:	0000      	movs	r0, r0
    8594:	0024      	movs	r4, r4
	...
    859e:	0000      	movs	r0, r0
    85a0:	00d0      	lsls	r0, r2, #3
    85a2:	0000      	movs	r0, r0
    85a4:	0e42      	lsrs	r2, r0, #25
    85a6:	8418      	strh	r0, [r3, #32]
    85a8:	8506      	strh	r6, [r0, #40]	; 0x28
    85aa:	8605      	strh	r5, [r0, #48]	; 0x30
    85ac:	8704      	strh	r4, [r0, #56]	; 0x38
    85ae:	8803      	ldrh	r3, [r0, #0]
    85b0:	8e02      	ldrh	r2, [r0, #48]	; 0x30
    85b2:	4201      	tst	r1, r0
    85b4:	580e      	ldr	r6, [r1, r0]
    85b6:	5702      	ldrsb	r2, [r0, r4]
    85b8:	180e      	adds	r6, r1, r0
    85ba:	0000      	movs	r0, r0
    85bc:	002c      	movs	r4, r5
	...
    85c6:	0000      	movs	r0, r0
    85c8:	0148      	lsls	r0, r1, #5
    85ca:	0000      	movs	r0, r0
    85cc:	0e42      	lsrs	r2, r0, #25
    85ce:	8424      	strh	r4, [r4, #32]
    85d0:	8509      	strh	r1, [r1, #40]	; 0x28
    85d2:	8608      	strh	r0, [r1, #48]	; 0x30
    85d4:	8707      	strh	r7, [r0, #56]	; 0x38
    85d6:	8806      	ldrh	r6, [r0, #0]
    85d8:	8905      	ldrh	r5, [r0, #8]
    85da:	8a04      	ldrh	r4, [r0, #16]
    85dc:	8b03      	ldrh	r3, [r0, #24]
    85de:	8e02      	ldrh	r2, [r0, #48]	; 0x30
    85e0:	4301      	orrs	r1, r0
    85e2:	900e      	str	r0, [sp, #56]	; 0x38
    85e4:	0201      	lsls	r1, r0, #8
    85e6:	0e8f      	lsrs	r7, r1, #26
    85e8:	0024      	movs	r4, r4
    85ea:	0000      	movs	r0, r0
    85ec:	002c      	movs	r4, r5
	...
    85f6:	0000      	movs	r0, r0
    85f8:	0174      	lsls	r4, r6, #5
    85fa:	0000      	movs	r0, r0
    85fc:	0e42      	lsrs	r2, r0, #25
    85fe:	8420      	strh	r0, [r4, #32]
    8600:	8508      	strh	r0, [r1, #40]	; 0x28
    8602:	8607      	strh	r7, [r0, #48]	; 0x30
    8604:	8706      	strh	r6, [r0, #56]	; 0x38
    8606:	8805      	ldrh	r5, [r0, #0]
    8608:	8904      	ldrh	r4, [r0, #8]
    860a:	8a03      	ldrh	r3, [r0, #16]
    860c:	8e02      	ldrh	r2, [r0, #48]	; 0x30
    860e:	4101      	asrs	r1, r0
    8610:	600e      	str	r6, [r1, #0]
    8612:	7e02      	ldrb	r2, [r0, #24]
    8614:	0e0a      	lsrs	r2, r1, #24
    8616:	4220      	tst	r0, r4
    8618:	000b      	movs	r3, r1
    861a:	0000      	movs	r0, r0
    861c:	000c      	movs	r4, r1
	...
    8626:	0000      	movs	r0, r0
    8628:	001c      	movs	r4, r3
    862a:	0000      	movs	r0, r0
    862c:	000c      	movs	r4, r1
	...
    8636:	0000      	movs	r0, r0
    8638:	0006      	movs	r6, r0
    863a:	0000      	movs	r0, r0
    863c:	0014      	movs	r4, r2
	...
    8646:	0000      	movs	r0, r0
    8648:	00c0      	lsls	r0, r0, #3
    864a:	0000      	movs	r0, r0
    864c:	0e44      	lsrs	r4, r0, #25
    864e:	8408      	strh	r0, [r1, #32]
    8650:	8e02      	ldrh	r2, [r0, #48]	; 0x30
    8652:	0001      	movs	r1, r0
    8654:	000c      	movs	r4, r1
	...
    865e:	0000      	movs	r0, r0
    8660:	0028      	movs	r0, r5
    8662:	0000      	movs	r0, r0
    8664:	000c      	movs	r4, r1
	...
    866e:	0000      	movs	r0, r0
    8670:	0014      	movs	r4, r2
    8672:	0000      	movs	r0, r0
    8674:	000c      	movs	r4, r1
	...
    867e:	0000      	movs	r0, r0
    8680:	0030      	movs	r0, r6
    8682:	0000      	movs	r0, r0
    8684:	0014      	movs	r4, r2
	...
    868e:	0000      	movs	r0, r0
    8690:	0024      	movs	r4, r4
    8692:	0000      	movs	r0, r0
    8694:	0e41      	lsrs	r1, r0, #25
    8696:	8308      	strh	r0, [r1, #24]
    8698:	8e02      	ldrh	r2, [r0, #48]	; 0x30
    869a:	0001      	movs	r1, r0
    869c:	000c      	movs	r4, r1
	...
    86a6:	0000      	movs	r0, r0
    86a8:	0020      	movs	r0, r4
    86aa:	0000      	movs	r0, r0
    86ac:	3b41      	subs	r3, #65	; 0x41
    86ae:	0000      	movs	r0, r0
    86b0:	6100      	str	r0, [r0, #16]
    86b2:	6165      	str	r5, [r4, #20]
    86b4:	6962      	ldr	r2, [r4, #20]
    86b6:	0100      	lsls	r0, r0, #4
    86b8:	0031      	movs	r1, r6
    86ba:	0000      	movs	r0, r0
    86bc:	4305      	orrs	r5, r0
    86be:	726f      	strb	r7, [r5, #9]
    86c0:	6574      	str	r4, [r6, #84]	; 0x54
    86c2:	2d78      	cmp	r5, #120	; 0x78
    86c4:	334d      	adds	r3, #77	; 0x4d
    86c6:	0033      	movs	r3, r6
    86c8:	1106      	asrs	r6, r0, #4
    86ca:	4d07      	ldr	r5, [pc, #28]	; (0x86e8)
    86cc:	0309      	lsls	r1, r1, #12
    86ce:	080a      	lsrs	r2, r1, #32
    86d0:	0412      	lsls	r2, r2, #16
    86d2:	0114      	lsls	r4, r2, #4
    86d4:	0115      	lsls	r5, r2, #4
    86d6:	0317      	lsls	r7, r2, #12
    86d8:	0118      	lsls	r0, r3, #4
    86da:	0119      	lsls	r1, r3, #4
    86dc:	011a      	lsls	r2, r3, #4
    86de:	011b      	lsls	r3, r3, #4
    86e0:	011c      	lsls	r4, r3, #4
    86e2:	041e      	lsls	r6, r3, #16
    86e4:	0122      	lsls	r2, r4, #4
    86e6:	012e      	lsls	r6, r5, #4
	...
    86f8:	0001      	movs	r1, r0
	...
    8702:	0000      	movs	r0, r0
    8704:	0004      	movs	r4, r0
    8706:	fff1 0000 	vcgt.s8	d16, d0, #0
	...
    8712:	0000      	movs	r0, r0
    8714:	0003      	movs	r3, r0
    8716:	0001      	movs	r1, r0
	...
    8724:	0003      	movs	r3, r0
    8726:	0002      	movs	r2, r0
	...
    8734:	0003      	movs	r3, r0
    8736:	0003      	movs	r3, r0
	...
    8744:	0003      	movs	r3, r0
    8746:	0004      	movs	r4, r0
    8748:	0011      	movs	r1, r2
	...
    8756:	0004      	movs	r4, r0
    8758:	0014      	movs	r4, r2
    875a:	0000      	movs	r0, r0
    875c:	007c      	lsls	r4, r7, #1
	...
    8766:	0004      	movs	r4, r0
	...
    8774:	0003      	movs	r3, r0
    8776:	0006      	movs	r6, r0
    8778:	0011      	movs	r1, r2
	...
    8786:	0006      	movs	r6, r0
    8788:	0014      	movs	r4, r2
    878a:	0000      	movs	r0, r0
    878c:	0008      	movs	r0, r1
	...
    8796:	0006      	movs	r6, r0
	...
    87a4:	0003      	movs	r3, r0
    87a6:	0007      	movs	r7, r0
    87a8:	0011      	movs	r1, r2
	...
    87b6:	0007      	movs	r7, r0
    87b8:	0014      	movs	r4, r2
    87ba:	0000      	movs	r0, r0
    87bc:	00bc      	lsls	r4, r7, #2
	...
    87c6:	0007      	movs	r7, r0
	...
    87d4:	0003      	movs	r3, r0
    87d6:	0009      	movs	r1, r1
    87d8:	0011      	movs	r1, r2
	...
    87e6:	0009      	movs	r1, r1
    87e8:	0014      	movs	r4, r2
    87ea:	0000      	movs	r0, r0
    87ec:	0130      	lsls	r0, r6, #4
	...
    87f6:	0009      	movs	r1, r1
	...
    8804:	0003      	movs	r3, r0
    8806:	000b      	movs	r3, r1
    8808:	0011      	movs	r1, r2
	...
    8816:	000b      	movs	r3, r1
    8818:	0014      	movs	r4, r2
    881a:	0000      	movs	r0, r0
    881c:	0164      	lsls	r4, r4, #5
	...
    8826:	000b      	movs	r3, r1
	...
    8834:	0003      	movs	r3, r0
    8836:	000d      	movs	r5, r1
    8838:	0011      	movs	r1, r2
	...
    8846:	000d      	movs	r5, r1
    8848:	0014      	movs	r4, r2
    884a:	0000      	movs	r0, r0
    884c:	0018      	movs	r0, r3
	...
    8856:	000d      	movs	r5, r1
	...
    8864:	0003      	movs	r3, r0
    8866:	000e      	movs	r6, r1
    8868:	0011      	movs	r1, r2
	...
    8876:	000e      	movs	r6, r1
	...
    8884:	0003      	movs	r3, r0
    8886:	000f      	movs	r7, r1
    8888:	0011      	movs	r1, r2
	...
    8896:	000f      	movs	r7, r1
    8898:	0014      	movs	r4, r2
    889a:	0000      	movs	r0, r0
    889c:	00bc      	lsls	r4, r7, #2
	...
    88a6:	000f      	movs	r7, r1
	...
    88b4:	0003      	movs	r3, r0
    88b6:	0010      	movs	r0, r2
    88b8:	0011      	movs	r1, r2
	...
    88c6:	0010      	movs	r0, r2
    88c8:	0014      	movs	r4, r2
    88ca:	0000      	movs	r0, r0
    88cc:	0020      	movs	r0, r4
	...
    88d6:	0010      	movs	r0, r2
	...
    88e4:	0003      	movs	r3, r0
    88e6:	0012      	movs	r2, r2
    88e8:	0011      	movs	r1, r2
	...
    88f6:	0012      	movs	r2, r2
    88f8:	0014      	movs	r4, r2
    88fa:	0000      	movs	r0, r0
    88fc:	0010      	movs	r0, r2
	...
    8906:	0012      	movs	r2, r2
	...
    8914:	0003      	movs	r3, r0
    8916:	0013      	movs	r3, r2
    8918:	0011      	movs	r1, r2
	...
    8926:	0013      	movs	r3, r2
    8928:	0014      	movs	r4, r2
    892a:	0000      	movs	r0, r0
    892c:	0028      	movs	r0, r5
	...
    8936:	0013      	movs	r3, r2
	...
    8944:	0003      	movs	r3, r0
    8946:	0014      	movs	r4, r2
    8948:	0011      	movs	r1, r2
	...
    8956:	0014      	movs	r4, r2
    8958:	0014      	movs	r4, r2
    895a:	0000      	movs	r0, r0
    895c:	0020      	movs	r0, r4
	...
    8966:	0014      	movs	r4, r2
	...
    8974:	0003      	movs	r3, r0
    8976:	0016      	movs	r6, r2
    8978:	0011      	movs	r1, r2
	...
    8986:	0016      	movs	r6, r2
    8988:	0014      	movs	r4, r2
    898a:	0000      	movs	r0, r0
    898c:	001c      	movs	r4, r3
	...
    8996:	0016      	movs	r6, r2
	...
    89a4:	0003      	movs	r3, r0
    89a6:	0017      	movs	r7, r2
	...
    89b4:	0003      	movs	r3, r0
    89b6:	0019      	movs	r1, r3
	...
    89c4:	0003      	movs	r3, r0
    89c6:	001a      	movs	r2, r3
	...
    89d4:	0003      	movs	r3, r0
    89d6:	001c      	movs	r4, r3
	...
    89e4:	0003      	movs	r3, r0
    89e6:	001e      	movs	r6, r3
	...
    89f4:	0003      	movs	r3, r0
    89f6:	0020      	movs	r0, r4
	...
    8a04:	0003      	movs	r3, r0
    8a06:	0022      	movs	r2, r4
	...
    8a14:	0003      	movs	r3, r0
    8a16:	0024      	movs	r4, r4
	...
    8a24:	0003      	movs	r3, r0
    8a26:	0023      	movs	r3, r4
	...
    8a34:	0003      	movs	r3, r0
    8a36:	0026      	movs	r6, r4
    8a38:	0017      	movs	r7, r2
    8a3a:	0000      	movs	r0, r0
    8a3c:	0001      	movs	r1, r0
    8a3e:	0000      	movs	r0, r0
    8a40:	008c      	lsls	r4, r1, #2
    8a42:	0000      	movs	r0, r0
    8a44:	0012      	movs	r2, r2
    8a46:	0004      	movs	r4, r0
    8a48:	002b      	movs	r3, r5
	...
    8a52:	0000      	movs	r0, r0
    8a54:	0010      	movs	r0, r2
    8a56:	0000      	movs	r0, r0
    8a58:	003b      	movs	r3, r7
	...
    8a62:	0000      	movs	r0, r0
    8a64:	0010      	movs	r0, r2
    8a66:	0000      	movs	r0, r0
    8a68:	004b      	lsls	r3, r1, #1
    8a6a:	0000      	movs	r0, r0
    8a6c:	0001      	movs	r1, r0
    8a6e:	0000      	movs	r0, r0
    8a70:	000c      	movs	r4, r1
    8a72:	0000      	movs	r0, r0
    8a74:	0012      	movs	r2, r2
    8a76:	0006      	movs	r6, r0
    8a78:	0062      	lsls	r2, r4, #1
    8a7a:	0000      	movs	r0, r0
    8a7c:	0001      	movs	r1, r0
    8a7e:	0000      	movs	r0, r0
    8a80:	00d0      	lsls	r0, r2, #3
    8a82:	0000      	movs	r0, r0
    8a84:	0012      	movs	r2, r2
    8a86:	0007      	movs	r7, r0
    8a88:	0077      	lsls	r7, r6, #1
	...
    8a92:	0000      	movs	r0, r0
    8a94:	0010      	movs	r0, r2
    8a96:	0000      	movs	r0, r0
    8a98:	007e      	lsls	r6, r7, #1
    8a9a:	0000      	movs	r0, r0
    8a9c:	0001      	movs	r1, r0
    8a9e:	0000      	movs	r0, r0
    8aa0:	0148      	lsls	r0, r1, #5
    8aa2:	0000      	movs	r0, r0
    8aa4:	0012      	movs	r2, r2
    8aa6:	0009      	movs	r1, r1
    8aa8:	0093      	lsls	r3, r2, #2
    8aaa:	0000      	movs	r0, r0
    8aac:	0001      	movs	r1, r0
    8aae:	0000      	movs	r0, r0
    8ab0:	0174      	lsls	r4, r6, #5
    8ab2:	0000      	movs	r0, r0
    8ab4:	0012      	movs	r2, r2
    8ab6:	000b      	movs	r3, r1
    8ab8:	00ac      	lsls	r4, r5, #2
    8aba:	0000      	movs	r0, r0
    8abc:	0001      	movs	r1, r0
    8abe:	0000      	movs	r0, r0
    8ac0:	001c      	movs	r4, r3
    8ac2:	0000      	movs	r0, r0
    8ac4:	0012      	movs	r2, r2
    8ac6:	000d      	movs	r5, r1
    8ac8:	00bd      	lsls	r5, r7, #2
    8aca:	0000      	movs	r0, r0
    8acc:	0001      	movs	r1, r0
    8ace:	0000      	movs	r0, r0
    8ad0:	0006      	movs	r6, r0
    8ad2:	0000      	movs	r0, r0
    8ad4:	0012      	movs	r2, r2
    8ad6:	000e      	movs	r6, r1
    8ad8:	00d1      	lsls	r1, r2, #3
    8ada:	0000      	movs	r0, r0
    8adc:	0001      	movs	r1, r0
    8ade:	0000      	movs	r0, r0
    8ae0:	00c0      	lsls	r0, r0, #3
    8ae2:	0000      	movs	r0, r0
    8ae4:	0012      	movs	r2, r2
    8ae6:	000f      	movs	r7, r1
    8ae8:	00e8      	lsls	r0, r5, #3
    8aea:	0000      	movs	r0, r0
    8aec:	0001      	movs	r1, r0
    8aee:	0000      	movs	r0, r0
    8af0:	0028      	movs	r0, r5
    8af2:	0000      	movs	r0, r0
    8af4:	0012      	movs	r2, r2
    8af6:	0010      	movs	r0, r2
    8af8:	0100      	lsls	r0, r0, #4
    8afa:	0000      	movs	r0, r0
    8afc:	0001      	movs	r1, r0
    8afe:	0000      	movs	r0, r0
    8b00:	0014      	movs	r4, r2
    8b02:	0000      	movs	r0, r0
    8b04:	0012      	movs	r2, r2
    8b06:	0012      	movs	r2, r2
    8b08:	011c      	lsls	r4, r3, #4
    8b0a:	0000      	movs	r0, r0
    8b0c:	0001      	movs	r1, r0
    8b0e:	0000      	movs	r0, r0
    8b10:	0030      	movs	r0, r6
    8b12:	0000      	movs	r0, r0
    8b14:	0012      	movs	r2, r2
    8b16:	0013      	movs	r3, r2
    8b18:	0132      	lsls	r2, r6, #4
    8b1a:	0000      	movs	r0, r0
    8b1c:	0001      	movs	r1, r0
    8b1e:	0000      	movs	r0, r0
    8b20:	0024      	movs	r4, r4
    8b22:	0000      	movs	r0, r0
    8b24:	0012      	movs	r2, r2
    8b26:	0014      	movs	r4, r2
    8b28:	014e      	lsls	r6, r1, #5
    8b2a:	0000      	movs	r0, r0
    8b2c:	0001      	movs	r1, r0
    8b2e:	0000      	movs	r0, r0
    8b30:	0020      	movs	r0, r4
    8b32:	0000      	movs	r0, r0
    8b34:	0012      	movs	r2, r2
    8b36:	0016      	movs	r6, r2
    8b38:	6600      	str	r0, [r0, #96]	; 0x60
    8b3a:	6c73      	ldr	r3, [r6, #68]	; 0x44
    8b3c:	705f      	strb	r7, [r3, #1]
    8b3e:	776f      	strb	r7, [r5, #29]
    8b40:	7265      	strb	r5, [r4, #9]
    8b42:	6c5f      	ldr	r7, [r3, #68]	; 0x44
    8b44:	6269      	str	r1, [r5, #36]	; 0x24
    8b46:	632e      	str	r6, [r5, #48]	; 0x30
    8b48:	2400      	movs	r4, #0
    8b4a:	0074      	lsls	r4, r6, #1
    8b4c:	6424      	str	r4, [r4, #64]	; 0x40
    8b4e:	5000      	str	r0, [r0, r0]
    8b50:	574f      	ldrsb	r7, [r1, r5]
    8b52:	5245      	strh	r5, [r0, r1]
    8b54:	455f      	cmp	r7, fp
    8b56:	746e      	strb	r6, [r5, #17]
    8b58:	7265      	strb	r5, [r4, #9]
    8b5a:	6f4c      	ldr	r4, [r1, #116]	; 0x74
    8b5c:	5077      	str	r7, [r6, r1]
    8b5e:	776f      	strb	r7, [r5, #29]
    8b60:	7265      	strb	r5, [r4, #9]
    8b62:	4300      	orrs	r0, r0
    8b64:	4f4c      	ldr	r7, [pc, #304]	; (0x8c98)
    8b66:	4b43      	ldr	r3, [pc, #268]	; (0x8c74)
    8b68:	415f      	adcs	r7, r3
    8b6a:	7474      	strb	r4, [r6, #17]
    8b6c:	6361      	str	r1, [r4, #52]	; 0x34
    8b6e:	4368      	muls	r0, r5
    8b70:	6b6c      	ldr	r4, [r5, #52]	; 0x34
    8b72:	4300      	orrs	r0, r0
    8b74:	4f4c      	ldr	r7, [pc, #304]	; (0x8ca8)
    8b76:	4b43      	ldr	r3, [pc, #268]	; (0x8c84)
    8b78:	535f      	strh	r7, [r3, r5]
    8b7a:	7465      	strb	r5, [r4, #17]
    8b7c:	6c43      	ldr	r3, [r0, #68]	; 0x44
    8b7e:	446b      	add	r3, sp
    8b80:	7669      	strb	r1, [r5, #25]
    8b82:	5000      	str	r0, [r0, r0]
    8b84:	574f      	ldrsb	r7, [r1, r5]
    8b86:	5245      	strh	r5, [r0, r1]
    8b88:	435f      	muls	r7, r3
    8b8a:	6379      	str	r1, [r7, #52]	; 0x34
    8b8c:	656c      	str	r4, [r5, #84]	; 0x54
    8b8e:	7043      	strb	r3, [r0, #1]
    8b90:	4175      	adcs	r5, r6
    8b92:	646e      	str	r6, [r5, #68]	; 0x44
    8b94:	6c46      	ldr	r6, [r0, #68]	; 0x44
    8b96:	7361      	strb	r1, [r4, #13]
    8b98:	0068      	lsls	r0, r5, #1
    8b9a:	4f50      	ldr	r7, [pc, #320]	; (0x8cdc)
    8b9c:	4557      	cmp	r7, sl
    8b9e:	5f52      	ldrsh	r2, [r2, r5]
    8ba0:	6e45      	ldr	r5, [r0, #100]	; 0x64
    8ba2:	6574      	str	r4, [r6, #84]	; 0x54
    8ba4:	4472      	add	r2, lr
    8ba6:	6565      	str	r5, [r4, #84]	; 0x54
    8ba8:	5370      	strh	r0, [r6, r5]
    8baa:	656c      	str	r4, [r5, #84]	; 0x54
    8bac:	7065      	strb	r5, [r4, #1]
    8bae:	6d00      	ldr	r0, [r0, #80]	; 0x50
    8bb0:	6d65      	ldr	r5, [r4, #84]	; 0x54
    8bb2:	6573      	str	r3, [r6, #84]	; 0x54
    8bb4:	0074      	lsls	r4, r6, #1
    8bb6:	4f50      	ldr	r7, [pc, #320]	; (0x8cf8)
    8bb8:	4557      	cmp	r7, sl
    8bba:	5f52      	ldrsh	r2, [r2, r5]
    8bbc:	6e45      	ldr	r5, [r0, #100]	; 0x64
    8bbe:	6574      	str	r4, [r6, #84]	; 0x54
    8bc0:	5072      	str	r2, [r6, r1]
    8bc2:	776f      	strb	r7, [r5, #29]
    8bc4:	7265      	strb	r5, [r4, #9]
    8bc6:	6f44      	ldr	r4, [r0, #116]	; 0x74
    8bc8:	6e77      	ldr	r7, [r6, #100]	; 0x64
    8bca:	5000      	str	r0, [r0, r0]
    8bcc:	574f      	ldrsb	r7, [r1, r5]
    8bce:	5245      	strh	r5, [r0, r1]
    8bd0:	455f      	cmp	r7, fp
    8bd2:	746e      	strb	r6, [r5, #17]
    8bd4:	7265      	strb	r5, [r4, #9]
    8bd6:	6544      	str	r4, [r0, #84]	; 0x54
    8bd8:	7065      	strb	r5, [r4, #1]
    8bda:	6f50      	ldr	r0, [r2, #116]	; 0x74
    8bdc:	6577      	str	r7, [r6, #84]	; 0x54
    8bde:	4472      	add	r2, lr
    8be0:	776f      	strb	r7, [r5, #29]
    8be2:	006e      	lsls	r6, r5, #1
    8be4:	4f50      	ldr	r7, [pc, #320]	; (0x8d28)
    8be6:	4557      	cmp	r7, sl
    8be8:	5f52      	ldrsh	r2, [r2, r5]
    8bea:	6e45      	ldr	r5, [r0, #100]	; 0x64
    8bec:	6574      	str	r4, [r6, #84]	; 0x54
    8bee:	5372      	strh	r2, [r6, r5]
    8bf0:	656c      	str	r4, [r5, #84]	; 0x54
    8bf2:	7065      	strb	r5, [r4, #1]
    8bf4:	5000      	str	r0, [r0, r0]
    8bf6:	574f      	ldrsb	r7, [r1, r5]
    8bf8:	5245      	strh	r5, [r0, r1]
    8bfa:	475f      	bx	fp
    8bfc:	7465      	strb	r5, [r4, #17]
    8bfe:	694c      	ldr	r4, [r1, #20]
    8c00:	5662      	ldrsb	r2, [r4, r1]
    8c02:	7265      	strb	r5, [r4, #9]
    8c04:	6973      	ldr	r3, [r6, #20]
    8c06:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    8c08:	6e00      	ldr	r0, [r0, #96]	; 0x60
    8c0a:	6f69      	ldr	r1, [r5, #116]	; 0x74
    8c0c:	735f      	strb	r7, [r3, #13]
    8c0e:	7465      	strb	r5, [r4, #17]
    8c10:	735f      	strb	r7, [r3, #13]
    8c12:	7379      	strb	r1, [r7, #13]
    8c14:	6574      	str	r4, [r6, #84]	; 0x54
    8c16:	5f6d      	ldrsh	r5, [r5, r5]
    8c18:	6f76      	ldr	r6, [r6, #116]	; 0x74
    8c1a:	746c      	strb	r4, [r5, #17]
    8c1c:	6761      	str	r1, [r4, #116]	; 0x74
    8c1e:	0065      	lsls	r5, r4, #1
    8c20:	4f50      	ldr	r7, [pc, #320]	; (0x8d64)
    8c22:	4557      	cmp	r7, sl
    8c24:	5f52      	ldrsh	r2, [r2, r5]
    8c26:	6553      	str	r3, [r2, #84]	; 0x54
    8c28:	5674      	ldrsb	r4, [r6, r1]
    8c2a:	6c6f      	ldr	r7, [r5, #68]	; 0x44
    8c2c:	6174      	str	r4, [r6, #20]
    8c2e:	6567      	str	r7, [r4, #84]	; 0x54
    8c30:	6f46      	ldr	r6, [r0, #116]	; 0x74
    8c32:	4672      	mov	r2, lr
    8c34:	6572      	str	r2, [r6, #84]	; 0x54
    8c36:	0071      	lsls	r1, r6, #1
    8c38:	4f50      	ldr	r7, [pc, #320]	; (0x8d7c)
    8c3a:	4557      	cmp	r7, sl
    8c3c:	5f52      	ldrsh	r2, [r2, r5]
    8c3e:	7458      	strb	r0, [r3, #17]
    8c40:	6c61      	ldr	r1, [r4, #68]	; 0x44
    8c42:	3233      	adds	r2, #51	; 0x33
    8c44:	686b      	ldr	r3, [r5, #4]
    8c46:	437a      	muls	r2, r7
    8c48:	7061      	strb	r1, [r4, #1]
    8c4a:	6261      	str	r1, [r4, #36]	; 0x24
    8c4c:	6e61      	ldr	r1, [r4, #100]	; 0x64
    8c4e:	546b      	strb	r3, [r5, r1]
    8c50:	6972      	ldr	r2, [r6, #20]
    8c52:	006d      	lsls	r5, r5, #1
    8c54:	4f50      	ldr	r7, [pc, #320]	; (0x8d98)
    8c56:	4557      	cmp	r7, sl
    8c58:	5f52      	ldrsh	r2, [r2, r5]
    8c5a:	6553      	str	r3, [r2, #84]	; 0x54
    8c5c:	5874      	ldr	r4, [r6, r1]
    8c5e:	6174      	str	r4, [r6, #20]
    8c60:	316c      	adds	r1, #108	; 0x6c
    8c62:	6d36      	ldr	r6, [r6, #80]	; 0x50
    8c64:	7a68      	ldrb	r0, [r5, #9]
    8c66:	644c      	str	r4, [r1, #68]	; 0x44
    8c68:	006f      	lsls	r7, r5, #1
    8c6a:	4f50      	ldr	r7, [pc, #320]	; (0x8dac)
    8c6c:	4557      	cmp	r7, sl
    8c6e:	5f52      	ldrsh	r2, [r2, r5]
    8c70:	7458      	strb	r0, [r3, #17]
    8c72:	6c61      	ldr	r1, [r4, #68]	; 0x44
    8c74:	3631      	adds	r6, #49	; 0x31
    8c76:	686d      	ldr	r5, [r5, #4]
    8c78:	437a      	muls	r2, r7
    8c7a:	7061      	strb	r1, [r4, #1]
    8c7c:	6261      	str	r1, [r4, #36]	; 0x24
    8c7e:	6e61      	ldr	r1, [r4, #100]	; 0x64
    8c80:	546b      	strb	r3, [r5, r1]
    8c82:	6972      	ldr	r2, [r6, #20]
    8c84:	006d      	lsls	r5, r5, #1
    8c86:	4f50      	ldr	r7, [pc, #320]	; (0x8dc8)
    8c88:	4557      	cmp	r7, sl
    8c8a:	5f52      	ldrsh	r2, [r2, r5]
    8c8c:	6553      	str	r3, [r2, #84]	; 0x54
    8c8e:	5874      	ldr	r4, [r6, r1]
    8c90:	6174      	str	r4, [r6, #20]
    8c92:	316c      	adds	r1, #108	; 0x6c
    8c94:	6d36      	ldr	r6, [r6, #80]	; 0x50
    8c96:	7a68      	ldrb	r0, [r5, #9]
    8c98:	7254      	strb	r4, [r2, #9]
    8c9a:	6d69      	ldr	r1, [r5, #84]	; 0x54
    8c9c:	0000      	movs	r0, r0
    8c9e:	0000      	movs	r0, r0
    8ca0:	003e      	movs	r6, r7
    8ca2:	0000      	movs	r0, r0
    8ca4:	360a      	adds	r6, #10
    8ca6:	0000      	movs	r0, r0
    8ca8:	0048      	lsls	r0, r1, #1
    8caa:	0000      	movs	r0, r0
    8cac:	370a      	adds	r7, #10
    8cae:	0000      	movs	r0, r0
    8cb0:	0014      	movs	r4, r2
    8cb2:	0000      	movs	r0, r0
    8cb4:	3a0a      	subs	r2, #10
    8cb6:	0000      	movs	r0, r0
    8cb8:	00a0      	lsls	r0, r4, #2
    8cba:	0000      	movs	r0, r0
    8cbc:	350a      	adds	r5, #10
    8cbe:	0000      	movs	r0, r0
    8cc0:	0014      	movs	r4, r2
    8cc2:	0000      	movs	r0, r0
    8cc4:	3a0a      	subs	r2, #10
    8cc6:	0000      	movs	r0, r0
    8cc8:	00d6      	lsls	r6, r2, #3
    8cca:	0000      	movs	r0, r0
    8ccc:	350a      	adds	r5, #10
    8cce:	0000      	movs	r0, r0
    8cd0:	0016      	movs	r6, r2
    8cd2:	0000      	movs	r0, r0
    8cd4:	3a0a      	subs	r2, #10
    8cd6:	0000      	movs	r0, r0
    8cd8:	00ec      	lsls	r4, r5, #3
    8cda:	0000      	movs	r0, r0
    8cdc:	350a      	adds	r5, #10
    8cde:	0000      	movs	r0, r0
    8ce0:	000a      	movs	r2, r1
    8ce2:	0000      	movs	r0, r0
    8ce4:	3f1e      	subs	r7, #30
    8ce6:	0000      	movs	r0, r0
    8ce8:	0002      	movs	r2, r0
    8cea:	0000      	movs	r0, r0
    8cec:	420a      	tst	r2, r1
    8cee:	0000      	movs	r0, r0
    8cf0:	0006      	movs	r6, r0
    8cf2:	0000      	movs	r0, r0
    8cf4:	2c02      	cmp	r4, #2
    8cf6:	0000      	movs	r0, r0
    8cf8:	000c      	movs	r4, r1
    8cfa:	0000      	movs	r0, r0
    8cfc:	3102      	adds	r1, #2
    8cfe:	0000      	movs	r0, r0
    8d00:	0011      	movs	r1, r2
    8d02:	0000      	movs	r0, r0
    8d04:	3102      	adds	r1, #2
    8d06:	0000      	movs	r0, r0
    8d08:	0015      	movs	r5, r2
    8d0a:	0000      	movs	r0, r0
    8d0c:	3102      	adds	r1, #2
    8d0e:	0000      	movs	r0, r0
    8d10:	0019      	movs	r1, r3
    8d12:	0000      	movs	r0, r0
    8d14:	2f02      	cmp	r7, #2
    8d16:	0000      	movs	r0, r0
    8d18:	0021      	movs	r1, r4
    8d1a:	0000      	movs	r0, r0
    8d1c:	3002      	adds	r0, #2
    8d1e:	0000      	movs	r0, r0
    8d20:	0028      	movs	r0, r5
    8d22:	0000      	movs	r0, r0
    8d24:	3102      	adds	r1, #2
    8d26:	0000      	movs	r0, r0
    8d28:	002f      	movs	r7, r5
    8d2a:	0000      	movs	r0, r0
    8d2c:	3102      	adds	r1, #2
    8d2e:	0000      	movs	r0, r0
    8d30:	003d      	movs	r5, r7
    8d32:	0000      	movs	r0, r0
    8d34:	3102      	adds	r1, #2
    8d36:	0000      	movs	r0, r0
    8d38:	0044      	lsls	r4, r0, #1
    8d3a:	0000      	movs	r0, r0
    8d3c:	3102      	adds	r1, #2
    8d3e:	0000      	movs	r0, r0
    8d40:	0049      	lsls	r1, r1, #1
    8d42:	0000      	movs	r0, r0
    8d44:	3102      	adds	r1, #2
    8d46:	0000      	movs	r0, r0
    8d48:	0056      	lsls	r6, r2, #1
    8d4a:	0000      	movs	r0, r0
    8d4c:	3102      	adds	r1, #2
    8d4e:	0000      	movs	r0, r0
    8d50:	005b      	lsls	r3, r3, #1
    8d52:	0000      	movs	r0, r0
    8d54:	3102      	adds	r1, #2
    8d56:	0000      	movs	r0, r0
    8d58:	0079      	lsls	r1, r7, #1
    8d5a:	0000      	movs	r0, r0
    8d5c:	3102      	adds	r1, #2
    8d5e:	0000      	movs	r0, r0
    8d60:	0087      	lsls	r7, r0, #2
    8d62:	0000      	movs	r0, r0
    8d64:	3102      	adds	r1, #2
    8d66:	0000      	movs	r0, r0
    8d68:	008c      	lsls	r4, r1, #2
    8d6a:	0000      	movs	r0, r0
    8d6c:	3102      	adds	r1, #2
    8d6e:	0000      	movs	r0, r0
    8d70:	009e      	lsls	r6, r3, #2
    8d72:	0000      	movs	r0, r0
    8d74:	3102      	adds	r1, #2
    8d76:	0000      	movs	r0, r0
    8d78:	00a5      	lsls	r5, r4, #2
    8d7a:	0000      	movs	r0, r0
    8d7c:	3102      	adds	r1, #2
    8d7e:	0000      	movs	r0, r0
    8d80:	00aa      	lsls	r2, r5, #2
    8d82:	0000      	movs	r0, r0
    8d84:	3102      	adds	r1, #2
    8d86:	0000      	movs	r0, r0
    8d88:	00ba      	lsls	r2, r7, #2
    8d8a:	0000      	movs	r0, r0
    8d8c:	3102      	adds	r1, #2
    8d8e:	0000      	movs	r0, r0
    8d90:	00d6      	lsls	r6, r2, #3
    8d92:	0000      	movs	r0, r0
    8d94:	3102      	adds	r1, #2
    8d96:	0000      	movs	r0, r0
    8d98:	00db      	lsls	r3, r3, #3
    8d9a:	0000      	movs	r0, r0
    8d9c:	3102      	adds	r1, #2
    8d9e:	0000      	movs	r0, r0
    8da0:	00f5      	lsls	r5, r6, #3
    8da2:	0000      	movs	r0, r0
    8da4:	3102      	adds	r1, #2
    8da6:	0000      	movs	r0, r0
    8da8:	0102      	lsls	r2, r0, #4
    8daa:	0000      	movs	r0, r0
    8dac:	3102      	adds	r1, #2
    8dae:	0000      	movs	r0, r0
    8db0:	010f      	lsls	r7, r1, #4
    8db2:	0000      	movs	r0, r0
    8db4:	3102      	adds	r1, #2
    8db6:	0000      	movs	r0, r0
    8db8:	011c      	lsls	r4, r3, #4
    8dba:	0000      	movs	r0, r0
    8dbc:	3102      	adds	r1, #2
    8dbe:	0000      	movs	r0, r0
    8dc0:	0129      	lsls	r1, r5, #4
    8dc2:	0000      	movs	r0, r0
    8dc4:	3102      	adds	r1, #2
    8dc6:	0000      	movs	r0, r0
    8dc8:	0137      	lsls	r7, r6, #4
    8dca:	0000      	movs	r0, r0
    8dcc:	3102      	adds	r1, #2
    8dce:	0000      	movs	r0, r0
    8dd0:	0145      	lsls	r5, r0, #5
    8dd2:	0000      	movs	r0, r0
    8dd4:	3102      	adds	r1, #2
    8dd6:	0000      	movs	r0, r0
    8dd8:	0153      	lsls	r3, r2, #5
    8dda:	0000      	movs	r0, r0
    8ddc:	3102      	adds	r1, #2
    8dde:	0000      	movs	r0, r0
    8de0:	0161      	lsls	r1, r4, #5
    8de2:	0000      	movs	r0, r0
    8de4:	3102      	adds	r1, #2
    8de6:	0000      	movs	r0, r0
    8de8:	016f      	lsls	r7, r5, #5
    8dea:	0000      	movs	r0, r0
    8dec:	3102      	adds	r1, #2
    8dee:	0000      	movs	r0, r0
    8df0:	017d      	lsls	r5, r7, #5
    8df2:	0000      	movs	r0, r0
    8df4:	3102      	adds	r1, #2
    8df6:	0000      	movs	r0, r0
    8df8:	018b      	lsls	r3, r1, #6
    8dfa:	0000      	movs	r0, r0
    8dfc:	3102      	adds	r1, #2
    8dfe:	0000      	movs	r0, r0
    8e00:	01a7      	lsls	r7, r4, #6
    8e02:	0000      	movs	r0, r0
    8e04:	3102      	adds	r1, #2
    8e06:	0000      	movs	r0, r0
    8e08:	01b5      	lsls	r5, r6, #6
    8e0a:	0000      	movs	r0, r0
    8e0c:	3102      	adds	r1, #2
    8e0e:	0000      	movs	r0, r0
    8e10:	0210      	lsls	r0, r2, #8
    8e12:	0000      	movs	r0, r0
    8e14:	3102      	adds	r1, #2
    8e16:	0000      	movs	r0, r0
    8e18:	0226      	lsls	r6, r4, #8
    8e1a:	0000      	movs	r0, r0
    8e1c:	3102      	adds	r1, #2
    8e1e:	0000      	movs	r0, r0
    8e20:	0233      	lsls	r3, r6, #8
    8e22:	0000      	movs	r0, r0
    8e24:	3102      	adds	r1, #2
    8e26:	0000      	movs	r0, r0
    8e28:	0240      	lsls	r0, r0, #9
    8e2a:	0000      	movs	r0, r0
    8e2c:	3102      	adds	r1, #2
    8e2e:	0000      	movs	r0, r0
    8e30:	024d      	lsls	r5, r1, #9
    8e32:	0000      	movs	r0, r0
    8e34:	3102      	adds	r1, #2
    8e36:	0000      	movs	r0, r0
    8e38:	0274      	lsls	r4, r6, #9
    8e3a:	0000      	movs	r0, r0
    8e3c:	3102      	adds	r1, #2
    8e3e:	0000      	movs	r0, r0
    8e40:	0281      	lsls	r1, r0, #10
    8e42:	0000      	movs	r0, r0
    8e44:	3102      	adds	r1, #2
    8e46:	0000      	movs	r0, r0
    8e48:	028e      	lsls	r6, r1, #10
    8e4a:	0000      	movs	r0, r0
    8e4c:	3102      	adds	r1, #2
    8e4e:	0000      	movs	r0, r0
    8e50:	029b      	lsls	r3, r3, #10
    8e52:	0000      	movs	r0, r0
    8e54:	3102      	adds	r1, #2
    8e56:	0000      	movs	r0, r0
    8e58:	02a8      	lsls	r0, r5, #10
    8e5a:	0000      	movs	r0, r0
    8e5c:	3102      	adds	r1, #2
    8e5e:	0000      	movs	r0, r0
    8e60:	02b5      	lsls	r5, r6, #10
    8e62:	0000      	movs	r0, r0
    8e64:	3102      	adds	r1, #2
    8e66:	0000      	movs	r0, r0
    8e68:	02c2      	lsls	r2, r0, #11
    8e6a:	0000      	movs	r0, r0
    8e6c:	3102      	adds	r1, #2
    8e6e:	0000      	movs	r0, r0
    8e70:	02cf      	lsls	r7, r1, #11
    8e72:	0000      	movs	r0, r0
    8e74:	3102      	adds	r1, #2
    8e76:	0000      	movs	r0, r0
    8e78:	02dc      	lsls	r4, r3, #11
    8e7a:	0000      	movs	r0, r0
    8e7c:	3102      	adds	r1, #2
    8e7e:	0000      	movs	r0, r0
    8e80:	02e9      	lsls	r1, r5, #11
    8e82:	0000      	movs	r0, r0
    8e84:	3102      	adds	r1, #2
    8e86:	0000      	movs	r0, r0
    8e88:	02f6      	lsls	r6, r6, #11
    8e8a:	0000      	movs	r0, r0
    8e8c:	3102      	adds	r1, #2
    8e8e:	0000      	movs	r0, r0
    8e90:	0303      	lsls	r3, r0, #12
    8e92:	0000      	movs	r0, r0
    8e94:	3102      	adds	r1, #2
    8e96:	0000      	movs	r0, r0
    8e98:	0310      	lsls	r0, r2, #12
    8e9a:	0000      	movs	r0, r0
    8e9c:	3102      	adds	r1, #2
    8e9e:	0000      	movs	r0, r0
    8ea0:	031d      	lsls	r5, r3, #12
    8ea2:	0000      	movs	r0, r0
    8ea4:	3102      	adds	r1, #2
    8ea6:	0000      	movs	r0, r0
    8ea8:	0337      	lsls	r7, r6, #12
    8eaa:	0000      	movs	r0, r0
    8eac:	3102      	adds	r1, #2
    8eae:	0000      	movs	r0, r0
    8eb0:	0344      	lsls	r4, r0, #13
    8eb2:	0000      	movs	r0, r0
    8eb4:	3102      	adds	r1, #2
    8eb6:	0000      	movs	r0, r0
    8eb8:	0351      	lsls	r1, r2, #13
    8eba:	0000      	movs	r0, r0
    8ebc:	3102      	adds	r1, #2
    8ebe:	0000      	movs	r0, r0
    8ec0:	035e      	lsls	r6, r3, #13
    8ec2:	0000      	movs	r0, r0
    8ec4:	3102      	adds	r1, #2
    8ec6:	0000      	movs	r0, r0
    8ec8:	036b      	lsls	r3, r5, #13
    8eca:	0000      	movs	r0, r0
    8ecc:	3102      	adds	r1, #2
    8ece:	0000      	movs	r0, r0
    8ed0:	0378      	lsls	r0, r7, #13
    8ed2:	0000      	movs	r0, r0
    8ed4:	3102      	adds	r1, #2
    8ed6:	0000      	movs	r0, r0
    8ed8:	0386      	lsls	r6, r0, #14
    8eda:	0000      	movs	r0, r0
    8edc:	3102      	adds	r1, #2
    8ede:	0000      	movs	r0, r0
    8ee0:	0394      	lsls	r4, r2, #14
    8ee2:	0000      	movs	r0, r0
    8ee4:	3102      	adds	r1, #2
    8ee6:	0000      	movs	r0, r0
    8ee8:	03a2      	lsls	r2, r4, #14
    8eea:	0000      	movs	r0, r0
    8eec:	3102      	adds	r1, #2
    8eee:	0000      	movs	r0, r0
    8ef0:	03b0      	lsls	r0, r6, #14
    8ef2:	0000      	movs	r0, r0
    8ef4:	3102      	adds	r1, #2
    8ef6:	0000      	movs	r0, r0
    8ef8:	03be      	lsls	r6, r7, #14
    8efa:	0000      	movs	r0, r0
    8efc:	3102      	adds	r1, #2
    8efe:	0000      	movs	r0, r0
    8f00:	03cc      	lsls	r4, r1, #15
    8f02:	0000      	movs	r0, r0
    8f04:	3102      	adds	r1, #2
    8f06:	0000      	movs	r0, r0
    8f08:	03da      	lsls	r2, r3, #15
    8f0a:	0000      	movs	r0, r0
    8f0c:	3102      	adds	r1, #2
    8f0e:	0000      	movs	r0, r0
    8f10:	03e8      	lsls	r0, r5, #15
    8f12:	0000      	movs	r0, r0
    8f14:	3102      	adds	r1, #2
    8f16:	0000      	movs	r0, r0
    8f18:	03f6      	lsls	r6, r6, #15
    8f1a:	0000      	movs	r0, r0
    8f1c:	3102      	adds	r1, #2
    8f1e:	0000      	movs	r0, r0
    8f20:	0404      	lsls	r4, r0, #16
    8f22:	0000      	movs	r0, r0
    8f24:	3102      	adds	r1, #2
    8f26:	0000      	movs	r0, r0
    8f28:	0412      	lsls	r2, r2, #16
    8f2a:	0000      	movs	r0, r0
    8f2c:	3102      	adds	r1, #2
    8f2e:	0000      	movs	r0, r0
    8f30:	0420      	lsls	r0, r4, #16
    8f32:	0000      	movs	r0, r0
    8f34:	3102      	adds	r1, #2
    8f36:	0000      	movs	r0, r0
    8f38:	042e      	lsls	r6, r5, #16
    8f3a:	0000      	movs	r0, r0
    8f3c:	3102      	adds	r1, #2
    8f3e:	0000      	movs	r0, r0
    8f40:	043c      	lsls	r4, r7, #16
    8f42:	0000      	movs	r0, r0
    8f44:	3102      	adds	r1, #2
    8f46:	0000      	movs	r0, r0
    8f48:	044a      	lsls	r2, r1, #17
    8f4a:	0000      	movs	r0, r0
    8f4c:	3102      	adds	r1, #2
    8f4e:	0000      	movs	r0, r0
    8f50:	0458      	lsls	r0, r3, #17
    8f52:	0000      	movs	r0, r0
    8f54:	3102      	adds	r1, #2
    8f56:	0000      	movs	r0, r0
    8f58:	0466      	lsls	r6, r4, #17
    8f5a:	0000      	movs	r0, r0
    8f5c:	3102      	adds	r1, #2
    8f5e:	0000      	movs	r0, r0
    8f60:	0474      	lsls	r4, r6, #17
    8f62:	0000      	movs	r0, r0
    8f64:	3102      	adds	r1, #2
    8f66:	0000      	movs	r0, r0
    8f68:	0482      	lsls	r2, r0, #18
    8f6a:	0000      	movs	r0, r0
    8f6c:	3102      	adds	r1, #2
    8f6e:	0000      	movs	r0, r0
    8f70:	0490      	lsls	r0, r2, #18
    8f72:	0000      	movs	r0, r0
    8f74:	3102      	adds	r1, #2
    8f76:	0000      	movs	r0, r0
    8f78:	049e      	lsls	r6, r3, #18
    8f7a:	0000      	movs	r0, r0
    8f7c:	3102      	adds	r1, #2
    8f7e:	0000      	movs	r0, r0
    8f80:	04ac      	lsls	r4, r5, #18
    8f82:	0000      	movs	r0, r0
    8f84:	3102      	adds	r1, #2
    8f86:	0000      	movs	r0, r0
    8f88:	04ba      	lsls	r2, r7, #18
    8f8a:	0000      	movs	r0, r0
    8f8c:	3102      	adds	r1, #2
    8f8e:	0000      	movs	r0, r0
    8f90:	056c      	lsls	r4, r5, #21
    8f92:	0000      	movs	r0, r0
    8f94:	3102      	adds	r1, #2
    8f96:	0000      	movs	r0, r0
    8f98:	058d      	lsls	r5, r1, #22
    8f9a:	0000      	movs	r0, r0
    8f9c:	3102      	adds	r1, #2
    8f9e:	0000      	movs	r0, r0
    8fa0:	0599      	lsls	r1, r3, #22
    8fa2:	0000      	movs	r0, r0
    8fa4:	3102      	adds	r1, #2
    8fa6:	0000      	movs	r0, r0
    8fa8:	0653      	lsls	r3, r2, #25
    8faa:	0000      	movs	r0, r0
    8fac:	3102      	adds	r1, #2
    8fae:	0000      	movs	r0, r0
    8fb0:	0660      	lsls	r0, r4, #25
    8fb2:	0000      	movs	r0, r0
    8fb4:	3102      	adds	r1, #2
    8fb6:	0000      	movs	r0, r0
    8fb8:	066d      	lsls	r5, r5, #25
    8fba:	0000      	movs	r0, r0
    8fbc:	3102      	adds	r1, #2
    8fbe:	0000      	movs	r0, r0
    8fc0:	067a      	lsls	r2, r7, #25
    8fc2:	0000      	movs	r0, r0
    8fc4:	3102      	adds	r1, #2
    8fc6:	0000      	movs	r0, r0
    8fc8:	0687      	lsls	r7, r0, #26
    8fca:	0000      	movs	r0, r0
    8fcc:	3102      	adds	r1, #2
    8fce:	0000      	movs	r0, r0
    8fd0:	0694      	lsls	r4, r2, #26
    8fd2:	0000      	movs	r0, r0
    8fd4:	3102      	adds	r1, #2
    8fd6:	0000      	movs	r0, r0
    8fd8:	06a1      	lsls	r1, r4, #26
    8fda:	0000      	movs	r0, r0
    8fdc:	3102      	adds	r1, #2
    8fde:	0000      	movs	r0, r0
    8fe0:	06ae      	lsls	r6, r5, #26
    8fe2:	0000      	movs	r0, r0
    8fe4:	3102      	adds	r1, #2
    8fe6:	0000      	movs	r0, r0
    8fe8:	06bb      	lsls	r3, r7, #26
    8fea:	0000      	movs	r0, r0
    8fec:	3102      	adds	r1, #2
    8fee:	0000      	movs	r0, r0
    8ff0:	06c8      	lsls	r0, r1, #27
    8ff2:	0000      	movs	r0, r0
    8ff4:	3102      	adds	r1, #2
    8ff6:	0000      	movs	r0, r0
    8ff8:	06d5      	lsls	r5, r2, #27
    8ffa:	0000      	movs	r0, r0
    8ffc:	3102      	adds	r1, #2
    8ffe:	0000      	movs	r0, r0
    9000:	06e2      	lsls	r2, r4, #27
    9002:	0000      	movs	r0, r0
    9004:	3102      	adds	r1, #2
    9006:	0000      	movs	r0, r0
    9008:	06ef      	lsls	r7, r5, #27
    900a:	0000      	movs	r0, r0
    900c:	3102      	adds	r1, #2
    900e:	0000      	movs	r0, r0
    9010:	06fc      	lsls	r4, r7, #27
    9012:	0000      	movs	r0, r0
    9014:	3102      	adds	r1, #2
    9016:	0000      	movs	r0, r0
    9018:	0709      	lsls	r1, r1, #28
    901a:	0000      	movs	r0, r0
    901c:	3102      	adds	r1, #2
    901e:	0000      	movs	r0, r0
    9020:	0716      	lsls	r6, r2, #28
    9022:	0000      	movs	r0, r0
    9024:	3102      	adds	r1, #2
    9026:	0000      	movs	r0, r0
    9028:	0723      	lsls	r3, r4, #28
    902a:	0000      	movs	r0, r0
    902c:	3102      	adds	r1, #2
    902e:	0000      	movs	r0, r0
    9030:	0730      	lsls	r0, r6, #28
    9032:	0000      	movs	r0, r0
    9034:	3102      	adds	r1, #2
    9036:	0000      	movs	r0, r0
    9038:	073d      	lsls	r5, r7, #28
    903a:	0000      	movs	r0, r0
    903c:	3102      	adds	r1, #2
    903e:	0000      	movs	r0, r0
    9040:	074a      	lsls	r2, r1, #29
    9042:	0000      	movs	r0, r0
    9044:	3102      	adds	r1, #2
    9046:	0000      	movs	r0, r0
    9048:	0757      	lsls	r7, r2, #29
    904a:	0000      	movs	r0, r0
    904c:	3102      	adds	r1, #2
    904e:	0000      	movs	r0, r0
    9050:	0764      	lsls	r4, r4, #29
    9052:	0000      	movs	r0, r0
    9054:	3102      	adds	r1, #2
    9056:	0000      	movs	r0, r0
    9058:	0771      	lsls	r1, r6, #29
    905a:	0000      	movs	r0, r0
    905c:	3102      	adds	r1, #2
    905e:	0000      	movs	r0, r0
    9060:	077e      	lsls	r6, r7, #29
    9062:	0000      	movs	r0, r0
    9064:	3102      	adds	r1, #2
    9066:	0000      	movs	r0, r0
    9068:	078b      	lsls	r3, r1, #30
    906a:	0000      	movs	r0, r0
    906c:	3102      	adds	r1, #2
    906e:	0000      	movs	r0, r0
    9070:	0798      	lsls	r0, r3, #30
    9072:	0000      	movs	r0, r0
    9074:	3102      	adds	r1, #2
    9076:	0000      	movs	r0, r0
    9078:	07a5      	lsls	r5, r4, #30
    907a:	0000      	movs	r0, r0
    907c:	3102      	adds	r1, #2
    907e:	0000      	movs	r0, r0
    9080:	07b2      	lsls	r2, r6, #30
    9082:	0000      	movs	r0, r0
    9084:	3102      	adds	r1, #2
    9086:	0000      	movs	r0, r0
    9088:	07bf      	lsls	r7, r7, #30
    908a:	0000      	movs	r0, r0
    908c:	3102      	adds	r1, #2
    908e:	0000      	movs	r0, r0
    9090:	07cc      	lsls	r4, r1, #31
    9092:	0000      	movs	r0, r0
    9094:	3102      	adds	r1, #2
    9096:	0000      	movs	r0, r0
    9098:	07da      	lsls	r2, r3, #31
    909a:	0000      	movs	r0, r0
    909c:	3102      	adds	r1, #2
    909e:	0000      	movs	r0, r0
    90a0:	07e8      	lsls	r0, r5, #31
    90a2:	0000      	movs	r0, r0
    90a4:	3102      	adds	r1, #2
    90a6:	0000      	movs	r0, r0
    90a8:	0807      	lsrs	r7, r0, #32
    90aa:	0000      	movs	r0, r0
    90ac:	3102      	adds	r1, #2
    90ae:	0000      	movs	r0, r0
    90b0:	086b      	lsrs	r3, r5, #1
    90b2:	0000      	movs	r0, r0
    90b4:	3102      	adds	r1, #2
    90b6:	0000      	movs	r0, r0
    90b8:	08a5      	lsrs	r5, r4, #2
    90ba:	0000      	movs	r0, r0
    90bc:	3102      	adds	r1, #2
    90be:	0000      	movs	r0, r0
    90c0:	08b2      	lsrs	r2, r6, #2
    90c2:	0000      	movs	r0, r0
    90c4:	3102      	adds	r1, #2
    90c6:	0000      	movs	r0, r0
    90c8:	08bf      	lsrs	r7, r7, #2
    90ca:	0000      	movs	r0, r0
    90cc:	3102      	adds	r1, #2
    90ce:	0000      	movs	r0, r0
    90d0:	08cc      	lsrs	r4, r1, #3
    90d2:	0000      	movs	r0, r0
    90d4:	3102      	adds	r1, #2
    90d6:	0000      	movs	r0, r0
    90d8:	08d9      	lsrs	r1, r3, #3
    90da:	0000      	movs	r0, r0
    90dc:	3102      	adds	r1, #2
    90de:	0000      	movs	r0, r0
    90e0:	08e6      	lsrs	r6, r4, #3
    90e2:	0000      	movs	r0, r0
    90e4:	3102      	adds	r1, #2
    90e6:	0000      	movs	r0, r0
    90e8:	08f3      	lsrs	r3, r6, #3
    90ea:	0000      	movs	r0, r0
    90ec:	3102      	adds	r1, #2
    90ee:	0000      	movs	r0, r0
    90f0:	0900      	lsrs	r0, r0, #4
    90f2:	0000      	movs	r0, r0
    90f4:	3102      	adds	r1, #2
    90f6:	0000      	movs	r0, r0
    90f8:	090d      	lsrs	r5, r1, #4
    90fa:	0000      	movs	r0, r0
    90fc:	3102      	adds	r1, #2
    90fe:	0000      	movs	r0, r0
    9100:	091a      	lsrs	r2, r3, #4
    9102:	0000      	movs	r0, r0
    9104:	3102      	adds	r1, #2
    9106:	0000      	movs	r0, r0
    9108:	0927      	lsrs	r7, r4, #4
    910a:	0000      	movs	r0, r0
    910c:	3102      	adds	r1, #2
    910e:	0000      	movs	r0, r0
    9110:	0934      	lsrs	r4, r6, #4
    9112:	0000      	movs	r0, r0
    9114:	3102      	adds	r1, #2
    9116:	0000      	movs	r0, r0
    9118:	0941      	lsrs	r1, r0, #5
    911a:	0000      	movs	r0, r0
    911c:	3102      	adds	r1, #2
    911e:	0000      	movs	r0, r0
    9120:	094e      	lsrs	r6, r1, #5
    9122:	0000      	movs	r0, r0
    9124:	3102      	adds	r1, #2
    9126:	0000      	movs	r0, r0
    9128:	095b      	lsrs	r3, r3, #5
    912a:	0000      	movs	r0, r0
    912c:	3102      	adds	r1, #2
    912e:	0000      	movs	r0, r0
    9130:	0968      	lsrs	r0, r5, #5
    9132:	0000      	movs	r0, r0
    9134:	3102      	adds	r1, #2
    9136:	0000      	movs	r0, r0
    9138:	0975      	lsrs	r5, r6, #5
    913a:	0000      	movs	r0, r0
    913c:	3102      	adds	r1, #2
    913e:	0000      	movs	r0, r0
    9140:	0982      	lsrs	r2, r0, #6
    9142:	0000      	movs	r0, r0
    9144:	3102      	adds	r1, #2
    9146:	0000      	movs	r0, r0
    9148:	098f      	lsrs	r7, r1, #6
    914a:	0000      	movs	r0, r0
    914c:	3102      	adds	r1, #2
    914e:	0000      	movs	r0, r0
    9150:	099c      	lsrs	r4, r3, #6
    9152:	0000      	movs	r0, r0
    9154:	3102      	adds	r1, #2
    9156:	0000      	movs	r0, r0
    9158:	09a9      	lsrs	r1, r5, #6
    915a:	0000      	movs	r0, r0
    915c:	3102      	adds	r1, #2
    915e:	0000      	movs	r0, r0
    9160:	09b6      	lsrs	r6, r6, #6
    9162:	0000      	movs	r0, r0
    9164:	3102      	adds	r1, #2
    9166:	0000      	movs	r0, r0
    9168:	09c3      	lsrs	r3, r0, #7
    916a:	0000      	movs	r0, r0
    916c:	3102      	adds	r1, #2
    916e:	0000      	movs	r0, r0
    9170:	09d0      	lsrs	r0, r2, #7
    9172:	0000      	movs	r0, r0
    9174:	3102      	adds	r1, #2
    9176:	0000      	movs	r0, r0
    9178:	09dd      	lsrs	r5, r3, #7
    917a:	0000      	movs	r0, r0
    917c:	3102      	adds	r1, #2
    917e:	0000      	movs	r0, r0
    9180:	09ea      	lsrs	r2, r5, #7
    9182:	0000      	movs	r0, r0
    9184:	3102      	adds	r1, #2
    9186:	0000      	movs	r0, r0
    9188:	09f7      	lsrs	r7, r6, #7
    918a:	0000      	movs	r0, r0
    918c:	3102      	adds	r1, #2
    918e:	0000      	movs	r0, r0
    9190:	0a04      	lsrs	r4, r0, #8
    9192:	0000      	movs	r0, r0
    9194:	3102      	adds	r1, #2
    9196:	0000      	movs	r0, r0
    9198:	0a11      	lsrs	r1, r2, #8
    919a:	0000      	movs	r0, r0
    919c:	3102      	adds	r1, #2
    919e:	0000      	movs	r0, r0
    91a0:	0a1e      	lsrs	r6, r3, #8
    91a2:	0000      	movs	r0, r0
    91a4:	3102      	adds	r1, #2
    91a6:	0000      	movs	r0, r0
    91a8:	0a2b      	lsrs	r3, r5, #8
    91aa:	0000      	movs	r0, r0
    91ac:	3102      	adds	r1, #2
    91ae:	0000      	movs	r0, r0
    91b0:	0a38      	lsrs	r0, r7, #8
    91b2:	0000      	movs	r0, r0
    91b4:	3102      	adds	r1, #2
    91b6:	0000      	movs	r0, r0
    91b8:	0a45      	lsrs	r5, r0, #9
    91ba:	0000      	movs	r0, r0
    91bc:	3102      	adds	r1, #2
    91be:	0000      	movs	r0, r0
    91c0:	0a52      	lsrs	r2, r2, #9
    91c2:	0000      	movs	r0, r0
    91c4:	3102      	adds	r1, #2
    91c6:	0000      	movs	r0, r0
    91c8:	0a5f      	lsrs	r7, r3, #9
    91ca:	0000      	movs	r0, r0
    91cc:	3102      	adds	r1, #2
    91ce:	0000      	movs	r0, r0
    91d0:	0a6c      	lsrs	r4, r5, #9
    91d2:	0000      	movs	r0, r0
    91d4:	3102      	adds	r1, #2
    91d6:	0000      	movs	r0, r0
    91d8:	0a79      	lsrs	r1, r7, #9
    91da:	0000      	movs	r0, r0
    91dc:	3102      	adds	r1, #2
    91de:	0000      	movs	r0, r0
    91e0:	0a86      	lsrs	r6, r0, #10
    91e2:	0000      	movs	r0, r0
    91e4:	3102      	adds	r1, #2
    91e6:	0000      	movs	r0, r0
    91e8:	0a93      	lsrs	r3, r2, #10
    91ea:	0000      	movs	r0, r0
    91ec:	3102      	adds	r1, #2
    91ee:	0000      	movs	r0, r0
    91f0:	0aa0      	lsrs	r0, r4, #10
    91f2:	0000      	movs	r0, r0
    91f4:	3102      	adds	r1, #2
    91f6:	0000      	movs	r0, r0
    91f8:	0aad      	lsrs	r5, r5, #10
    91fa:	0000      	movs	r0, r0
    91fc:	3102      	adds	r1, #2
    91fe:	0000      	movs	r0, r0
    9200:	0aba      	lsrs	r2, r7, #10
    9202:	0000      	movs	r0, r0
    9204:	3102      	adds	r1, #2
    9206:	0000      	movs	r0, r0
    9208:	0ac7      	lsrs	r7, r0, #11
    920a:	0000      	movs	r0, r0
    920c:	3102      	adds	r1, #2
    920e:	0000      	movs	r0, r0
    9210:	0ad4      	lsrs	r4, r2, #11
    9212:	0000      	movs	r0, r0
    9214:	3102      	adds	r1, #2
    9216:	0000      	movs	r0, r0
    9218:	0ae1      	lsrs	r1, r4, #11
    921a:	0000      	movs	r0, r0
    921c:	3102      	adds	r1, #2
    921e:	0000      	movs	r0, r0
    9220:	0aee      	lsrs	r6, r5, #11
    9222:	0000      	movs	r0, r0
    9224:	3102      	adds	r1, #2
    9226:	0000      	movs	r0, r0
    9228:	0afb      	lsrs	r3, r7, #11
    922a:	0000      	movs	r0, r0
    922c:	3102      	adds	r1, #2
    922e:	0000      	movs	r0, r0
    9230:	0b08      	lsrs	r0, r1, #12
    9232:	0000      	movs	r0, r0
    9234:	3102      	adds	r1, #2
    9236:	0000      	movs	r0, r0
    9238:	0b15      	lsrs	r5, r2, #12
    923a:	0000      	movs	r0, r0
    923c:	3102      	adds	r1, #2
    923e:	0000      	movs	r0, r0
    9240:	0b22      	lsrs	r2, r4, #12
    9242:	0000      	movs	r0, r0
    9244:	3102      	adds	r1, #2
    9246:	0000      	movs	r0, r0
    9248:	0b2f      	lsrs	r7, r5, #12
    924a:	0000      	movs	r0, r0
    924c:	3102      	adds	r1, #2
    924e:	0000      	movs	r0, r0
    9250:	0b3c      	lsrs	r4, r7, #12
    9252:	0000      	movs	r0, r0
    9254:	3102      	adds	r1, #2
    9256:	0000      	movs	r0, r0
    9258:	0b49      	lsrs	r1, r1, #13
    925a:	0000      	movs	r0, r0
    925c:	3102      	adds	r1, #2
    925e:	0000      	movs	r0, r0
    9260:	0b56      	lsrs	r6, r2, #13
    9262:	0000      	movs	r0, r0
    9264:	3102      	adds	r1, #2
    9266:	0000      	movs	r0, r0
    9268:	0b63      	lsrs	r3, r4, #13
    926a:	0000      	movs	r0, r0
    926c:	3102      	adds	r1, #2
    926e:	0000      	movs	r0, r0
    9270:	0b70      	lsrs	r0, r6, #13
    9272:	0000      	movs	r0, r0
    9274:	3102      	adds	r1, #2
    9276:	0000      	movs	r0, r0
    9278:	0b7d      	lsrs	r5, r7, #13
    927a:	0000      	movs	r0, r0
    927c:	3102      	adds	r1, #2
    927e:	0000      	movs	r0, r0
    9280:	0b8b      	lsrs	r3, r1, #14
    9282:	0000      	movs	r0, r0
    9284:	3102      	adds	r1, #2
    9286:	0000      	movs	r0, r0
    9288:	0bb0      	lsrs	r0, r6, #14
    928a:	0000      	movs	r0, r0
    928c:	3102      	adds	r1, #2
    928e:	0000      	movs	r0, r0
    9290:	0bbd      	lsrs	r5, r7, #14
    9292:	0000      	movs	r0, r0
    9294:	3102      	adds	r1, #2
    9296:	0000      	movs	r0, r0
    9298:	0bca      	lsrs	r2, r1, #15
    929a:	0000      	movs	r0, r0
    929c:	3102      	adds	r1, #2
    929e:	0000      	movs	r0, r0
    92a0:	0be1      	lsrs	r1, r4, #15
    92a2:	0000      	movs	r0, r0
    92a4:	3102      	adds	r1, #2
    92a6:	0000      	movs	r0, r0
    92a8:	0bed      	lsrs	r5, r5, #15
    92aa:	0000      	movs	r0, r0
    92ac:	3102      	adds	r1, #2
    92ae:	0000      	movs	r0, r0
    92b0:	0c03      	lsrs	r3, r0, #16
    92b2:	0000      	movs	r0, r0
    92b4:	3102      	adds	r1, #2
    92b6:	0000      	movs	r0, r0
    92b8:	0c10      	lsrs	r0, r2, #16
    92ba:	0000      	movs	r0, r0
    92bc:	3102      	adds	r1, #2
    92be:	0000      	movs	r0, r0
    92c0:	0c1d      	lsrs	r5, r3, #16
    92c2:	0000      	movs	r0, r0
    92c4:	3102      	adds	r1, #2
    92c6:	0000      	movs	r0, r0
    92c8:	0c34      	lsrs	r4, r6, #16
    92ca:	0000      	movs	r0, r0
    92cc:	3102      	adds	r1, #2
    92ce:	0000      	movs	r0, r0
    92d0:	0c40      	lsrs	r0, r0, #17
    92d2:	0000      	movs	r0, r0
    92d4:	3102      	adds	r1, #2
    92d6:	0000      	movs	r0, r0
    92d8:	0c56      	lsrs	r6, r2, #17
    92da:	0000      	movs	r0, r0
    92dc:	3102      	adds	r1, #2
    92de:	0000      	movs	r0, r0
    92e0:	0c63      	lsrs	r3, r4, #17
    92e2:	0000      	movs	r0, r0
    92e4:	3102      	adds	r1, #2
    92e6:	0000      	movs	r0, r0
    92e8:	0c7a      	lsrs	r2, r7, #17
    92ea:	0000      	movs	r0, r0
    92ec:	3102      	adds	r1, #2
    92ee:	0000      	movs	r0, r0
    92f0:	0c86      	lsrs	r6, r0, #18
    92f2:	0000      	movs	r0, r0
    92f4:	3102      	adds	r1, #2
    92f6:	0000      	movs	r0, r0
    92f8:	0c9c      	lsrs	r4, r3, #18
    92fa:	0000      	movs	r0, r0
    92fc:	3102      	adds	r1, #2
    92fe:	0000      	movs	r0, r0
    9300:	0ca9      	lsrs	r1, r5, #18
    9302:	0000      	movs	r0, r0
    9304:	3102      	adds	r1, #2
    9306:	0000      	movs	r0, r0
    9308:	0cb6      	lsrs	r6, r6, #18
    930a:	0000      	movs	r0, r0
    930c:	3102      	adds	r1, #2
    930e:	0000      	movs	r0, r0
    9310:	0cc3      	lsrs	r3, r0, #19
    9312:	0000      	movs	r0, r0
    9314:	3102      	adds	r1, #2
    9316:	0000      	movs	r0, r0
    9318:	0cd0      	lsrs	r0, r2, #19
    931a:	0000      	movs	r0, r0
    931c:	3102      	adds	r1, #2
    931e:	0000      	movs	r0, r0
    9320:	0ce7      	lsrs	r7, r4, #19
    9322:	0000      	movs	r0, r0
    9324:	3102      	adds	r1, #2
    9326:	0000      	movs	r0, r0
    9328:	0cf3      	lsrs	r3, r6, #19
    932a:	0000      	movs	r0, r0
    932c:	3102      	adds	r1, #2
    932e:	0000      	movs	r0, r0
    9330:	0d09      	lsrs	r1, r1, #20
    9332:	0000      	movs	r0, r0
    9334:	3102      	adds	r1, #2
    9336:	0000      	movs	r0, r0
    9338:	0d16      	lsrs	r6, r2, #20
    933a:	0000      	movs	r0, r0
    933c:	3102      	adds	r1, #2
    933e:	0000      	movs	r0, r0
    9340:	0d23      	lsrs	r3, r4, #20
    9342:	0000      	movs	r0, r0
    9344:	3102      	adds	r1, #2
    9346:	0000      	movs	r0, r0
    9348:	0d30      	lsrs	r0, r6, #20
    934a:	0000      	movs	r0, r0
    934c:	3102      	adds	r1, #2
    934e:	0000      	movs	r0, r0
    9350:	0d3d      	lsrs	r5, r7, #20
    9352:	0000      	movs	r0, r0
    9354:	3102      	adds	r1, #2
    9356:	0000      	movs	r0, r0
    9358:	0d4a      	lsrs	r2, r1, #21
    935a:	0000      	movs	r0, r0
    935c:	3102      	adds	r1, #2
    935e:	0000      	movs	r0, r0
    9360:	0d57      	lsrs	r7, r2, #21
    9362:	0000      	movs	r0, r0
    9364:	3102      	adds	r1, #2
    9366:	0000      	movs	r0, r0
    9368:	0d64      	lsrs	r4, r4, #21
    936a:	0000      	movs	r0, r0
    936c:	3102      	adds	r1, #2
    936e:	0000      	movs	r0, r0
    9370:	0d7b      	lsrs	r3, r7, #21
    9372:	0000      	movs	r0, r0
    9374:	3102      	adds	r1, #2
    9376:	0000      	movs	r0, r0
    9378:	0d87      	lsrs	r7, r0, #22
    937a:	0000      	movs	r0, r0
    937c:	3102      	adds	r1, #2
    937e:	0000      	movs	r0, r0
    9380:	0d9d      	lsrs	r5, r3, #22
    9382:	0000      	movs	r0, r0
    9384:	3102      	adds	r1, #2
    9386:	0000      	movs	r0, r0
    9388:	0daa      	lsrs	r2, r5, #22
    938a:	0000      	movs	r0, r0
    938c:	3102      	adds	r1, #2
    938e:	0000      	movs	r0, r0
    9390:	0db7      	lsrs	r7, r6, #22
    9392:	0000      	movs	r0, r0
    9394:	3102      	adds	r1, #2
    9396:	0000      	movs	r0, r0
    9398:	0dc4      	lsrs	r4, r0, #23
    939a:	0000      	movs	r0, r0
    939c:	3102      	adds	r1, #2
    939e:	0000      	movs	r0, r0
    93a0:	0dd1      	lsrs	r1, r2, #23
    93a2:	0000      	movs	r0, r0
    93a4:	3102      	adds	r1, #2
    93a6:	0000      	movs	r0, r0
    93a8:	0dde      	lsrs	r6, r3, #23
    93aa:	0000      	movs	r0, r0
    93ac:	3102      	adds	r1, #2
    93ae:	0000      	movs	r0, r0
    93b0:	0deb      	lsrs	r3, r5, #23
    93b2:	0000      	movs	r0, r0
    93b4:	3102      	adds	r1, #2
    93b6:	0000      	movs	r0, r0
    93b8:	0df8      	lsrs	r0, r7, #23
    93ba:	0000      	movs	r0, r0
    93bc:	3102      	adds	r1, #2
    93be:	0000      	movs	r0, r0
    93c0:	0e0f      	lsrs	r7, r1, #24
    93c2:	0000      	movs	r0, r0
    93c4:	3102      	adds	r1, #2
    93c6:	0000      	movs	r0, r0
    93c8:	0e1b      	lsrs	r3, r3, #24
    93ca:	0000      	movs	r0, r0
    93cc:	3102      	adds	r1, #2
    93ce:	0000      	movs	r0, r0
    93d0:	0e32      	lsrs	r2, r6, #24
    93d2:	0000      	movs	r0, r0
    93d4:	3102      	adds	r1, #2
    93d6:	0000      	movs	r0, r0
    93d8:	0e3f      	lsrs	r7, r7, #24
    93da:	0000      	movs	r0, r0
    93dc:	3102      	adds	r1, #2
    93de:	0000      	movs	r0, r0
    93e0:	0e4c      	lsrs	r4, r1, #25
    93e2:	0000      	movs	r0, r0
    93e4:	3102      	adds	r1, #2
    93e6:	0000      	movs	r0, r0
    93e8:	0e59      	lsrs	r1, r3, #25
    93ea:	0000      	movs	r0, r0
    93ec:	3102      	adds	r1, #2
    93ee:	0000      	movs	r0, r0
    93f0:	0e66      	lsrs	r6, r4, #25
    93f2:	0000      	movs	r0, r0
    93f4:	3102      	adds	r1, #2
    93f6:	0000      	movs	r0, r0
    93f8:	0e73      	lsrs	r3, r6, #25
    93fa:	0000      	movs	r0, r0
    93fc:	3102      	adds	r1, #2
    93fe:	0000      	movs	r0, r0
    9400:	0e80      	lsrs	r0, r0, #26
    9402:	0000      	movs	r0, r0
    9404:	3102      	adds	r1, #2
    9406:	0000      	movs	r0, r0
    9408:	0e8d      	lsrs	r5, r1, #26
    940a:	0000      	movs	r0, r0
    940c:	3102      	adds	r1, #2
    940e:	0000      	movs	r0, r0
    9410:	0e9a      	lsrs	r2, r3, #26
    9412:	0000      	movs	r0, r0
    9414:	3102      	adds	r1, #2
    9416:	0000      	movs	r0, r0
    9418:	0ea7      	lsrs	r7, r4, #26
    941a:	0000      	movs	r0, r0
    941c:	3102      	adds	r1, #2
    941e:	0000      	movs	r0, r0
    9420:	0eb4      	lsrs	r4, r6, #26
    9422:	0000      	movs	r0, r0
    9424:	3102      	adds	r1, #2
    9426:	0000      	movs	r0, r0
    9428:	0ec1      	lsrs	r1, r0, #27
    942a:	0000      	movs	r0, r0
    942c:	3102      	adds	r1, #2
    942e:	0000      	movs	r0, r0
    9430:	0ece      	lsrs	r6, r1, #27
    9432:	0000      	movs	r0, r0
    9434:	3102      	adds	r1, #2
    9436:	0000      	movs	r0, r0
    9438:	0ee2      	lsrs	r2, r4, #27
    943a:	0000      	movs	r0, r0
    943c:	3102      	adds	r1, #2
    943e:	0000      	movs	r0, r0
    9440:	0ef0      	lsrs	r0, r6, #27
    9442:	0000      	movs	r0, r0
    9444:	3102      	adds	r1, #2
    9446:	0000      	movs	r0, r0
    9448:	0efe      	lsrs	r6, r7, #27
    944a:	0000      	movs	r0, r0
    944c:	3102      	adds	r1, #2
    944e:	0000      	movs	r0, r0
    9450:	0f0c      	lsrs	r4, r1, #28
    9452:	0000      	movs	r0, r0
    9454:	3102      	adds	r1, #2
    9456:	0000      	movs	r0, r0
    9458:	0f1a      	lsrs	r2, r3, #28
    945a:	0000      	movs	r0, r0
    945c:	3102      	adds	r1, #2
    945e:	0000      	movs	r0, r0
    9460:	0f28      	lsrs	r0, r5, #28
    9462:	0000      	movs	r0, r0
    9464:	3102      	adds	r1, #2
    9466:	0000      	movs	r0, r0
    9468:	0f36      	lsrs	r6, r6, #28
    946a:	0000      	movs	r0, r0
    946c:	3102      	adds	r1, #2
    946e:	0000      	movs	r0, r0
    9470:	0f4b      	lsrs	r3, r1, #29
    9472:	0000      	movs	r0, r0
    9474:	3102      	adds	r1, #2
    9476:	0000      	movs	r0, r0
    9478:	0f59      	lsrs	r1, r3, #29
    947a:	0000      	movs	r0, r0
    947c:	3102      	adds	r1, #2
    947e:	0000      	movs	r0, r0
    9480:	0f67      	lsrs	r7, r4, #29
    9482:	0000      	movs	r0, r0
    9484:	3102      	adds	r1, #2
    9486:	0000      	movs	r0, r0
    9488:	0f75      	lsrs	r5, r6, #29
    948a:	0000      	movs	r0, r0
    948c:	3102      	adds	r1, #2
    948e:	0000      	movs	r0, r0
    9490:	0f83      	lsrs	r3, r0, #30
    9492:	0000      	movs	r0, r0
    9494:	3102      	adds	r1, #2
    9496:	0000      	movs	r0, r0
    9498:	0f98      	lsrs	r0, r3, #30
    949a:	0000      	movs	r0, r0
    949c:	3102      	adds	r1, #2
    949e:	0000      	movs	r0, r0
    94a0:	0fad      	lsrs	r5, r5, #30
    94a2:	0000      	movs	r0, r0
    94a4:	3102      	adds	r1, #2
    94a6:	0000      	movs	r0, r0
    94a8:	0fbb      	lsrs	r3, r7, #30
    94aa:	0000      	movs	r0, r0
    94ac:	3102      	adds	r1, #2
    94ae:	0000      	movs	r0, r0
    94b0:	0fc9      	lsrs	r1, r1, #31
    94b2:	0000      	movs	r0, r0
    94b4:	3102      	adds	r1, #2
    94b6:	0000      	movs	r0, r0
    94b8:	0fd7      	lsrs	r7, r2, #31
    94ba:	0000      	movs	r0, r0
    94bc:	3102      	adds	r1, #2
    94be:	0000      	movs	r0, r0
    94c0:	0fe5      	lsrs	r5, r4, #31
    94c2:	0000      	movs	r0, r0
    94c4:	3102      	adds	r1, #2
    94c6:	0000      	movs	r0, r0
    94c8:	0ff3      	lsrs	r3, r6, #31
    94ca:	0000      	movs	r0, r0
    94cc:	3102      	adds	r1, #2
    94ce:	0000      	movs	r0, r0
    94d0:	1001      	asrs	r1, r0, #32
    94d2:	0000      	movs	r0, r0
    94d4:	3102      	adds	r1, #2
    94d6:	0000      	movs	r0, r0
    94d8:	100f      	asrs	r7, r1, #32
    94da:	0000      	movs	r0, r0
    94dc:	3102      	adds	r1, #2
    94de:	0000      	movs	r0, r0
    94e0:	101d      	asrs	r5, r3, #32
    94e2:	0000      	movs	r0, r0
    94e4:	3102      	adds	r1, #2
    94e6:	0000      	movs	r0, r0
    94e8:	102b      	asrs	r3, r5, #32
    94ea:	0000      	movs	r0, r0
    94ec:	3102      	adds	r1, #2
    94ee:	0000      	movs	r0, r0
    94f0:	1040      	asrs	r0, r0, #1
    94f2:	0000      	movs	r0, r0
    94f4:	3102      	adds	r1, #2
    94f6:	0000      	movs	r0, r0
    94f8:	104e      	asrs	r6, r1, #1
    94fa:	0000      	movs	r0, r0
    94fc:	3102      	adds	r1, #2
    94fe:	0000      	movs	r0, r0
    9500:	105c      	asrs	r4, r3, #1
    9502:	0000      	movs	r0, r0
    9504:	3102      	adds	r1, #2
    9506:	0000      	movs	r0, r0
    9508:	106a      	asrs	r2, r5, #1
    950a:	0000      	movs	r0, r0
    950c:	3102      	adds	r1, #2
    950e:	0000      	movs	r0, r0
    9510:	1078      	asrs	r0, r7, #1
    9512:	0000      	movs	r0, r0
    9514:	3102      	adds	r1, #2
    9516:	0000      	movs	r0, r0
    9518:	1086      	asrs	r6, r0, #2
    951a:	0000      	movs	r0, r0
    951c:	3102      	adds	r1, #2
    951e:	0000      	movs	r0, r0
    9520:	1094      	asrs	r4, r2, #2
    9522:	0000      	movs	r0, r0
    9524:	3102      	adds	r1, #2
    9526:	0000      	movs	r0, r0
    9528:	10a2      	asrs	r2, r4, #2
    952a:	0000      	movs	r0, r0
    952c:	3102      	adds	r1, #2
    952e:	0000      	movs	r0, r0
    9530:	10b0      	asrs	r0, r6, #2
    9532:	0000      	movs	r0, r0
    9534:	3102      	adds	r1, #2
    9536:	0000      	movs	r0, r0
    9538:	10be      	asrs	r6, r7, #2
    953a:	0000      	movs	r0, r0
    953c:	3102      	adds	r1, #2
    953e:	0000      	movs	r0, r0
    9540:	10cc      	asrs	r4, r1, #3
    9542:	0000      	movs	r0, r0
    9544:	3102      	adds	r1, #2
    9546:	0000      	movs	r0, r0
    9548:	10da      	asrs	r2, r3, #3
    954a:	0000      	movs	r0, r0
    954c:	3102      	adds	r1, #2
    954e:	0000      	movs	r0, r0
    9550:	10e8      	asrs	r0, r5, #3
    9552:	0000      	movs	r0, r0
    9554:	3102      	adds	r1, #2
    9556:	0000      	movs	r0, r0
    9558:	10fd      	asrs	r5, r7, #3
    955a:	0000      	movs	r0, r0
    955c:	3102      	adds	r1, #2
    955e:	0000      	movs	r0, r0
    9560:	110b      	asrs	r3, r1, #4
    9562:	0000      	movs	r0, r0
    9564:	3102      	adds	r1, #2
    9566:	0000      	movs	r0, r0
    9568:	1119      	asrs	r1, r3, #4
    956a:	0000      	movs	r0, r0
    956c:	3102      	adds	r1, #2
    956e:	0000      	movs	r0, r0
    9570:	1127      	asrs	r7, r4, #4
    9572:	0000      	movs	r0, r0
    9574:	3102      	adds	r1, #2
    9576:	0000      	movs	r0, r0
    9578:	1135      	asrs	r5, r6, #4
    957a:	0000      	movs	r0, r0
    957c:	3102      	adds	r1, #2
    957e:	0000      	movs	r0, r0
    9580:	1143      	asrs	r3, r0, #5
    9582:	0000      	movs	r0, r0
    9584:	3102      	adds	r1, #2
    9586:	0000      	movs	r0, r0
    9588:	1151      	asrs	r1, r2, #5
    958a:	0000      	movs	r0, r0
    958c:	3102      	adds	r1, #2
    958e:	0000      	movs	r0, r0
    9590:	115f      	asrs	r7, r3, #5
    9592:	0000      	movs	r0, r0
    9594:	3102      	adds	r1, #2
    9596:	0000      	movs	r0, r0
    9598:	116d      	asrs	r5, r5, #5
    959a:	0000      	movs	r0, r0
    959c:	3102      	adds	r1, #2
    959e:	0000      	movs	r0, r0
    95a0:	117b      	asrs	r3, r7, #5
    95a2:	0000      	movs	r0, r0
    95a4:	3102      	adds	r1, #2
    95a6:	0000      	movs	r0, r0
    95a8:	1189      	asrs	r1, r1, #6
    95aa:	0000      	movs	r0, r0
    95ac:	3102      	adds	r1, #2
    95ae:	0000      	movs	r0, r0
    95b0:	1197      	asrs	r7, r2, #6
    95b2:	0000      	movs	r0, r0
    95b4:	3102      	adds	r1, #2
    95b6:	0000      	movs	r0, r0
    95b8:	11a5      	asrs	r5, r4, #6
    95ba:	0000      	movs	r0, r0
    95bc:	3102      	adds	r1, #2
    95be:	0000      	movs	r0, r0
    95c0:	11b3      	asrs	r3, r6, #6
    95c2:	0000      	movs	r0, r0
    95c4:	3102      	adds	r1, #2
    95c6:	0000      	movs	r0, r0
    95c8:	11c1      	asrs	r1, r0, #7
    95ca:	0000      	movs	r0, r0
    95cc:	3102      	adds	r1, #2
    95ce:	0000      	movs	r0, r0
    95d0:	11cf      	asrs	r7, r1, #7
    95d2:	0000      	movs	r0, r0
    95d4:	3102      	adds	r1, #2
    95d6:	0000      	movs	r0, r0
    95d8:	11dd      	asrs	r5, r3, #7
    95da:	0000      	movs	r0, r0
    95dc:	3102      	adds	r1, #2
    95de:	0000      	movs	r0, r0
    95e0:	11eb      	asrs	r3, r5, #7
    95e2:	0000      	movs	r0, r0
    95e4:	3102      	adds	r1, #2
    95e6:	0000      	movs	r0, r0
    95e8:	11f9      	asrs	r1, r7, #7
    95ea:	0000      	movs	r0, r0
    95ec:	3102      	adds	r1, #2
    95ee:	0000      	movs	r0, r0
    95f0:	1207      	asrs	r7, r0, #8
    95f2:	0000      	movs	r0, r0
    95f4:	3102      	adds	r1, #2
    95f6:	0000      	movs	r0, r0
    95f8:	1215      	asrs	r5, r2, #8
    95fa:	0000      	movs	r0, r0
    95fc:	3102      	adds	r1, #2
    95fe:	0000      	movs	r0, r0
    9600:	1223      	asrs	r3, r4, #8
    9602:	0000      	movs	r0, r0
    9604:	3102      	adds	r1, #2
    9606:	0000      	movs	r0, r0
    9608:	1231      	asrs	r1, r6, #8
    960a:	0000      	movs	r0, r0
    960c:	3102      	adds	r1, #2
    960e:	0000      	movs	r0, r0
    9610:	123f      	asrs	r7, r7, #8
    9612:	0000      	movs	r0, r0
    9614:	3102      	adds	r1, #2
    9616:	0000      	movs	r0, r0
    9618:	124d      	asrs	r5, r1, #9
    961a:	0000      	movs	r0, r0
    961c:	3102      	adds	r1, #2
    961e:	0000      	movs	r0, r0
    9620:	125b      	asrs	r3, r3, #9
    9622:	0000      	movs	r0, r0
    9624:	3102      	adds	r1, #2
    9626:	0000      	movs	r0, r0
    9628:	1269      	asrs	r1, r5, #9
    962a:	0000      	movs	r0, r0
    962c:	3102      	adds	r1, #2
    962e:	0000      	movs	r0, r0
    9630:	1277      	asrs	r7, r6, #9
    9632:	0000      	movs	r0, r0
    9634:	3102      	adds	r1, #2
    9636:	0000      	movs	r0, r0
    9638:	1285      	asrs	r5, r0, #10
    963a:	0000      	movs	r0, r0
    963c:	3102      	adds	r1, #2
    963e:	0000      	movs	r0, r0
    9640:	1293      	asrs	r3, r2, #10
    9642:	0000      	movs	r0, r0
    9644:	3102      	adds	r1, #2
    9646:	0000      	movs	r0, r0
    9648:	12a1      	asrs	r1, r4, #10
    964a:	0000      	movs	r0, r0
    964c:	3102      	adds	r1, #2
    964e:	0000      	movs	r0, r0
    9650:	12af      	asrs	r7, r5, #10
    9652:	0000      	movs	r0, r0
    9654:	3102      	adds	r1, #2
    9656:	0000      	movs	r0, r0
    9658:	12bd      	asrs	r5, r7, #10
    965a:	0000      	movs	r0, r0
    965c:	3102      	adds	r1, #2
    965e:	0000      	movs	r0, r0
    9660:	12cb      	asrs	r3, r1, #11
    9662:	0000      	movs	r0, r0
    9664:	3102      	adds	r1, #2
    9666:	0000      	movs	r0, r0
    9668:	12d9      	asrs	r1, r3, #11
    966a:	0000      	movs	r0, r0
    966c:	3102      	adds	r1, #2
    966e:	0000      	movs	r0, r0
    9670:	12e7      	asrs	r7, r4, #11
    9672:	0000      	movs	r0, r0
    9674:	3102      	adds	r1, #2
    9676:	0000      	movs	r0, r0
    9678:	12f5      	asrs	r5, r6, #11
    967a:	0000      	movs	r0, r0
    967c:	3102      	adds	r1, #2
    967e:	0000      	movs	r0, r0
    9680:	1303      	asrs	r3, r0, #12
    9682:	0000      	movs	r0, r0
    9684:	3102      	adds	r1, #2
    9686:	0000      	movs	r0, r0
    9688:	1311      	asrs	r1, r2, #12
    968a:	0000      	movs	r0, r0
    968c:	3102      	adds	r1, #2
    968e:	0000      	movs	r0, r0
    9690:	131f      	asrs	r7, r3, #12
    9692:	0000      	movs	r0, r0
    9694:	3102      	adds	r1, #2
    9696:	0000      	movs	r0, r0
    9698:	132d      	asrs	r5, r5, #12
    969a:	0000      	movs	r0, r0
    969c:	3102      	adds	r1, #2
    969e:	0000      	movs	r0, r0
    96a0:	133b      	asrs	r3, r7, #12
    96a2:	0000      	movs	r0, r0
    96a4:	3102      	adds	r1, #2
    96a6:	0000      	movs	r0, r0
    96a8:	1349      	asrs	r1, r1, #13
    96aa:	0000      	movs	r0, r0
    96ac:	3102      	adds	r1, #2
    96ae:	0000      	movs	r0, r0
    96b0:	1357      	asrs	r7, r2, #13
    96b2:	0000      	movs	r0, r0
    96b4:	3102      	adds	r1, #2
    96b6:	0000      	movs	r0, r0
    96b8:	1365      	asrs	r5, r4, #13
    96ba:	0000      	movs	r0, r0
    96bc:	3102      	adds	r1, #2
    96be:	0000      	movs	r0, r0
    96c0:	1373      	asrs	r3, r6, #13
    96c2:	0000      	movs	r0, r0
    96c4:	3102      	adds	r1, #2
    96c6:	0000      	movs	r0, r0
    96c8:	1381      	asrs	r1, r0, #14
    96ca:	0000      	movs	r0, r0
    96cc:	3102      	adds	r1, #2
    96ce:	0000      	movs	r0, r0
    96d0:	138f      	asrs	r7, r1, #14
    96d2:	0000      	movs	r0, r0
    96d4:	3102      	adds	r1, #2
    96d6:	0000      	movs	r0, r0
    96d8:	139d      	asrs	r5, r3, #14
    96da:	0000      	movs	r0, r0
    96dc:	3102      	adds	r1, #2
    96de:	0000      	movs	r0, r0
    96e0:	13ab      	asrs	r3, r5, #14
    96e2:	0000      	movs	r0, r0
    96e4:	3102      	adds	r1, #2
    96e6:	0000      	movs	r0, r0
    96e8:	13b9      	asrs	r1, r7, #14
    96ea:	0000      	movs	r0, r0
    96ec:	3102      	adds	r1, #2
    96ee:	0000      	movs	r0, r0
    96f0:	13c7      	asrs	r7, r0, #15
    96f2:	0000      	movs	r0, r0
    96f4:	3102      	adds	r1, #2
    96f6:	0000      	movs	r0, r0
    96f8:	13d5      	asrs	r5, r2, #15
    96fa:	0000      	movs	r0, r0
    96fc:	3102      	adds	r1, #2
    96fe:	0000      	movs	r0, r0
    9700:	13e3      	asrs	r3, r4, #15
    9702:	0000      	movs	r0, r0
    9704:	3102      	adds	r1, #2
    9706:	0000      	movs	r0, r0
    9708:	13f1      	asrs	r1, r6, #15
    970a:	0000      	movs	r0, r0
    970c:	3102      	adds	r1, #2
    970e:	0000      	movs	r0, r0
    9710:	13ff      	asrs	r7, r7, #15
    9712:	0000      	movs	r0, r0
    9714:	3102      	adds	r1, #2
    9716:	0000      	movs	r0, r0
    9718:	140d      	asrs	r5, r1, #16
    971a:	0000      	movs	r0, r0
    971c:	3102      	adds	r1, #2
    971e:	0000      	movs	r0, r0
    9720:	141b      	asrs	r3, r3, #16
    9722:	0000      	movs	r0, r0
    9724:	3102      	adds	r1, #2
    9726:	0000      	movs	r0, r0
    9728:	1429      	asrs	r1, r5, #16
    972a:	0000      	movs	r0, r0
    972c:	3102      	adds	r1, #2
    972e:	0000      	movs	r0, r0
    9730:	1437      	asrs	r7, r6, #16
    9732:	0000      	movs	r0, r0
    9734:	3102      	adds	r1, #2
    9736:	0000      	movs	r0, r0
    9738:	1445      	asrs	r5, r0, #17
    973a:	0000      	movs	r0, r0
    973c:	3102      	adds	r1, #2
    973e:	0000      	movs	r0, r0
    9740:	1453      	asrs	r3, r2, #17
    9742:	0000      	movs	r0, r0
    9744:	3102      	adds	r1, #2
    9746:	0000      	movs	r0, r0
    9748:	1461      	asrs	r1, r4, #17
    974a:	0000      	movs	r0, r0
    974c:	3102      	adds	r1, #2
    974e:	0000      	movs	r0, r0
    9750:	146f      	asrs	r7, r5, #17
    9752:	0000      	movs	r0, r0
    9754:	3102      	adds	r1, #2
    9756:	0000      	movs	r0, r0
    9758:	147d      	asrs	r5, r7, #17
    975a:	0000      	movs	r0, r0
    975c:	3102      	adds	r1, #2
    975e:	0000      	movs	r0, r0
    9760:	148b      	asrs	r3, r1, #18
    9762:	0000      	movs	r0, r0
    9764:	3102      	adds	r1, #2
    9766:	0000      	movs	r0, r0
    9768:	1499      	asrs	r1, r3, #18
    976a:	0000      	movs	r0, r0
    976c:	3102      	adds	r1, #2
    976e:	0000      	movs	r0, r0
    9770:	14a7      	asrs	r7, r4, #18
    9772:	0000      	movs	r0, r0
    9774:	3102      	adds	r1, #2
    9776:	0000      	movs	r0, r0
    9778:	14b5      	asrs	r5, r6, #18
    977a:	0000      	movs	r0, r0
    977c:	3102      	adds	r1, #2
    977e:	0000      	movs	r0, r0
    9780:	14c3      	asrs	r3, r0, #19
    9782:	0000      	movs	r0, r0
    9784:	3102      	adds	r1, #2
    9786:	0000      	movs	r0, r0
    9788:	14d1      	asrs	r1, r2, #19
    978a:	0000      	movs	r0, r0
    978c:	3102      	adds	r1, #2
    978e:	0000      	movs	r0, r0
    9790:	14df      	asrs	r7, r3, #19
    9792:	0000      	movs	r0, r0
    9794:	3102      	adds	r1, #2
    9796:	0000      	movs	r0, r0
    9798:	14ed      	asrs	r5, r5, #19
    979a:	0000      	movs	r0, r0
    979c:	3102      	adds	r1, #2
    979e:	0000      	movs	r0, r0
    97a0:	14fb      	asrs	r3, r7, #19
    97a2:	0000      	movs	r0, r0
    97a4:	3102      	adds	r1, #2
    97a6:	0000      	movs	r0, r0
    97a8:	1509      	asrs	r1, r1, #20
    97aa:	0000      	movs	r0, r0
    97ac:	3102      	adds	r1, #2
    97ae:	0000      	movs	r0, r0
    97b0:	1517      	asrs	r7, r2, #20
    97b2:	0000      	movs	r0, r0
    97b4:	3102      	adds	r1, #2
    97b6:	0000      	movs	r0, r0
    97b8:	1525      	asrs	r5, r4, #20
    97ba:	0000      	movs	r0, r0
    97bc:	3102      	adds	r1, #2
    97be:	0000      	movs	r0, r0
    97c0:	1533      	asrs	r3, r6, #20
    97c2:	0000      	movs	r0, r0
    97c4:	3102      	adds	r1, #2
    97c6:	0000      	movs	r0, r0
    97c8:	1541      	asrs	r1, r0, #21
    97ca:	0000      	movs	r0, r0
    97cc:	3102      	adds	r1, #2
    97ce:	0000      	movs	r0, r0
    97d0:	154f      	asrs	r7, r1, #21
    97d2:	0000      	movs	r0, r0
    97d4:	3102      	adds	r1, #2
    97d6:	0000      	movs	r0, r0
    97d8:	155d      	asrs	r5, r3, #21
    97da:	0000      	movs	r0, r0
    97dc:	3102      	adds	r1, #2
    97de:	0000      	movs	r0, r0
    97e0:	156b      	asrs	r3, r5, #21
    97e2:	0000      	movs	r0, r0
    97e4:	3102      	adds	r1, #2
    97e6:	0000      	movs	r0, r0
    97e8:	1579      	asrs	r1, r7, #21
    97ea:	0000      	movs	r0, r0
    97ec:	3102      	adds	r1, #2
    97ee:	0000      	movs	r0, r0
    97f0:	1587      	asrs	r7, r0, #22
    97f2:	0000      	movs	r0, r0
    97f4:	3102      	adds	r1, #2
    97f6:	0000      	movs	r0, r0
    97f8:	1595      	asrs	r5, r2, #22
    97fa:	0000      	movs	r0, r0
    97fc:	3102      	adds	r1, #2
    97fe:	0000      	movs	r0, r0
    9800:	15a3      	asrs	r3, r4, #22
    9802:	0000      	movs	r0, r0
    9804:	3102      	adds	r1, #2
    9806:	0000      	movs	r0, r0
    9808:	15b1      	asrs	r1, r6, #22
    980a:	0000      	movs	r0, r0
    980c:	3102      	adds	r1, #2
    980e:	0000      	movs	r0, r0
    9810:	15bf      	asrs	r7, r7, #22
    9812:	0000      	movs	r0, r0
    9814:	3102      	adds	r1, #2
    9816:	0000      	movs	r0, r0
    9818:	15cd      	asrs	r5, r1, #23
    981a:	0000      	movs	r0, r0
    981c:	3102      	adds	r1, #2
    981e:	0000      	movs	r0, r0
    9820:	15db      	asrs	r3, r3, #23
    9822:	0000      	movs	r0, r0
    9824:	3102      	adds	r1, #2
    9826:	0000      	movs	r0, r0
    9828:	15e9      	asrs	r1, r5, #23
    982a:	0000      	movs	r0, r0
    982c:	3102      	adds	r1, #2
    982e:	0000      	movs	r0, r0
    9830:	15f7      	asrs	r7, r6, #23
    9832:	0000      	movs	r0, r0
    9834:	3102      	adds	r1, #2
    9836:	0000      	movs	r0, r0
    9838:	1605      	asrs	r5, r0, #24
    983a:	0000      	movs	r0, r0
    983c:	3102      	adds	r1, #2
    983e:	0000      	movs	r0, r0
    9840:	1613      	asrs	r3, r2, #24
    9842:	0000      	movs	r0, r0
    9844:	3102      	adds	r1, #2
    9846:	0000      	movs	r0, r0
    9848:	1621      	asrs	r1, r4, #24
    984a:	0000      	movs	r0, r0
    984c:	3102      	adds	r1, #2
    984e:	0000      	movs	r0, r0
    9850:	162f      	asrs	r7, r5, #24
    9852:	0000      	movs	r0, r0
    9854:	3102      	adds	r1, #2
    9856:	0000      	movs	r0, r0
    9858:	163d      	asrs	r5, r7, #24
    985a:	0000      	movs	r0, r0
    985c:	3102      	adds	r1, #2
    985e:	0000      	movs	r0, r0
    9860:	164b      	asrs	r3, r1, #25
    9862:	0000      	movs	r0, r0
    9864:	3102      	adds	r1, #2
    9866:	0000      	movs	r0, r0
    9868:	1659      	asrs	r1, r3, #25
    986a:	0000      	movs	r0, r0
    986c:	3102      	adds	r1, #2
    986e:	0000      	movs	r0, r0
    9870:	1667      	asrs	r7, r4, #25
    9872:	0000      	movs	r0, r0
    9874:	3102      	adds	r1, #2
    9876:	0000      	movs	r0, r0
    9878:	1675      	asrs	r5, r6, #25
    987a:	0000      	movs	r0, r0
    987c:	3102      	adds	r1, #2
    987e:	0000      	movs	r0, r0
    9880:	1683      	asrs	r3, r0, #26
    9882:	0000      	movs	r0, r0
    9884:	3102      	adds	r1, #2
    9886:	0000      	movs	r0, r0
    9888:	1691      	asrs	r1, r2, #26
    988a:	0000      	movs	r0, r0
    988c:	3102      	adds	r1, #2
    988e:	0000      	movs	r0, r0
    9890:	169f      	asrs	r7, r3, #26
    9892:	0000      	movs	r0, r0
    9894:	3102      	adds	r1, #2
    9896:	0000      	movs	r0, r0
    9898:	16ad      	asrs	r5, r5, #26
    989a:	0000      	movs	r0, r0
    989c:	3102      	adds	r1, #2
    989e:	0000      	movs	r0, r0
    98a0:	16bb      	asrs	r3, r7, #26
    98a2:	0000      	movs	r0, r0
    98a4:	3102      	adds	r1, #2
    98a6:	0000      	movs	r0, r0
    98a8:	16c9      	asrs	r1, r1, #27
    98aa:	0000      	movs	r0, r0
    98ac:	3102      	adds	r1, #2
    98ae:	0000      	movs	r0, r0
    98b0:	16d7      	asrs	r7, r2, #27
    98b2:	0000      	movs	r0, r0
    98b4:	3102      	adds	r1, #2
    98b6:	0000      	movs	r0, r0
    98b8:	16e5      	asrs	r5, r4, #27
    98ba:	0000      	movs	r0, r0
    98bc:	3102      	adds	r1, #2
    98be:	0000      	movs	r0, r0
    98c0:	16f3      	asrs	r3, r6, #27
    98c2:	0000      	movs	r0, r0
    98c4:	3102      	adds	r1, #2
    98c6:	0000      	movs	r0, r0
    98c8:	17a4      	asrs	r4, r4, #30
    98ca:	0000      	movs	r0, r0
    98cc:	3102      	adds	r1, #2
    98ce:	0000      	movs	r0, r0
    98d0:	17b0      	asrs	r0, r6, #30
    98d2:	0000      	movs	r0, r0
    98d4:	3102      	adds	r1, #2
    98d6:	0000      	movs	r0, r0
    98d8:	17c1      	asrs	r1, r0, #31
    98da:	0000      	movs	r0, r0
    98dc:	3102      	adds	r1, #2
    98de:	0000      	movs	r0, r0
    98e0:	17c7      	asrs	r7, r0, #31
    98e2:	0000      	movs	r0, r0
    98e4:	3102      	adds	r1, #2
    98e6:	0000      	movs	r0, r0
    98e8:	17cd      	asrs	r5, r1, #31
    98ea:	0000      	movs	r0, r0
    98ec:	3102      	adds	r1, #2
    98ee:	0000      	movs	r0, r0
    98f0:	17d3      	asrs	r3, r2, #31
    98f2:	0000      	movs	r0, r0
    98f4:	3102      	adds	r1, #2
    98f6:	0000      	movs	r0, r0
    98f8:	17d9      	asrs	r1, r3, #31
    98fa:	0000      	movs	r0, r0
    98fc:	3102      	adds	r1, #2
    98fe:	0000      	movs	r0, r0
    9900:	17df      	asrs	r7, r3, #31
    9902:	0000      	movs	r0, r0
    9904:	3102      	adds	r1, #2
    9906:	0000      	movs	r0, r0
    9908:	17e5      	asrs	r5, r4, #31
    990a:	0000      	movs	r0, r0
    990c:	3102      	adds	r1, #2
    990e:	0000      	movs	r0, r0
    9910:	17eb      	asrs	r3, r5, #31
    9912:	0000      	movs	r0, r0
    9914:	3102      	adds	r1, #2
    9916:	0000      	movs	r0, r0
    9918:	17f1      	asrs	r1, r6, #31
    991a:	0000      	movs	r0, r0
    991c:	3102      	adds	r1, #2
    991e:	0000      	movs	r0, r0
    9920:	17f7      	asrs	r7, r6, #31
    9922:	0000      	movs	r0, r0
    9924:	3102      	adds	r1, #2
    9926:	0000      	movs	r0, r0
    9928:	17fd      	asrs	r5, r7, #31
    992a:	0000      	movs	r0, r0
    992c:	3102      	adds	r1, #2
    992e:	0000      	movs	r0, r0
    9930:	1803      	adds	r3, r0, r0
    9932:	0000      	movs	r0, r0
    9934:	3102      	adds	r1, #2
    9936:	0000      	movs	r0, r0
    9938:	1809      	adds	r1, r1, r0
    993a:	0000      	movs	r0, r0
    993c:	3102      	adds	r1, #2
    993e:	0000      	movs	r0, r0
    9940:	180f      	adds	r7, r1, r0
    9942:	0000      	movs	r0, r0
    9944:	3102      	adds	r1, #2
    9946:	0000      	movs	r0, r0
    9948:	1815      	adds	r5, r2, r0
    994a:	0000      	movs	r0, r0
    994c:	3102      	adds	r1, #2
    994e:	0000      	movs	r0, r0
    9950:	181b      	adds	r3, r3, r0
    9952:	0000      	movs	r0, r0
    9954:	3102      	adds	r1, #2
    9956:	0000      	movs	r0, r0
    9958:	1821      	adds	r1, r4, r0
    995a:	0000      	movs	r0, r0
    995c:	3102      	adds	r1, #2
    995e:	0000      	movs	r0, r0
    9960:	1827      	adds	r7, r4, r0
    9962:	0000      	movs	r0, r0
    9964:	3102      	adds	r1, #2
    9966:	0000      	movs	r0, r0
    9968:	182d      	adds	r5, r5, r0
    996a:	0000      	movs	r0, r0
    996c:	3102      	adds	r1, #2
    996e:	0000      	movs	r0, r0
    9970:	1833      	adds	r3, r6, r0
    9972:	0000      	movs	r0, r0
    9974:	3102      	adds	r1, #2
    9976:	0000      	movs	r0, r0
    9978:	1839      	adds	r1, r7, r0
    997a:	0000      	movs	r0, r0
    997c:	3102      	adds	r1, #2
    997e:	0000      	movs	r0, r0
    9980:	183f      	adds	r7, r7, r0
    9982:	0000      	movs	r0, r0
    9984:	3102      	adds	r1, #2
    9986:	0000      	movs	r0, r0
    9988:	1845      	adds	r5, r0, r1
    998a:	0000      	movs	r0, r0
    998c:	3102      	adds	r1, #2
    998e:	0000      	movs	r0, r0
    9990:	184b      	adds	r3, r1, r1
    9992:	0000      	movs	r0, r0
    9994:	3102      	adds	r1, #2
    9996:	0000      	movs	r0, r0
    9998:	1851      	adds	r1, r2, r1
    999a:	0000      	movs	r0, r0
    999c:	3102      	adds	r1, #2
    999e:	0000      	movs	r0, r0
    99a0:	1857      	adds	r7, r2, r1
    99a2:	0000      	movs	r0, r0
    99a4:	3102      	adds	r1, #2
    99a6:	0000      	movs	r0, r0
    99a8:	185d      	adds	r5, r3, r1
    99aa:	0000      	movs	r0, r0
    99ac:	3102      	adds	r1, #2
    99ae:	0000      	movs	r0, r0
    99b0:	1863      	adds	r3, r4, r1
    99b2:	0000      	movs	r0, r0
    99b4:	3102      	adds	r1, #2
    99b6:	0000      	movs	r0, r0
    99b8:	1869      	adds	r1, r5, r1
    99ba:	0000      	movs	r0, r0
    99bc:	3102      	adds	r1, #2
    99be:	0000      	movs	r0, r0
    99c0:	186f      	adds	r7, r5, r1
    99c2:	0000      	movs	r0, r0
    99c4:	3102      	adds	r1, #2
    99c6:	0000      	movs	r0, r0
    99c8:	1875      	adds	r5, r6, r1
    99ca:	0000      	movs	r0, r0
    99cc:	3102      	adds	r1, #2
    99ce:	0000      	movs	r0, r0
    99d0:	187b      	adds	r3, r7, r1
    99d2:	0000      	movs	r0, r0
    99d4:	3102      	adds	r1, #2
    99d6:	0000      	movs	r0, r0
    99d8:	1881      	adds	r1, r0, r2
    99da:	0000      	movs	r0, r0
    99dc:	3102      	adds	r1, #2
    99de:	0000      	movs	r0, r0
    99e0:	1887      	adds	r7, r0, r2
    99e2:	0000      	movs	r0, r0
    99e4:	3102      	adds	r1, #2
    99e6:	0000      	movs	r0, r0
    99e8:	188d      	adds	r5, r1, r2
    99ea:	0000      	movs	r0, r0
    99ec:	3102      	adds	r1, #2
    99ee:	0000      	movs	r0, r0
    99f0:	1893      	adds	r3, r2, r2
    99f2:	0000      	movs	r0, r0
    99f4:	3102      	adds	r1, #2
    99f6:	0000      	movs	r0, r0
    99f8:	1899      	adds	r1, r3, r2
    99fa:	0000      	movs	r0, r0
    99fc:	3102      	adds	r1, #2
    99fe:	0000      	movs	r0, r0
    9a00:	189f      	adds	r7, r3, r2
    9a02:	0000      	movs	r0, r0
    9a04:	3102      	adds	r1, #2
    9a06:	0000      	movs	r0, r0
    9a08:	18a5      	adds	r5, r4, r2
    9a0a:	0000      	movs	r0, r0
    9a0c:	3102      	adds	r1, #2
    9a0e:	0000      	movs	r0, r0
    9a10:	18ab      	adds	r3, r5, r2
    9a12:	0000      	movs	r0, r0
    9a14:	3102      	adds	r1, #2
    9a16:	0000      	movs	r0, r0
    9a18:	18b1      	adds	r1, r6, r2
    9a1a:	0000      	movs	r0, r0
    9a1c:	3102      	adds	r1, #2
    9a1e:	0000      	movs	r0, r0
    9a20:	18b7      	adds	r7, r6, r2
    9a22:	0000      	movs	r0, r0
    9a24:	3102      	adds	r1, #2
    9a26:	0000      	movs	r0, r0
    9a28:	18bd      	adds	r5, r7, r2
    9a2a:	0000      	movs	r0, r0
    9a2c:	3102      	adds	r1, #2
    9a2e:	0000      	movs	r0, r0
    9a30:	18c3      	adds	r3, r0, r3
    9a32:	0000      	movs	r0, r0
    9a34:	3102      	adds	r1, #2
    9a36:	0000      	movs	r0, r0
    9a38:	18c9      	adds	r1, r1, r3
    9a3a:	0000      	movs	r0, r0
    9a3c:	3102      	adds	r1, #2
    9a3e:	0000      	movs	r0, r0
    9a40:	18cf      	adds	r7, r1, r3
    9a42:	0000      	movs	r0, r0
    9a44:	3102      	adds	r1, #2
    9a46:	0000      	movs	r0, r0
    9a48:	18d5      	adds	r5, r2, r3
    9a4a:	0000      	movs	r0, r0
    9a4c:	3102      	adds	r1, #2
    9a4e:	0000      	movs	r0, r0
    9a50:	18db      	adds	r3, r3, r3
    9a52:	0000      	movs	r0, r0
    9a54:	3102      	adds	r1, #2
    9a56:	0000      	movs	r0, r0
    9a58:	18e1      	adds	r1, r4, r3
    9a5a:	0000      	movs	r0, r0
    9a5c:	3102      	adds	r1, #2
    9a5e:	0000      	movs	r0, r0
    9a60:	18e7      	adds	r7, r4, r3
    9a62:	0000      	movs	r0, r0
    9a64:	3102      	adds	r1, #2
    9a66:	0000      	movs	r0, r0
    9a68:	18ed      	adds	r5, r5, r3
    9a6a:	0000      	movs	r0, r0
    9a6c:	3102      	adds	r1, #2
    9a6e:	0000      	movs	r0, r0
    9a70:	18f3      	adds	r3, r6, r3
    9a72:	0000      	movs	r0, r0
    9a74:	3102      	adds	r1, #2
    9a76:	0000      	movs	r0, r0
    9a78:	18f9      	adds	r1, r7, r3
    9a7a:	0000      	movs	r0, r0
    9a7c:	3102      	adds	r1, #2
    9a7e:	0000      	movs	r0, r0
    9a80:	18ff      	adds	r7, r7, r3
    9a82:	0000      	movs	r0, r0
    9a84:	3102      	adds	r1, #2
    9a86:	0000      	movs	r0, r0
    9a88:	1905      	adds	r5, r0, r4
    9a8a:	0000      	movs	r0, r0
    9a8c:	3102      	adds	r1, #2
    9a8e:	0000      	movs	r0, r0
    9a90:	190b      	adds	r3, r1, r4
    9a92:	0000      	movs	r0, r0
    9a94:	3102      	adds	r1, #2
    9a96:	0000      	movs	r0, r0
    9a98:	1911      	adds	r1, r2, r4
    9a9a:	0000      	movs	r0, r0
    9a9c:	3102      	adds	r1, #2
    9a9e:	0000      	movs	r0, r0
    9aa0:	1917      	adds	r7, r2, r4
    9aa2:	0000      	movs	r0, r0
    9aa4:	3102      	adds	r1, #2
    9aa6:	0000      	movs	r0, r0
    9aa8:	191d      	adds	r5, r3, r4
    9aaa:	0000      	movs	r0, r0
    9aac:	3102      	adds	r1, #2
    9aae:	0000      	movs	r0, r0
    9ab0:	1923      	adds	r3, r4, r4
    9ab2:	0000      	movs	r0, r0
    9ab4:	3102      	adds	r1, #2
    9ab6:	0000      	movs	r0, r0
    9ab8:	1929      	adds	r1, r5, r4
    9aba:	0000      	movs	r0, r0
    9abc:	3102      	adds	r1, #2
    9abe:	0000      	movs	r0, r0
    9ac0:	192f      	adds	r7, r5, r4
    9ac2:	0000      	movs	r0, r0
    9ac4:	3102      	adds	r1, #2
    9ac6:	0000      	movs	r0, r0
    9ac8:	1935      	adds	r5, r6, r4
    9aca:	0000      	movs	r0, r0
    9acc:	3102      	adds	r1, #2
    9ace:	0000      	movs	r0, r0
    9ad0:	193b      	adds	r3, r7, r4
    9ad2:	0000      	movs	r0, r0
    9ad4:	3102      	adds	r1, #2
    9ad6:	0000      	movs	r0, r0
    9ad8:	1941      	adds	r1, r0, r5
    9ada:	0000      	movs	r0, r0
    9adc:	3102      	adds	r1, #2
    9ade:	0000      	movs	r0, r0
    9ae0:	1947      	adds	r7, r0, r5
    9ae2:	0000      	movs	r0, r0
    9ae4:	3102      	adds	r1, #2
    9ae6:	0000      	movs	r0, r0
    9ae8:	194d      	adds	r5, r1, r5
    9aea:	0000      	movs	r0, r0
    9aec:	3102      	adds	r1, #2
    9aee:	0000      	movs	r0, r0
    9af0:	1953      	adds	r3, r2, r5
    9af2:	0000      	movs	r0, r0
    9af4:	3102      	adds	r1, #2
    9af6:	0000      	movs	r0, r0
    9af8:	1959      	adds	r1, r3, r5
    9afa:	0000      	movs	r0, r0
    9afc:	3102      	adds	r1, #2
    9afe:	0000      	movs	r0, r0
    9b00:	195f      	adds	r7, r3, r5
    9b02:	0000      	movs	r0, r0
    9b04:	3102      	adds	r1, #2
    9b06:	0000      	movs	r0, r0
    9b08:	1965      	adds	r5, r4, r5
    9b0a:	0000      	movs	r0, r0
    9b0c:	3102      	adds	r1, #2
    9b0e:	0000      	movs	r0, r0
    9b10:	196b      	adds	r3, r5, r5
    9b12:	0000      	movs	r0, r0
    9b14:	3102      	adds	r1, #2
    9b16:	0000      	movs	r0, r0
    9b18:	1971      	adds	r1, r6, r5
    9b1a:	0000      	movs	r0, r0
    9b1c:	3102      	adds	r1, #2
    9b1e:	0000      	movs	r0, r0
    9b20:	1977      	adds	r7, r6, r5
    9b22:	0000      	movs	r0, r0
    9b24:	3102      	adds	r1, #2
    9b26:	0000      	movs	r0, r0
    9b28:	197d      	adds	r5, r7, r5
    9b2a:	0000      	movs	r0, r0
    9b2c:	3102      	adds	r1, #2
    9b2e:	0000      	movs	r0, r0
    9b30:	1983      	adds	r3, r0, r6
    9b32:	0000      	movs	r0, r0
    9b34:	3102      	adds	r1, #2
    9b36:	0000      	movs	r0, r0
    9b38:	1989      	adds	r1, r1, r6
    9b3a:	0000      	movs	r0, r0
    9b3c:	3102      	adds	r1, #2
    9b3e:	0000      	movs	r0, r0
    9b40:	198f      	adds	r7, r1, r6
    9b42:	0000      	movs	r0, r0
    9b44:	3102      	adds	r1, #2
    9b46:	0000      	movs	r0, r0
    9b48:	1995      	adds	r5, r2, r6
    9b4a:	0000      	movs	r0, r0
    9b4c:	3102      	adds	r1, #2
    9b4e:	0000      	movs	r0, r0
    9b50:	199b      	adds	r3, r3, r6
    9b52:	0000      	movs	r0, r0
    9b54:	3102      	adds	r1, #2
    9b56:	0000      	movs	r0, r0
    9b58:	19a1      	adds	r1, r4, r6
    9b5a:	0000      	movs	r0, r0
    9b5c:	3102      	adds	r1, #2
    9b5e:	0000      	movs	r0, r0
    9b60:	19a7      	adds	r7, r4, r6
    9b62:	0000      	movs	r0, r0
    9b64:	3102      	adds	r1, #2
    9b66:	0000      	movs	r0, r0
    9b68:	19ad      	adds	r5, r5, r6
    9b6a:	0000      	movs	r0, r0
    9b6c:	3102      	adds	r1, #2
    9b6e:	0000      	movs	r0, r0
    9b70:	19b3      	adds	r3, r6, r6
    9b72:	0000      	movs	r0, r0
    9b74:	3102      	adds	r1, #2
    9b76:	0000      	movs	r0, r0
    9b78:	19b9      	adds	r1, r7, r6
    9b7a:	0000      	movs	r0, r0
    9b7c:	3102      	adds	r1, #2
    9b7e:	0000      	movs	r0, r0
    9b80:	19bf      	adds	r7, r7, r6
    9b82:	0000      	movs	r0, r0
    9b84:	3102      	adds	r1, #2
    9b86:	0000      	movs	r0, r0
    9b88:	19c5      	adds	r5, r0, r7
    9b8a:	0000      	movs	r0, r0
    9b8c:	3102      	adds	r1, #2
    9b8e:	0000      	movs	r0, r0
    9b90:	19cb      	adds	r3, r1, r7
    9b92:	0000      	movs	r0, r0
    9b94:	3102      	adds	r1, #2
    9b96:	0000      	movs	r0, r0
    9b98:	19d1      	adds	r1, r2, r7
    9b9a:	0000      	movs	r0, r0
    9b9c:	3102      	adds	r1, #2
    9b9e:	0000      	movs	r0, r0
    9ba0:	19d7      	adds	r7, r2, r7
    9ba2:	0000      	movs	r0, r0
    9ba4:	3102      	adds	r1, #2
    9ba6:	0000      	movs	r0, r0
    9ba8:	19dd      	adds	r5, r3, r7
    9baa:	0000      	movs	r0, r0
    9bac:	3102      	adds	r1, #2
    9bae:	0000      	movs	r0, r0
    9bb0:	19e4      	adds	r4, r4, r7
    9bb2:	0000      	movs	r0, r0
    9bb4:	3102      	adds	r1, #2
    9bb6:	0000      	movs	r0, r0
    9bb8:	19f6      	adds	r6, r6, r7
    9bba:	0000      	movs	r0, r0
    9bbc:	3102      	adds	r1, #2
    9bbe:	0000      	movs	r0, r0
    9bc0:	19fc      	adds	r4, r7, r7
    9bc2:	0000      	movs	r0, r0
    9bc4:	3102      	adds	r1, #2
    9bc6:	0000      	movs	r0, r0
    9bc8:	1a02      	subs	r2, r0, r0
    9bca:	0000      	movs	r0, r0
    9bcc:	3102      	adds	r1, #2
    9bce:	0000      	movs	r0, r0
    9bd0:	1a08      	subs	r0, r1, r0
    9bd2:	0000      	movs	r0, r0
    9bd4:	3102      	adds	r1, #2
    9bd6:	0000      	movs	r0, r0
    9bd8:	1a0e      	subs	r6, r1, r0
    9bda:	0000      	movs	r0, r0
    9bdc:	3102      	adds	r1, #2
    9bde:	0000      	movs	r0, r0
    9be0:	1a14      	subs	r4, r2, r0
    9be2:	0000      	movs	r0, r0
    9be4:	3102      	adds	r1, #2
    9be6:	0000      	movs	r0, r0
    9be8:	1a1a      	subs	r2, r3, r0
    9bea:	0000      	movs	r0, r0
    9bec:	3102      	adds	r1, #2
    9bee:	0000      	movs	r0, r0
    9bf0:	1a20      	subs	r0, r4, r0
    9bf2:	0000      	movs	r0, r0
    9bf4:	3102      	adds	r1, #2
    9bf6:	0000      	movs	r0, r0
    9bf8:	1a26      	subs	r6, r4, r0
    9bfa:	0000      	movs	r0, r0
    9bfc:	3102      	adds	r1, #2
    9bfe:	0000      	movs	r0, r0
    9c00:	1a2c      	subs	r4, r5, r0
    9c02:	0000      	movs	r0, r0
    9c04:	3102      	adds	r1, #2
    9c06:	0000      	movs	r0, r0
    9c08:	1a32      	subs	r2, r6, r0
    9c0a:	0000      	movs	r0, r0
    9c0c:	3102      	adds	r1, #2
    9c0e:	0000      	movs	r0, r0
    9c10:	1a38      	subs	r0, r7, r0
    9c12:	0000      	movs	r0, r0
    9c14:	3102      	adds	r1, #2
    9c16:	0000      	movs	r0, r0
    9c18:	1a3e      	subs	r6, r7, r0
    9c1a:	0000      	movs	r0, r0
    9c1c:	3102      	adds	r1, #2
    9c1e:	0000      	movs	r0, r0
    9c20:	1a44      	subs	r4, r0, r1
    9c22:	0000      	movs	r0, r0
    9c24:	3102      	adds	r1, #2
    9c26:	0000      	movs	r0, r0
    9c28:	1a4a      	subs	r2, r1, r1
    9c2a:	0000      	movs	r0, r0
    9c2c:	3102      	adds	r1, #2
    9c2e:	0000      	movs	r0, r0
    9c30:	1a50      	subs	r0, r2, r1
    9c32:	0000      	movs	r0, r0
    9c34:	3102      	adds	r1, #2
    9c36:	0000      	movs	r0, r0
    9c38:	1a56      	subs	r6, r2, r1
    9c3a:	0000      	movs	r0, r0
    9c3c:	3102      	adds	r1, #2
    9c3e:	0000      	movs	r0, r0
    9c40:	1a5c      	subs	r4, r3, r1
    9c42:	0000      	movs	r0, r0
    9c44:	3102      	adds	r1, #2
    9c46:	0000      	movs	r0, r0
    9c48:	1a62      	subs	r2, r4, r1
    9c4a:	0000      	movs	r0, r0
    9c4c:	3102      	adds	r1, #2
    9c4e:	0000      	movs	r0, r0
    9c50:	1a68      	subs	r0, r5, r1
    9c52:	0000      	movs	r0, r0
    9c54:	3102      	adds	r1, #2
    9c56:	0000      	movs	r0, r0
    9c58:	1a6e      	subs	r6, r5, r1
    9c5a:	0000      	movs	r0, r0
    9c5c:	3102      	adds	r1, #2
    9c5e:	0000      	movs	r0, r0
    9c60:	1a74      	subs	r4, r6, r1
    9c62:	0000      	movs	r0, r0
    9c64:	3102      	adds	r1, #2
    9c66:	0000      	movs	r0, r0
    9c68:	1a7a      	subs	r2, r7, r1
    9c6a:	0000      	movs	r0, r0
    9c6c:	3102      	adds	r1, #2
    9c6e:	0000      	movs	r0, r0
    9c70:	1a81      	subs	r1, r0, r2
    9c72:	0000      	movs	r0, r0
    9c74:	3102      	adds	r1, #2
    9c76:	0000      	movs	r0, r0
    9c78:	1a88      	subs	r0, r1, r2
    9c7a:	0000      	movs	r0, r0
    9c7c:	3102      	adds	r1, #2
    9c7e:	0000      	movs	r0, r0
    9c80:	1a8f      	subs	r7, r1, r2
    9c82:	0000      	movs	r0, r0
    9c84:	3102      	adds	r1, #2
    9c86:	0000      	movs	r0, r0
    9c88:	1a96      	subs	r6, r2, r2
    9c8a:	0000      	movs	r0, r0
    9c8c:	3102      	adds	r1, #2
    9c8e:	0000      	movs	r0, r0
    9c90:	1a9d      	subs	r5, r3, r2
    9c92:	0000      	movs	r0, r0
    9c94:	3102      	adds	r1, #2
    9c96:	0000      	movs	r0, r0
    9c98:	1aa4      	subs	r4, r4, r2
    9c9a:	0000      	movs	r0, r0
    9c9c:	3102      	adds	r1, #2
    9c9e:	0000      	movs	r0, r0
    9ca0:	1aab      	subs	r3, r5, r2
    9ca2:	0000      	movs	r0, r0
    9ca4:	3102      	adds	r1, #2
    9ca6:	0000      	movs	r0, r0
    9ca8:	1ab2      	subs	r2, r6, r2
    9caa:	0000      	movs	r0, r0
    9cac:	3102      	adds	r1, #2
    9cae:	0000      	movs	r0, r0
    9cb0:	1ab9      	subs	r1, r7, r2
    9cb2:	0000      	movs	r0, r0
    9cb4:	3102      	adds	r1, #2
    9cb6:	0000      	movs	r0, r0
    9cb8:	1ac0      	subs	r0, r0, r3
    9cba:	0000      	movs	r0, r0
    9cbc:	3102      	adds	r1, #2
    9cbe:	0000      	movs	r0, r0
    9cc0:	1ac7      	subs	r7, r0, r3
    9cc2:	0000      	movs	r0, r0
    9cc4:	3102      	adds	r1, #2
    9cc6:	0000      	movs	r0, r0
    9cc8:	1ace      	subs	r6, r1, r3
    9cca:	0000      	movs	r0, r0
    9ccc:	3102      	adds	r1, #2
    9cce:	0000      	movs	r0, r0
    9cd0:	1ad5      	subs	r5, r2, r3
    9cd2:	0000      	movs	r0, r0
    9cd4:	3102      	adds	r1, #2
    9cd6:	0000      	movs	r0, r0
    9cd8:	1adc      	subs	r4, r3, r3
    9cda:	0000      	movs	r0, r0
    9cdc:	3102      	adds	r1, #2
    9cde:	0000      	movs	r0, r0
    9ce0:	1ae3      	subs	r3, r4, r3
    9ce2:	0000      	movs	r0, r0
    9ce4:	3102      	adds	r1, #2
    9ce6:	0000      	movs	r0, r0
    9ce8:	1aea      	subs	r2, r5, r3
    9cea:	0000      	movs	r0, r0
    9cec:	3102      	adds	r1, #2
    9cee:	0000      	movs	r0, r0
    9cf0:	1af1      	subs	r1, r6, r3
    9cf2:	0000      	movs	r0, r0
    9cf4:	3102      	adds	r1, #2
    9cf6:	0000      	movs	r0, r0
    9cf8:	1af8      	subs	r0, r7, r3
    9cfa:	0000      	movs	r0, r0
    9cfc:	3102      	adds	r1, #2
    9cfe:	0000      	movs	r0, r0
    9d00:	1aff      	subs	r7, r7, r3
    9d02:	0000      	movs	r0, r0
    9d04:	3102      	adds	r1, #2
    9d06:	0000      	movs	r0, r0
    9d08:	1b06      	subs	r6, r0, r4
    9d0a:	0000      	movs	r0, r0
    9d0c:	3102      	adds	r1, #2
    9d0e:	0000      	movs	r0, r0
    9d10:	1b0d      	subs	r5, r1, r4
    9d12:	0000      	movs	r0, r0
    9d14:	3102      	adds	r1, #2
    9d16:	0000      	movs	r0, r0
    9d18:	1b14      	subs	r4, r2, r4
    9d1a:	0000      	movs	r0, r0
    9d1c:	3102      	adds	r1, #2
    9d1e:	0000      	movs	r0, r0
    9d20:	1b1b      	subs	r3, r3, r4
    9d22:	0000      	movs	r0, r0
    9d24:	3102      	adds	r1, #2
    9d26:	0000      	movs	r0, r0
    9d28:	1b22      	subs	r2, r4, r4
    9d2a:	0000      	movs	r0, r0
    9d2c:	3102      	adds	r1, #2
    9d2e:	0000      	movs	r0, r0
    9d30:	1b29      	subs	r1, r5, r4
    9d32:	0000      	movs	r0, r0
    9d34:	3102      	adds	r1, #2
    9d36:	0000      	movs	r0, r0
    9d38:	1b30      	subs	r0, r6, r4
    9d3a:	0000      	movs	r0, r0
    9d3c:	3102      	adds	r1, #2
    9d3e:	0000      	movs	r0, r0
    9d40:	1b37      	subs	r7, r6, r4
    9d42:	0000      	movs	r0, r0
    9d44:	3102      	adds	r1, #2
    9d46:	0000      	movs	r0, r0
    9d48:	1b3e      	subs	r6, r7, r4
    9d4a:	0000      	movs	r0, r0
    9d4c:	3102      	adds	r1, #2
    9d4e:	0000      	movs	r0, r0
    9d50:	1b45      	subs	r5, r0, r5
    9d52:	0000      	movs	r0, r0
    9d54:	3102      	adds	r1, #2
    9d56:	0000      	movs	r0, r0
    9d58:	1b4c      	subs	r4, r1, r5
    9d5a:	0000      	movs	r0, r0
    9d5c:	3102      	adds	r1, #2
    9d5e:	0000      	movs	r0, r0
    9d60:	1b53      	subs	r3, r2, r5
    9d62:	0000      	movs	r0, r0
    9d64:	3102      	adds	r1, #2
    9d66:	0000      	movs	r0, r0
    9d68:	1b5a      	subs	r2, r3, r5
    9d6a:	0000      	movs	r0, r0
    9d6c:	3102      	adds	r1, #2
    9d6e:	0000      	movs	r0, r0
    9d70:	1b61      	subs	r1, r4, r5
    9d72:	0000      	movs	r0, r0
    9d74:	3102      	adds	r1, #2
    9d76:	0000      	movs	r0, r0
    9d78:	1b68      	subs	r0, r5, r5
    9d7a:	0000      	movs	r0, r0
    9d7c:	3102      	adds	r1, #2
    9d7e:	0000      	movs	r0, r0
    9d80:	1b6f      	subs	r7, r5, r5
    9d82:	0000      	movs	r0, r0
    9d84:	3102      	adds	r1, #2
    9d86:	0000      	movs	r0, r0
    9d88:	1b76      	subs	r6, r6, r5
    9d8a:	0000      	movs	r0, r0
    9d8c:	3102      	adds	r1, #2
    9d8e:	0000      	movs	r0, r0
    9d90:	1b7d      	subs	r5, r7, r5
    9d92:	0000      	movs	r0, r0
    9d94:	3102      	adds	r1, #2
    9d96:	0000      	movs	r0, r0
    9d98:	1b84      	subs	r4, r0, r6
    9d9a:	0000      	movs	r0, r0
    9d9c:	3102      	adds	r1, #2
    9d9e:	0000      	movs	r0, r0
    9da0:	1b8b      	subs	r3, r1, r6
    9da2:	0000      	movs	r0, r0
    9da4:	3102      	adds	r1, #2
    9da6:	0000      	movs	r0, r0
    9da8:	1b92      	subs	r2, r2, r6
    9daa:	0000      	movs	r0, r0
    9dac:	3102      	adds	r1, #2
    9dae:	0000      	movs	r0, r0
    9db0:	1b99      	subs	r1, r3, r6
    9db2:	0000      	movs	r0, r0
    9db4:	3102      	adds	r1, #2
    9db6:	0000      	movs	r0, r0
    9db8:	1ba0      	subs	r0, r4, r6
    9dba:	0000      	movs	r0, r0
    9dbc:	3102      	adds	r1, #2
    9dbe:	0000      	movs	r0, r0
    9dc0:	1ba7      	subs	r7, r4, r6
    9dc2:	0000      	movs	r0, r0
    9dc4:	3102      	adds	r1, #2
    9dc6:	0000      	movs	r0, r0
    9dc8:	1bae      	subs	r6, r5, r6
    9dca:	0000      	movs	r0, r0
    9dcc:	3102      	adds	r1, #2
    9dce:	0000      	movs	r0, r0
    9dd0:	1bb5      	subs	r5, r6, r6
    9dd2:	0000      	movs	r0, r0
    9dd4:	3102      	adds	r1, #2
    9dd6:	0000      	movs	r0, r0
    9dd8:	1bbc      	subs	r4, r7, r6
    9dda:	0000      	movs	r0, r0
    9ddc:	3102      	adds	r1, #2
    9dde:	0000      	movs	r0, r0
    9de0:	1bc3      	subs	r3, r0, r7
    9de2:	0000      	movs	r0, r0
    9de4:	3102      	adds	r1, #2
    9de6:	0000      	movs	r0, r0
    9de8:	1bca      	subs	r2, r1, r7
    9dea:	0000      	movs	r0, r0
    9dec:	3102      	adds	r1, #2
    9dee:	0000      	movs	r0, r0
    9df0:	1bd1      	subs	r1, r2, r7
    9df2:	0000      	movs	r0, r0
    9df4:	3102      	adds	r1, #2
    9df6:	0000      	movs	r0, r0
    9df8:	1bd8      	subs	r0, r3, r7
    9dfa:	0000      	movs	r0, r0
    9dfc:	3102      	adds	r1, #2
    9dfe:	0000      	movs	r0, r0
    9e00:	1bdf      	subs	r7, r3, r7
    9e02:	0000      	movs	r0, r0
    9e04:	3102      	adds	r1, #2
    9e06:	0000      	movs	r0, r0
    9e08:	1be6      	subs	r6, r4, r7
    9e0a:	0000      	movs	r0, r0
    9e0c:	3102      	adds	r1, #2
    9e0e:	0000      	movs	r0, r0
    9e10:	1bed      	subs	r5, r5, r7
    9e12:	0000      	movs	r0, r0
    9e14:	3102      	adds	r1, #2
    9e16:	0000      	movs	r0, r0
    9e18:	1bf4      	subs	r4, r6, r7
    9e1a:	0000      	movs	r0, r0
    9e1c:	3102      	adds	r1, #2
    9e1e:	0000      	movs	r0, r0
    9e20:	1bfb      	subs	r3, r7, r7
    9e22:	0000      	movs	r0, r0
    9e24:	3102      	adds	r1, #2
    9e26:	0000      	movs	r0, r0
    9e28:	1c02      	adds	r2, r0, #0
    9e2a:	0000      	movs	r0, r0
    9e2c:	3102      	adds	r1, #2
    9e2e:	0000      	movs	r0, r0
    9e30:	1c09      	adds	r1, r1, #0
    9e32:	0000      	movs	r0, r0
    9e34:	3102      	adds	r1, #2
    9e36:	0000      	movs	r0, r0
    9e38:	1c10      	adds	r0, r2, #0
    9e3a:	0000      	movs	r0, r0
    9e3c:	3102      	adds	r1, #2
    9e3e:	0000      	movs	r0, r0
    9e40:	1c17      	adds	r7, r2, #0
    9e42:	0000      	movs	r0, r0
    9e44:	3102      	adds	r1, #2
    9e46:	0000      	movs	r0, r0
    9e48:	1c1e      	adds	r6, r3, #0
    9e4a:	0000      	movs	r0, r0
    9e4c:	3102      	adds	r1, #2
    9e4e:	0000      	movs	r0, r0
    9e50:	1c25      	adds	r5, r4, #0
    9e52:	0000      	movs	r0, r0
    9e54:	3102      	adds	r1, #2
    9e56:	0000      	movs	r0, r0
    9e58:	1c2c      	adds	r4, r5, #0
    9e5a:	0000      	movs	r0, r0
    9e5c:	3102      	adds	r1, #2
    9e5e:	0000      	movs	r0, r0
    9e60:	1c33      	adds	r3, r6, #0
    9e62:	0000      	movs	r0, r0
    9e64:	3102      	adds	r1, #2
    9e66:	0000      	movs	r0, r0
    9e68:	1c3a      	adds	r2, r7, #0
    9e6a:	0000      	movs	r0, r0
    9e6c:	3102      	adds	r1, #2
    9e6e:	0000      	movs	r0, r0
    9e70:	1c41      	adds	r1, r0, #1
    9e72:	0000      	movs	r0, r0
    9e74:	3102      	adds	r1, #2
    9e76:	0000      	movs	r0, r0
    9e78:	1c48      	adds	r0, r1, #1
    9e7a:	0000      	movs	r0, r0
    9e7c:	3102      	adds	r1, #2
    9e7e:	0000      	movs	r0, r0
    9e80:	1c4f      	adds	r7, r1, #1
    9e82:	0000      	movs	r0, r0
    9e84:	3102      	adds	r1, #2
    9e86:	0000      	movs	r0, r0
    9e88:	1c56      	adds	r6, r2, #1
    9e8a:	0000      	movs	r0, r0
    9e8c:	3102      	adds	r1, #2
    9e8e:	0000      	movs	r0, r0
    9e90:	1c5d      	adds	r5, r3, #1
    9e92:	0000      	movs	r0, r0
    9e94:	3102      	adds	r1, #2
    9e96:	0000      	movs	r0, r0
    9e98:	1c64      	adds	r4, r4, #1
    9e9a:	0000      	movs	r0, r0
    9e9c:	3102      	adds	r1, #2
    9e9e:	0000      	movs	r0, r0
    9ea0:	1c6b      	adds	r3, r5, #1
    9ea2:	0000      	movs	r0, r0
    9ea4:	3102      	adds	r1, #2
    9ea6:	0000      	movs	r0, r0
    9ea8:	1c72      	adds	r2, r6, #1
    9eaa:	0000      	movs	r0, r0
    9eac:	3102      	adds	r1, #2
    9eae:	0000      	movs	r0, r0
    9eb0:	1c79      	adds	r1, r7, #1
    9eb2:	0000      	movs	r0, r0
    9eb4:	3102      	adds	r1, #2
    9eb6:	0000      	movs	r0, r0
    9eb8:	1c80      	adds	r0, r0, #2
    9eba:	0000      	movs	r0, r0
    9ebc:	3102      	adds	r1, #2
    9ebe:	0000      	movs	r0, r0
    9ec0:	1c87      	adds	r7, r0, #2
    9ec2:	0000      	movs	r0, r0
    9ec4:	3102      	adds	r1, #2
    9ec6:	0000      	movs	r0, r0
    9ec8:	1c8e      	adds	r6, r1, #2
    9eca:	0000      	movs	r0, r0
    9ecc:	3102      	adds	r1, #2
    9ece:	0000      	movs	r0, r0
    9ed0:	1c95      	adds	r5, r2, #2
    9ed2:	0000      	movs	r0, r0
    9ed4:	3102      	adds	r1, #2
    9ed6:	0000      	movs	r0, r0
    9ed8:	1c9c      	adds	r4, r3, #2
    9eda:	0000      	movs	r0, r0
    9edc:	3102      	adds	r1, #2
    9ede:	0000      	movs	r0, r0
    9ee0:	1ca3      	adds	r3, r4, #2
    9ee2:	0000      	movs	r0, r0
    9ee4:	3102      	adds	r1, #2
    9ee6:	0000      	movs	r0, r0
    9ee8:	1cab      	adds	r3, r5, #2
    9eea:	0000      	movs	r0, r0
    9eec:	3102      	adds	r1, #2
    9eee:	0000      	movs	r0, r0
    9ef0:	1cb7      	adds	r7, r6, #2
    9ef2:	0000      	movs	r0, r0
    9ef4:	3102      	adds	r1, #2
    9ef6:	0000      	movs	r0, r0
    9ef8:	1cc9      	adds	r1, r1, #3
    9efa:	0000      	movs	r0, r0
    9efc:	3102      	adds	r1, #2
    9efe:	0000      	movs	r0, r0
    9f00:	1ccf      	adds	r7, r1, #3
    9f02:	0000      	movs	r0, r0
    9f04:	3102      	adds	r1, #2
    9f06:	0000      	movs	r0, r0
    9f08:	1cd5      	adds	r5, r2, #3
    9f0a:	0000      	movs	r0, r0
    9f0c:	3102      	adds	r1, #2
    9f0e:	0000      	movs	r0, r0
    9f10:	1cdb      	adds	r3, r3, #3
    9f12:	0000      	movs	r0, r0
    9f14:	3102      	adds	r1, #2
    9f16:	0000      	movs	r0, r0
    9f18:	1ce1      	adds	r1, r4, #3
    9f1a:	0000      	movs	r0, r0
    9f1c:	3102      	adds	r1, #2
    9f1e:	0000      	movs	r0, r0
    9f20:	1ce7      	adds	r7, r4, #3
    9f22:	0000      	movs	r0, r0
    9f24:	3102      	adds	r1, #2
    9f26:	0000      	movs	r0, r0
    9f28:	1ced      	adds	r5, r5, #3
    9f2a:	0000      	movs	r0, r0
    9f2c:	3102      	adds	r1, #2
    9f2e:	0000      	movs	r0, r0
    9f30:	1cf3      	adds	r3, r6, #3
    9f32:	0000      	movs	r0, r0
    9f34:	3102      	adds	r1, #2
    9f36:	0000      	movs	r0, r0
    9f38:	1cf9      	adds	r1, r7, #3
    9f3a:	0000      	movs	r0, r0
    9f3c:	3102      	adds	r1, #2
    9f3e:	0000      	movs	r0, r0
    9f40:	1cff      	adds	r7, r7, #3
    9f42:	0000      	movs	r0, r0
    9f44:	3102      	adds	r1, #2
    9f46:	0000      	movs	r0, r0
    9f48:	1d05      	adds	r5, r0, #4
    9f4a:	0000      	movs	r0, r0
    9f4c:	3102      	adds	r1, #2
    9f4e:	0000      	movs	r0, r0
    9f50:	1d0b      	adds	r3, r1, #4
    9f52:	0000      	movs	r0, r0
    9f54:	3102      	adds	r1, #2
    9f56:	0000      	movs	r0, r0
    9f58:	1d11      	adds	r1, r2, #4
    9f5a:	0000      	movs	r0, r0
    9f5c:	3102      	adds	r1, #2
    9f5e:	0000      	movs	r0, r0
    9f60:	1d17      	adds	r7, r2, #4
    9f62:	0000      	movs	r0, r0
    9f64:	3102      	adds	r1, #2
    9f66:	0000      	movs	r0, r0
    9f68:	1d1d      	adds	r5, r3, #4
    9f6a:	0000      	movs	r0, r0
    9f6c:	3102      	adds	r1, #2
    9f6e:	0000      	movs	r0, r0
    9f70:	1d23      	adds	r3, r4, #4
    9f72:	0000      	movs	r0, r0
    9f74:	3102      	adds	r1, #2
    9f76:	0000      	movs	r0, r0
    9f78:	1d29      	adds	r1, r5, #4
    9f7a:	0000      	movs	r0, r0
    9f7c:	3102      	adds	r1, #2
    9f7e:	0000      	movs	r0, r0
    9f80:	1d2f      	adds	r7, r5, #4
    9f82:	0000      	movs	r0, r0
    9f84:	3102      	adds	r1, #2
    9f86:	0000      	movs	r0, r0
    9f88:	1d35      	adds	r5, r6, #4
    9f8a:	0000      	movs	r0, r0
    9f8c:	3102      	adds	r1, #2
    9f8e:	0000      	movs	r0, r0
    9f90:	1d3b      	adds	r3, r7, #4
    9f92:	0000      	movs	r0, r0
    9f94:	3102      	adds	r1, #2
    9f96:	0000      	movs	r0, r0
    9f98:	1d41      	adds	r1, r0, #5
    9f9a:	0000      	movs	r0, r0
    9f9c:	3102      	adds	r1, #2
    9f9e:	0000      	movs	r0, r0
    9fa0:	1d47      	adds	r7, r0, #5
    9fa2:	0000      	movs	r0, r0
    9fa4:	3102      	adds	r1, #2
    9fa6:	0000      	movs	r0, r0
    9fa8:	1d4d      	adds	r5, r1, #5
    9faa:	0000      	movs	r0, r0
    9fac:	3102      	adds	r1, #2
    9fae:	0000      	movs	r0, r0
    9fb0:	1d53      	adds	r3, r2, #5
    9fb2:	0000      	movs	r0, r0
    9fb4:	3102      	adds	r1, #2
    9fb6:	0000      	movs	r0, r0
    9fb8:	1d59      	adds	r1, r3, #5
    9fba:	0000      	movs	r0, r0
    9fbc:	3102      	adds	r1, #2
    9fbe:	0000      	movs	r0, r0
    9fc0:	1d5f      	adds	r7, r3, #5
    9fc2:	0000      	movs	r0, r0
    9fc4:	3102      	adds	r1, #2
    9fc6:	0000      	movs	r0, r0
    9fc8:	1d65      	adds	r5, r4, #5
    9fca:	0000      	movs	r0, r0
    9fcc:	3102      	adds	r1, #2
    9fce:	0000      	movs	r0, r0
    9fd0:	1d6b      	adds	r3, r5, #5
    9fd2:	0000      	movs	r0, r0
    9fd4:	3102      	adds	r1, #2
    9fd6:	0000      	movs	r0, r0
    9fd8:	1d71      	adds	r1, r6, #5
    9fda:	0000      	movs	r0, r0
    9fdc:	3102      	adds	r1, #2
    9fde:	0000      	movs	r0, r0
    9fe0:	1d77      	adds	r7, r6, #5
    9fe2:	0000      	movs	r0, r0
    9fe4:	3102      	adds	r1, #2
    9fe6:	0000      	movs	r0, r0
    9fe8:	1d7d      	adds	r5, r7, #5
    9fea:	0000      	movs	r0, r0
    9fec:	3102      	adds	r1, #2
    9fee:	0000      	movs	r0, r0
    9ff0:	1d83      	adds	r3, r0, #6
    9ff2:	0000      	movs	r0, r0
    9ff4:	3102      	adds	r1, #2
    9ff6:	0000      	movs	r0, r0
    9ff8:	1d8a      	adds	r2, r1, #6
    9ffa:	0000      	movs	r0, r0
    9ffc:	3102      	adds	r1, #2
    9ffe:	0000      	movs	r0, r0
    a000:	1d9c      	adds	r4, r3, #6
    a002:	0000      	movs	r0, r0
    a004:	3102      	adds	r1, #2
    a006:	0000      	movs	r0, r0
    a008:	1da5      	adds	r5, r4, #6
    a00a:	0000      	movs	r0, r0
    a00c:	3102      	adds	r1, #2
    a00e:	0000      	movs	r0, r0
    a010:	1dae      	adds	r6, r5, #6
    a012:	0000      	movs	r0, r0
    a014:	3102      	adds	r1, #2
    a016:	0000      	movs	r0, r0
    a018:	1db7      	adds	r7, r6, #6
    a01a:	0000      	movs	r0, r0
    a01c:	3102      	adds	r1, #2
    a01e:	0000      	movs	r0, r0
    a020:	1dc0      	adds	r0, r0, #7
    a022:	0000      	movs	r0, r0
    a024:	3102      	adds	r1, #2
    a026:	0000      	movs	r0, r0
    a028:	1dc9      	adds	r1, r1, #7
    a02a:	0000      	movs	r0, r0
    a02c:	3102      	adds	r1, #2
    a02e:	0000      	movs	r0, r0
    a030:	1dd2      	adds	r2, r2, #7
    a032:	0000      	movs	r0, r0
    a034:	3102      	adds	r1, #2
    a036:	0000      	movs	r0, r0
    a038:	1ddb      	adds	r3, r3, #7
    a03a:	0000      	movs	r0, r0
    a03c:	3102      	adds	r1, #2
    a03e:	0000      	movs	r0, r0
    a040:	1de2      	adds	r2, r4, #7
    a042:	0000      	movs	r0, r0
    a044:	3102      	adds	r1, #2
    a046:	0000      	movs	r0, r0
    a048:	1de9      	adds	r1, r5, #7
    a04a:	0000      	movs	r0, r0
    a04c:	3102      	adds	r1, #2
    a04e:	0000      	movs	r0, r0
    a050:	1df0      	adds	r0, r6, #7
    a052:	0000      	movs	r0, r0
    a054:	3102      	adds	r1, #2
    a056:	0000      	movs	r0, r0
    a058:	1df7      	adds	r7, r6, #7
    a05a:	0000      	movs	r0, r0
    a05c:	3102      	adds	r1, #2
    a05e:	0000      	movs	r0, r0
    a060:	1dfe      	adds	r6, r7, #7
    a062:	0000      	movs	r0, r0
    a064:	3102      	adds	r1, #2
    a066:	0000      	movs	r0, r0
    a068:	1e05      	subs	r5, r0, #0
    a06a:	0000      	movs	r0, r0
    a06c:	3102      	adds	r1, #2
    a06e:	0000      	movs	r0, r0
    a070:	1e0c      	subs	r4, r1, #0
    a072:	0000      	movs	r0, r0
    a074:	3102      	adds	r1, #2
    a076:	0000      	movs	r0, r0
    a078:	1e13      	subs	r3, r2, #0
    a07a:	0000      	movs	r0, r0
    a07c:	3102      	adds	r1, #2
    a07e:	0000      	movs	r0, r0
    a080:	1e1a      	subs	r2, r3, #0
    a082:	0000      	movs	r0, r0
    a084:	3102      	adds	r1, #2
    a086:	0000      	movs	r0, r0
    a088:	1e21      	subs	r1, r4, #0
    a08a:	0000      	movs	r0, r0
    a08c:	3102      	adds	r1, #2
    a08e:	0000      	movs	r0, r0
    a090:	1e28      	subs	r0, r5, #0
    a092:	0000      	movs	r0, r0
    a094:	3102      	adds	r1, #2
    a096:	0000      	movs	r0, r0
    a098:	1e2f      	subs	r7, r5, #0
    a09a:	0000      	movs	r0, r0
    a09c:	3102      	adds	r1, #2
    a09e:	0000      	movs	r0, r0
    a0a0:	1e36      	subs	r6, r6, #0
    a0a2:	0000      	movs	r0, r0
    a0a4:	3102      	adds	r1, #2
    a0a6:	0000      	movs	r0, r0
    a0a8:	1e3d      	subs	r5, r7, #0
    a0aa:	0000      	movs	r0, r0
    a0ac:	3102      	adds	r1, #2
    a0ae:	0000      	movs	r0, r0
    a0b0:	1e44      	subs	r4, r0, #1
    a0b2:	0000      	movs	r0, r0
    a0b4:	3102      	adds	r1, #2
    a0b6:	0000      	movs	r0, r0
    a0b8:	1e4b      	subs	r3, r1, #1
    a0ba:	0000      	movs	r0, r0
    a0bc:	3102      	adds	r1, #2
    a0be:	0000      	movs	r0, r0
    a0c0:	1e52      	subs	r2, r2, #1
    a0c2:	0000      	movs	r0, r0
    a0c4:	3102      	adds	r1, #2
    a0c6:	0000      	movs	r0, r0
    a0c8:	1e59      	subs	r1, r3, #1
    a0ca:	0000      	movs	r0, r0
    a0cc:	3102      	adds	r1, #2
    a0ce:	0000      	movs	r0, r0
    a0d0:	1e60      	subs	r0, r4, #1
    a0d2:	0000      	movs	r0, r0
    a0d4:	3102      	adds	r1, #2
    a0d6:	0000      	movs	r0, r0
    a0d8:	1e67      	subs	r7, r4, #1
    a0da:	0000      	movs	r0, r0
    a0dc:	3102      	adds	r1, #2
    a0de:	0000      	movs	r0, r0
    a0e0:	1e6e      	subs	r6, r5, #1
    a0e2:	0000      	movs	r0, r0
    a0e4:	3102      	adds	r1, #2
    a0e6:	0000      	movs	r0, r0
    a0e8:	1e75      	subs	r5, r6, #1
    a0ea:	0000      	movs	r0, r0
    a0ec:	3102      	adds	r1, #2
    a0ee:	0000      	movs	r0, r0
    a0f0:	1e7c      	subs	r4, r7, #1
    a0f2:	0000      	movs	r0, r0
    a0f4:	3102      	adds	r1, #2
    a0f6:	0000      	movs	r0, r0
    a0f8:	1e83      	subs	r3, r0, #2
    a0fa:	0000      	movs	r0, r0
    a0fc:	3102      	adds	r1, #2
    a0fe:	0000      	movs	r0, r0
    a100:	1e8a      	subs	r2, r1, #2
    a102:	0000      	movs	r0, r0
    a104:	3102      	adds	r1, #2
    a106:	0000      	movs	r0, r0
    a108:	1e91      	subs	r1, r2, #2
    a10a:	0000      	movs	r0, r0
    a10c:	3102      	adds	r1, #2
    a10e:	0000      	movs	r0, r0
    a110:	1e98      	subs	r0, r3, #2
    a112:	0000      	movs	r0, r0
    a114:	3102      	adds	r1, #2
    a116:	0000      	movs	r0, r0
    a118:	1e9f      	subs	r7, r3, #2
    a11a:	0000      	movs	r0, r0
    a11c:	3102      	adds	r1, #2
    a11e:	0000      	movs	r0, r0
    a120:	1ea6      	subs	r6, r4, #2
    a122:	0000      	movs	r0, r0
    a124:	3102      	adds	r1, #2
    a126:	0000      	movs	r0, r0
    a128:	1ead      	subs	r5, r5, #2
    a12a:	0000      	movs	r0, r0
    a12c:	3102      	adds	r1, #2
    a12e:	0000      	movs	r0, r0
    a130:	1eb4      	subs	r4, r6, #2
    a132:	0000      	movs	r0, r0
    a134:	3102      	adds	r1, #2
    a136:	0000      	movs	r0, r0
    a138:	1ebb      	subs	r3, r7, #2
    a13a:	0000      	movs	r0, r0
    a13c:	3102      	adds	r1, #2
    a13e:	0000      	movs	r0, r0
    a140:	1ec2      	subs	r2, r0, #3
    a142:	0000      	movs	r0, r0
    a144:	3102      	adds	r1, #2
    a146:	0000      	movs	r0, r0
    a148:	1ec9      	subs	r1, r1, #3
    a14a:	0000      	movs	r0, r0
    a14c:	3102      	adds	r1, #2
    a14e:	0000      	movs	r0, r0
    a150:	1ed0      	subs	r0, r2, #3
    a152:	0000      	movs	r0, r0
    a154:	3102      	adds	r1, #2
    a156:	0000      	movs	r0, r0
    a158:	1ed7      	subs	r7, r2, #3
    a15a:	0000      	movs	r0, r0
    a15c:	3102      	adds	r1, #2
    a15e:	0000      	movs	r0, r0
    a160:	1ede      	subs	r6, r3, #3
    a162:	0000      	movs	r0, r0
    a164:	3102      	adds	r1, #2
    a166:	0000      	movs	r0, r0
    a168:	1ee5      	subs	r5, r4, #3
    a16a:	0000      	movs	r0, r0
    a16c:	3102      	adds	r1, #2
    a16e:	0000      	movs	r0, r0
    a170:	1eec      	subs	r4, r5, #3
    a172:	0000      	movs	r0, r0
    a174:	3102      	adds	r1, #2
    a176:	0000      	movs	r0, r0
    a178:	1ef3      	subs	r3, r6, #3
    a17a:	0000      	movs	r0, r0
    a17c:	3102      	adds	r1, #2
    a17e:	0000      	movs	r0, r0
    a180:	1efa      	subs	r2, r7, #3
    a182:	0000      	movs	r0, r0
    a184:	3102      	adds	r1, #2
    a186:	0000      	movs	r0, r0
    a188:	1f01      	subs	r1, r0, #4
    a18a:	0000      	movs	r0, r0
    a18c:	3102      	adds	r1, #2
    a18e:	0000      	movs	r0, r0
    a190:	1f08      	subs	r0, r1, #4
    a192:	0000      	movs	r0, r0
    a194:	3102      	adds	r1, #2
    a196:	0000      	movs	r0, r0
    a198:	1f0f      	subs	r7, r1, #4
    a19a:	0000      	movs	r0, r0
    a19c:	3102      	adds	r1, #2
    a19e:	0000      	movs	r0, r0
    a1a0:	1f16      	subs	r6, r2, #4
    a1a2:	0000      	movs	r0, r0
    a1a4:	3102      	adds	r1, #2
    a1a6:	0000      	movs	r0, r0
    a1a8:	1f1d      	subs	r5, r3, #4
    a1aa:	0000      	movs	r0, r0
    a1ac:	3102      	adds	r1, #2
    a1ae:	0000      	movs	r0, r0
    a1b0:	1f24      	subs	r4, r4, #4
    a1b2:	0000      	movs	r0, r0
    a1b4:	3102      	adds	r1, #2
    a1b6:	0000      	movs	r0, r0
    a1b8:	1f2b      	subs	r3, r5, #4
    a1ba:	0000      	movs	r0, r0
    a1bc:	3102      	adds	r1, #2
    a1be:	0000      	movs	r0, r0
    a1c0:	1f32      	subs	r2, r6, #4
    a1c2:	0000      	movs	r0, r0
    a1c4:	3102      	adds	r1, #2
    a1c6:	0000      	movs	r0, r0
    a1c8:	1f39      	subs	r1, r7, #4
    a1ca:	0000      	movs	r0, r0
    a1cc:	3102      	adds	r1, #2
    a1ce:	0000      	movs	r0, r0
    a1d0:	1f40      	subs	r0, r0, #5
    a1d2:	0000      	movs	r0, r0
    a1d4:	3102      	adds	r1, #2
    a1d6:	0000      	movs	r0, r0
    a1d8:	1f47      	subs	r7, r0, #5
    a1da:	0000      	movs	r0, r0
    a1dc:	3102      	adds	r1, #2
    a1de:	0000      	movs	r0, r0
    a1e0:	1f4e      	subs	r6, r1, #5
    a1e2:	0000      	movs	r0, r0
    a1e4:	3102      	adds	r1, #2
    a1e6:	0000      	movs	r0, r0
    a1e8:	1f55      	subs	r5, r2, #5
    a1ea:	0000      	movs	r0, r0
    a1ec:	3102      	adds	r1, #2
    a1ee:	0000      	movs	r0, r0
    a1f0:	1f5c      	subs	r4, r3, #5
    a1f2:	0000      	movs	r0, r0
    a1f4:	3102      	adds	r1, #2
    a1f6:	0000      	movs	r0, r0
    a1f8:	1f63      	subs	r3, r4, #5
    a1fa:	0000      	movs	r0, r0
    a1fc:	3102      	adds	r1, #2
    a1fe:	0000      	movs	r0, r0
    a200:	1f6a      	subs	r2, r5, #5
    a202:	0000      	movs	r0, r0
    a204:	3102      	adds	r1, #2
    a206:	0000      	movs	r0, r0
    a208:	1f71      	subs	r1, r6, #5
    a20a:	0000      	movs	r0, r0
    a20c:	3102      	adds	r1, #2
    a20e:	0000      	movs	r0, r0
    a210:	1f78      	subs	r0, r7, #5
    a212:	0000      	movs	r0, r0
    a214:	3102      	adds	r1, #2
    a216:	0000      	movs	r0, r0
    a218:	1f7f      	subs	r7, r7, #5
    a21a:	0000      	movs	r0, r0
    a21c:	3102      	adds	r1, #2
    a21e:	0000      	movs	r0, r0
    a220:	1f86      	subs	r6, r0, #6
    a222:	0000      	movs	r0, r0
    a224:	3102      	adds	r1, #2
    a226:	0000      	movs	r0, r0
    a228:	1f8d      	subs	r5, r1, #6
    a22a:	0000      	movs	r0, r0
    a22c:	3102      	adds	r1, #2
    a22e:	0000      	movs	r0, r0
    a230:	1f94      	subs	r4, r2, #6
    a232:	0000      	movs	r0, r0
    a234:	3102      	adds	r1, #2
    a236:	0000      	movs	r0, r0
    a238:	1f9b      	subs	r3, r3, #6
    a23a:	0000      	movs	r0, r0
    a23c:	3102      	adds	r1, #2
    a23e:	0000      	movs	r0, r0
    a240:	1fa2      	subs	r2, r4, #6
    a242:	0000      	movs	r0, r0
    a244:	3102      	adds	r1, #2
    a246:	0000      	movs	r0, r0
    a248:	1fa9      	subs	r1, r5, #6
    a24a:	0000      	movs	r0, r0
    a24c:	3102      	adds	r1, #2
    a24e:	0000      	movs	r0, r0
    a250:	1fb0      	subs	r0, r6, #6
    a252:	0000      	movs	r0, r0
    a254:	3102      	adds	r1, #2
    a256:	0000      	movs	r0, r0
    a258:	1fb7      	subs	r7, r6, #6
    a25a:	0000      	movs	r0, r0
    a25c:	3102      	adds	r1, #2
    a25e:	0000      	movs	r0, r0
    a260:	1fbe      	subs	r6, r7, #6
    a262:	0000      	movs	r0, r0
    a264:	3102      	adds	r1, #2
    a266:	0000      	movs	r0, r0
    a268:	1fc5      	subs	r5, r0, #7
    a26a:	0000      	movs	r0, r0
    a26c:	3102      	adds	r1, #2
    a26e:	0000      	movs	r0, r0
    a270:	1fcc      	subs	r4, r1, #7
    a272:	0000      	movs	r0, r0
    a274:	3102      	adds	r1, #2
    a276:	0000      	movs	r0, r0
    a278:	1fd3      	subs	r3, r2, #7
    a27a:	0000      	movs	r0, r0
    a27c:	3102      	adds	r1, #2
    a27e:	0000      	movs	r0, r0
    a280:	1fda      	subs	r2, r3, #7
    a282:	0000      	movs	r0, r0
    a284:	3102      	adds	r1, #2
    a286:	0000      	movs	r0, r0
    a288:	1fe1      	subs	r1, r4, #7
    a28a:	0000      	movs	r0, r0
    a28c:	3102      	adds	r1, #2
    a28e:	0000      	movs	r0, r0
    a290:	1fe8      	subs	r0, r5, #7
    a292:	0000      	movs	r0, r0
    a294:	3102      	adds	r1, #2
    a296:	0000      	movs	r0, r0
    a298:	1fef      	subs	r7, r5, #7
    a29a:	0000      	movs	r0, r0
    a29c:	3102      	adds	r1, #2
    a29e:	0000      	movs	r0, r0
    a2a0:	1ff6      	subs	r6, r6, #7
    a2a2:	0000      	movs	r0, r0
    a2a4:	3102      	adds	r1, #2
    a2a6:	0000      	movs	r0, r0
    a2a8:	1ffd      	subs	r5, r7, #7
    a2aa:	0000      	movs	r0, r0
    a2ac:	3102      	adds	r1, #2
    a2ae:	0000      	movs	r0, r0
    a2b0:	2004      	movs	r0, #4
    a2b2:	0000      	movs	r0, r0
    a2b4:	3102      	adds	r1, #2
    a2b6:	0000      	movs	r0, r0
    a2b8:	200b      	movs	r0, #11
    a2ba:	0000      	movs	r0, r0
    a2bc:	3102      	adds	r1, #2
    a2be:	0000      	movs	r0, r0
    a2c0:	2012      	movs	r0, #18
    a2c2:	0000      	movs	r0, r0
    a2c4:	3102      	adds	r1, #2
    a2c6:	0000      	movs	r0, r0
    a2c8:	2019      	movs	r0, #25
    a2ca:	0000      	movs	r0, r0
    a2cc:	3102      	adds	r1, #2
    a2ce:	0000      	movs	r0, r0
    a2d0:	2020      	movs	r0, #32
    a2d2:	0000      	movs	r0, r0
    a2d4:	3102      	adds	r1, #2
    a2d6:	0000      	movs	r0, r0
    a2d8:	2027      	movs	r0, #39	; 0x27
    a2da:	0000      	movs	r0, r0
    a2dc:	3102      	adds	r1, #2
    a2de:	0000      	movs	r0, r0
    a2e0:	202e      	movs	r0, #46	; 0x2e
    a2e2:	0000      	movs	r0, r0
    a2e4:	3102      	adds	r1, #2
    a2e6:	0000      	movs	r0, r0
    a2e8:	2035      	movs	r0, #53	; 0x35
    a2ea:	0000      	movs	r0, r0
    a2ec:	3102      	adds	r1, #2
    a2ee:	0000      	movs	r0, r0
    a2f0:	203c      	movs	r0, #60	; 0x3c
    a2f2:	0000      	movs	r0, r0
    a2f4:	3102      	adds	r1, #2
    a2f6:	0000      	movs	r0, r0
    a2f8:	2043      	movs	r0, #67	; 0x43
    a2fa:	0000      	movs	r0, r0
    a2fc:	3102      	adds	r1, #2
    a2fe:	0000      	movs	r0, r0
    a300:	204a      	movs	r0, #74	; 0x4a
    a302:	0000      	movs	r0, r0
    a304:	3102      	adds	r1, #2
    a306:	0000      	movs	r0, r0
    a308:	2051      	movs	r0, #81	; 0x51
    a30a:	0000      	movs	r0, r0
    a30c:	3102      	adds	r1, #2
    a30e:	0000      	movs	r0, r0
    a310:	2058      	movs	r0, #88	; 0x58
    a312:	0000      	movs	r0, r0
    a314:	3102      	adds	r1, #2
    a316:	0000      	movs	r0, r0
    a318:	205f      	movs	r0, #95	; 0x5f
    a31a:	0000      	movs	r0, r0
    a31c:	3102      	adds	r1, #2
    a31e:	0000      	movs	r0, r0
    a320:	2066      	movs	r0, #102	; 0x66
    a322:	0000      	movs	r0, r0
    a324:	3102      	adds	r1, #2
    a326:	0000      	movs	r0, r0
    a328:	206d      	movs	r0, #109	; 0x6d
    a32a:	0000      	movs	r0, r0
    a32c:	3102      	adds	r1, #2
    a32e:	0000      	movs	r0, r0
    a330:	2074      	movs	r0, #116	; 0x74
    a332:	0000      	movs	r0, r0
    a334:	3102      	adds	r1, #2
    a336:	0000      	movs	r0, r0
    a338:	207b      	movs	r0, #123	; 0x7b
    a33a:	0000      	movs	r0, r0
    a33c:	3102      	adds	r1, #2
    a33e:	0000      	movs	r0, r0
    a340:	2082      	movs	r0, #130	; 0x82
    a342:	0000      	movs	r0, r0
    a344:	3102      	adds	r1, #2
    a346:	0000      	movs	r0, r0
    a348:	2089      	movs	r0, #137	; 0x89
    a34a:	0000      	movs	r0, r0
    a34c:	3102      	adds	r1, #2
    a34e:	0000      	movs	r0, r0
    a350:	2090      	movs	r0, #144	; 0x90
    a352:	0000      	movs	r0, r0
    a354:	3102      	adds	r1, #2
    a356:	0000      	movs	r0, r0
    a358:	2097      	movs	r0, #151	; 0x97
    a35a:	0000      	movs	r0, r0
    a35c:	3102      	adds	r1, #2
    a35e:	0000      	movs	r0, r0
    a360:	209e      	movs	r0, #158	; 0x9e
    a362:	0000      	movs	r0, r0
    a364:	3102      	adds	r1, #2
    a366:	0000      	movs	r0, r0
    a368:	20a5      	movs	r0, #165	; 0xa5
    a36a:	0000      	movs	r0, r0
    a36c:	3102      	adds	r1, #2
    a36e:	0000      	movs	r0, r0
    a370:	20ac      	movs	r0, #172	; 0xac
    a372:	0000      	movs	r0, r0
    a374:	3102      	adds	r1, #2
    a376:	0000      	movs	r0, r0
    a378:	20b3      	movs	r0, #179	; 0xb3
    a37a:	0000      	movs	r0, r0
    a37c:	3102      	adds	r1, #2
    a37e:	0000      	movs	r0, r0
    a380:	20ba      	movs	r0, #186	; 0xba
    a382:	0000      	movs	r0, r0
    a384:	3102      	adds	r1, #2
    a386:	0000      	movs	r0, r0
    a388:	20c1      	movs	r0, #193	; 0xc1
    a38a:	0000      	movs	r0, r0
    a38c:	3102      	adds	r1, #2
    a38e:	0000      	movs	r0, r0
    a390:	20c8      	movs	r0, #200	; 0xc8
    a392:	0000      	movs	r0, r0
    a394:	3102      	adds	r1, #2
    a396:	0000      	movs	r0, r0
    a398:	20cf      	movs	r0, #207	; 0xcf
    a39a:	0000      	movs	r0, r0
    a39c:	3102      	adds	r1, #2
    a39e:	0000      	movs	r0, r0
    a3a0:	20d6      	movs	r0, #214	; 0xd6
    a3a2:	0000      	movs	r0, r0
    a3a4:	3102      	adds	r1, #2
    a3a6:	0000      	movs	r0, r0
    a3a8:	20dd      	movs	r0, #221	; 0xdd
    a3aa:	0000      	movs	r0, r0
    a3ac:	3102      	adds	r1, #2
    a3ae:	0000      	movs	r0, r0
    a3b0:	20e4      	movs	r0, #228	; 0xe4
    a3b2:	0000      	movs	r0, r0
    a3b4:	3102      	adds	r1, #2
    a3b6:	0000      	movs	r0, r0
    a3b8:	20eb      	movs	r0, #235	; 0xeb
    a3ba:	0000      	movs	r0, r0
    a3bc:	3102      	adds	r1, #2
    a3be:	0000      	movs	r0, r0
    a3c0:	20f2      	movs	r0, #242	; 0xf2
    a3c2:	0000      	movs	r0, r0
    a3c4:	3102      	adds	r1, #2
    a3c6:	0000      	movs	r0, r0
    a3c8:	20f9      	movs	r0, #249	; 0xf9
    a3ca:	0000      	movs	r0, r0
    a3cc:	3102      	adds	r1, #2
    a3ce:	0000      	movs	r0, r0
    a3d0:	2100      	movs	r1, #0
    a3d2:	0000      	movs	r0, r0
    a3d4:	3102      	adds	r1, #2
    a3d6:	0000      	movs	r0, r0
    a3d8:	2107      	movs	r1, #7
    a3da:	0000      	movs	r0, r0
    a3dc:	3102      	adds	r1, #2
    a3de:	0000      	movs	r0, r0
    a3e0:	210e      	movs	r1, #14
    a3e2:	0000      	movs	r0, r0
    a3e4:	3102      	adds	r1, #2
    a3e6:	0000      	movs	r0, r0
    a3e8:	2115      	movs	r1, #21
    a3ea:	0000      	movs	r0, r0
    a3ec:	3102      	adds	r1, #2
    a3ee:	0000      	movs	r0, r0
    a3f0:	211c      	movs	r1, #28
    a3f2:	0000      	movs	r0, r0
    a3f4:	3102      	adds	r1, #2
    a3f6:	0000      	movs	r0, r0
    a3f8:	2123      	movs	r1, #35	; 0x23
    a3fa:	0000      	movs	r0, r0
    a3fc:	3102      	adds	r1, #2
    a3fe:	0000      	movs	r0, r0
    a400:	212a      	movs	r1, #42	; 0x2a
    a402:	0000      	movs	r0, r0
    a404:	3102      	adds	r1, #2
    a406:	0000      	movs	r0, r0
    a408:	2131      	movs	r1, #49	; 0x31
    a40a:	0000      	movs	r0, r0
    a40c:	3102      	adds	r1, #2
    a40e:	0000      	movs	r0, r0
    a410:	2138      	movs	r1, #56	; 0x38
    a412:	0000      	movs	r0, r0
    a414:	3102      	adds	r1, #2
    a416:	0000      	movs	r0, r0
    a418:	213f      	movs	r1, #63	; 0x3f
    a41a:	0000      	movs	r0, r0
    a41c:	3102      	adds	r1, #2
    a41e:	0000      	movs	r0, r0
    a420:	2146      	movs	r1, #70	; 0x46
    a422:	0000      	movs	r0, r0
    a424:	3102      	adds	r1, #2
    a426:	0000      	movs	r0, r0
    a428:	214d      	movs	r1, #77	; 0x4d
    a42a:	0000      	movs	r0, r0
    a42c:	3102      	adds	r1, #2
    a42e:	0000      	movs	r0, r0
    a430:	2154      	movs	r1, #84	; 0x54
    a432:	0000      	movs	r0, r0
    a434:	3102      	adds	r1, #2
    a436:	0000      	movs	r0, r0
    a438:	215b      	movs	r1, #91	; 0x5b
    a43a:	0000      	movs	r0, r0
    a43c:	3102      	adds	r1, #2
    a43e:	0000      	movs	r0, r0
    a440:	2162      	movs	r1, #98	; 0x62
    a442:	0000      	movs	r0, r0
    a444:	3102      	adds	r1, #2
    a446:	0000      	movs	r0, r0
    a448:	2169      	movs	r1, #105	; 0x69
    a44a:	0000      	movs	r0, r0
    a44c:	3102      	adds	r1, #2
    a44e:	0000      	movs	r0, r0
    a450:	2170      	movs	r1, #112	; 0x70
    a452:	0000      	movs	r0, r0
    a454:	3102      	adds	r1, #2
    a456:	0000      	movs	r0, r0
    a458:	2177      	movs	r1, #119	; 0x77
    a45a:	0000      	movs	r0, r0
    a45c:	3102      	adds	r1, #2
    a45e:	0000      	movs	r0, r0
    a460:	217e      	movs	r1, #126	; 0x7e
    a462:	0000      	movs	r0, r0
    a464:	3102      	adds	r1, #2
    a466:	0000      	movs	r0, r0
    a468:	2185      	movs	r1, #133	; 0x85
    a46a:	0000      	movs	r0, r0
    a46c:	3102      	adds	r1, #2
    a46e:	0000      	movs	r0, r0
    a470:	218c      	movs	r1, #140	; 0x8c
    a472:	0000      	movs	r0, r0
    a474:	3102      	adds	r1, #2
    a476:	0000      	movs	r0, r0
    a478:	2193      	movs	r1, #147	; 0x93
    a47a:	0000      	movs	r0, r0
    a47c:	3102      	adds	r1, #2
    a47e:	0000      	movs	r0, r0
    a480:	219a      	movs	r1, #154	; 0x9a
    a482:	0000      	movs	r0, r0
    a484:	3102      	adds	r1, #2
    a486:	0000      	movs	r0, r0
    a488:	21a1      	movs	r1, #161	; 0xa1
    a48a:	0000      	movs	r0, r0
    a48c:	3102      	adds	r1, #2
    a48e:	0000      	movs	r0, r0
    a490:	21a8      	movs	r1, #168	; 0xa8
    a492:	0000      	movs	r0, r0
    a494:	3102      	adds	r1, #2
    a496:	0000      	movs	r0, r0
    a498:	21af      	movs	r1, #175	; 0xaf
    a49a:	0000      	movs	r0, r0
    a49c:	3102      	adds	r1, #2
    a49e:	0000      	movs	r0, r0
    a4a0:	21b6      	movs	r1, #182	; 0xb6
    a4a2:	0000      	movs	r0, r0
    a4a4:	3102      	adds	r1, #2
    a4a6:	0000      	movs	r0, r0
    a4a8:	21bd      	movs	r1, #189	; 0xbd
    a4aa:	0000      	movs	r0, r0
    a4ac:	3102      	adds	r1, #2
    a4ae:	0000      	movs	r0, r0
    a4b0:	21c4      	movs	r1, #196	; 0xc4
    a4b2:	0000      	movs	r0, r0
    a4b4:	3102      	adds	r1, #2
    a4b6:	0000      	movs	r0, r0
    a4b8:	21cb      	movs	r1, #203	; 0xcb
    a4ba:	0000      	movs	r0, r0
    a4bc:	3102      	adds	r1, #2
    a4be:	0000      	movs	r0, r0
    a4c0:	21d2      	movs	r1, #210	; 0xd2
    a4c2:	0000      	movs	r0, r0
    a4c4:	3102      	adds	r1, #2
    a4c6:	0000      	movs	r0, r0
    a4c8:	21d9      	movs	r1, #217	; 0xd9
    a4ca:	0000      	movs	r0, r0
    a4cc:	3102      	adds	r1, #2
    a4ce:	0000      	movs	r0, r0
    a4d0:	21e0      	movs	r1, #224	; 0xe0
    a4d2:	0000      	movs	r0, r0
    a4d4:	3102      	adds	r1, #2
    a4d6:	0000      	movs	r0, r0
    a4d8:	21e7      	movs	r1, #231	; 0xe7
    a4da:	0000      	movs	r0, r0
    a4dc:	3102      	adds	r1, #2
    a4de:	0000      	movs	r0, r0
    a4e0:	21ee      	movs	r1, #238	; 0xee
    a4e2:	0000      	movs	r0, r0
    a4e4:	3102      	adds	r1, #2
    a4e6:	0000      	movs	r0, r0
    a4e8:	21f5      	movs	r1, #245	; 0xf5
    a4ea:	0000      	movs	r0, r0
    a4ec:	3102      	adds	r1, #2
    a4ee:	0000      	movs	r0, r0
    a4f0:	21fc      	movs	r1, #252	; 0xfc
    a4f2:	0000      	movs	r0, r0
    a4f4:	3102      	adds	r1, #2
    a4f6:	0000      	movs	r0, r0
    a4f8:	2203      	movs	r2, #3
    a4fa:	0000      	movs	r0, r0
    a4fc:	3102      	adds	r1, #2
    a4fe:	0000      	movs	r0, r0
    a500:	220a      	movs	r2, #10
    a502:	0000      	movs	r0, r0
    a504:	3102      	adds	r1, #2
    a506:	0000      	movs	r0, r0
    a508:	2211      	movs	r2, #17
    a50a:	0000      	movs	r0, r0
    a50c:	3102      	adds	r1, #2
    a50e:	0000      	movs	r0, r0
    a510:	2218      	movs	r2, #24
    a512:	0000      	movs	r0, r0
    a514:	3102      	adds	r1, #2
    a516:	0000      	movs	r0, r0
    a518:	221f      	movs	r2, #31
    a51a:	0000      	movs	r0, r0
    a51c:	3102      	adds	r1, #2
    a51e:	0000      	movs	r0, r0
    a520:	2226      	movs	r2, #38	; 0x26
    a522:	0000      	movs	r0, r0
    a524:	3102      	adds	r1, #2
    a526:	0000      	movs	r0, r0
    a528:	222d      	movs	r2, #45	; 0x2d
    a52a:	0000      	movs	r0, r0
    a52c:	3102      	adds	r1, #2
    a52e:	0000      	movs	r0, r0
    a530:	2234      	movs	r2, #52	; 0x34
    a532:	0000      	movs	r0, r0
    a534:	3102      	adds	r1, #2
    a536:	0000      	movs	r0, r0
    a538:	223b      	movs	r2, #59	; 0x3b
    a53a:	0000      	movs	r0, r0
    a53c:	3102      	adds	r1, #2
    a53e:	0000      	movs	r0, r0
    a540:	2242      	movs	r2, #66	; 0x42
    a542:	0000      	movs	r0, r0
    a544:	3102      	adds	r1, #2
    a546:	0000      	movs	r0, r0
    a548:	2249      	movs	r2, #73	; 0x49
    a54a:	0000      	movs	r0, r0
    a54c:	3102      	adds	r1, #2
    a54e:	0000      	movs	r0, r0
    a550:	2250      	movs	r2, #80	; 0x50
    a552:	0000      	movs	r0, r0
    a554:	3102      	adds	r1, #2
    a556:	0000      	movs	r0, r0
    a558:	2257      	movs	r2, #87	; 0x57
    a55a:	0000      	movs	r0, r0
    a55c:	3102      	adds	r1, #2
    a55e:	0000      	movs	r0, r0
    a560:	2262      	movs	r2, #98	; 0x62
    a562:	0000      	movs	r0, r0
    a564:	3102      	adds	r1, #2
    a566:	0000      	movs	r0, r0
    a568:	2274      	movs	r2, #116	; 0x74
    a56a:	0000      	movs	r0, r0
    a56c:	3102      	adds	r1, #2
    a56e:	0000      	movs	r0, r0
    a570:	227a      	movs	r2, #122	; 0x7a
    a572:	0000      	movs	r0, r0
    a574:	3102      	adds	r1, #2
    a576:	0000      	movs	r0, r0
    a578:	2280      	movs	r2, #128	; 0x80
    a57a:	0000      	movs	r0, r0
    a57c:	3102      	adds	r1, #2
    a57e:	0000      	movs	r0, r0
    a580:	2286      	movs	r2, #134	; 0x86
    a582:	0000      	movs	r0, r0
    a584:	3102      	adds	r1, #2
    a586:	0000      	movs	r0, r0
    a588:	228c      	movs	r2, #140	; 0x8c
    a58a:	0000      	movs	r0, r0
    a58c:	3102      	adds	r1, #2
    a58e:	0000      	movs	r0, r0
    a590:	2292      	movs	r2, #146	; 0x92
    a592:	0000      	movs	r0, r0
    a594:	3102      	adds	r1, #2
    a596:	0000      	movs	r0, r0
    a598:	2298      	movs	r2, #152	; 0x98
    a59a:	0000      	movs	r0, r0
    a59c:	3102      	adds	r1, #2
    a59e:	0000      	movs	r0, r0
    a5a0:	229e      	movs	r2, #158	; 0x9e
    a5a2:	0000      	movs	r0, r0
    a5a4:	3102      	adds	r1, #2
    a5a6:	0000      	movs	r0, r0
    a5a8:	22a4      	movs	r2, #164	; 0xa4
    a5aa:	0000      	movs	r0, r0
    a5ac:	3102      	adds	r1, #2
    a5ae:	0000      	movs	r0, r0
    a5b0:	22aa      	movs	r2, #170	; 0xaa
    a5b2:	0000      	movs	r0, r0
    a5b4:	3102      	adds	r1, #2
    a5b6:	0000      	movs	r0, r0
    a5b8:	22b0      	movs	r2, #176	; 0xb0
    a5ba:	0000      	movs	r0, r0
    a5bc:	3102      	adds	r1, #2
    a5be:	0000      	movs	r0, r0
    a5c0:	22b6      	movs	r2, #182	; 0xb6
    a5c2:	0000      	movs	r0, r0
    a5c4:	3102      	adds	r1, #2
    a5c6:	0000      	movs	r0, r0
    a5c8:	22bc      	movs	r2, #188	; 0xbc
    a5ca:	0000      	movs	r0, r0
    a5cc:	3102      	adds	r1, #2
    a5ce:	0000      	movs	r0, r0
    a5d0:	22c2      	movs	r2, #194	; 0xc2
    a5d2:	0000      	movs	r0, r0
    a5d4:	3102      	adds	r1, #2
    a5d6:	0000      	movs	r0, r0
    a5d8:	22c8      	movs	r2, #200	; 0xc8
    a5da:	0000      	movs	r0, r0
    a5dc:	3102      	adds	r1, #2
    a5de:	0000      	movs	r0, r0
    a5e0:	22ce      	movs	r2, #206	; 0xce
    a5e2:	0000      	movs	r0, r0
    a5e4:	3102      	adds	r1, #2
    a5e6:	0000      	movs	r0, r0
    a5e8:	22d4      	movs	r2, #212	; 0xd4
    a5ea:	0000      	movs	r0, r0
    a5ec:	3102      	adds	r1, #2
    a5ee:	0000      	movs	r0, r0
    a5f0:	22da      	movs	r2, #218	; 0xda
    a5f2:	0000      	movs	r0, r0
    a5f4:	3102      	adds	r1, #2
    a5f6:	0000      	movs	r0, r0
    a5f8:	22e0      	movs	r2, #224	; 0xe0
    a5fa:	0000      	movs	r0, r0
    a5fc:	3102      	adds	r1, #2
    a5fe:	0000      	movs	r0, r0
    a600:	22e6      	movs	r2, #230	; 0xe6
    a602:	0000      	movs	r0, r0
    a604:	3102      	adds	r1, #2
    a606:	0000      	movs	r0, r0
    a608:	22ec      	movs	r2, #236	; 0xec
    a60a:	0000      	movs	r0, r0
    a60c:	3102      	adds	r1, #2
    a60e:	0000      	movs	r0, r0
    a610:	22f5      	movs	r2, #245	; 0xf5
    a612:	0000      	movs	r0, r0
    a614:	3102      	adds	r1, #2
    a616:	0000      	movs	r0, r0
    a618:	230e      	movs	r3, #14
    a61a:	0000      	movs	r0, r0
    a61c:	3102      	adds	r1, #2
    a61e:	0000      	movs	r0, r0
    a620:	231a      	movs	r3, #26
    a622:	0000      	movs	r0, r0
    a624:	3102      	adds	r1, #2
    a626:	0000      	movs	r0, r0
    a628:	2326      	movs	r3, #38	; 0x26
    a62a:	0000      	movs	r0, r0
    a62c:	3102      	adds	r1, #2
    a62e:	0000      	movs	r0, r0
    a630:	2332      	movs	r3, #50	; 0x32
    a632:	0000      	movs	r0, r0
    a634:	3102      	adds	r1, #2
    a636:	0000      	movs	r0, r0
    a638:	233e      	movs	r3, #62	; 0x3e
    a63a:	0000      	movs	r0, r0
    a63c:	3102      	adds	r1, #2
    a63e:	0000      	movs	r0, r0
    a640:	234a      	movs	r3, #74	; 0x4a
    a642:	0000      	movs	r0, r0
    a644:	3102      	adds	r1, #2
    a646:	0000      	movs	r0, r0
    a648:	2356      	movs	r3, #86	; 0x56
    a64a:	0000      	movs	r0, r0
    a64c:	3102      	adds	r1, #2
    a64e:	0000      	movs	r0, r0
    a650:	2362      	movs	r3, #98	; 0x62
    a652:	0000      	movs	r0, r0
    a654:	3102      	adds	r1, #2
    a656:	0000      	movs	r0, r0
    a658:	236e      	movs	r3, #110	; 0x6e
    a65a:	0000      	movs	r0, r0
    a65c:	3102      	adds	r1, #2
    a65e:	0000      	movs	r0, r0
    a660:	237a      	movs	r3, #122	; 0x7a
    a662:	0000      	movs	r0, r0
    a664:	3102      	adds	r1, #2
    a666:	0000      	movs	r0, r0
    a668:	2386      	movs	r3, #134	; 0x86
    a66a:	0000      	movs	r0, r0
    a66c:	3102      	adds	r1, #2
    a66e:	0000      	movs	r0, r0
    a670:	2393      	movs	r3, #147	; 0x93
    a672:	0000      	movs	r0, r0
    a674:	3102      	adds	r1, #2
    a676:	0000      	movs	r0, r0
    a678:	239e      	movs	r3, #158	; 0x9e
    a67a:	0000      	movs	r0, r0
    a67c:	3102      	adds	r1, #2
    a67e:	0000      	movs	r0, r0
    a680:	23af      	movs	r3, #175	; 0xaf
    a682:	0000      	movs	r0, r0
    a684:	3102      	adds	r1, #2
    a686:	0000      	movs	r0, r0
    a688:	23b5      	movs	r3, #181	; 0xb5
    a68a:	0000      	movs	r0, r0
    a68c:	3102      	adds	r1, #2
    a68e:	0000      	movs	r0, r0
    a690:	23bb      	movs	r3, #187	; 0xbb
    a692:	0000      	movs	r0, r0
    a694:	3102      	adds	r1, #2
    a696:	0000      	movs	r0, r0
    a698:	23c1      	movs	r3, #193	; 0xc1
    a69a:	0000      	movs	r0, r0
    a69c:	3102      	adds	r1, #2
    a69e:	0000      	movs	r0, r0
    a6a0:	23c7      	movs	r3, #199	; 0xc7
    a6a2:	0000      	movs	r0, r0
    a6a4:	3102      	adds	r1, #2
    a6a6:	0000      	movs	r0, r0
    a6a8:	23cd      	movs	r3, #205	; 0xcd
    a6aa:	0000      	movs	r0, r0
    a6ac:	3102      	adds	r1, #2
    a6ae:	0000      	movs	r0, r0
    a6b0:	23d3      	movs	r3, #211	; 0xd3
    a6b2:	0000      	movs	r0, r0
    a6b4:	3102      	adds	r1, #2
    a6b6:	0000      	movs	r0, r0
    a6b8:	23d9      	movs	r3, #217	; 0xd9
    a6ba:	0000      	movs	r0, r0
    a6bc:	3102      	adds	r1, #2
    a6be:	0000      	movs	r0, r0
    a6c0:	23df      	movs	r3, #223	; 0xdf
    a6c2:	0000      	movs	r0, r0
    a6c4:	3102      	adds	r1, #2
    a6c6:	0000      	movs	r0, r0
    a6c8:	23e6      	movs	r3, #230	; 0xe6
    a6ca:	0000      	movs	r0, r0
    a6cc:	3102      	adds	r1, #2
    a6ce:	0000      	movs	r0, r0
    a6d0:	23ed      	movs	r3, #237	; 0xed
    a6d2:	0000      	movs	r0, r0
    a6d4:	3102      	adds	r1, #2
    a6d6:	0000      	movs	r0, r0
    a6d8:	23f4      	movs	r3, #244	; 0xf4
    a6da:	0000      	movs	r0, r0
    a6dc:	3102      	adds	r1, #2
    a6de:	0000      	movs	r0, r0
    a6e0:	23fb      	movs	r3, #251	; 0xfb
    a6e2:	0000      	movs	r0, r0
    a6e4:	3102      	adds	r1, #2
    a6e6:	0000      	movs	r0, r0
    a6e8:	2402      	movs	r4, #2
    a6ea:	0000      	movs	r0, r0
    a6ec:	3102      	adds	r1, #2
    a6ee:	0000      	movs	r0, r0
    a6f0:	2409      	movs	r4, #9
    a6f2:	0000      	movs	r0, r0
    a6f4:	3102      	adds	r1, #2
    a6f6:	0000      	movs	r0, r0
    a6f8:	2410      	movs	r4, #16
    a6fa:	0000      	movs	r0, r0
    a6fc:	3102      	adds	r1, #2
    a6fe:	0000      	movs	r0, r0
    a700:	2417      	movs	r4, #23
    a702:	0000      	movs	r0, r0
    a704:	3102      	adds	r1, #2
    a706:	0000      	movs	r0, r0
    a708:	2420      	movs	r4, #32
    a70a:	0000      	movs	r0, r0
    a70c:	3102      	adds	r1, #2
    a70e:	0000      	movs	r0, r0
    a710:	2429      	movs	r4, #41	; 0x29
    a712:	0000      	movs	r0, r0
    a714:	3102      	adds	r1, #2
    a716:	0000      	movs	r0, r0
    a718:	2432      	movs	r4, #50	; 0x32
    a71a:	0000      	movs	r0, r0
    a71c:	3102      	adds	r1, #2
    a71e:	0000      	movs	r0, r0
    a720:	243b      	movs	r4, #59	; 0x3b
    a722:	0000      	movs	r0, r0
    a724:	3102      	adds	r1, #2
    a726:	0000      	movs	r0, r0
    a728:	2444      	movs	r4, #68	; 0x44
    a72a:	0000      	movs	r0, r0
    a72c:	3102      	adds	r1, #2
    a72e:	0000      	movs	r0, r0
    a730:	244d      	movs	r4, #77	; 0x4d
    a732:	0000      	movs	r0, r0
    a734:	3102      	adds	r1, #2
    a736:	0000      	movs	r0, r0
    a738:	2456      	movs	r4, #86	; 0x56
    a73a:	0000      	movs	r0, r0
    a73c:	3102      	adds	r1, #2
    a73e:	0000      	movs	r0, r0
    a740:	245f      	movs	r4, #95	; 0x5f
    a742:	0000      	movs	r0, r0
    a744:	3102      	adds	r1, #2
    a746:	0000      	movs	r0, r0
    a748:	2468      	movs	r4, #104	; 0x68
    a74a:	0000      	movs	r0, r0
    a74c:	3102      	adds	r1, #2
    a74e:	0000      	movs	r0, r0
    a750:	2472      	movs	r4, #114	; 0x72
    a752:	0000      	movs	r0, r0
    a754:	3102      	adds	r1, #2
    a756:	0000      	movs	r0, r0
    a758:	2483      	movs	r4, #131	; 0x83
    a75a:	0000      	movs	r0, r0
    a75c:	3102      	adds	r1, #2
    a75e:	0000      	movs	r0, r0
    a760:	2489      	movs	r4, #137	; 0x89
    a762:	0000      	movs	r0, r0
    a764:	3102      	adds	r1, #2
    a766:	0000      	movs	r0, r0
    a768:	248f      	movs	r4, #143	; 0x8f
    a76a:	0000      	movs	r0, r0
    a76c:	3102      	adds	r1, #2
    a76e:	0000      	movs	r0, r0
    a770:	2495      	movs	r4, #149	; 0x95
    a772:	0000      	movs	r0, r0
    a774:	3102      	adds	r1, #2
    a776:	0000      	movs	r0, r0
    a778:	249b      	movs	r4, #155	; 0x9b
    a77a:	0000      	movs	r0, r0
    a77c:	3102      	adds	r1, #2
    a77e:	0000      	movs	r0, r0
    a780:	24a1      	movs	r4, #161	; 0xa1
    a782:	0000      	movs	r0, r0
    a784:	3102      	adds	r1, #2
    a786:	0000      	movs	r0, r0
    a788:	24a7      	movs	r4, #167	; 0xa7
    a78a:	0000      	movs	r0, r0
    a78c:	3102      	adds	r1, #2
    a78e:	0000      	movs	r0, r0
    a790:	24ad      	movs	r4, #173	; 0xad
    a792:	0000      	movs	r0, r0
    a794:	3102      	adds	r1, #2
    a796:	0000      	movs	r0, r0
    a798:	24b3      	movs	r4, #179	; 0xb3
    a79a:	0000      	movs	r0, r0
    a79c:	3102      	adds	r1, #2
    a79e:	0000      	movs	r0, r0
    a7a0:	24b9      	movs	r4, #185	; 0xb9
    a7a2:	0000      	movs	r0, r0
    a7a4:	3102      	adds	r1, #2
    a7a6:	0000      	movs	r0, r0
    a7a8:	24bf      	movs	r4, #191	; 0xbf
    a7aa:	0000      	movs	r0, r0
    a7ac:	3102      	adds	r1, #2
    a7ae:	0000      	movs	r0, r0
    a7b0:	24c5      	movs	r4, #197	; 0xc5
    a7b2:	0000      	movs	r0, r0
    a7b4:	3102      	adds	r1, #2
    a7b6:	0000      	movs	r0, r0
    a7b8:	24cb      	movs	r4, #203	; 0xcb
    a7ba:	0000      	movs	r0, r0
    a7bc:	3102      	adds	r1, #2
    a7be:	0000      	movs	r0, r0
    a7c0:	24d1      	movs	r4, #209	; 0xd1
    a7c2:	0000      	movs	r0, r0
    a7c4:	3102      	adds	r1, #2
    a7c6:	0000      	movs	r0, r0
    a7c8:	24d7      	movs	r4, #215	; 0xd7
    a7ca:	0000      	movs	r0, r0
    a7cc:	3102      	adds	r1, #2
    a7ce:	0000      	movs	r0, r0
    a7d0:	24dd      	movs	r4, #221	; 0xdd
    a7d2:	0000      	movs	r0, r0
    a7d4:	3102      	adds	r1, #2
    a7d6:	0000      	movs	r0, r0
    a7d8:	24e3      	movs	r4, #227	; 0xe3
    a7da:	0000      	movs	r0, r0
    a7dc:	3102      	adds	r1, #2
    a7de:	0000      	movs	r0, r0
    a7e0:	24e9      	movs	r4, #233	; 0xe9
    a7e2:	0000      	movs	r0, r0
    a7e4:	3102      	adds	r1, #2
    a7e6:	0000      	movs	r0, r0
    a7e8:	24ef      	movs	r4, #239	; 0xef
    a7ea:	0000      	movs	r0, r0
    a7ec:	3102      	adds	r1, #2
    a7ee:	0000      	movs	r0, r0
    a7f0:	24f5      	movs	r4, #245	; 0xf5
    a7f2:	0000      	movs	r0, r0
    a7f4:	3102      	adds	r1, #2
    a7f6:	0000      	movs	r0, r0
    a7f8:	24fb      	movs	r4, #251	; 0xfb
    a7fa:	0000      	movs	r0, r0
    a7fc:	3102      	adds	r1, #2
    a7fe:	0000      	movs	r0, r0
    a800:	2501      	movs	r5, #1
    a802:	0000      	movs	r0, r0
    a804:	3102      	adds	r1, #2
    a806:	0000      	movs	r0, r0
    a808:	2507      	movs	r5, #7
    a80a:	0000      	movs	r0, r0
    a80c:	3102      	adds	r1, #2
    a80e:	0000      	movs	r0, r0
    a810:	250d      	movs	r5, #13
    a812:	0000      	movs	r0, r0
    a814:	3102      	adds	r1, #2
    a816:	0000      	movs	r0, r0
    a818:	2513      	movs	r5, #19
    a81a:	0000      	movs	r0, r0
    a81c:	3102      	adds	r1, #2
    a81e:	0000      	movs	r0, r0
    a820:	2519      	movs	r5, #25
    a822:	0000      	movs	r0, r0
    a824:	3102      	adds	r1, #2
    a826:	0000      	movs	r0, r0
    a828:	251f      	movs	r5, #31
    a82a:	0000      	movs	r0, r0
    a82c:	3102      	adds	r1, #2
    a82e:	0000      	movs	r0, r0
    a830:	2525      	movs	r5, #37	; 0x25
    a832:	0000      	movs	r0, r0
    a834:	3102      	adds	r1, #2
    a836:	0000      	movs	r0, r0
    a838:	252b      	movs	r5, #43	; 0x2b
    a83a:	0000      	movs	r0, r0
    a83c:	3102      	adds	r1, #2
    a83e:	0000      	movs	r0, r0
    a840:	2531      	movs	r5, #49	; 0x31
    a842:	0000      	movs	r0, r0
    a844:	3102      	adds	r1, #2
    a846:	0000      	movs	r0, r0
    a848:	2537      	movs	r5, #55	; 0x37
    a84a:	0000      	movs	r0, r0
    a84c:	3102      	adds	r1, #2
    a84e:	0000      	movs	r0, r0
    a850:	253e      	movs	r5, #62	; 0x3e
    a852:	0000      	movs	r0, r0
    a854:	3102      	adds	r1, #2
    a856:	0000      	movs	r0, r0
    a858:	2550      	movs	r5, #80	; 0x50
    a85a:	0000      	movs	r0, r0
    a85c:	3102      	adds	r1, #2
    a85e:	0000      	movs	r0, r0
    a860:	2556      	movs	r5, #86	; 0x56
    a862:	0000      	movs	r0, r0
    a864:	3102      	adds	r1, #2
    a866:	0000      	movs	r0, r0
    a868:	255c      	movs	r5, #92	; 0x5c
    a86a:	0000      	movs	r0, r0
    a86c:	3102      	adds	r1, #2
    a86e:	0000      	movs	r0, r0
    a870:	2562      	movs	r5, #98	; 0x62
    a872:	0000      	movs	r0, r0
    a874:	3102      	adds	r1, #2
    a876:	0000      	movs	r0, r0
    a878:	2568      	movs	r5, #104	; 0x68
    a87a:	0000      	movs	r0, r0
    a87c:	3102      	adds	r1, #2
    a87e:	0000      	movs	r0, r0
    a880:	256e      	movs	r5, #110	; 0x6e
    a882:	0000      	movs	r0, r0
    a884:	3102      	adds	r1, #2
    a886:	0000      	movs	r0, r0
    a888:	2574      	movs	r5, #116	; 0x74
    a88a:	0000      	movs	r0, r0
    a88c:	3102      	adds	r1, #2
    a88e:	0000      	movs	r0, r0
    a890:	257a      	movs	r5, #122	; 0x7a
    a892:	0000      	movs	r0, r0
    a894:	3102      	adds	r1, #2
    a896:	0000      	movs	r0, r0
    a898:	2581      	movs	r5, #129	; 0x81
    a89a:	0000      	movs	r0, r0
    a89c:	3102      	adds	r1, #2
    a89e:	0000      	movs	r0, r0
    a8a0:	2593      	movs	r5, #147	; 0x93
    a8a2:	0000      	movs	r0, r0
    a8a4:	3102      	adds	r1, #2
    a8a6:	0000      	movs	r0, r0
    a8a8:	2599      	movs	r5, #153	; 0x99
    a8aa:	0000      	movs	r0, r0
    a8ac:	3102      	adds	r1, #2
    a8ae:	0000      	movs	r0, r0
    a8b0:	259f      	movs	r5, #159	; 0x9f
    a8b2:	0000      	movs	r0, r0
    a8b4:	3102      	adds	r1, #2
    a8b6:	0000      	movs	r0, r0
    a8b8:	25a5      	movs	r5, #165	; 0xa5
    a8ba:	0000      	movs	r0, r0
    a8bc:	3102      	adds	r1, #2
    a8be:	0000      	movs	r0, r0
    a8c0:	25ab      	movs	r5, #171	; 0xab
    a8c2:	0000      	movs	r0, r0
    a8c4:	3102      	adds	r1, #2
    a8c6:	0000      	movs	r0, r0
    a8c8:	25b1      	movs	r5, #177	; 0xb1
    a8ca:	0000      	movs	r0, r0
    a8cc:	3102      	adds	r1, #2
    a8ce:	0000      	movs	r0, r0
    a8d0:	25b7      	movs	r5, #183	; 0xb7
    a8d2:	0000      	movs	r0, r0
    a8d4:	3102      	adds	r1, #2
    a8d6:	0000      	movs	r0, r0
    a8d8:	25bd      	movs	r5, #189	; 0xbd
    a8da:	0000      	movs	r0, r0
    a8dc:	3102      	adds	r1, #2
    a8de:	0000      	movs	r0, r0
    a8e0:	25c3      	movs	r5, #195	; 0xc3
    a8e2:	0000      	movs	r0, r0
    a8e4:	3102      	adds	r1, #2
    a8e6:	0000      	movs	r0, r0
    a8e8:	25c9      	movs	r5, #201	; 0xc9
    a8ea:	0000      	movs	r0, r0
    a8ec:	3102      	adds	r1, #2
    a8ee:	0000      	movs	r0, r0
    a8f0:	25cf      	movs	r5, #207	; 0xcf
    a8f2:	0000      	movs	r0, r0
    a8f4:	3102      	adds	r1, #2
    a8f6:	0000      	movs	r0, r0
    a8f8:	25d6      	movs	r5, #214	; 0xd6
    a8fa:	0000      	movs	r0, r0
    a8fc:	3102      	adds	r1, #2
    a8fe:	0000      	movs	r0, r0
    a900:	25e3      	movs	r5, #227	; 0xe3
    a902:	0000      	movs	r0, r0
    a904:	3102      	adds	r1, #2
    a906:	0000      	movs	r0, r0
    a908:	25f0      	movs	r5, #240	; 0xf0
    a90a:	0000      	movs	r0, r0
    a90c:	3102      	adds	r1, #2
    a90e:	0000      	movs	r0, r0
    a910:	2615      	movs	r6, #21
    a912:	0000      	movs	r0, r0
    a914:	3102      	adds	r1, #2
    a916:	0000      	movs	r0, r0
    a918:	2621      	movs	r6, #33	; 0x21
    a91a:	0000      	movs	r0, r0
    a91c:	3102      	adds	r1, #2
    a91e:	0000      	movs	r0, r0
    a920:	2632      	movs	r6, #50	; 0x32
    a922:	0000      	movs	r0, r0
    a924:	3102      	adds	r1, #2
    a926:	0000      	movs	r0, r0
    a928:	2639      	movs	r6, #57	; 0x39
    a92a:	0000      	movs	r0, r0
    a92c:	2802      	cmp	r0, #2
    a92e:	0000      	movs	r0, r0
    a930:	2653      	movs	r6, #83	; 0x53
    a932:	0000      	movs	r0, r0
    a934:	2d02      	cmp	r5, #2
    a936:	0000      	movs	r0, r0
    a938:	2662      	movs	r6, #98	; 0x62
    a93a:	0000      	movs	r0, r0
    a93c:	2d02      	cmp	r5, #2
    a93e:	0000      	movs	r0, r0
    a940:	2667      	movs	r6, #103	; 0x67
    a942:	0000      	movs	r0, r0
    a944:	3102      	adds	r1, #2
    a946:	0000      	movs	r0, r0
    a948:	2672      	movs	r6, #114	; 0x72
    a94a:	0000      	movs	r0, r0
    a94c:	2d02      	cmp	r5, #2
    a94e:	0000      	movs	r0, r0
    a950:	2677      	movs	r6, #119	; 0x77
    a952:	0000      	movs	r0, r0
    a954:	3102      	adds	r1, #2
    a956:	0000      	movs	r0, r0
    a958:	2684      	movs	r6, #132	; 0x84
    a95a:	0000      	movs	r0, r0
    a95c:	3102      	adds	r1, #2
    a95e:	0000      	movs	r0, r0
    a960:	268f      	movs	r6, #143	; 0x8f
    a962:	0000      	movs	r0, r0
    a964:	2d02      	cmp	r5, #2
    a966:	0000      	movs	r0, r0
    a968:	2695      	movs	r6, #149	; 0x95
    a96a:	0000      	movs	r0, r0
    a96c:	3102      	adds	r1, #2
    a96e:	0000      	movs	r0, r0
    a970:	269c      	movs	r6, #156	; 0x9c
    a972:	0000      	movs	r0, r0
    a974:	2202      	movs	r2, #2
    a976:	0000      	movs	r0, r0
    a978:	26ab      	movs	r6, #171	; 0xab
    a97a:	0000      	movs	r0, r0
    a97c:	3102      	adds	r1, #2
    a97e:	0000      	movs	r0, r0
    a980:	26b6      	movs	r6, #182	; 0xb6
    a982:	0000      	movs	r0, r0
    a984:	2d02      	cmp	r5, #2
    a986:	0000      	movs	r0, r0
    a988:	26bb      	movs	r6, #187	; 0xbb
    a98a:	0000      	movs	r0, r0
    a98c:	3102      	adds	r1, #2
    a98e:	0000      	movs	r0, r0
    a990:	26c9      	movs	r6, #201	; 0xc9
    a992:	0000      	movs	r0, r0
    a994:	3102      	adds	r1, #2
    a996:	0000      	movs	r0, r0
    a998:	26d8      	movs	r6, #216	; 0xd8
    a99a:	0000      	movs	r0, r0
    a99c:	3102      	adds	r1, #2
    a99e:	0000      	movs	r0, r0
    a9a0:	26df      	movs	r6, #223	; 0xdf
    a9a2:	0000      	movs	r0, r0
    a9a4:	1f02      	subs	r2, r0, #4
    a9a6:	0000      	movs	r0, r0
    a9a8:	26ee      	movs	r6, #238	; 0xee
    a9aa:	0000      	movs	r0, r0
    a9ac:	3102      	adds	r1, #2
    a9ae:	0000      	movs	r0, r0
    a9b0:	26fc      	movs	r6, #252	; 0xfc
    a9b2:	0000      	movs	r0, r0
    a9b4:	3102      	adds	r1, #2
    a9b6:	0000      	movs	r0, r0
    a9b8:	270a      	movs	r7, #10
    a9ba:	0000      	movs	r0, r0
    a9bc:	3102      	adds	r1, #2
    a9be:	0000      	movs	r0, r0
    a9c0:	2715      	movs	r7, #21
    a9c2:	0000      	movs	r0, r0
    a9c4:	2d02      	cmp	r5, #2
    a9c6:	0000      	movs	r0, r0
    a9c8:	271a      	movs	r7, #26
    a9ca:	0000      	movs	r0, r0
    a9cc:	3102      	adds	r1, #2
    a9ce:	0000      	movs	r0, r0
    a9d0:	272c      	movs	r7, #44	; 0x2c
    a9d2:	0000      	movs	r0, r0
    a9d4:	3102      	adds	r1, #2
    a9d6:	0000      	movs	r0, r0
    a9d8:	2738      	movs	r7, #56	; 0x38
    a9da:	0000      	movs	r0, r0
    a9dc:	3102      	adds	r1, #2
    a9de:	0000      	movs	r0, r0
    a9e0:	2744      	movs	r7, #68	; 0x44
    a9e2:	0000      	movs	r0, r0
    a9e4:	3102      	adds	r1, #2
    a9e6:	0000      	movs	r0, r0
    a9e8:	2750      	movs	r7, #80	; 0x50
    a9ea:	0000      	movs	r0, r0
    a9ec:	3102      	adds	r1, #2
    a9ee:	0000      	movs	r0, r0
    a9f0:	275c      	movs	r7, #92	; 0x5c
    a9f2:	0000      	movs	r0, r0
    a9f4:	3102      	adds	r1, #2
    a9f6:	0000      	movs	r0, r0
    a9f8:	2769      	movs	r7, #105	; 0x69
    a9fa:	0000      	movs	r0, r0
    a9fc:	3102      	adds	r1, #2
    a9fe:	0000      	movs	r0, r0
    aa00:	2776      	movs	r7, #118	; 0x76
    aa02:	0000      	movs	r0, r0
    aa04:	3102      	adds	r1, #2
    aa06:	0000      	movs	r0, r0
    aa08:	2783      	movs	r7, #131	; 0x83
    aa0a:	0000      	movs	r0, r0
    aa0c:	3102      	adds	r1, #2
    aa0e:	0000      	movs	r0, r0
    aa10:	2790      	movs	r7, #144	; 0x90
    aa12:	0000      	movs	r0, r0
    aa14:	3102      	adds	r1, #2
    aa16:	0000      	movs	r0, r0
    aa18:	279b      	movs	r7, #155	; 0x9b
    aa1a:	0000      	movs	r0, r0
    aa1c:	2d02      	cmp	r5, #2
    aa1e:	0000      	movs	r0, r0
    aa20:	27a0      	movs	r7, #160	; 0xa0
    aa22:	0000      	movs	r0, r0
    aa24:	3102      	adds	r1, #2
    aa26:	0000      	movs	r0, r0
    aa28:	27b8      	movs	r7, #184	; 0xb8
    aa2a:	0000      	movs	r0, r0
    aa2c:	3102      	adds	r1, #2
    aa2e:	0000      	movs	r0, r0
    aa30:	27c5      	movs	r7, #197	; 0xc5
    aa32:	0000      	movs	r0, r0
    aa34:	3102      	adds	r1, #2
    aa36:	0000      	movs	r0, r0
    aa38:	27d2      	movs	r7, #210	; 0xd2
    aa3a:	0000      	movs	r0, r0
    aa3c:	3102      	adds	r1, #2
    aa3e:	0000      	movs	r0, r0
    aa40:	27dd      	movs	r7, #221	; 0xdd
    aa42:	0000      	movs	r0, r0
    aa44:	2d02      	cmp	r5, #2
    aa46:	0000      	movs	r0, r0
    aa48:	27e3      	movs	r7, #227	; 0xe3
    aa4a:	0000      	movs	r0, r0
    aa4c:	3102      	adds	r1, #2
    aa4e:	0000      	movs	r0, r0
    aa50:	27ea      	movs	r7, #234	; 0xea
    aa52:	0000      	movs	r0, r0
    aa54:	2502      	movs	r5, #2
    aa56:	0000      	movs	r0, r0
    aa58:	27f9      	movs	r7, #249	; 0xf9
    aa5a:	0000      	movs	r0, r0
    aa5c:	3102      	adds	r1, #2
    aa5e:	0000      	movs	r0, r0
    aa60:	2807      	cmp	r0, #7
    aa62:	0000      	movs	r0, r0
    aa64:	3102      	adds	r1, #2
    aa66:	0000      	movs	r0, r0
    aa68:	2812      	cmp	r0, #18
    aa6a:	0000      	movs	r0, r0
    aa6c:	2d02      	cmp	r5, #2
    aa6e:	0000      	movs	r0, r0
    aa70:	2817      	cmp	r0, #23
    aa72:	0000      	movs	r0, r0
    aa74:	3102      	adds	r1, #2
    aa76:	0000      	movs	r0, r0
    aa78:	2822      	cmp	r0, #34	; 0x22
    aa7a:	0000      	movs	r0, r0
    aa7c:	2d02      	cmp	r5, #2
    aa7e:	0000      	movs	r0, r0
    aa80:	2827      	cmp	r0, #39	; 0x27
    aa82:	0000      	movs	r0, r0
    aa84:	3102      	adds	r1, #2
    aa86:	0000      	movs	r0, r0
    aa88:	2839      	cmp	r0, #57	; 0x39
    aa8a:	0000      	movs	r0, r0
    aa8c:	3102      	adds	r1, #2
    aa8e:	0000      	movs	r0, r0
    aa90:	2845      	cmp	r0, #69	; 0x45
    aa92:	0000      	movs	r0, r0
    aa94:	3102      	adds	r1, #2
    aa96:	0000      	movs	r0, r0
    aa98:	2851      	cmp	r0, #81	; 0x51
    aa9a:	0000      	movs	r0, r0
    aa9c:	3102      	adds	r1, #2
    aa9e:	0000      	movs	r0, r0
    aaa0:	285d      	cmp	r0, #93	; 0x5d
    aaa2:	0000      	movs	r0, r0
    aaa4:	3102      	adds	r1, #2
    aaa6:	0000      	movs	r0, r0
    aaa8:	2869      	cmp	r0, #105	; 0x69
    aaaa:	0000      	movs	r0, r0
    aaac:	3102      	adds	r1, #2
    aaae:	0000      	movs	r0, r0
    aab0:	2876      	cmp	r0, #118	; 0x76
    aab2:	0000      	movs	r0, r0
    aab4:	3102      	adds	r1, #2
    aab6:	0000      	movs	r0, r0
    aab8:	2883      	cmp	r0, #131	; 0x83
    aaba:	0000      	movs	r0, r0
    aabc:	3102      	adds	r1, #2
    aabe:	0000      	movs	r0, r0
    aac0:	2890      	cmp	r0, #144	; 0x90
    aac2:	0000      	movs	r0, r0
    aac4:	3102      	adds	r1, #2
    aac6:	0000      	movs	r0, r0
    aac8:	289d      	cmp	r0, #157	; 0x9d
    aaca:	0000      	movs	r0, r0
    aacc:	3102      	adds	r1, #2
    aace:	0000      	movs	r0, r0
    aad0:	28aa      	cmp	r0, #170	; 0xaa
    aad2:	0000      	movs	r0, r0
    aad4:	3102      	adds	r1, #2
    aad6:	0000      	movs	r0, r0
    aad8:	28c2      	cmp	r0, #194	; 0xc2
    aada:	0000      	movs	r0, r0
    aadc:	3102      	adds	r1, #2
    aade:	0000      	movs	r0, r0
    aae0:	28da      	cmp	r0, #218	; 0xda
    aae2:	0000      	movs	r0, r0
    aae4:	3102      	adds	r1, #2
    aae6:	0000      	movs	r0, r0
    aae8:	28e7      	cmp	r0, #231	; 0xe7
    aaea:	0000      	movs	r0, r0
    aaec:	3102      	adds	r1, #2
    aaee:	0000      	movs	r0, r0
    aaf0:	28f4      	cmp	r0, #244	; 0xf4
    aaf2:	0000      	movs	r0, r0
    aaf4:	3102      	adds	r1, #2
    aaf6:	0000      	movs	r0, r0
    aaf8:	28ff      	cmp	r0, #255	; 0xff
    aafa:	0000      	movs	r0, r0
    aafc:	2d02      	cmp	r5, #2
    aafe:	0000      	movs	r0, r0
    ab00:	2904      	cmp	r1, #4
    ab02:	0000      	movs	r0, r0
    ab04:	2502      	movs	r5, #2
    ab06:	0000      	movs	r0, r0
    ab08:	290e      	cmp	r1, #14
    ab0a:	0000      	movs	r0, r0
    ab0c:	3102      	adds	r1, #2
    ab0e:	0000      	movs	r0, r0
    ab10:	2915      	cmp	r1, #21
    ab12:	0000      	movs	r0, r0
    ab14:	1c02      	adds	r2, r0, #0
    ab16:	0000      	movs	r0, r0
    ab18:	2924      	cmp	r1, #36	; 0x24
    ab1a:	0000      	movs	r0, r0
    ab1c:	3102      	adds	r1, #2
    ab1e:	0000      	movs	r0, r0
    ab20:	292f      	cmp	r1, #47	; 0x2f
    ab22:	0000      	movs	r0, r0
    ab24:	2d02      	cmp	r5, #2
    ab26:	0000      	movs	r0, r0
    ab28:	2934      	cmp	r1, #52	; 0x34
    ab2a:	0000      	movs	r0, r0
    ab2c:	1c02      	adds	r2, r0, #0
    ab2e:	0000      	movs	r0, r0
    ab30:	293e      	cmp	r1, #62	; 0x3e
    ab32:	0000      	movs	r0, r0
    ab34:	3102      	adds	r1, #2
    ab36:	0000      	movs	r0, r0
    ab38:	2945      	cmp	r1, #69	; 0x45
    ab3a:	0000      	movs	r0, r0
    ab3c:	1902      	adds	r2, r0, r4
    ab3e:	0000      	movs	r0, r0
    ab40:	2954      	cmp	r1, #84	; 0x54
    ab42:	0000      	movs	r0, r0
    ab44:	3102      	adds	r1, #2
    ab46:	0000      	movs	r0, r0
    ab48:	295f      	cmp	r1, #95	; 0x5f
    ab4a:	0000      	movs	r0, r0
    ab4c:	2d02      	cmp	r5, #2
    ab4e:	0000      	movs	r0, r0
    ab50:	2964      	cmp	r1, #100	; 0x64
    ab52:	0000      	movs	r0, r0
    ab54:	3102      	adds	r1, #2
    ab56:	0000      	movs	r0, r0
    ab58:	296f      	cmp	r1, #111	; 0x6f
    ab5a:	0000      	movs	r0, r0
    ab5c:	2d02      	cmp	r5, #2
    ab5e:	0000      	movs	r0, r0
    ab60:	2974      	cmp	r1, #116	; 0x74
    ab62:	0000      	movs	r0, r0
    ab64:	3102      	adds	r1, #2
    ab66:	0000      	movs	r0, r0
    ab68:	297f      	cmp	r1, #127	; 0x7f
    ab6a:	0000      	movs	r0, r0
    ab6c:	2d02      	cmp	r5, #2
    ab6e:	0000      	movs	r0, r0
    ab70:	2984      	cmp	r1, #132	; 0x84
    ab72:	0000      	movs	r0, r0
    ab74:	3102      	adds	r1, #2
    ab76:	0000      	movs	r0, r0
    ab78:	298f      	cmp	r1, #143	; 0x8f
    ab7a:	0000      	movs	r0, r0
    ab7c:	2d02      	cmp	r5, #2
    ab7e:	0000      	movs	r0, r0
    ab80:	2994      	cmp	r1, #148	; 0x94
    ab82:	0000      	movs	r0, r0
    ab84:	3102      	adds	r1, #2
    ab86:	0000      	movs	r0, r0
    ab88:	29a2      	cmp	r1, #162	; 0xa2
    ab8a:	0000      	movs	r0, r0
    ab8c:	3102      	adds	r1, #2
    ab8e:	0000      	movs	r0, r0
    ab90:	29b1      	cmp	r1, #177	; 0xb1
    ab92:	0000      	movs	r0, r0
    ab94:	3102      	adds	r1, #2
    ab96:	0000      	movs	r0, r0
    ab98:	29c2      	cmp	r1, #194	; 0xc2
    ab9a:	0000      	movs	r0, r0
    ab9c:	3102      	adds	r1, #2
    ab9e:	0000      	movs	r0, r0
    aba0:	29ce      	cmp	r1, #206	; 0xce
    aba2:	0000      	movs	r0, r0
    aba4:	3102      	adds	r1, #2
    aba6:	0000      	movs	r0, r0
    aba8:	29db      	cmp	r1, #219	; 0xdb
    abaa:	0000      	movs	r0, r0
    abac:	3102      	adds	r1, #2
    abae:	0000      	movs	r0, r0
    abb0:	29ec      	cmp	r1, #236	; 0xec
    abb2:	0000      	movs	r0, r0
    abb4:	3102      	adds	r1, #2
    abb6:	0000      	movs	r0, r0
    abb8:	29f8      	cmp	r1, #248	; 0xf8
    abba:	0000      	movs	r0, r0
    abbc:	3102      	adds	r1, #2
    abbe:	0000      	movs	r0, r0
    abc0:	2a04      	cmp	r2, #4
    abc2:	0000      	movs	r0, r0
    abc4:	3102      	adds	r1, #2
    abc6:	0000      	movs	r0, r0
    abc8:	2a11      	cmp	r2, #17
    abca:	0000      	movs	r0, r0
    abcc:	3102      	adds	r1, #2
    abce:	0000      	movs	r0, r0
    abd0:	2a22      	cmp	r2, #34	; 0x22
    abd2:	0000      	movs	r0, r0
    abd4:	3102      	adds	r1, #2
    abd6:	0000      	movs	r0, r0
    abd8:	2a2e      	cmp	r2, #46	; 0x2e
    abda:	0000      	movs	r0, r0
    abdc:	3102      	adds	r1, #2
    abde:	0000      	movs	r0, r0
    abe0:	2a3a      	cmp	r2, #58	; 0x3a
    abe2:	0000      	movs	r0, r0
    abe4:	3102      	adds	r1, #2
    abe6:	0000      	movs	r0, r0
    abe8:	2a46      	cmp	r2, #70	; 0x46
    abea:	0000      	movs	r0, r0
    abec:	3102      	adds	r1, #2
    abee:	0000      	movs	r0, r0
    abf0:	2a52      	cmp	r2, #82	; 0x52
    abf2:	0000      	movs	r0, r0
    abf4:	3102      	adds	r1, #2
    abf6:	0000      	movs	r0, r0
    abf8:	2a5e      	cmp	r2, #94	; 0x5e
    abfa:	0000      	movs	r0, r0
    abfc:	3102      	adds	r1, #2
    abfe:	0000      	movs	r0, r0
    ac00:	2a6b      	cmp	r2, #107	; 0x6b
    ac02:	0000      	movs	r0, r0
    ac04:	3102      	adds	r1, #2
    ac06:	0000      	movs	r0, r0
    ac08:	2a78      	cmp	r2, #120	; 0x78
    ac0a:	0000      	movs	r0, r0
    ac0c:	3102      	adds	r1, #2
    ac0e:	0000      	movs	r0, r0
    ac10:	2a84      	cmp	r2, #132	; 0x84
    ac12:	0000      	movs	r0, r0
    ac14:	3102      	adds	r1, #2
    ac16:	0000      	movs	r0, r0
    ac18:	2a97      	cmp	r2, #151	; 0x97
    ac1a:	0000      	movs	r0, r0
    ac1c:	3102      	adds	r1, #2
    ac1e:	0000      	movs	r0, r0
    ac20:	2aa2      	cmp	r2, #162	; 0xa2
    ac22:	0000      	movs	r0, r0
    ac24:	1702      	asrs	r2, r0, #28
    ac26:	0000      	movs	r0, r0
    ac28:	2aad      	cmp	r2, #173	; 0xad
    ac2a:	0000      	movs	r0, r0
    ac2c:	3102      	adds	r1, #2
    ac2e:	0000      	movs	r0, r0
    ac30:	2ab4      	cmp	r2, #180	; 0xb4
    ac32:	0000      	movs	r0, r0
    ac34:	1402      	asrs	r2, r0, #16
    ac36:	0000      	movs	r0, r0
    ac38:	2ac3      	cmp	r2, #195	; 0xc3
    ac3a:	0000      	movs	r0, r0
    ac3c:	3102      	adds	r1, #2
    ac3e:	0000      	movs	r0, r0
    ac40:	2ad3      	cmp	r2, #211	; 0xd3
    ac42:	0000      	movs	r0, r0
    ac44:	1402      	asrs	r2, r0, #16
    ac46:	0000      	movs	r0, r0
    ac48:	2ae3      	cmp	r2, #227	; 0xe3
    ac4a:	0000      	movs	r0, r0
    ac4c:	1402      	asrs	r2, r0, #16
    ac4e:	0000      	movs	r0, r0
    ac50:	2af7      	cmp	r2, #247	; 0xf7
    ac52:	0000      	movs	r0, r0
    ac54:	1402      	asrs	r2, r0, #16
    ac56:	0000      	movs	r0, r0
    ac58:	2b07      	cmp	r3, #7
    ac5a:	0000      	movs	r0, r0
    ac5c:	1402      	asrs	r2, r0, #16
    ac5e:	0000      	movs	r0, r0
    ac60:	2b1a      	cmp	r3, #26
    ac62:	0000      	movs	r0, r0
    ac64:	3102      	adds	r1, #2
    ac66:	0000      	movs	r0, r0
    ac68:	2b20      	cmp	r3, #32
    ac6a:	0000      	movs	r0, r0
    ac6c:	1102      	asrs	r2, r0, #4
    ac6e:	0000      	movs	r0, r0
    ac70:	2b2f      	cmp	r3, #47	; 0x2f
    ac72:	0000      	movs	r0, r0
    ac74:	3102      	adds	r1, #2
    ac76:	0000      	movs	r0, r0
    ac78:	2b39      	cmp	r3, #57	; 0x39
    ac7a:	0000      	movs	r0, r0
    ac7c:	2d02      	cmp	r5, #2
    ac7e:	0000      	movs	r0, r0
    ac80:	2b3e      	cmp	r3, #62	; 0x3e
    ac82:	0000      	movs	r0, r0
    ac84:	3102      	adds	r1, #2
    ac86:	0000      	movs	r0, r0
    ac88:	2b48      	cmp	r3, #72	; 0x48
    ac8a:	0000      	movs	r0, r0
    ac8c:	2d02      	cmp	r5, #2
    ac8e:	0000      	movs	r0, r0
    ac90:	2b4d      	cmp	r3, #77	; 0x4d
    ac92:	0000      	movs	r0, r0
    ac94:	3102      	adds	r1, #2
    ac96:	0000      	movs	r0, r0
    ac98:	2b57      	cmp	r3, #87	; 0x57
    ac9a:	0000      	movs	r0, r0
    ac9c:	2d02      	cmp	r5, #2
    ac9e:	0000      	movs	r0, r0
    aca0:	2b5c      	cmp	r3, #92	; 0x5c
    aca2:	0000      	movs	r0, r0
    aca4:	3102      	adds	r1, #2
    aca6:	0000      	movs	r0, r0
    aca8:	2b66      	cmp	r3, #102	; 0x66
    acaa:	0000      	movs	r0, r0
    acac:	2d02      	cmp	r5, #2
    acae:	0000      	movs	r0, r0
    acb0:	2b6b      	cmp	r3, #107	; 0x6b
    acb2:	0000      	movs	r0, r0
    acb4:	3102      	adds	r1, #2
    acb6:	0000      	movs	r0, r0
    acb8:	2b7a      	cmp	r3, #122	; 0x7a
    acba:	0000      	movs	r0, r0
    acbc:	3102      	adds	r1, #2
    acbe:	0000      	movs	r0, r0
    acc0:	2b84      	cmp	r3, #132	; 0x84
    acc2:	0000      	movs	r0, r0
    acc4:	2d02      	cmp	r5, #2
    acc6:	0000      	movs	r0, r0
    acc8:	2b89      	cmp	r3, #137	; 0x89
    acca:	0000      	movs	r0, r0
    accc:	3102      	adds	r1, #2
    acce:	0000      	movs	r0, r0
    acd0:	2b94      	cmp	r3, #148	; 0x94
    acd2:	0000      	movs	r0, r0
    acd4:	2d02      	cmp	r5, #2
    acd6:	0000      	movs	r0, r0
    acd8:	2b99      	cmp	r3, #153	; 0x99
    acda:	0000      	movs	r0, r0
    acdc:	3102      	adds	r1, #2
    acde:	0000      	movs	r0, r0
    ace0:	2ba4      	cmp	r3, #164	; 0xa4
    ace2:	0000      	movs	r0, r0
    ace4:	2d02      	cmp	r5, #2
    ace6:	0000      	movs	r0, r0
    ace8:	2bad      	cmp	r3, #173	; 0xad
    acea:	0000      	movs	r0, r0
    acec:	1102      	asrs	r2, r0, #4
    acee:	0000      	movs	r0, r0
    acf0:	2bc1      	cmp	r3, #193	; 0xc1
    acf2:	0000      	movs	r0, r0
    acf4:	2d02      	cmp	r5, #2
    acf6:	0000      	movs	r0, r0
    acf8:	2bca      	cmp	r3, #202	; 0xca
    acfa:	0000      	movs	r0, r0
    acfc:	2d02      	cmp	r5, #2
    acfe:	0000      	movs	r0, r0
    ad00:	2bcf      	cmp	r3, #207	; 0xcf
    ad02:	0000      	movs	r0, r0
    ad04:	1102      	asrs	r2, r0, #4
    ad06:	0000      	movs	r0, r0
    ad08:	2bdc      	cmp	r3, #220	; 0xdc
    ad0a:	0000      	movs	r0, r0
    ad0c:	2d02      	cmp	r5, #2
    ad0e:	0000      	movs	r0, r0
    ad10:	2bfa      	cmp	r3, #250	; 0xfa
    ad12:	0000      	movs	r0, r0
    ad14:	1102      	asrs	r2, r0, #4
    ad16:	0000      	movs	r0, r0
    ad18:	2bfe      	cmp	r3, #254	; 0xfe
    ad1a:	0000      	movs	r0, r0
    ad1c:	2f02      	cmp	r7, #2
    ad1e:	0000      	movs	r0, r0
    ad20:	2c0e      	cmp	r4, #14
    ad22:	0000      	movs	r0, r0
    ad24:	2d02      	cmp	r5, #2
    ad26:	0000      	movs	r0, r0
    ad28:	2c13      	cmp	r4, #19
    ad2a:	0000      	movs	r0, r0
    ad2c:	2f02      	cmp	r7, #2
    ad2e:	0000      	movs	r0, r0
    ad30:	2c1c      	cmp	r4, #28
    ad32:	0000      	movs	r0, r0
    ad34:	2d02      	cmp	r5, #2
    ad36:	0000      	movs	r0, r0
    ad38:	2c25      	cmp	r4, #37	; 0x25
    ad3a:	0000      	movs	r0, r0
    ad3c:	2d02      	cmp	r5, #2
    ad3e:	0000      	movs	r0, r0
    ad40:	2c2e      	cmp	r4, #46	; 0x2e
    ad42:	0000      	movs	r0, r0
    ad44:	1102      	asrs	r2, r0, #4
    ad46:	0000      	movs	r0, r0
    ad48:	2c32      	cmp	r4, #50	; 0x32
    ad4a:	0000      	movs	r0, r0
    ad4c:	2f02      	cmp	r7, #2
    ad4e:	0000      	movs	r0, r0
    ad50:	2c3e      	cmp	r4, #62	; 0x3e
    ad52:	0000      	movs	r0, r0
    ad54:	2d02      	cmp	r5, #2
    ad56:	0000      	movs	r0, r0
    ad58:	2c43      	cmp	r4, #67	; 0x43
    ad5a:	0000      	movs	r0, r0
    ad5c:	2f02      	cmp	r7, #2
    ad5e:	0000      	movs	r0, r0
    ad60:	2c4c      	cmp	r4, #76	; 0x4c
    ad62:	0000      	movs	r0, r0
    ad64:	2d02      	cmp	r5, #2
    ad66:	0000      	movs	r0, r0
    ad68:	2c55      	cmp	r4, #85	; 0x55
    ad6a:	0000      	movs	r0, r0
    ad6c:	1102      	asrs	r2, r0, #4
    ad6e:	0000      	movs	r0, r0
    ad70:	2c74      	cmp	r4, #116	; 0x74
    ad72:	0000      	movs	r0, r0
    ad74:	1102      	asrs	r2, r0, #4
    ad76:	0000      	movs	r0, r0
    ad78:	2c85      	cmp	r4, #133	; 0x85
    ad7a:	0000      	movs	r0, r0
    ad7c:	3102      	adds	r1, #2
    ad7e:	0000      	movs	r0, r0
    ad80:	2c8b      	cmp	r4, #139	; 0x8b
    ad82:	0000      	movs	r0, r0
    ad84:	0e02      	lsrs	r2, r0, #24
    ad86:	0000      	movs	r0, r0
    ad88:	2c9a      	cmp	r4, #154	; 0x9a
    ad8a:	0000      	movs	r0, r0
    ad8c:	3102      	adds	r1, #2
    ad8e:	0000      	movs	r0, r0
    ad90:	2ca4      	cmp	r4, #164	; 0xa4
    ad92:	0000      	movs	r0, r0
    ad94:	2d02      	cmp	r5, #2
    ad96:	0000      	movs	r0, r0
    ad98:	2ca9      	cmp	r4, #169	; 0xa9
    ad9a:	0000      	movs	r0, r0
    ad9c:	3102      	adds	r1, #2
    ad9e:	0000      	movs	r0, r0
    ada0:	2cb3      	cmp	r4, #179	; 0xb3
    ada2:	0000      	movs	r0, r0
    ada4:	2d02      	cmp	r5, #2
    ada6:	0000      	movs	r0, r0
    ada8:	2cb8      	cmp	r4, #184	; 0xb8
    adaa:	0000      	movs	r0, r0
    adac:	3102      	adds	r1, #2
    adae:	0000      	movs	r0, r0
    adb0:	2cc2      	cmp	r4, #194	; 0xc2
    adb2:	0000      	movs	r0, r0
    adb4:	2d02      	cmp	r5, #2
    adb6:	0000      	movs	r0, r0
    adb8:	2cc7      	cmp	r4, #199	; 0xc7
    adba:	0000      	movs	r0, r0
    adbc:	3102      	adds	r1, #2
    adbe:	0000      	movs	r0, r0
    adc0:	2cd1      	cmp	r4, #209	; 0xd1
    adc2:	0000      	movs	r0, r0
    adc4:	2d02      	cmp	r5, #2
    adc6:	0000      	movs	r0, r0
    adc8:	2cd6      	cmp	r4, #214	; 0xd6
    adca:	0000      	movs	r0, r0
    adcc:	3102      	adds	r1, #2
    adce:	0000      	movs	r0, r0
    add0:	2ce5      	cmp	r4, #229	; 0xe5
    add2:	0000      	movs	r0, r0
    add4:	3102      	adds	r1, #2
    add6:	0000      	movs	r0, r0
    add8:	2cef      	cmp	r4, #239	; 0xef
    adda:	0000      	movs	r0, r0
    addc:	2d02      	cmp	r5, #2
    adde:	0000      	movs	r0, r0
    ade0:	2cf4      	cmp	r4, #244	; 0xf4
    ade2:	0000      	movs	r0, r0
    ade4:	3102      	adds	r1, #2
    ade6:	0000      	movs	r0, r0
    ade8:	2cfe      	cmp	r4, #254	; 0xfe
    adea:	0000      	movs	r0, r0
    adec:	2d02      	cmp	r5, #2
    adee:	0000      	movs	r0, r0
    adf0:	2d03      	cmp	r5, #3
    adf2:	0000      	movs	r0, r0
    adf4:	3102      	adds	r1, #2
    adf6:	0000      	movs	r0, r0
    adf8:	2d0d      	cmp	r5, #13
    adfa:	0000      	movs	r0, r0
    adfc:	2d02      	cmp	r5, #2
    adfe:	0000      	movs	r0, r0
    ae00:	2d12      	cmp	r5, #18
    ae02:	0000      	movs	r0, r0
    ae04:	3102      	adds	r1, #2
    ae06:	0000      	movs	r0, r0
    ae08:	2d25      	cmp	r5, #37	; 0x25
    ae0a:	0000      	movs	r0, r0
    ae0c:	3102      	adds	r1, #2
    ae0e:	0000      	movs	r0, r0
    ae10:	2d2f      	cmp	r5, #47	; 0x2f
    ae12:	0000      	movs	r0, r0
    ae14:	2d02      	cmp	r5, #2
    ae16:	0000      	movs	r0, r0
    ae18:	2d38      	cmp	r5, #56	; 0x38
    ae1a:	0000      	movs	r0, r0
    ae1c:	0e02      	lsrs	r2, r0, #24
    ae1e:	0000      	movs	r0, r0
    ae20:	2d4b      	cmp	r5, #75	; 0x4b
    ae22:	0000      	movs	r0, r0
    ae24:	2d02      	cmp	r5, #2
    ae26:	0000      	movs	r0, r0
    ae28:	2d54      	cmp	r5, #84	; 0x54
    ae2a:	0000      	movs	r0, r0
    ae2c:	2d02      	cmp	r5, #2
    ae2e:	0000      	movs	r0, r0
    ae30:	2d59      	cmp	r5, #89	; 0x59
    ae32:	0000      	movs	r0, r0
    ae34:	0e02      	lsrs	r2, r0, #24
    ae36:	0000      	movs	r0, r0
    ae38:	2d66      	cmp	r5, #102	; 0x66
    ae3a:	0000      	movs	r0, r0
    ae3c:	2d02      	cmp	r5, #2
    ae3e:	0000      	movs	r0, r0
    ae40:	2d80      	cmp	r5, #128	; 0x80
    ae42:	0000      	movs	r0, r0
    ae44:	0e02      	lsrs	r2, r0, #24
    ae46:	0000      	movs	r0, r0
    ae48:	2da0      	cmp	r5, #160	; 0xa0
    ae4a:	0000      	movs	r0, r0
    ae4c:	0e02      	lsrs	r2, r0, #24
    ae4e:	0000      	movs	r0, r0
    ae50:	2dc2      	cmp	r5, #194	; 0xc2
    ae52:	0000      	movs	r0, r0
    ae54:	3102      	adds	r1, #2
    ae56:	0000      	movs	r0, r0
    ae58:	2dc8      	cmp	r5, #200	; 0xc8
    ae5a:	0000      	movs	r0, r0
    ae5c:	0b02      	lsrs	r2, r0, #12
    ae5e:	0000      	movs	r0, r0
    ae60:	2dd7      	cmp	r5, #215	; 0xd7
    ae62:	0000      	movs	r0, r0
    ae64:	3102      	adds	r1, #2
    ae66:	0000      	movs	r0, r0
    ae68:	2de1      	cmp	r5, #225	; 0xe1
    ae6a:	0000      	movs	r0, r0
    ae6c:	2d02      	cmp	r5, #2
    ae6e:	0000      	movs	r0, r0
    ae70:	2de6      	cmp	r5, #230	; 0xe6
    ae72:	0000      	movs	r0, r0
    ae74:	3102      	adds	r1, #2
    ae76:	0000      	movs	r0, r0
    ae78:	2df0      	cmp	r5, #240	; 0xf0
    ae7a:	0000      	movs	r0, r0
    ae7c:	2d02      	cmp	r5, #2
    ae7e:	0000      	movs	r0, r0
    ae80:	2df5      	cmp	r5, #245	; 0xf5
    ae82:	0000      	movs	r0, r0
    ae84:	3102      	adds	r1, #2
    ae86:	0000      	movs	r0, r0
    ae88:	2dff      	cmp	r5, #255	; 0xff
    ae8a:	0000      	movs	r0, r0
    ae8c:	2d02      	cmp	r5, #2
    ae8e:	0000      	movs	r0, r0
    ae90:	2e04      	cmp	r6, #4
    ae92:	0000      	movs	r0, r0
    ae94:	3102      	adds	r1, #2
    ae96:	0000      	movs	r0, r0
    ae98:	2e0e      	cmp	r6, #14
    ae9a:	0000      	movs	r0, r0
    ae9c:	2d02      	cmp	r5, #2
    ae9e:	0000      	movs	r0, r0
    aea0:	2e13      	cmp	r6, #19
    aea2:	0000      	movs	r0, r0
    aea4:	3102      	adds	r1, #2
    aea6:	0000      	movs	r0, r0
    aea8:	2e22      	cmp	r6, #34	; 0x22
    aeaa:	0000      	movs	r0, r0
    aeac:	3102      	adds	r1, #2
    aeae:	0000      	movs	r0, r0
    aeb0:	2e2c      	cmp	r6, #44	; 0x2c
    aeb2:	0000      	movs	r0, r0
    aeb4:	2d02      	cmp	r5, #2
    aeb6:	0000      	movs	r0, r0
    aeb8:	2e31      	cmp	r6, #49	; 0x31
    aeba:	0000      	movs	r0, r0
    aebc:	3102      	adds	r1, #2
    aebe:	0000      	movs	r0, r0
    aec0:	2e3b      	cmp	r6, #59	; 0x3b
    aec2:	0000      	movs	r0, r0
    aec4:	2d02      	cmp	r5, #2
    aec6:	0000      	movs	r0, r0
    aec8:	2e40      	cmp	r6, #64	; 0x40
    aeca:	0000      	movs	r0, r0
    aecc:	3102      	adds	r1, #2
    aece:	0000      	movs	r0, r0
    aed0:	2e4a      	cmp	r6, #74	; 0x4a
    aed2:	0000      	movs	r0, r0
    aed4:	2d02      	cmp	r5, #2
    aed6:	0000      	movs	r0, r0
    aed8:	2e4f      	cmp	r6, #79	; 0x4f
    aeda:	0000      	movs	r0, r0
    aedc:	3102      	adds	r1, #2
    aede:	0000      	movs	r0, r0
    aee0:	2e59      	cmp	r6, #89	; 0x59
    aee2:	0000      	movs	r0, r0
    aee4:	2d02      	cmp	r5, #2
    aee6:	0000      	movs	r0, r0
    aee8:	2e62      	cmp	r6, #98	; 0x62
    aeea:	0000      	movs	r0, r0
    aeec:	0b02      	lsrs	r2, r0, #12
    aeee:	0000      	movs	r0, r0
    aef0:	2e66      	cmp	r6, #102	; 0x66
    aef2:	0000      	movs	r0, r0
    aef4:	2f02      	cmp	r7, #2
    aef6:	0000      	movs	r0, r0
    aef8:	2e75      	cmp	r6, #117	; 0x75
    aefa:	0000      	movs	r0, r0
    aefc:	2d02      	cmp	r5, #2
    aefe:	0000      	movs	r0, r0
    af00:	2e7e      	cmp	r6, #126	; 0x7e
    af02:	0000      	movs	r0, r0
    af04:	2d02      	cmp	r5, #2
    af06:	0000      	movs	r0, r0
    af08:	2e88      	cmp	r6, #136	; 0x88
    af0a:	0000      	movs	r0, r0
    af0c:	0b02      	lsrs	r2, r0, #12
    af0e:	0000      	movs	r0, r0
    af10:	2e8c      	cmp	r6, #140	; 0x8c
    af12:	0000      	movs	r0, r0
    af14:	2f02      	cmp	r7, #2
    af16:	0000      	movs	r0, r0
    af18:	2e9b      	cmp	r6, #155	; 0x9b
    af1a:	0000      	movs	r0, r0
    af1c:	2d02      	cmp	r5, #2
    af1e:	0000      	movs	r0, r0
    af20:	2ea4      	cmp	r6, #164	; 0xa4
    af22:	0000      	movs	r0, r0
    af24:	2d02      	cmp	r5, #2
    af26:	0000      	movs	r0, r0
    af28:	2ea9      	cmp	r6, #169	; 0xa9
    af2a:	0000      	movs	r0, r0
    af2c:	2f02      	cmp	r7, #2
    af2e:	0000      	movs	r0, r0
    af30:	2eb2      	cmp	r6, #178	; 0xb2
    af32:	0000      	movs	r0, r0
    af34:	2d02      	cmp	r5, #2
    af36:	0000      	movs	r0, r0
    af38:	2ecc      	cmp	r6, #204	; 0xcc
    af3a:	0000      	movs	r0, r0
    af3c:	0b02      	lsrs	r2, r0, #12
    af3e:	0000      	movs	r0, r0
    af40:	2eeb      	cmp	r6, #235	; 0xeb
    af42:	0000      	movs	r0, r0
    af44:	0b02      	lsrs	r2, r0, #12
    af46:	0000      	movs	r0, r0
    af48:	2efc      	cmp	r6, #252	; 0xfc
    af4a:	0000      	movs	r0, r0
    af4c:	3102      	adds	r1, #2
    af4e:	0000      	movs	r0, r0
    af50:	2f02      	cmp	r7, #2
    af52:	0000      	movs	r0, r0
    af54:	0802      	lsrs	r2, r0, #32
    af56:	0000      	movs	r0, r0
    af58:	2f0d      	cmp	r7, #13
    af5a:	0000      	movs	r0, r0
    af5c:	3102      	adds	r1, #2
    af5e:	0000      	movs	r0, r0
    af60:	2f13      	cmp	r7, #19
    af62:	0000      	movs	r0, r0
    af64:	0502      	lsls	r2, r0, #20
    af66:	0000      	movs	r0, r0
    af68:	2f22      	cmp	r7, #34	; 0x22
    af6a:	0000      	movs	r0, r0
    af6c:	3102      	adds	r1, #2
    af6e:	0000      	movs	r0, r0
    af70:	2f2c      	cmp	r7, #44	; 0x2c
    af72:	0000      	movs	r0, r0
    af74:	2d02      	cmp	r5, #2
    af76:	0000      	movs	r0, r0
    af78:	2f31      	cmp	r7, #49	; 0x31
    af7a:	0000      	movs	r0, r0
    af7c:	0502      	lsls	r2, r0, #20
    af7e:	0000      	movs	r0, r0
    af80:	2f48      	cmp	r7, #72	; 0x48
    af82:	0000      	movs	r0, r0
    af84:	0502      	lsls	r2, r0, #20
    af86:	0000      	movs	r0, r0
    af88:	2f66      	cmp	r7, #102	; 0x66
    af8a:	0000      	movs	r0, r0
    af8c:	0502      	lsls	r2, r0, #20
    af8e:	0000      	movs	r0, r0
    af90:	2f73      	cmp	r7, #115	; 0x73
    af92:	0000      	movs	r0, r0
    af94:	3102      	adds	r1, #2
    af96:	0000      	movs	r0, r0
    af98:	2f8c      	cmp	r7, #140	; 0x8c
    af9a:	0000      	movs	r0, r0
    af9c:	3102      	adds	r1, #2
    af9e:	0000      	movs	r0, r0
    afa0:	2f99      	cmp	r7, #153	; 0x99
    afa2:	0000      	movs	r0, r0
    afa4:	3102      	adds	r1, #2
    afa6:	0000      	movs	r0, r0
    afa8:	2fa6      	cmp	r7, #166	; 0xa6
    afaa:	0000      	movs	r0, r0
    afac:	3102      	adds	r1, #2
    afae:	0000      	movs	r0, r0
    afb0:	2fb3      	cmp	r7, #179	; 0xb3
    afb2:	0000      	movs	r0, r0
    afb4:	3102      	adds	r1, #2
    afb6:	0000      	movs	r0, r0
    afb8:	2fc4      	cmp	r7, #196	; 0xc4
    afba:	0000      	movs	r0, r0
    afbc:	3102      	adds	r1, #2
    afbe:	0000      	movs	r0, r0
    afc0:	2fd1      	cmp	r7, #209	; 0xd1
    afc2:	0000      	movs	r0, r0
    afc4:	3102      	adds	r1, #2
    afc6:	0000      	movs	r0, r0
    afc8:	2fd9      	cmp	r7, #217	; 0xd9
    afca:	0000      	movs	r0, r0
    afcc:	3102      	adds	r1, #2
    afce:	0000      	movs	r0, r0
    afd0:	2fdd      	cmp	r7, #221	; 0xdd
    afd2:	0000      	movs	r0, r0
    afd4:	3102      	adds	r1, #2
    afd6:	0000      	movs	r0, r0
    afd8:	2fe4      	cmp	r7, #228	; 0xe4
    afda:	0000      	movs	r0, r0
    afdc:	3102      	adds	r1, #2
    afde:	0000      	movs	r0, r0
    afe0:	2fe8      	cmp	r7, #232	; 0xe8
    afe2:	0000      	movs	r0, r0
    afe4:	3102      	adds	r1, #2
    afe6:	0000      	movs	r0, r0
    afe8:	2ff0      	cmp	r7, #240	; 0xf0
    afea:	0000      	movs	r0, r0
    afec:	3102      	adds	r1, #2
    afee:	0000      	movs	r0, r0
    aff0:	2ff4      	cmp	r7, #244	; 0xf4
    aff2:	0000      	movs	r0, r0
    aff4:	3102      	adds	r1, #2
    aff6:	0000      	movs	r0, r0
    aff8:	0000      	movs	r0, r0
    affa:	0000      	movs	r0, r0
    affc:	2802      	cmp	r0, #2
    affe:	0000      	movs	r0, r0
    b000:	0004      	movs	r4, r0
    b002:	0000      	movs	r0, r0
    b004:	2802      	cmp	r0, #2
    b006:	0000      	movs	r0, r0
    b008:	000b      	movs	r3, r1
    b00a:	0000      	movs	r0, r0
    b00c:	2802      	cmp	r0, #2
    b00e:	0000      	movs	r0, r0
    b010:	000f      	movs	r7, r1
    b012:	0000      	movs	r0, r0
    b014:	2802      	cmp	r0, #2
    b016:	0000      	movs	r0, r0
    b018:	0021      	movs	r1, r4
    b01a:	0000      	movs	r0, r0
    b01c:	2802      	cmp	r0, #2
    b01e:	0000      	movs	r0, r0
    b020:	0025      	movs	r5, r4
    b022:	0000      	movs	r0, r0
    b024:	2802      	cmp	r0, #2
    b026:	0000      	movs	r0, r0
    b028:	002c      	movs	r4, r5
    b02a:	0000      	movs	r0, r0
    b02c:	2802      	cmp	r0, #2
    b02e:	0000      	movs	r0, r0
    b030:	0030      	movs	r0, r6
    b032:	0000      	movs	r0, r0
    b034:	2802      	cmp	r0, #2
    b036:	0000      	movs	r0, r0
    b038:	0042      	lsls	r2, r0, #1
    b03a:	0000      	movs	r0, r0
    b03c:	2802      	cmp	r0, #2
    b03e:	0000      	movs	r0, r0
    b040:	0046      	lsls	r6, r0, #1
    b042:	0000      	movs	r0, r0
    b044:	2802      	cmp	r0, #2
    b046:	0000      	movs	r0, r0
    b048:	004d      	lsls	r5, r1, #1
    b04a:	0000      	movs	r0, r0
    b04c:	2802      	cmp	r0, #2
    b04e:	0000      	movs	r0, r0
    b050:	0051      	lsls	r1, r2, #1
    b052:	0000      	movs	r0, r0
    b054:	2802      	cmp	r0, #2
    b056:	0000      	movs	r0, r0
    b058:	0058      	lsls	r0, r3, #1
    b05a:	0000      	movs	r0, r0
    b05c:	2802      	cmp	r0, #2
    b05e:	0000      	movs	r0, r0
    b060:	005c      	lsls	r4, r3, #1
    b062:	0000      	movs	r0, r0
    b064:	2802      	cmp	r0, #2
    b066:	0000      	movs	r0, r0
    b068:	006b      	lsls	r3, r5, #1
    b06a:	0000      	movs	r0, r0
    b06c:	2802      	cmp	r0, #2
    b06e:	0000      	movs	r0, r0
    b070:	006f      	lsls	r7, r5, #1
    b072:	0000      	movs	r0, r0
    b074:	2802      	cmp	r0, #2
    b076:	0000      	movs	r0, r0
    b078:	0084      	lsls	r4, r0, #2
    b07a:	0000      	movs	r0, r0
    b07c:	2802      	cmp	r0, #2
    b07e:	0000      	movs	r0, r0
    b080:	0088      	lsls	r0, r1, #2
    b082:	0000      	movs	r0, r0
    b084:	2802      	cmp	r0, #2
    b086:	0000      	movs	r0, r0
    b088:	009e      	lsls	r6, r3, #2
    b08a:	0000      	movs	r0, r0
    b08c:	2802      	cmp	r0, #2
    b08e:	0000      	movs	r0, r0
    b090:	00a2      	lsls	r2, r4, #2
    b092:	0000      	movs	r0, r0
    b094:	2802      	cmp	r0, #2
    b096:	0000      	movs	r0, r0
    b098:	00c1      	lsls	r1, r0, #3
    b09a:	0000      	movs	r0, r0
    b09c:	2202      	movs	r2, #2
    b09e:	0000      	movs	r0, r0
    b0a0:	00c5      	lsls	r5, r0, #3
    b0a2:	0000      	movs	r0, r0
    b0a4:	2202      	movs	r2, #2
    b0a6:	0000      	movs	r0, r0
    b0a8:	00d4      	lsls	r4, r2, #3
    b0aa:	0000      	movs	r0, r0
    b0ac:	1f02      	subs	r2, r0, #4
    b0ae:	0000      	movs	r0, r0
    b0b0:	00d8      	lsls	r0, r3, #3
    b0b2:	0000      	movs	r0, r0
    b0b4:	1f02      	subs	r2, r0, #4
    b0b6:	0000      	movs	r0, r0
    b0b8:	00df      	lsls	r7, r3, #3
    b0ba:	0000      	movs	r0, r0
    b0bc:	1f02      	subs	r2, r0, #4
    b0be:	0000      	movs	r0, r0
    b0c0:	00e3      	lsls	r3, r4, #3
    b0c2:	0000      	movs	r0, r0
    b0c4:	1f02      	subs	r2, r0, #4
    b0c6:	0000      	movs	r0, r0
    b0c8:	00f5      	lsls	r5, r6, #3
    b0ca:	0000      	movs	r0, r0
    b0cc:	1f02      	subs	r2, r0, #4
    b0ce:	0000      	movs	r0, r0
    b0d0:	00f9      	lsls	r1, r7, #3
    b0d2:	0000      	movs	r0, r0
    b0d4:	1f02      	subs	r2, r0, #4
    b0d6:	0000      	movs	r0, r0
    b0d8:	010a      	lsls	r2, r1, #4
    b0da:	0000      	movs	r0, r0
    b0dc:	1f02      	subs	r2, r0, #4
    b0de:	0000      	movs	r0, r0
    b0e0:	010e      	lsls	r6, r1, #4
    b0e2:	0000      	movs	r0, r0
    b0e4:	1f02      	subs	r2, r0, #4
    b0e6:	0000      	movs	r0, r0
    b0e8:	0128      	lsls	r0, r5, #4
    b0ea:	0000      	movs	r0, r0
    b0ec:	1f02      	subs	r2, r0, #4
    b0ee:	0000      	movs	r0, r0
    b0f0:	012c      	lsls	r4, r5, #4
    b0f2:	0000      	movs	r0, r0
    b0f4:	1f02      	subs	r2, r0, #4
    b0f6:	0000      	movs	r0, r0
    b0f8:	0133      	lsls	r3, r6, #4
    b0fa:	0000      	movs	r0, r0
    b0fc:	1f02      	subs	r2, r0, #4
    b0fe:	0000      	movs	r0, r0
    b100:	0137      	lsls	r7, r6, #4
    b102:	0000      	movs	r0, r0
    b104:	1f02      	subs	r2, r0, #4
    b106:	0000      	movs	r0, r0
    b108:	0146      	lsls	r6, r0, #5
    b10a:	0000      	movs	r0, r0
    b10c:	2502      	movs	r5, #2
    b10e:	0000      	movs	r0, r0
    b110:	014a      	lsls	r2, r1, #5
    b112:	0000      	movs	r0, r0
    b114:	2502      	movs	r5, #2
    b116:	0000      	movs	r0, r0
    b118:	0151      	lsls	r1, r2, #5
    b11a:	0000      	movs	r0, r0
    b11c:	2502      	movs	r5, #2
    b11e:	0000      	movs	r0, r0
    b120:	0155      	lsls	r5, r2, #5
    b122:	0000      	movs	r0, r0
    b124:	2502      	movs	r5, #2
    b126:	0000      	movs	r0, r0
    b128:	0167      	lsls	r7, r4, #5
    b12a:	0000      	movs	r0, r0
    b12c:	2502      	movs	r5, #2
    b12e:	0000      	movs	r0, r0
    b130:	016b      	lsls	r3, r5, #5
    b132:	0000      	movs	r0, r0
    b134:	2502      	movs	r5, #2
    b136:	0000      	movs	r0, r0
    b138:	0172      	lsls	r2, r6, #5
    b13a:	0000      	movs	r0, r0
    b13c:	2502      	movs	r5, #2
    b13e:	0000      	movs	r0, r0
    b140:	0176      	lsls	r6, r6, #5
    b142:	0000      	movs	r0, r0
    b144:	2502      	movs	r5, #2
    b146:	0000      	movs	r0, r0
    b148:	0188      	lsls	r0, r1, #6
    b14a:	0000      	movs	r0, r0
    b14c:	2502      	movs	r5, #2
    b14e:	0000      	movs	r0, r0
    b150:	018c      	lsls	r4, r1, #6
    b152:	0000      	movs	r0, r0
    b154:	2502      	movs	r5, #2
    b156:	0000      	movs	r0, r0
    b158:	0193      	lsls	r3, r2, #6
    b15a:	0000      	movs	r0, r0
    b15c:	2502      	movs	r5, #2
    b15e:	0000      	movs	r0, r0
    b160:	0197      	lsls	r7, r2, #6
    b162:	0000      	movs	r0, r0
    b164:	2502      	movs	r5, #2
    b166:	0000      	movs	r0, r0
    b168:	019e      	lsls	r6, r3, #6
    b16a:	0000      	movs	r0, r0
    b16c:	2502      	movs	r5, #2
    b16e:	0000      	movs	r0, r0
    b170:	01a2      	lsls	r2, r4, #6
    b172:	0000      	movs	r0, r0
    b174:	2502      	movs	r5, #2
    b176:	0000      	movs	r0, r0
    b178:	01a9      	lsls	r1, r5, #6
    b17a:	0000      	movs	r0, r0
    b17c:	2502      	movs	r5, #2
    b17e:	0000      	movs	r0, r0
    b180:	01ad      	lsls	r5, r5, #6
    b182:	0000      	movs	r0, r0
    b184:	2502      	movs	r5, #2
    b186:	0000      	movs	r0, r0
    b188:	01bd      	lsls	r5, r7, #6
    b18a:	0000      	movs	r0, r0
    b18c:	1c02      	adds	r2, r0, #0
    b18e:	0000      	movs	r0, r0
    b190:	01c1      	lsls	r1, r0, #7
    b192:	0000      	movs	r0, r0
    b194:	1c02      	adds	r2, r0, #0
    b196:	0000      	movs	r0, r0
    b198:	01c8      	lsls	r0, r1, #7
    b19a:	0000      	movs	r0, r0
    b19c:	1c02      	adds	r2, r0, #0
    b19e:	0000      	movs	r0, r0
    b1a0:	01cc      	lsls	r4, r1, #7
    b1a2:	0000      	movs	r0, r0
    b1a4:	1c02      	adds	r2, r0, #0
    b1a6:	0000      	movs	r0, r0
    b1a8:	01d6      	lsls	r6, r2, #7
    b1aa:	0000      	movs	r0, r0
    b1ac:	1c02      	adds	r2, r0, #0
    b1ae:	0000      	movs	r0, r0
    b1b0:	01da      	lsls	r2, r3, #7
    b1b2:	0000      	movs	r0, r0
    b1b4:	1c02      	adds	r2, r0, #0
    b1b6:	0000      	movs	r0, r0
    b1b8:	01e1      	lsls	r1, r4, #7
    b1ba:	0000      	movs	r0, r0
    b1bc:	1c02      	adds	r2, r0, #0
    b1be:	0000      	movs	r0, r0
    b1c0:	01e5      	lsls	r5, r4, #7
    b1c2:	0000      	movs	r0, r0
    b1c4:	1c02      	adds	r2, r0, #0
    b1c6:	0000      	movs	r0, r0
    b1c8:	01f7      	lsls	r7, r6, #7
    b1ca:	0000      	movs	r0, r0
    b1cc:	1902      	adds	r2, r0, r4
    b1ce:	0000      	movs	r0, r0
    b1d0:	01fb      	lsls	r3, r7, #7
    b1d2:	0000      	movs	r0, r0
    b1d4:	1902      	adds	r2, r0, r4
    b1d6:	0000      	movs	r0, r0
    b1d8:	0202      	lsls	r2, r0, #8
    b1da:	0000      	movs	r0, r0
    b1dc:	1902      	adds	r2, r0, r4
    b1de:	0000      	movs	r0, r0
    b1e0:	0206      	lsls	r6, r0, #8
    b1e2:	0000      	movs	r0, r0
    b1e4:	1902      	adds	r2, r0, r4
    b1e6:	0000      	movs	r0, r0
    b1e8:	0210      	lsls	r0, r2, #8
    b1ea:	0000      	movs	r0, r0
    b1ec:	1902      	adds	r2, r0, r4
    b1ee:	0000      	movs	r0, r0
    b1f0:	0214      	lsls	r4, r2, #8
    b1f2:	0000      	movs	r0, r0
    b1f4:	1902      	adds	r2, r0, r4
    b1f6:	0000      	movs	r0, r0
    b1f8:	0223      	lsls	r3, r4, #8
    b1fa:	0000      	movs	r0, r0
    b1fc:	1902      	adds	r2, r0, r4
    b1fe:	0000      	movs	r0, r0
    b200:	0227      	lsls	r7, r4, #8
    b202:	0000      	movs	r0, r0
    b204:	1902      	adds	r2, r0, r4
    b206:	0000      	movs	r0, r0
    b208:	022f      	lsls	r7, r5, #8
    b20a:	0000      	movs	r0, r0
    b20c:	1902      	adds	r2, r0, r4
    b20e:	0000      	movs	r0, r0
    b210:	0233      	lsls	r3, r6, #8
    b212:	0000      	movs	r0, r0
    b214:	1902      	adds	r2, r0, r4
    b216:	0000      	movs	r0, r0
    b218:	023a      	lsls	r2, r7, #8
    b21a:	0000      	movs	r0, r0
    b21c:	1902      	adds	r2, r0, r4
    b21e:	0000      	movs	r0, r0
    b220:	023e      	lsls	r6, r7, #8
    b222:	0000      	movs	r0, r0
    b224:	1902      	adds	r2, r0, r4
    b226:	0000      	movs	r0, r0
    b228:	024e      	lsls	r6, r1, #9
    b22a:	0000      	movs	r0, r0
    b22c:	1902      	adds	r2, r0, r4
    b22e:	0000      	movs	r0, r0
    b230:	0252      	lsls	r2, r2, #9
    b232:	0000      	movs	r0, r0
    b234:	1902      	adds	r2, r0, r4
    b236:	0000      	movs	r0, r0
    b238:	025a      	lsls	r2, r3, #9
    b23a:	0000      	movs	r0, r0
    b23c:	1902      	adds	r2, r0, r4
    b23e:	0000      	movs	r0, r0
    b240:	025e      	lsls	r6, r3, #9
    b242:	0000      	movs	r0, r0
    b244:	1902      	adds	r2, r0, r4
    b246:	0000      	movs	r0, r0
    b248:	0265      	lsls	r5, r4, #9
    b24a:	0000      	movs	r0, r0
    b24c:	1902      	adds	r2, r0, r4
    b24e:	0000      	movs	r0, r0
    b250:	0269      	lsls	r1, r5, #9
    b252:	0000      	movs	r0, r0
    b254:	1902      	adds	r2, r0, r4
    b256:	0000      	movs	r0, r0
    b258:	0279      	lsls	r1, r7, #9
    b25a:	0000      	movs	r0, r0
    b25c:	1902      	adds	r2, r0, r4
    b25e:	0000      	movs	r0, r0
    b260:	027d      	lsls	r5, r7, #9
    b262:	0000      	movs	r0, r0
    b264:	1902      	adds	r2, r0, r4
    b266:	0000      	movs	r0, r0
    b268:	0285      	lsls	r5, r0, #10
    b26a:	0000      	movs	r0, r0
    b26c:	1902      	adds	r2, r0, r4
    b26e:	0000      	movs	r0, r0
    b270:	0289      	lsls	r1, r1, #10
    b272:	0000      	movs	r0, r0
    b274:	1902      	adds	r2, r0, r4
    b276:	0000      	movs	r0, r0
    b278:	0290      	lsls	r0, r2, #10
    b27a:	0000      	movs	r0, r0
    b27c:	1902      	adds	r2, r0, r4
    b27e:	0000      	movs	r0, r0
    b280:	0294      	lsls	r4, r2, #10
    b282:	0000      	movs	r0, r0
    b284:	1902      	adds	r2, r0, r4
    b286:	0000      	movs	r0, r0
    b288:	02a4      	lsls	r4, r4, #10
    b28a:	0000      	movs	r0, r0
    b28c:	1102      	asrs	r2, r0, #4
    b28e:	0000      	movs	r0, r0
    b290:	02a8      	lsls	r0, r5, #10
    b292:	0000      	movs	r0, r0
    b294:	1102      	asrs	r2, r0, #4
    b296:	0000      	movs	r0, r0
    b298:	02af      	lsls	r7, r5, #10
    b29a:	0000      	movs	r0, r0
    b29c:	1102      	asrs	r2, r0, #4
    b29e:	0000      	movs	r0, r0
    b2a0:	02b3      	lsls	r3, r6, #10
    b2a2:	0000      	movs	r0, r0
    b2a4:	1102      	asrs	r2, r0, #4
    b2a6:	0000      	movs	r0, r0
    b2a8:	02ba      	lsls	r2, r7, #10
    b2aa:	0000      	movs	r0, r0
    b2ac:	1102      	asrs	r2, r0, #4
    b2ae:	0000      	movs	r0, r0
    b2b0:	02be      	lsls	r6, r7, #10
    b2b2:	0000      	movs	r0, r0
    b2b4:	1102      	asrs	r2, r0, #4
    b2b6:	0000      	movs	r0, r0
    b2b8:	02c8      	lsls	r0, r1, #11
    b2ba:	0000      	movs	r0, r0
    b2bc:	1102      	asrs	r2, r0, #4
    b2be:	0000      	movs	r0, r0
    b2c0:	02cc      	lsls	r4, r1, #11
    b2c2:	0000      	movs	r0, r0
    b2c4:	1102      	asrs	r2, r0, #4
    b2c6:	0000      	movs	r0, r0
    b2c8:	02db      	lsls	r3, r3, #11
    b2ca:	0000      	movs	r0, r0
    b2cc:	1102      	asrs	r2, r0, #4
    b2ce:	0000      	movs	r0, r0
    b2d0:	02df      	lsls	r7, r3, #11
    b2d2:	0000      	movs	r0, r0
    b2d4:	1102      	asrs	r2, r0, #4
    b2d6:	0000      	movs	r0, r0
    b2d8:	02e6      	lsls	r6, r4, #11
    b2da:	0000      	movs	r0, r0
    b2dc:	1102      	asrs	r2, r0, #4
    b2de:	0000      	movs	r0, r0
    b2e0:	02ea      	lsls	r2, r5, #11
    b2e2:	0000      	movs	r0, r0
    b2e4:	1102      	asrs	r2, r0, #4
    b2e6:	0000      	movs	r0, r0
    b2e8:	02f1      	lsls	r1, r6, #11
    b2ea:	0000      	movs	r0, r0
    b2ec:	1102      	asrs	r2, r0, #4
    b2ee:	0000      	movs	r0, r0
    b2f0:	02f5      	lsls	r5, r6, #11
    b2f2:	0000      	movs	r0, r0
    b2f4:	1102      	asrs	r2, r0, #4
    b2f6:	0000      	movs	r0, r0
    b2f8:	02fe      	lsls	r6, r7, #11
    b2fa:	0000      	movs	r0, r0
    b2fc:	1102      	asrs	r2, r0, #4
    b2fe:	0000      	movs	r0, r0
    b300:	0302      	lsls	r2, r0, #12
    b302:	0000      	movs	r0, r0
    b304:	1102      	asrs	r2, r0, #4
    b306:	0000      	movs	r0, r0
    b308:	0314      	lsls	r4, r2, #12
    b30a:	0000      	movs	r0, r0
    b30c:	1102      	asrs	r2, r0, #4
    b30e:	0000      	movs	r0, r0
    b310:	0318      	lsls	r0, r3, #12
    b312:	0000      	movs	r0, r0
    b314:	1102      	asrs	r2, r0, #4
    b316:	0000      	movs	r0, r0
    b318:	0324      	lsls	r4, r4, #12
    b31a:	0000      	movs	r0, r0
    b31c:	1102      	asrs	r2, r0, #4
    b31e:	0000      	movs	r0, r0
    b320:	0328      	lsls	r0, r5, #12
    b322:	0000      	movs	r0, r0
    b324:	1102      	asrs	r2, r0, #4
    b326:	0000      	movs	r0, r0
    b328:	033c      	lsls	r4, r7, #12
    b32a:	0000      	movs	r0, r0
    b32c:	1102      	asrs	r2, r0, #4
    b32e:	0000      	movs	r0, r0
    b330:	0340      	lsls	r0, r0, #13
    b332:	0000      	movs	r0, r0
    b334:	1102      	asrs	r2, r0, #4
    b336:	0000      	movs	r0, r0
    b338:	0350      	lsls	r0, r2, #13
    b33a:	0000      	movs	r0, r0
    b33c:	1102      	asrs	r2, r0, #4
    b33e:	0000      	movs	r0, r0
    b340:	0354      	lsls	r4, r2, #13
    b342:	0000      	movs	r0, r0
    b344:	1102      	asrs	r2, r0, #4
    b346:	0000      	movs	r0, r0
    b348:	0362      	lsls	r2, r4, #13
    b34a:	0000      	movs	r0, r0
    b34c:	1102      	asrs	r2, r0, #4
    b34e:	0000      	movs	r0, r0
    b350:	0366      	lsls	r6, r4, #13
    b352:	0000      	movs	r0, r0
    b354:	1102      	asrs	r2, r0, #4
    b356:	0000      	movs	r0, r0
    b358:	0375      	lsls	r5, r6, #13
    b35a:	0000      	movs	r0, r0
    b35c:	1102      	asrs	r2, r0, #4
    b35e:	0000      	movs	r0, r0
    b360:	0379      	lsls	r1, r7, #13
    b362:	0000      	movs	r0, r0
    b364:	1102      	asrs	r2, r0, #4
    b366:	0000      	movs	r0, r0
    b368:	0388      	lsls	r0, r1, #14
    b36a:	0000      	movs	r0, r0
    b36c:	1102      	asrs	r2, r0, #4
    b36e:	0000      	movs	r0, r0
    b370:	038c      	lsls	r4, r1, #14
    b372:	0000      	movs	r0, r0
    b374:	1102      	asrs	r2, r0, #4
    b376:	0000      	movs	r0, r0
    b378:	039b      	lsls	r3, r3, #14
    b37a:	0000      	movs	r0, r0
    b37c:	1102      	asrs	r2, r0, #4
    b37e:	0000      	movs	r0, r0
    b380:	039f      	lsls	r7, r3, #14
    b382:	0000      	movs	r0, r0
    b384:	1102      	asrs	r2, r0, #4
    b386:	0000      	movs	r0, r0
    b388:	03af      	lsls	r7, r5, #14
    b38a:	0000      	movs	r0, r0
    b38c:	1102      	asrs	r2, r0, #4
    b38e:	0000      	movs	r0, r0
    b390:	03b3      	lsls	r3, r6, #14
    b392:	0000      	movs	r0, r0
    b394:	1102      	asrs	r2, r0, #4
    b396:	0000      	movs	r0, r0
    b398:	03c3      	lsls	r3, r0, #15
    b39a:	0000      	movs	r0, r0
    b39c:	1102      	asrs	r2, r0, #4
    b39e:	0000      	movs	r0, r0
    b3a0:	03c7      	lsls	r7, r0, #15
    b3a2:	0000      	movs	r0, r0
    b3a4:	1102      	asrs	r2, r0, #4
    b3a6:	0000      	movs	r0, r0
    b3a8:	03d6      	lsls	r6, r2, #15
    b3aa:	0000      	movs	r0, r0
    b3ac:	1102      	asrs	r2, r0, #4
    b3ae:	0000      	movs	r0, r0
    b3b0:	03da      	lsls	r2, r3, #15
    b3b2:	0000      	movs	r0, r0
    b3b4:	1102      	asrs	r2, r0, #4
    b3b6:	0000      	movs	r0, r0
    b3b8:	03e1      	lsls	r1, r4, #15
    b3ba:	0000      	movs	r0, r0
    b3bc:	1102      	asrs	r2, r0, #4
    b3be:	0000      	movs	r0, r0
    b3c0:	03e5      	lsls	r5, r4, #15
    b3c2:	0000      	movs	r0, r0
    b3c4:	1102      	asrs	r2, r0, #4
    b3c6:	0000      	movs	r0, r0
    b3c8:	03f4      	lsls	r4, r6, #15
    b3ca:	0000      	movs	r0, r0
    b3cc:	1102      	asrs	r2, r0, #4
    b3ce:	0000      	movs	r0, r0
    b3d0:	03f8      	lsls	r0, r7, #15
    b3d2:	0000      	movs	r0, r0
    b3d4:	1102      	asrs	r2, r0, #4
    b3d6:	0000      	movs	r0, r0
    b3d8:	0403      	lsls	r3, r0, #16
    b3da:	0000      	movs	r0, r0
    b3dc:	1102      	asrs	r2, r0, #4
    b3de:	0000      	movs	r0, r0
    b3e0:	0407      	lsls	r7, r0, #16
    b3e2:	0000      	movs	r0, r0
    b3e4:	1102      	asrs	r2, r0, #4
    b3e6:	0000      	movs	r0, r0
    b3e8:	0412      	lsls	r2, r2, #16
    b3ea:	0000      	movs	r0, r0
    b3ec:	1102      	asrs	r2, r0, #4
    b3ee:	0000      	movs	r0, r0
    b3f0:	0416      	lsls	r6, r2, #16
    b3f2:	0000      	movs	r0, r0
    b3f4:	1102      	asrs	r2, r0, #4
    b3f6:	0000      	movs	r0, r0
    b3f8:	0423      	lsls	r3, r4, #16
    b3fa:	0000      	movs	r0, r0
    b3fc:	1102      	asrs	r2, r0, #4
    b3fe:	0000      	movs	r0, r0
    b400:	0427      	lsls	r7, r4, #16
    b402:	0000      	movs	r0, r0
    b404:	1102      	asrs	r2, r0, #4
    b406:	0000      	movs	r0, r0
    b408:	0432      	lsls	r2, r6, #16
    b40a:	0000      	movs	r0, r0
    b40c:	1102      	asrs	r2, r0, #4
    b40e:	0000      	movs	r0, r0
    b410:	0436      	lsls	r6, r6, #16
    b412:	0000      	movs	r0, r0
    b414:	1102      	asrs	r2, r0, #4
    b416:	0000      	movs	r0, r0
    b418:	0443      	lsls	r3, r0, #17
    b41a:	0000      	movs	r0, r0
    b41c:	1102      	asrs	r2, r0, #4
    b41e:	0000      	movs	r0, r0
    b420:	0447      	lsls	r7, r0, #17
    b422:	0000      	movs	r0, r0
    b424:	1102      	asrs	r2, r0, #4
    b426:	0000      	movs	r0, r0
    b428:	0452      	lsls	r2, r2, #17
    b42a:	0000      	movs	r0, r0
    b42c:	1102      	asrs	r2, r0, #4
    b42e:	0000      	movs	r0, r0
    b430:	0456      	lsls	r6, r2, #17
    b432:	0000      	movs	r0, r0
    b434:	1102      	asrs	r2, r0, #4
    b436:	0000      	movs	r0, r0
    b438:	0463      	lsls	r3, r4, #17
    b43a:	0000      	movs	r0, r0
    b43c:	1102      	asrs	r2, r0, #4
    b43e:	0000      	movs	r0, r0
    b440:	0467      	lsls	r7, r4, #17
    b442:	0000      	movs	r0, r0
    b444:	1102      	asrs	r2, r0, #4
    b446:	0000      	movs	r0, r0
    b448:	0472      	lsls	r2, r6, #17
    b44a:	0000      	movs	r0, r0
    b44c:	1102      	asrs	r2, r0, #4
    b44e:	0000      	movs	r0, r0
    b450:	0476      	lsls	r6, r6, #17
    b452:	0000      	movs	r0, r0
    b454:	1102      	asrs	r2, r0, #4
    b456:	0000      	movs	r0, r0
    b458:	0481      	lsls	r1, r0, #18
    b45a:	0000      	movs	r0, r0
    b45c:	1102      	asrs	r2, r0, #4
    b45e:	0000      	movs	r0, r0
    b460:	0485      	lsls	r5, r0, #18
    b462:	0000      	movs	r0, r0
    b464:	1102      	asrs	r2, r0, #4
    b466:	0000      	movs	r0, r0
    b468:	0492      	lsls	r2, r2, #18
    b46a:	0000      	movs	r0, r0
    b46c:	1102      	asrs	r2, r0, #4
    b46e:	0000      	movs	r0, r0
    b470:	0496      	lsls	r6, r2, #18
    b472:	0000      	movs	r0, r0
    b474:	1102      	asrs	r2, r0, #4
    b476:	0000      	movs	r0, r0
    b478:	04a1      	lsls	r1, r4, #18
    b47a:	0000      	movs	r0, r0
    b47c:	1102      	asrs	r2, r0, #4
    b47e:	0000      	movs	r0, r0
    b480:	04a5      	lsls	r5, r4, #18
    b482:	0000      	movs	r0, r0
    b484:	1102      	asrs	r2, r0, #4
    b486:	0000      	movs	r0, r0
    b488:	04b2      	lsls	r2, r6, #18
    b48a:	0000      	movs	r0, r0
    b48c:	1102      	asrs	r2, r0, #4
    b48e:	0000      	movs	r0, r0
    b490:	04b6      	lsls	r6, r6, #18
    b492:	0000      	movs	r0, r0
    b494:	1102      	asrs	r2, r0, #4
    b496:	0000      	movs	r0, r0
    b498:	04c1      	lsls	r1, r0, #19
    b49a:	0000      	movs	r0, r0
    b49c:	1102      	asrs	r2, r0, #4
    b49e:	0000      	movs	r0, r0
    b4a0:	04c5      	lsls	r5, r0, #19
    b4a2:	0000      	movs	r0, r0
    b4a4:	1102      	asrs	r2, r0, #4
    b4a6:	0000      	movs	r0, r0
    b4a8:	04da      	lsls	r2, r3, #19
    b4aa:	0000      	movs	r0, r0
    b4ac:	1102      	asrs	r2, r0, #4
    b4ae:	0000      	movs	r0, r0
    b4b0:	04de      	lsls	r6, r3, #19
    b4b2:	0000      	movs	r0, r0
    b4b4:	1102      	asrs	r2, r0, #4
    b4b6:	0000      	movs	r0, r0
    b4b8:	04e6      	lsls	r6, r4, #19
    b4ba:	0000      	movs	r0, r0
    b4bc:	1102      	asrs	r2, r0, #4
    b4be:	0000      	movs	r0, r0
    b4c0:	04ea      	lsls	r2, r5, #19
    b4c2:	0000      	movs	r0, r0
    b4c4:	1102      	asrs	r2, r0, #4
    b4c6:	0000      	movs	r0, r0
    b4c8:	04f1      	lsls	r1, r6, #19
    b4ca:	0000      	movs	r0, r0
    b4cc:	1102      	asrs	r2, r0, #4
    b4ce:	0000      	movs	r0, r0
    b4d0:	04f5      	lsls	r5, r6, #19
    b4d2:	0000      	movs	r0, r0
    b4d4:	1102      	asrs	r2, r0, #4
    b4d6:	0000      	movs	r0, r0
    b4d8:	04fd      	lsls	r5, r7, #19
    b4da:	0000      	movs	r0, r0
    b4dc:	1102      	asrs	r2, r0, #4
    b4de:	0000      	movs	r0, r0
    b4e0:	0501      	lsls	r1, r0, #20
    b4e2:	0000      	movs	r0, r0
    b4e4:	1102      	asrs	r2, r0, #4
    b4e6:	0000      	movs	r0, r0
    b4e8:	050b      	lsls	r3, r1, #20
    b4ea:	0000      	movs	r0, r0
    b4ec:	1102      	asrs	r2, r0, #4
    b4ee:	0000      	movs	r0, r0
    b4f0:	050f      	lsls	r7, r1, #20
    b4f2:	0000      	movs	r0, r0
    b4f4:	1102      	asrs	r2, r0, #4
    b4f6:	0000      	movs	r0, r0
    b4f8:	0516      	lsls	r6, r2, #20
    b4fa:	0000      	movs	r0, r0
    b4fc:	1102      	asrs	r2, r0, #4
    b4fe:	0000      	movs	r0, r0
    b500:	051a      	lsls	r2, r3, #20
    b502:	0000      	movs	r0, r0
    b504:	1102      	asrs	r2, r0, #4
    b506:	0000      	movs	r0, r0
    b508:	0524      	lsls	r4, r4, #20
    b50a:	0000      	movs	r0, r0
    b50c:	1102      	asrs	r2, r0, #4
    b50e:	0000      	movs	r0, r0
    b510:	0528      	lsls	r0, r5, #20
    b512:	0000      	movs	r0, r0
    b514:	1102      	asrs	r2, r0, #4
    b516:	0000      	movs	r0, r0
    b518:	052f      	lsls	r7, r5, #20
    b51a:	0000      	movs	r0, r0
    b51c:	1102      	asrs	r2, r0, #4
    b51e:	0000      	movs	r0, r0
    b520:	0533      	lsls	r3, r6, #20
    b522:	0000      	movs	r0, r0
    b524:	1102      	asrs	r2, r0, #4
    b526:	0000      	movs	r0, r0
    b528:	053d      	lsls	r5, r7, #20
    b52a:	0000      	movs	r0, r0
    b52c:	1102      	asrs	r2, r0, #4
    b52e:	0000      	movs	r0, r0
    b530:	0541      	lsls	r1, r0, #21
    b532:	0000      	movs	r0, r0
    b534:	1102      	asrs	r2, r0, #4
    b536:	0000      	movs	r0, r0
    b538:	0548      	lsls	r0, r1, #21
    b53a:	0000      	movs	r0, r0
    b53c:	1102      	asrs	r2, r0, #4
    b53e:	0000      	movs	r0, r0
    b540:	054c      	lsls	r4, r1, #21
    b542:	0000      	movs	r0, r0
    b544:	1102      	asrs	r2, r0, #4
    b546:	0000      	movs	r0, r0
    b548:	055e      	lsls	r6, r3, #21
    b54a:	0000      	movs	r0, r0
    b54c:	1102      	asrs	r2, r0, #4
    b54e:	0000      	movs	r0, r0
    b550:	0562      	lsls	r2, r4, #21
    b552:	0000      	movs	r0, r0
    b554:	1102      	asrs	r2, r0, #4
    b556:	0000      	movs	r0, r0
    b558:	0572      	lsls	r2, r6, #21
    b55a:	0000      	movs	r0, r0
    b55c:	1102      	asrs	r2, r0, #4
    b55e:	0000      	movs	r0, r0
    b560:	0576      	lsls	r6, r6, #21
    b562:	0000      	movs	r0, r0
    b564:	1102      	asrs	r2, r0, #4
    b566:	0000      	movs	r0, r0
    b568:	0586      	lsls	r6, r0, #22
    b56a:	0000      	movs	r0, r0
    b56c:	0e02      	lsrs	r2, r0, #24
    b56e:	0000      	movs	r0, r0
    b570:	058a      	lsls	r2, r1, #22
    b572:	0000      	movs	r0, r0
    b574:	0e02      	lsrs	r2, r0, #24
    b576:	0000      	movs	r0, r0
    b578:	0591      	lsls	r1, r2, #22
    b57a:	0000      	movs	r0, r0
    b57c:	0e02      	lsrs	r2, r0, #24
    b57e:	0000      	movs	r0, r0
    b580:	0595      	lsls	r5, r2, #22
    b582:	0000      	movs	r0, r0
    b584:	0e02      	lsrs	r2, r0, #24
    b586:	0000      	movs	r0, r0
    b588:	059c      	lsls	r4, r3, #22
    b58a:	0000      	movs	r0, r0
    b58c:	0e02      	lsrs	r2, r0, #24
    b58e:	0000      	movs	r0, r0
    b590:	05a0      	lsls	r0, r4, #22
    b592:	0000      	movs	r0, r0
    b594:	0e02      	lsrs	r2, r0, #24
    b596:	0000      	movs	r0, r0
    b598:	05b2      	lsls	r2, r6, #22
    b59a:	0000      	movs	r0, r0
    b59c:	0e02      	lsrs	r2, r0, #24
    b59e:	0000      	movs	r0, r0
    b5a0:	05b6      	lsls	r6, r6, #22
    b5a2:	0000      	movs	r0, r0
    b5a4:	0e02      	lsrs	r2, r0, #24
    b5a6:	0000      	movs	r0, r0
    b5a8:	05bd      	lsls	r5, r7, #22
    b5aa:	0000      	movs	r0, r0
    b5ac:	0e02      	lsrs	r2, r0, #24
    b5ae:	0000      	movs	r0, r0
    b5b0:	05c1      	lsls	r1, r0, #23
    b5b2:	0000      	movs	r0, r0
    b5b4:	0e02      	lsrs	r2, r0, #24
    b5b6:	0000      	movs	r0, r0
    b5b8:	05c8      	lsls	r0, r1, #23
    b5ba:	0000      	movs	r0, r0
    b5bc:	0e02      	lsrs	r2, r0, #24
    b5be:	0000      	movs	r0, r0
    b5c0:	05cc      	lsls	r4, r1, #23
    b5c2:	0000      	movs	r0, r0
    b5c4:	0e02      	lsrs	r2, r0, #24
    b5c6:	0000      	movs	r0, r0
    b5c8:	05d5      	lsls	r5, r2, #23
    b5ca:	0000      	movs	r0, r0
    b5cc:	0e02      	lsrs	r2, r0, #24
    b5ce:	0000      	movs	r0, r0
    b5d0:	05d9      	lsls	r1, r3, #23
    b5d2:	0000      	movs	r0, r0
    b5d4:	0e02      	lsrs	r2, r0, #24
    b5d6:	0000      	movs	r0, r0
    b5d8:	05eb      	lsls	r3, r5, #23
    b5da:	0000      	movs	r0, r0
    b5dc:	0e02      	lsrs	r2, r0, #24
    b5de:	0000      	movs	r0, r0
    b5e0:	05ef      	lsls	r7, r5, #23
    b5e2:	0000      	movs	r0, r0
    b5e4:	0e02      	lsrs	r2, r0, #24
    b5e6:	0000      	movs	r0, r0
    b5e8:	05fb      	lsls	r3, r7, #23
    b5ea:	0000      	movs	r0, r0
    b5ec:	0e02      	lsrs	r2, r0, #24
    b5ee:	0000      	movs	r0, r0
    b5f0:	05ff      	lsls	r7, r7, #23
    b5f2:	0000      	movs	r0, r0
    b5f4:	0e02      	lsrs	r2, r0, #24
    b5f6:	0000      	movs	r0, r0
    b5f8:	0613      	lsls	r3, r2, #24
    b5fa:	0000      	movs	r0, r0
    b5fc:	0e02      	lsrs	r2, r0, #24
    b5fe:	0000      	movs	r0, r0
    b600:	0617      	lsls	r7, r2, #24
    b602:	0000      	movs	r0, r0
    b604:	0e02      	lsrs	r2, r0, #24
    b606:	0000      	movs	r0, r0
    b608:	0627      	lsls	r7, r4, #24
    b60a:	0000      	movs	r0, r0
    b60c:	0e02      	lsrs	r2, r0, #24
    b60e:	0000      	movs	r0, r0
    b610:	062b      	lsls	r3, r5, #24
    b612:	0000      	movs	r0, r0
    b614:	0e02      	lsrs	r2, r0, #24
    b616:	0000      	movs	r0, r0
    b618:	0639      	lsls	r1, r7, #24
    b61a:	0000      	movs	r0, r0
    b61c:	0e02      	lsrs	r2, r0, #24
    b61e:	0000      	movs	r0, r0
    b620:	063d      	lsls	r5, r7, #24
    b622:	0000      	movs	r0, r0
    b624:	0e02      	lsrs	r2, r0, #24
    b626:	0000      	movs	r0, r0
    b628:	064c      	lsls	r4, r1, #25
    b62a:	0000      	movs	r0, r0
    b62c:	0e02      	lsrs	r2, r0, #24
    b62e:	0000      	movs	r0, r0
    b630:	0650      	lsls	r0, r2, #25
    b632:	0000      	movs	r0, r0
    b634:	0e02      	lsrs	r2, r0, #24
    b636:	0000      	movs	r0, r0
    b638:	0657      	lsls	r7, r2, #25
    b63a:	0000      	movs	r0, r0
    b63c:	0e02      	lsrs	r2, r0, #24
    b63e:	0000      	movs	r0, r0
    b640:	065b      	lsls	r3, r3, #25
    b642:	0000      	movs	r0, r0
    b644:	0e02      	lsrs	r2, r0, #24
    b646:	0000      	movs	r0, r0
    b648:	0664      	lsls	r4, r4, #25
    b64a:	0000      	movs	r0, r0
    b64c:	0e02      	lsrs	r2, r0, #24
    b64e:	0000      	movs	r0, r0
    b650:	0668      	lsls	r0, r5, #25
    b652:	0000      	movs	r0, r0
    b654:	0e02      	lsrs	r2, r0, #24
    b656:	0000      	movs	r0, r0
    b658:	0679      	lsls	r1, r7, #25
    b65a:	0000      	movs	r0, r0
    b65c:	0e02      	lsrs	r2, r0, #24
    b65e:	0000      	movs	r0, r0
    b660:	067d      	lsls	r5, r7, #25
    b662:	0000      	movs	r0, r0
    b664:	0e02      	lsrs	r2, r0, #24
    b666:	0000      	movs	r0, r0
    b668:	0684      	lsls	r4, r0, #26
    b66a:	0000      	movs	r0, r0
    b66c:	0e02      	lsrs	r2, r0, #24
    b66e:	0000      	movs	r0, r0
    b670:	0688      	lsls	r0, r1, #26
    b672:	0000      	movs	r0, r0
    b674:	0e02      	lsrs	r2, r0, #24
    b676:	0000      	movs	r0, r0
    b678:	0691      	lsls	r1, r2, #26
    b67a:	0000      	movs	r0, r0
    b67c:	0e02      	lsrs	r2, r0, #24
    b67e:	0000      	movs	r0, r0
    b680:	0695      	lsls	r5, r2, #26
    b682:	0000      	movs	r0, r0
    b684:	0e02      	lsrs	r2, r0, #24
    b686:	0000      	movs	r0, r0
    b688:	06a6      	lsls	r6, r4, #26
    b68a:	0000      	movs	r0, r0
    b68c:	0e02      	lsrs	r2, r0, #24
    b68e:	0000      	movs	r0, r0
    b690:	06aa      	lsls	r2, r5, #26
    b692:	0000      	movs	r0, r0
    b694:	0e02      	lsrs	r2, r0, #24
    b696:	0000      	movs	r0, r0
    b698:	06b5      	lsls	r5, r6, #26
    b69a:	0000      	movs	r0, r0
    b69c:	0e02      	lsrs	r2, r0, #24
    b69e:	0000      	movs	r0, r0
    b6a0:	06b9      	lsls	r1, r7, #26
    b6a2:	0000      	movs	r0, r0
    b6a4:	0e02      	lsrs	r2, r0, #24
    b6a6:	0000      	movs	r0, r0
    b6a8:	06c7      	lsls	r7, r0, #27
    b6aa:	0000      	movs	r0, r0
    b6ac:	0e02      	lsrs	r2, r0, #24
    b6ae:	0000      	movs	r0, r0
    b6b0:	06cb      	lsls	r3, r1, #27
    b6b2:	0000      	movs	r0, r0
    b6b4:	0e02      	lsrs	r2, r0, #24
    b6b6:	0000      	movs	r0, r0
    b6b8:	06dc      	lsls	r4, r3, #27
    b6ba:	0000      	movs	r0, r0
    b6bc:	0e02      	lsrs	r2, r0, #24
    b6be:	0000      	movs	r0, r0
    b6c0:	06e0      	lsls	r0, r4, #27
    b6c2:	0000      	movs	r0, r0
    b6c4:	0e02      	lsrs	r2, r0, #24
    b6c6:	0000      	movs	r0, r0
    b6c8:	06f2      	lsls	r2, r6, #27
    b6ca:	0000      	movs	r0, r0
    b6cc:	0e02      	lsrs	r2, r0, #24
    b6ce:	0000      	movs	r0, r0
    b6d0:	06f6      	lsls	r6, r6, #27
    b6d2:	0000      	movs	r0, r0
    b6d4:	0e02      	lsrs	r2, r0, #24
    b6d6:	0000      	movs	r0, r0
    b6d8:	070e      	lsls	r6, r1, #28
    b6da:	0000      	movs	r0, r0
    b6dc:	0e02      	lsrs	r2, r0, #24
    b6de:	0000      	movs	r0, r0
    b6e0:	0712      	lsls	r2, r2, #28
    b6e2:	0000      	movs	r0, r0
    b6e4:	0e02      	lsrs	r2, r0, #24
    b6e6:	0000      	movs	r0, r0
    b6e8:	072d      	lsls	r5, r5, #28
    b6ea:	0000      	movs	r0, r0
    b6ec:	0e02      	lsrs	r2, r0, #24
    b6ee:	0000      	movs	r0, r0
    b6f0:	0731      	lsls	r1, r6, #28
    b6f2:	0000      	movs	r0, r0
    b6f4:	0e02      	lsrs	r2, r0, #24
    b6f6:	0000      	movs	r0, r0
    b6f8:	074e      	lsls	r6, r1, #29
    b6fa:	0000      	movs	r0, r0
    b6fc:	0e02      	lsrs	r2, r0, #24
    b6fe:	0000      	movs	r0, r0
    b700:	0752      	lsls	r2, r2, #29
    b702:	0000      	movs	r0, r0
    b704:	0e02      	lsrs	r2, r0, #24
    b706:	0000      	movs	r0, r0
    b708:	0772      	lsls	r2, r6, #29
    b70a:	0000      	movs	r0, r0
    b70c:	0e02      	lsrs	r2, r0, #24
    b70e:	0000      	movs	r0, r0
    b710:	0776      	lsls	r6, r6, #29
    b712:	0000      	movs	r0, r0
    b714:	0e02      	lsrs	r2, r0, #24
    b716:	0000      	movs	r0, r0
    b718:	0798      	lsls	r0, r3, #30
    b71a:	0000      	movs	r0, r0
    b71c:	0e02      	lsrs	r2, r0, #24
    b71e:	0000      	movs	r0, r0
    b720:	079c      	lsls	r4, r3, #30
    b722:	0000      	movs	r0, r0
    b724:	0e02      	lsrs	r2, r0, #24
    b726:	0000      	movs	r0, r0
    b728:	07c1      	lsls	r1, r0, #31
    b72a:	0000      	movs	r0, r0
    b72c:	0e02      	lsrs	r2, r0, #24
    b72e:	0000      	movs	r0, r0
    b730:	07c5      	lsls	r5, r0, #31
    b732:	0000      	movs	r0, r0
    b734:	0e02      	lsrs	r2, r0, #24
    b736:	0000      	movs	r0, r0
    b738:	07ec      	lsls	r4, r5, #31
    b73a:	0000      	movs	r0, r0
    b73c:	0e02      	lsrs	r2, r0, #24
    b73e:	0000      	movs	r0, r0
    b740:	07f0      	lsls	r0, r6, #31
    b742:	0000      	movs	r0, r0
    b744:	0e02      	lsrs	r2, r0, #24
    b746:	0000      	movs	r0, r0
    b748:	0817      	lsrs	r7, r2, #32
    b74a:	0000      	movs	r0, r0
    b74c:	0e02      	lsrs	r2, r0, #24
    b74e:	0000      	movs	r0, r0
    b750:	081b      	lsrs	r3, r3, #32
    b752:	0000      	movs	r0, r0
    b754:	0e02      	lsrs	r2, r0, #24
    b756:	0000      	movs	r0, r0
    b758:	0843      	lsrs	r3, r0, #1
    b75a:	0000      	movs	r0, r0
    b75c:	0e02      	lsrs	r2, r0, #24
    b75e:	0000      	movs	r0, r0
    b760:	0847      	lsrs	r7, r0, #1
    b762:	0000      	movs	r0, r0
    b764:	0e02      	lsrs	r2, r0, #24
    b766:	0000      	movs	r0, r0
    b768:	086f      	lsrs	r7, r5, #1
    b76a:	0000      	movs	r0, r0
    b76c:	0e02      	lsrs	r2, r0, #24
    b76e:	0000      	movs	r0, r0
    b770:	0873      	lsrs	r3, r6, #1
    b772:	0000      	movs	r0, r0
    b774:	0e02      	lsrs	r2, r0, #24
    b776:	0000      	movs	r0, r0
    b778:	0883      	lsrs	r3, r0, #2
    b77a:	0000      	movs	r0, r0
    b77c:	0e02      	lsrs	r2, r0, #24
    b77e:	0000      	movs	r0, r0
    b780:	0887      	lsrs	r7, r0, #2
    b782:	0000      	movs	r0, r0
    b784:	0e02      	lsrs	r2, r0, #24
    b786:	0000      	movs	r0, r0
    b788:	0897      	lsrs	r7, r2, #2
    b78a:	0000      	movs	r0, r0
    b78c:	0e02      	lsrs	r2, r0, #24
    b78e:	0000      	movs	r0, r0
    b790:	089b      	lsrs	r3, r3, #2
    b792:	0000      	movs	r0, r0
    b794:	0e02      	lsrs	r2, r0, #24
    b796:	0000      	movs	r0, r0
    b798:	08aa      	lsrs	r2, r5, #2
    b79a:	0000      	movs	r0, r0
    b79c:	0b02      	lsrs	r2, r0, #12
    b79e:	0000      	movs	r0, r0
    b7a0:	08ae      	lsrs	r6, r5, #2
    b7a2:	0000      	movs	r0, r0
    b7a4:	0b02      	lsrs	r2, r0, #12
    b7a6:	0000      	movs	r0, r0
    b7a8:	08b5      	lsrs	r5, r6, #2
    b7aa:	0000      	movs	r0, r0
    b7ac:	0b02      	lsrs	r2, r0, #12
    b7ae:	0000      	movs	r0, r0
    b7b0:	08b9      	lsrs	r1, r7, #2
    b7b2:	0000      	movs	r0, r0
    b7b4:	0b02      	lsrs	r2, r0, #12
    b7b6:	0000      	movs	r0, r0
    b7b8:	08c0      	lsrs	r0, r0, #3
    b7ba:	0000      	movs	r0, r0
    b7bc:	0b02      	lsrs	r2, r0, #12
    b7be:	0000      	movs	r0, r0
    b7c0:	08c4      	lsrs	r4, r0, #3
    b7c2:	0000      	movs	r0, r0
    b7c4:	0b02      	lsrs	r2, r0, #12
    b7c6:	0000      	movs	r0, r0
    b7c8:	08d6      	lsrs	r6, r2, #3
    b7ca:	0000      	movs	r0, r0
    b7cc:	0b02      	lsrs	r2, r0, #12
    b7ce:	0000      	movs	r0, r0
    b7d0:	08da      	lsrs	r2, r3, #3
    b7d2:	0000      	movs	r0, r0
    b7d4:	0b02      	lsrs	r2, r0, #12
    b7d6:	0000      	movs	r0, r0
    b7d8:	08e1      	lsrs	r1, r4, #3
    b7da:	0000      	movs	r0, r0
    b7dc:	0b02      	lsrs	r2, r0, #12
    b7de:	0000      	movs	r0, r0
    b7e0:	08e5      	lsrs	r5, r4, #3
    b7e2:	0000      	movs	r0, r0
    b7e4:	0b02      	lsrs	r2, r0, #12
    b7e6:	0000      	movs	r0, r0
    b7e8:	08ec      	lsrs	r4, r5, #3
    b7ea:	0000      	movs	r0, r0
    b7ec:	0b02      	lsrs	r2, r0, #12
    b7ee:	0000      	movs	r0, r0
    b7f0:	08f0      	lsrs	r0, r6, #3
    b7f2:	0000      	movs	r0, r0
    b7f4:	0b02      	lsrs	r2, r0, #12
    b7f6:	0000      	movs	r0, r0
    b7f8:	0902      	lsrs	r2, r0, #4
    b7fa:	0000      	movs	r0, r0
    b7fc:	0b02      	lsrs	r2, r0, #12
    b7fe:	0000      	movs	r0, r0
    b800:	0906      	lsrs	r6, r0, #4
    b802:	0000      	movs	r0, r0
    b804:	0b02      	lsrs	r2, r0, #12
    b806:	0000      	movs	r0, r0
    b808:	0912      	lsrs	r2, r2, #4
    b80a:	0000      	movs	r0, r0
    b80c:	0b02      	lsrs	r2, r0, #12
    b80e:	0000      	movs	r0, r0
    b810:	0916      	lsrs	r6, r2, #4
    b812:	0000      	movs	r0, r0
    b814:	0b02      	lsrs	r2, r0, #12
    b816:	0000      	movs	r0, r0
    b818:	092a      	lsrs	r2, r5, #4
    b81a:	0000      	movs	r0, r0
    b81c:	0b02      	lsrs	r2, r0, #12
    b81e:	0000      	movs	r0, r0
    b820:	092e      	lsrs	r6, r5, #4
    b822:	0000      	movs	r0, r0
    b824:	0b02      	lsrs	r2, r0, #12
    b826:	0000      	movs	r0, r0
    b828:	093e      	lsrs	r6, r7, #4
    b82a:	0000      	movs	r0, r0
    b82c:	0b02      	lsrs	r2, r0, #12
    b82e:	0000      	movs	r0, r0
    b830:	0942      	lsrs	r2, r0, #5
    b832:	0000      	movs	r0, r0
    b834:	0b02      	lsrs	r2, r0, #12
    b836:	0000      	movs	r0, r0
    b838:	0950      	lsrs	r0, r2, #5
    b83a:	0000      	movs	r0, r0
    b83c:	0b02      	lsrs	r2, r0, #12
    b83e:	0000      	movs	r0, r0
    b840:	0954      	lsrs	r4, r2, #5
    b842:	0000      	movs	r0, r0
    b844:	0b02      	lsrs	r2, r0, #12
    b846:	0000      	movs	r0, r0
    b848:	0963      	lsrs	r3, r4, #5
    b84a:	0000      	movs	r0, r0
    b84c:	0b02      	lsrs	r2, r0, #12
    b84e:	0000      	movs	r0, r0
    b850:	0967      	lsrs	r7, r4, #5
    b852:	0000      	movs	r0, r0
    b854:	0b02      	lsrs	r2, r0, #12
    b856:	0000      	movs	r0, r0
    b858:	0976      	lsrs	r6, r6, #5
    b85a:	0000      	movs	r0, r0
    b85c:	0b02      	lsrs	r2, r0, #12
    b85e:	0000      	movs	r0, r0
    b860:	097a      	lsrs	r2, r7, #5
    b862:	0000      	movs	r0, r0
    b864:	0b02      	lsrs	r2, r0, #12
    b866:	0000      	movs	r0, r0
    b868:	0981      	lsrs	r1, r0, #6
    b86a:	0000      	movs	r0, r0
    b86c:	0b02      	lsrs	r2, r0, #12
    b86e:	0000      	movs	r0, r0
    b870:	0985      	lsrs	r5, r0, #6
    b872:	0000      	movs	r0, r0
    b874:	0b02      	lsrs	r2, r0, #12
    b876:	0000      	movs	r0, r0
    b878:	0999      	lsrs	r1, r3, #6
    b87a:	0000      	movs	r0, r0
    b87c:	0b02      	lsrs	r2, r0, #12
    b87e:	0000      	movs	r0, r0
    b880:	099d      	lsrs	r5, r3, #6
    b882:	0000      	movs	r0, r0
    b884:	0b02      	lsrs	r2, r0, #12
    b886:	0000      	movs	r0, r0
    b888:	09a5      	lsrs	r5, r4, #6
    b88a:	0000      	movs	r0, r0
    b88c:	0b02      	lsrs	r2, r0, #12
    b88e:	0000      	movs	r0, r0
    b890:	09a9      	lsrs	r1, r5, #6
    b892:	0000      	movs	r0, r0
    b894:	0b02      	lsrs	r2, r0, #12
    b896:	0000      	movs	r0, r0
    b898:	09b1      	lsrs	r1, r6, #6
    b89a:	0000      	movs	r0, r0
    b89c:	0b02      	lsrs	r2, r0, #12
    b89e:	0000      	movs	r0, r0
    b8a0:	09b5      	lsrs	r5, r6, #6
    b8a2:	0000      	movs	r0, r0
    b8a4:	0b02      	lsrs	r2, r0, #12
    b8a6:	0000      	movs	r0, r0
    b8a8:	09c4      	lsrs	r4, r0, #7
    b8aa:	0000      	movs	r0, r0
    b8ac:	0b02      	lsrs	r2, r0, #12
    b8ae:	0000      	movs	r0, r0
    b8b0:	09c8      	lsrs	r0, r1, #7
    b8b2:	0000      	movs	r0, r0
    b8b4:	0b02      	lsrs	r2, r0, #12
    b8b6:	0000      	movs	r0, r0
    b8b8:	09cf      	lsrs	r7, r1, #7
    b8ba:	0000      	movs	r0, r0
    b8bc:	2b02      	cmp	r3, #2
    b8be:	0000      	movs	r0, r0
    b8c0:	09dc      	lsrs	r4, r3, #7
    b8c2:	0000      	movs	r0, r0
    b8c4:	0b02      	lsrs	r2, r0, #12
    b8c6:	0000      	movs	r0, r0
    b8c8:	09e0      	lsrs	r0, r4, #7
    b8ca:	0000      	movs	r0, r0
    b8cc:	0b02      	lsrs	r2, r0, #12
    b8ce:	0000      	movs	r0, r0
    b8d0:	09ef      	lsrs	r7, r5, #7
    b8d2:	0000      	movs	r0, r0
    b8d4:	0b02      	lsrs	r2, r0, #12
    b8d6:	0000      	movs	r0, r0
    b8d8:	09f3      	lsrs	r3, r6, #7
    b8da:	0000      	movs	r0, r0
    b8dc:	0b02      	lsrs	r2, r0, #12
    b8de:	0000      	movs	r0, r0
    b8e0:	0a02      	lsrs	r2, r0, #8
    b8e2:	0000      	movs	r0, r0
    b8e4:	0b02      	lsrs	r2, r0, #12
    b8e6:	0000      	movs	r0, r0
    b8e8:	0a06      	lsrs	r6, r0, #8
    b8ea:	0000      	movs	r0, r0
    b8ec:	0b02      	lsrs	r2, r0, #12
    b8ee:	0000      	movs	r0, r0
    b8f0:	0a16      	lsrs	r6, r2, #8
    b8f2:	0000      	movs	r0, r0
    b8f4:	0b02      	lsrs	r2, r0, #12
    b8f6:	0000      	movs	r0, r0
    b8f8:	0a1a      	lsrs	r2, r3, #8
    b8fa:	0000      	movs	r0, r0
    b8fc:	0b02      	lsrs	r2, r0, #12
    b8fe:	0000      	movs	r0, r0
    b900:	0a29      	lsrs	r1, r5, #8
    b902:	0000      	movs	r0, r0
    b904:	0502      	lsls	r2, r0, #20
    b906:	0000      	movs	r0, r0
    b908:	0a2d      	lsrs	r5, r5, #8
    b90a:	0000      	movs	r0, r0
    b90c:	0502      	lsls	r2, r0, #20
    b90e:	0000      	movs	r0, r0
    b910:	0a34      	lsrs	r4, r6, #8
    b912:	0000      	movs	r0, r0
    b914:	0502      	lsls	r2, r0, #20
    b916:	0000      	movs	r0, r0
    b918:	0a38      	lsrs	r0, r7, #8
    b91a:	0000      	movs	r0, r0
    b91c:	0502      	lsls	r2, r0, #20
    b91e:	0000      	movs	r0, r0
    b920:	0a3f      	lsrs	r7, r7, #8
    b922:	0000      	movs	r0, r0
    b924:	0502      	lsls	r2, r0, #20
    b926:	0000      	movs	r0, r0
    b928:	0a43      	lsrs	r3, r0, #9
    b92a:	0000      	movs	r0, r0
    b92c:	0502      	lsls	r2, r0, #20
    b92e:	0000      	movs	r0, r0
    b930:	0006      	movs	r6, r0
    b932:	0000      	movs	r0, r0
    b934:	2b02      	cmp	r3, #2
    b936:	0000      	movs	r0, r0
    b938:	0010      	movs	r0, r2
    b93a:	0000      	movs	r0, r0
    b93c:	0502      	lsls	r2, r0, #20
    b93e:	0000      	movs	r0, r0
    b940:	0018      	movs	r0, r3
    b942:	0000      	movs	r0, r0
    b944:	0802      	lsrs	r2, r0, #32
    b946:	0000      	movs	r0, r0
    b948:	0020      	movs	r0, r4
    b94a:	0000      	movs	r0, r0
    b94c:	0b02      	lsrs	r2, r0, #12
    b94e:	0000      	movs	r0, r0
    b950:	0028      	movs	r0, r5
    b952:	0000      	movs	r0, r0
    b954:	0e02      	lsrs	r2, r0, #24
    b956:	0000      	movs	r0, r0
    b958:	0030      	movs	r0, r6
    b95a:	0000      	movs	r0, r0
    b95c:	1102      	asrs	r2, r0, #4
    b95e:	0000      	movs	r0, r0
    b960:	0038      	movs	r0, r7
    b962:	0000      	movs	r0, r0
    b964:	1402      	asrs	r2, r0, #16
    b966:	0000      	movs	r0, r0
    b968:	0040      	lsls	r0, r0, #1
    b96a:	0000      	movs	r0, r0
    b96c:	1702      	asrs	r2, r0, #28
    b96e:	0000      	movs	r0, r0
    b970:	0048      	lsls	r0, r1, #1
    b972:	0000      	movs	r0, r0
    b974:	1902      	adds	r2, r0, r4
    b976:	0000      	movs	r0, r0
    b978:	0050      	lsls	r0, r2, #1
    b97a:	0000      	movs	r0, r0
    b97c:	1c02      	adds	r2, r0, #0
    b97e:	0000      	movs	r0, r0
    b980:	0058      	lsls	r0, r3, #1
    b982:	0000      	movs	r0, r0
    b984:	1f02      	subs	r2, r0, #4
    b986:	0000      	movs	r0, r0
    b988:	0060      	lsls	r0, r4, #1
    b98a:	0000      	movs	r0, r0
    b98c:	2202      	movs	r2, #2
    b98e:	0000      	movs	r0, r0
    b990:	0068      	lsls	r0, r5, #1
    b992:	0000      	movs	r0, r0
    b994:	2502      	movs	r5, #2
    b996:	0000      	movs	r0, r0
    b998:	0070      	lsls	r0, r6, #1
    b99a:	0000      	movs	r0, r0
    b99c:	2802      	cmp	r0, #2
    b99e:	0000      	movs	r0, r0
    b9a0:	0000      	movs	r0, r0
    b9a2:	0000      	movs	r0, r0
    b9a4:	0b02      	lsrs	r2, r0, #12
    b9a6:	0000      	movs	r0, r0
    b9a8:	0004      	movs	r4, r0
    b9aa:	0000      	movs	r0, r0
    b9ac:	0b02      	lsrs	r2, r0, #12
    b9ae:	0000      	movs	r0, r0
    b9b0:	0008      	movs	r0, r1
    b9b2:	0000      	movs	r0, r0
    b9b4:	0b02      	lsrs	r2, r0, #12
    b9b6:	0000      	movs	r0, r0
    b9b8:	000c      	movs	r4, r1
    b9ba:	0000      	movs	r0, r0
    b9bc:	0b02      	lsrs	r2, r0, #12
    b9be:	0000      	movs	r0, r0
    b9c0:	0010      	movs	r0, r2
    b9c2:	0000      	movs	r0, r0
    b9c4:	0b02      	lsrs	r2, r0, #12
    b9c6:	0000      	movs	r0, r0
    b9c8:	0014      	movs	r4, r2
    b9ca:	0000      	movs	r0, r0
    b9cc:	0b02      	lsrs	r2, r0, #12
    b9ce:	0000      	movs	r0, r0
    b9d0:	0018      	movs	r0, r3
    b9d2:	0000      	movs	r0, r0
    b9d4:	0b02      	lsrs	r2, r0, #12
    b9d6:	0000      	movs	r0, r0
    b9d8:	001c      	movs	r4, r3
    b9da:	0000      	movs	r0, r0
    b9dc:	0b02      	lsrs	r2, r0, #12
    b9de:	0000      	movs	r0, r0
    b9e0:	0020      	movs	r0, r4
    b9e2:	0000      	movs	r0, r0
    b9e4:	0b02      	lsrs	r2, r0, #12
    b9e6:	0000      	movs	r0, r0
    b9e8:	0024      	movs	r4, r4
    b9ea:	0000      	movs	r0, r0
    b9ec:	0b02      	lsrs	r2, r0, #12
    b9ee:	0000      	movs	r0, r0
    b9f0:	0028      	movs	r0, r5
    b9f2:	0000      	movs	r0, r0
    b9f4:	0b02      	lsrs	r2, r0, #12
    b9f6:	0000      	movs	r0, r0
    b9f8:	002c      	movs	r4, r5
    b9fa:	0000      	movs	r0, r0
    b9fc:	0b02      	lsrs	r2, r0, #12
    b9fe:	0000      	movs	r0, r0
    ba00:	0038      	movs	r0, r7
    ba02:	0000      	movs	r0, r0
    ba04:	0b02      	lsrs	r2, r0, #12
    ba06:	0000      	movs	r0, r0
    ba08:	003c      	movs	r4, r7
    ba0a:	0000      	movs	r0, r0
    ba0c:	0b02      	lsrs	r2, r0, #12
    ba0e:	0000      	movs	r0, r0
    ba10:	0040      	lsls	r0, r0, #1
    ba12:	0000      	movs	r0, r0
    ba14:	0b02      	lsrs	r2, r0, #12
    ba16:	0000      	movs	r0, r0
    ba18:	0044      	lsls	r4, r0, #1
    ba1a:	0000      	movs	r0, r0
    ba1c:	0b02      	lsrs	r2, r0, #12
    ba1e:	0000      	movs	r0, r0
    ba20:	0048      	lsls	r0, r1, #1
    ba22:	0000      	movs	r0, r0
    ba24:	0b02      	lsrs	r2, r0, #12
    ba26:	0000      	movs	r0, r0
    ba28:	004c      	lsls	r4, r1, #1
    ba2a:	0000      	movs	r0, r0
    ba2c:	0b02      	lsrs	r2, r0, #12
    ba2e:	0000      	movs	r0, r0
    ba30:	0050      	lsls	r0, r2, #1
    ba32:	0000      	movs	r0, r0
    ba34:	0b02      	lsrs	r2, r0, #12
    ba36:	0000      	movs	r0, r0
    ba38:	0054      	lsls	r4, r2, #1
    ba3a:	0000      	movs	r0, r0
    ba3c:	0b02      	lsrs	r2, r0, #12
    ba3e:	0000      	movs	r0, r0
    ba40:	0060      	lsls	r0, r4, #1
    ba42:	0000      	movs	r0, r0
    ba44:	1102      	asrs	r2, r0, #4
    ba46:	0000      	movs	r0, r0
    ba48:	0064      	lsls	r4, r4, #1
    ba4a:	0000      	movs	r0, r0
    ba4c:	1102      	asrs	r2, r0, #4
    ba4e:	0000      	movs	r0, r0
    ba50:	0068      	lsls	r0, r5, #1
    ba52:	0000      	movs	r0, r0
    ba54:	1102      	asrs	r2, r0, #4
    ba56:	0000      	movs	r0, r0
    ba58:	006c      	lsls	r4, r5, #1
    ba5a:	0000      	movs	r0, r0
    ba5c:	1102      	asrs	r2, r0, #4
    ba5e:	0000      	movs	r0, r0
    ba60:	0070      	lsls	r0, r6, #1
    ba62:	0000      	movs	r0, r0
    ba64:	1102      	asrs	r2, r0, #4
    ba66:	0000      	movs	r0, r0
    ba68:	0074      	lsls	r4, r6, #1
    ba6a:	0000      	movs	r0, r0
    ba6c:	1102      	asrs	r2, r0, #4
    ba6e:	0000      	movs	r0, r0
    ba70:	0078      	lsls	r0, r7, #1
    ba72:	0000      	movs	r0, r0
    ba74:	1102      	asrs	r2, r0, #4
    ba76:	0000      	movs	r0, r0
    ba78:	007c      	lsls	r4, r7, #1
    ba7a:	0000      	movs	r0, r0
    ba7c:	1102      	asrs	r2, r0, #4
    ba7e:	0000      	movs	r0, r0
    ba80:	0088      	lsls	r0, r1, #2
    ba82:	0000      	movs	r0, r0
    ba84:	1102      	asrs	r2, r0, #4
    ba86:	0000      	movs	r0, r0
    ba88:	008c      	lsls	r4, r1, #2
    ba8a:	0000      	movs	r0, r0
    ba8c:	1102      	asrs	r2, r0, #4
    ba8e:	0000      	movs	r0, r0
    ba90:	0090      	lsls	r0, r2, #2
    ba92:	0000      	movs	r0, r0
    ba94:	1102      	asrs	r2, r0, #4
    ba96:	0000      	movs	r0, r0
    ba98:	0094      	lsls	r4, r2, #2
    ba9a:	0000      	movs	r0, r0
    ba9c:	1102      	asrs	r2, r0, #4
    ba9e:	0000      	movs	r0, r0
    baa0:	00a0      	lsls	r0, r4, #2
    baa2:	0000      	movs	r0, r0
    baa4:	0502      	lsls	r2, r0, #20
    baa6:	0000      	movs	r0, r0
    baa8:	00a4      	lsls	r4, r4, #2
    baaa:	0000      	movs	r0, r0
    baac:	0502      	lsls	r2, r0, #20
    baae:	0000      	movs	r0, r0
    bab0:	00a8      	lsls	r0, r5, #2
    bab2:	0000      	movs	r0, r0
    bab4:	0802      	lsrs	r2, r0, #32
    bab6:	0000      	movs	r0, r0
    bab8:	00ac      	lsls	r4, r5, #2
    baba:	0000      	movs	r0, r0
    babc:	0802      	lsrs	r2, r0, #32
    babe:	0000      	movs	r0, r0
    bac0:	00b0      	lsls	r0, r6, #2
    bac2:	0000      	movs	r0, r0
    bac4:	0b02      	lsrs	r2, r0, #12
    bac6:	0000      	movs	r0, r0
    bac8:	00b4      	lsls	r4, r6, #2
    baca:	0000      	movs	r0, r0
    bacc:	0b02      	lsrs	r2, r0, #12
    bace:	0000      	movs	r0, r0
    bad0:	00b8      	lsls	r0, r7, #2
    bad2:	0000      	movs	r0, r0
    bad4:	0e02      	lsrs	r2, r0, #24
    bad6:	0000      	movs	r0, r0
    bad8:	00bc      	lsls	r4, r7, #2
    bada:	0000      	movs	r0, r0
    badc:	0e02      	lsrs	r2, r0, #24
    bade:	0000      	movs	r0, r0
    bae0:	00c0      	lsls	r0, r0, #3
    bae2:	0000      	movs	r0, r0
    bae4:	1102      	asrs	r2, r0, #4
    bae6:	0000      	movs	r0, r0
    bae8:	00c4      	lsls	r4, r0, #3
    baea:	0000      	movs	r0, r0
    baec:	1102      	asrs	r2, r0, #4
    baee:	0000      	movs	r0, r0
    baf0:	00c8      	lsls	r0, r1, #3
    baf2:	0000      	movs	r0, r0
    baf4:	1402      	asrs	r2, r0, #16
    baf6:	0000      	movs	r0, r0
    baf8:	00cc      	lsls	r4, r1, #3
    bafa:	0000      	movs	r0, r0
    bafc:	1402      	asrs	r2, r0, #16
    bafe:	0000      	movs	r0, r0
    bb00:	00d0      	lsls	r0, r2, #3
    bb02:	0000      	movs	r0, r0
    bb04:	1702      	asrs	r2, r0, #28
    bb06:	0000      	movs	r0, r0
    bb08:	00d4      	lsls	r4, r2, #3
    bb0a:	0000      	movs	r0, r0
    bb0c:	1702      	asrs	r2, r0, #28
    bb0e:	0000      	movs	r0, r0
    bb10:	00d8      	lsls	r0, r3, #3
    bb12:	0000      	movs	r0, r0
    bb14:	1902      	adds	r2, r0, r4
    bb16:	0000      	movs	r0, r0
    bb18:	00dc      	lsls	r4, r3, #3
    bb1a:	0000      	movs	r0, r0
    bb1c:	1902      	adds	r2, r0, r4
    bb1e:	0000      	movs	r0, r0
    bb20:	00e0      	lsls	r0, r4, #3
    bb22:	0000      	movs	r0, r0
    bb24:	1c02      	adds	r2, r0, #0
    bb26:	0000      	movs	r0, r0
    bb28:	00e4      	lsls	r4, r4, #3
    bb2a:	0000      	movs	r0, r0
    bb2c:	1c02      	adds	r2, r0, #0
    bb2e:	0000      	movs	r0, r0
    bb30:	00e8      	lsls	r0, r5, #3
    bb32:	0000      	movs	r0, r0
    bb34:	1f02      	subs	r2, r0, #4
    bb36:	0000      	movs	r0, r0
    bb38:	00ec      	lsls	r4, r5, #3
    bb3a:	0000      	movs	r0, r0
    bb3c:	1f02      	subs	r2, r0, #4
    bb3e:	0000      	movs	r0, r0
    bb40:	00f0      	lsls	r0, r6, #3
    bb42:	0000      	movs	r0, r0
    bb44:	2202      	movs	r2, #2
    bb46:	0000      	movs	r0, r0
    bb48:	00f4      	lsls	r4, r6, #3
    bb4a:	0000      	movs	r0, r0
    bb4c:	2202      	movs	r2, #2
    bb4e:	0000      	movs	r0, r0
    bb50:	00f8      	lsls	r0, r7, #3
    bb52:	0000      	movs	r0, r0
    bb54:	2502      	movs	r5, #2
    bb56:	0000      	movs	r0, r0
    bb58:	00fc      	lsls	r4, r7, #3
    bb5a:	0000      	movs	r0, r0
    bb5c:	2502      	movs	r5, #2
    bb5e:	0000      	movs	r0, r0
    bb60:	0100      	lsls	r0, r0, #4
    bb62:	0000      	movs	r0, r0
    bb64:	2802      	cmp	r0, #2
    bb66:	0000      	movs	r0, r0
    bb68:	0104      	lsls	r4, r0, #4
    bb6a:	0000      	movs	r0, r0
    bb6c:	2802      	cmp	r0, #2
    bb6e:	0000      	movs	r0, r0
    bb70:	02b3      	lsls	r3, r6, #10
    bb72:	0000      	movs	r0, r0
    bb74:	0502      	lsls	r2, r0, #20
    bb76:	0000      	movs	r0, r0
    bb78:	02d6      	lsls	r6, r2, #11
    bb7a:	0000      	movs	r0, r0
    bb7c:	0802      	lsrs	r2, r0, #32
    bb7e:	0000      	movs	r0, r0
    bb80:	02e7      	lsls	r7, r4, #11
    bb82:	0000      	movs	r0, r0
    bb84:	0b02      	lsrs	r2, r0, #12
    bb86:	0000      	movs	r0, r0
    bb88:	0378      	lsls	r0, r7, #13
    bb8a:	0000      	movs	r0, r0
    bb8c:	0e02      	lsrs	r2, r0, #24
    bb8e:	0000      	movs	r0, r0
    bb90:	03e5      	lsls	r5, r4, #15
    bb92:	0000      	movs	r0, r0
    bb94:	1102      	asrs	r2, r0, #4
    bb96:	0000      	movs	r0, r0
    bb98:	047b      	lsls	r3, r7, #17
    bb9a:	0000      	movs	r0, r0
    bb9c:	1402      	asrs	r2, r0, #16
    bb9e:	0000      	movs	r0, r0
    bba0:	04a8      	lsls	r0, r5, #18
    bba2:	0000      	movs	r0, r0
    bba4:	1702      	asrs	r2, r0, #28
    bba6:	0000      	movs	r0, r0
    bba8:	04b9      	lsls	r1, r7, #18
    bbaa:	0000      	movs	r0, r0
    bbac:	1902      	adds	r2, r0, r4
    bbae:	0000      	movs	r0, r0
    bbb0:	0507      	lsls	r7, r0, #20
    bbb2:	0000      	movs	r0, r0
    bbb4:	1c02      	adds	r2, r0, #0
    bbb6:	0000      	movs	r0, r0
    bbb8:	0521      	lsls	r1, r4, #20
    bbba:	0000      	movs	r0, r0
    bbbc:	1f02      	subs	r2, r0, #4
    bbbe:	0000      	movs	r0, r0
    bbc0:	0537      	lsls	r7, r6, #20
    bbc2:	0000      	movs	r0, r0
    bbc4:	2202      	movs	r2, #2
    bbc6:	0000      	movs	r0, r0
    bbc8:	0550      	lsls	r0, r2, #21
    bbca:	0000      	movs	r0, r0
    bbcc:	2502      	movs	r5, #2
    bbce:	0000      	movs	r0, r0
    bbd0:	056a      	lsls	r2, r5, #21
    bbd2:	0000      	movs	r0, r0
    bbd4:	2802      	cmp	r0, #2
    bbd6:	0000      	movs	r0, r0
    bbd8:	0014      	movs	r4, r2
    bbda:	0000      	movs	r0, r0
    bbdc:	3202      	adds	r2, #2
    bbde:	0000      	movs	r0, r0
    bbe0:	0018      	movs	r0, r3
    bbe2:	0000      	movs	r0, r0
    bbe4:	0502      	lsls	r2, r0, #20
    bbe6:	0000      	movs	r0, r0
    bbe8:	0030      	movs	r0, r6
    bbea:	0000      	movs	r0, r0
    bbec:	3202      	adds	r2, #2
    bbee:	0000      	movs	r0, r0
    bbf0:	0034      	movs	r4, r6
    bbf2:	0000      	movs	r0, r0
    bbf4:	0802      	lsrs	r2, r0, #32
    bbf6:	0000      	movs	r0, r0
    bbf8:	0040      	lsls	r0, r0, #1
    bbfa:	0000      	movs	r0, r0
    bbfc:	3202      	adds	r2, #2
    bbfe:	0000      	movs	r0, r0
    bc00:	0044      	lsls	r4, r0, #1
    bc02:	0000      	movs	r0, r0
    bc04:	0b02      	lsrs	r2, r0, #12
    bc06:	0000      	movs	r0, r0
    bc08:	0068      	lsls	r0, r5, #1
    bc0a:	0000      	movs	r0, r0
    bc0c:	3202      	adds	r2, #2
    bc0e:	0000      	movs	r0, r0
    bc10:	006c      	lsls	r4, r5, #1
    bc12:	0000      	movs	r0, r0
    bc14:	0e02      	lsrs	r2, r0, #24
    bc16:	0000      	movs	r0, r0
    bc18:	0098      	lsls	r0, r3, #2
    bc1a:	0000      	movs	r0, r0
    bc1c:	3202      	adds	r2, #2
    bc1e:	0000      	movs	r0, r0
    bc20:	009c      	lsls	r4, r3, #2
    bc22:	0000      	movs	r0, r0
    bc24:	1102      	asrs	r2, r0, #4
    bc26:	0000      	movs	r0, r0
    bc28:	00c8      	lsls	r0, r1, #3
    bc2a:	0000      	movs	r0, r0
    bc2c:	3202      	adds	r2, #2
    bc2e:	0000      	movs	r0, r0
    bc30:	00cc      	lsls	r4, r1, #3
    bc32:	0000      	movs	r0, r0
    bc34:	1402      	asrs	r2, r0, #16
    bc36:	0000      	movs	r0, r0
    bc38:	00d8      	lsls	r0, r3, #3
    bc3a:	0000      	movs	r0, r0
    bc3c:	3202      	adds	r2, #2
    bc3e:	0000      	movs	r0, r0
    bc40:	00dc      	lsls	r4, r3, #3
    bc42:	0000      	movs	r0, r0
    bc44:	1702      	asrs	r2, r0, #28
    bc46:	0000      	movs	r0, r0
    bc48:	00e8      	lsls	r0, r5, #3
    bc4a:	0000      	movs	r0, r0
    bc4c:	3202      	adds	r2, #2
    bc4e:	0000      	movs	r0, r0
    bc50:	00ec      	lsls	r4, r5, #3
    bc52:	0000      	movs	r0, r0
    bc54:	1902      	adds	r2, r0, r4
    bc56:	0000      	movs	r0, r0
    bc58:	0100      	lsls	r0, r0, #4
    bc5a:	0000      	movs	r0, r0
    bc5c:	3202      	adds	r2, #2
    bc5e:	0000      	movs	r0, r0
    bc60:	0104      	lsls	r4, r0, #4
    bc62:	0000      	movs	r0, r0
    bc64:	1c02      	adds	r2, r0, #0
    bc66:	0000      	movs	r0, r0
    bc68:	0110      	lsls	r0, r2, #4
    bc6a:	0000      	movs	r0, r0
    bc6c:	3202      	adds	r2, #2
    bc6e:	0000      	movs	r0, r0
    bc70:	0114      	lsls	r4, r2, #4
    bc72:	0000      	movs	r0, r0
    bc74:	1f02      	subs	r2, r0, #4
    bc76:	0000      	movs	r0, r0
    bc78:	0120      	lsls	r0, r4, #4
    bc7a:	0000      	movs	r0, r0
    bc7c:	3202      	adds	r2, #2
    bc7e:	0000      	movs	r0, r0
    bc80:	0124      	lsls	r4, r4, #4
    bc82:	0000      	movs	r0, r0
    bc84:	2202      	movs	r2, #2
    bc86:	0000      	movs	r0, r0
    bc88:	0130      	lsls	r0, r6, #4
    bc8a:	0000      	movs	r0, r0
    bc8c:	3202      	adds	r2, #2
    bc8e:	0000      	movs	r0, r0
    bc90:	0134      	lsls	r4, r6, #4
    bc92:	0000      	movs	r0, r0
    bc94:	2502      	movs	r5, #2
    bc96:	0000      	movs	r0, r0
    bc98:	0148      	lsls	r0, r1, #5
    bc9a:	0000      	movs	r0, r0
    bc9c:	3202      	adds	r2, #2
    bc9e:	0000      	movs	r0, r0
    bca0:	014c      	lsls	r4, r1, #5
    bca2:	0000      	movs	r0, r0
    bca4:	2802      	cmp	r0, #2
    bca6:	0000      	movs	r0, r0
    bca8:	2e00      	cmp	r6, #0
    bcaa:	7973      	ldrb	r3, [r6, #5]
    bcac:	746d      	strb	r5, [r5, #17]
    bcae:	6261      	str	r1, [r4, #36]	; 0x24
    bcb0:	2e00      	cmp	r6, #0
    bcb2:	7473      	strb	r3, [r6, #17]
    bcb4:	7472      	strb	r2, [r6, #17]
    bcb6:	6261      	str	r1, [r4, #36]	; 0x24
    bcb8:	2e00      	cmp	r6, #0
    bcba:	6873      	ldr	r3, [r6, #4]
    bcbc:	7473      	strb	r3, [r6, #17]
    bcbe:	7472      	strb	r2, [r6, #17]
    bcc0:	6261      	str	r1, [r4, #36]	; 0x24
    bcc2:	2e00      	cmp	r6, #0
    bcc4:	6574      	str	r4, [r6, #84]	; 0x54
    bcc6:	7478      	strb	r0, [r7, #17]
    bcc8:	2e00      	cmp	r6, #0
    bcca:	6164      	str	r4, [r4, #20]
    bccc:	6174      	str	r4, [r6, #20]
    bcce:	2e00      	cmp	r6, #0
    bcd0:	7362      	strb	r2, [r4, #13]
    bcd2:	0073      	lsls	r3, r6, #1
    bcd4:	722e      	strb	r6, [r5, #8]
    bcd6:	6c65      	ldr	r5, [r4, #68]	; 0x44
    bcd8:	742e      	strb	r6, [r5, #16]
    bcda:	7865      	ldrb	r5, [r4, #1]
    bcdc:	2e74      	cmp	r6, #116	; 0x74
    bcde:	4f50      	ldr	r7, [pc, #320]	; (0xbe20)
    bce0:	4557      	cmp	r7, sl
    bce2:	5f52      	ldrsh	r2, [r2, r5]
    bce4:	6e45      	ldr	r5, [r0, #100]	; 0x64
    bce6:	6574      	str	r4, [r6, #84]	; 0x54
    bce8:	4c72      	ldr	r4, [pc, #456]	; (0xbeb4)
    bcea:	776f      	strb	r7, [r5, #29]
    bcec:	6f50      	ldr	r0, [r2, #116]	; 0x74
    bcee:	6577      	str	r7, [r6, #84]	; 0x54
    bcf0:	0072      	lsls	r2, r6, #1
    bcf2:	742e      	strb	r6, [r5, #16]
    bcf4:	7865      	ldrb	r5, [r4, #1]
    bcf6:	2e74      	cmp	r6, #116	; 0x74
    bcf8:	4f50      	ldr	r7, [pc, #320]	; (0xbe3c)
    bcfa:	4557      	cmp	r7, sl
    bcfc:	5f52      	ldrsh	r2, [r2, r5]
    bcfe:	7943      	ldrb	r3, [r0, #5]
    bd00:	6c63      	ldr	r3, [r4, #68]	; 0x44
    bd02:	4365      	muls	r5, r4
    bd04:	7570      	strb	r0, [r6, #21]
    bd06:	6e41      	ldr	r1, [r0, #100]	; 0x64
    bd08:	4664      	mov	r4, ip
    bd0a:	616c      	str	r4, [r5, #20]
    bd0c:	6873      	ldr	r3, [r6, #4]
    bd0e:	2e00      	cmp	r6, #0
    bd10:	6572      	str	r2, [r6, #84]	; 0x54
    bd12:	2e6c      	cmp	r6, #108	; 0x6c
    bd14:	6574      	str	r4, [r6, #84]	; 0x54
    bd16:	7478      	strb	r0, [r7, #17]
    bd18:	502e      	str	r6, [r5, r0]
    bd1a:	574f      	ldrsb	r7, [r1, r5]
    bd1c:	5245      	strh	r5, [r0, r1]
    bd1e:	455f      	cmp	r7, fp
    bd20:	746e      	strb	r6, [r5, #17]
    bd22:	7265      	strb	r5, [r4, #9]
    bd24:	6544      	str	r4, [r0, #84]	; 0x54
    bd26:	7065      	strb	r5, [r4, #1]
    bd28:	6c53      	ldr	r3, [r2, #68]	; 0x44
    bd2a:	6565      	str	r5, [r4, #84]	; 0x54
    bd2c:	0070      	lsls	r0, r6, #1
    bd2e:	722e      	strb	r6, [r5, #8]
    bd30:	6c65      	ldr	r5, [r4, #68]	; 0x44
    bd32:	742e      	strb	r6, [r5, #16]
    bd34:	7865      	ldrb	r5, [r4, #1]
    bd36:	2e74      	cmp	r6, #116	; 0x74
    bd38:	4f50      	ldr	r7, [pc, #320]	; (0xbe7c)
    bd3a:	4557      	cmp	r7, sl
    bd3c:	5f52      	ldrsh	r2, [r2, r5]
    bd3e:	6e45      	ldr	r5, [r0, #100]	; 0x64
    bd40:	6574      	str	r4, [r6, #84]	; 0x54
    bd42:	5072      	str	r2, [r6, r1]
    bd44:	776f      	strb	r7, [r5, #29]
    bd46:	7265      	strb	r5, [r4, #9]
    bd48:	6f44      	ldr	r4, [r0, #116]	; 0x74
    bd4a:	6e77      	ldr	r7, [r6, #100]	; 0x64
    bd4c:	2e00      	cmp	r6, #0
    bd4e:	6572      	str	r2, [r6, #84]	; 0x54
    bd50:	2e6c      	cmp	r6, #108	; 0x6c
    bd52:	6574      	str	r4, [r6, #84]	; 0x54
    bd54:	7478      	strb	r0, [r7, #17]
    bd56:	502e      	str	r6, [r5, r0]
    bd58:	574f      	ldrsb	r7, [r1, r5]
    bd5a:	5245      	strh	r5, [r0, r1]
    bd5c:	455f      	cmp	r7, fp
    bd5e:	746e      	strb	r6, [r5, #17]
    bd60:	7265      	strb	r5, [r4, #9]
    bd62:	6544      	str	r4, [r0, #84]	; 0x54
    bd64:	7065      	strb	r5, [r4, #1]
    bd66:	6f50      	ldr	r0, [r2, #116]	; 0x74
    bd68:	6577      	str	r7, [r6, #84]	; 0x54
    bd6a:	4472      	add	r2, lr
    bd6c:	776f      	strb	r7, [r5, #29]
    bd6e:	006e      	lsls	r6, r5, #1
    bd70:	742e      	strb	r6, [r5, #16]
    bd72:	7865      	ldrb	r5, [r4, #1]
    bd74:	2e74      	cmp	r6, #116	; 0x74
    bd76:	4f50      	ldr	r7, [pc, #320]	; (0xbeb8)
    bd78:	4557      	cmp	r7, sl
    bd7a:	5f52      	ldrsh	r2, [r2, r5]
    bd7c:	6e45      	ldr	r5, [r0, #100]	; 0x64
    bd7e:	6574      	str	r4, [r6, #84]	; 0x54
    bd80:	5372      	strh	r2, [r6, r5]
    bd82:	656c      	str	r4, [r5, #84]	; 0x54
    bd84:	7065      	strb	r5, [r4, #1]
    bd86:	2e00      	cmp	r6, #0
    bd88:	6574      	str	r4, [r6, #84]	; 0x54
    bd8a:	7478      	strb	r0, [r7, #17]
    bd8c:	502e      	str	r6, [r5, r0]
    bd8e:	574f      	ldrsb	r7, [r1, r5]
    bd90:	5245      	strh	r5, [r0, r1]
    bd92:	475f      	bx	fp
    bd94:	7465      	strb	r5, [r4, #17]
    bd96:	694c      	ldr	r4, [r1, #20]
    bd98:	5662      	ldrsb	r2, [r4, r1]
    bd9a:	7265      	strb	r5, [r4, #9]
    bd9c:	6973      	ldr	r3, [r6, #20]
    bd9e:	6e6f      	ldr	r7, [r5, #100]	; 0x64
    bda0:	2e00      	cmp	r6, #0
    bda2:	6574      	str	r4, [r6, #84]	; 0x54
    bda4:	7478      	strb	r0, [r7, #17]
    bda6:	6e2e      	ldr	r6, [r5, #96]	; 0x60
    bda8:	6f69      	ldr	r1, [r5, #116]	; 0x74
    bdaa:	735f      	strb	r7, [r3, #13]
    bdac:	7465      	strb	r5, [r4, #17]
    bdae:	735f      	strb	r7, [r3, #13]
    bdb0:	7379      	strb	r1, [r7, #13]
    bdb2:	6574      	str	r4, [r6, #84]	; 0x54
    bdb4:	5f6d      	ldrsh	r5, [r5, r5]
    bdb6:	6f76      	ldr	r6, [r6, #116]	; 0x74
    bdb8:	746c      	strb	r4, [r5, #17]
    bdba:	6761      	str	r1, [r4, #116]	; 0x74
    bdbc:	0065      	lsls	r5, r4, #1
    bdbe:	722e      	strb	r6, [r5, #8]
    bdc0:	6c65      	ldr	r5, [r4, #68]	; 0x44
    bdc2:	742e      	strb	r6, [r5, #16]
    bdc4:	7865      	ldrb	r5, [r4, #1]
    bdc6:	2e74      	cmp	r6, #116	; 0x74
    bdc8:	4f50      	ldr	r7, [pc, #320]	; (0xbf0c)
    bdca:	4557      	cmp	r7, sl
    bdcc:	5f52      	ldrsh	r2, [r2, r5]
    bdce:	6553      	str	r3, [r2, #84]	; 0x54
    bdd0:	5674      	ldrsb	r4, [r6, r1]
    bdd2:	6c6f      	ldr	r7, [r5, #68]	; 0x44
    bdd4:	6174      	str	r4, [r6, #20]
    bdd6:	6567      	str	r7, [r4, #84]	; 0x54
    bdd8:	6f46      	ldr	r6, [r0, #116]	; 0x74
    bdda:	4672      	mov	r2, lr
    bddc:	6572      	str	r2, [r6, #84]	; 0x54
    bdde:	0071      	lsls	r1, r6, #1
    bde0:	742e      	strb	r6, [r5, #16]
    bde2:	7865      	ldrb	r5, [r4, #1]
    bde4:	2e74      	cmp	r6, #116	; 0x74
    bde6:	4f50      	ldr	r7, [pc, #320]	; (0xbf28)
    bde8:	4557      	cmp	r7, sl
    bdea:	5f52      	ldrsh	r2, [r2, r5]
    bdec:	7458      	strb	r0, [r3, #17]
    bdee:	6c61      	ldr	r1, [r4, #68]	; 0x44
    bdf0:	3233      	adds	r2, #51	; 0x33
    bdf2:	686b      	ldr	r3, [r5, #4]
    bdf4:	437a      	muls	r2, r7
    bdf6:	7061      	strb	r1, [r4, #1]
    bdf8:	6261      	str	r1, [r4, #36]	; 0x24
    bdfa:	6e61      	ldr	r1, [r4, #100]	; 0x64
    bdfc:	546b      	strb	r3, [r5, r1]
    bdfe:	6972      	ldr	r2, [r6, #20]
    be00:	006d      	lsls	r5, r5, #1
    be02:	742e      	strb	r6, [r5, #16]
    be04:	7865      	ldrb	r5, [r4, #1]
    be06:	2e74      	cmp	r6, #116	; 0x74
    be08:	4f50      	ldr	r7, [pc, #320]	; (0xbf4c)
    be0a:	4557      	cmp	r7, sl
    be0c:	5f52      	ldrsh	r2, [r2, r5]
    be0e:	6553      	str	r3, [r2, #84]	; 0x54
    be10:	5874      	ldr	r4, [r6, r1]
    be12:	6174      	str	r4, [r6, #20]
    be14:	316c      	adds	r1, #108	; 0x6c
    be16:	6d36      	ldr	r6, [r6, #80]	; 0x50
    be18:	7a68      	ldrb	r0, [r5, #9]
    be1a:	644c      	str	r4, [r1, #68]	; 0x44
    be1c:	006f      	lsls	r7, r5, #1
    be1e:	722e      	strb	r6, [r5, #8]
    be20:	6c65      	ldr	r5, [r4, #68]	; 0x44
    be22:	742e      	strb	r6, [r5, #16]
    be24:	7865      	ldrb	r5, [r4, #1]
    be26:	2e74      	cmp	r6, #116	; 0x74
    be28:	4f50      	ldr	r7, [pc, #320]	; (0xbf6c)
    be2a:	4557      	cmp	r7, sl
    be2c:	5f52      	ldrsh	r2, [r2, r5]
    be2e:	7458      	strb	r0, [r3, #17]
    be30:	6c61      	ldr	r1, [r4, #68]	; 0x44
    be32:	3631      	adds	r6, #49	; 0x31
    be34:	686d      	ldr	r5, [r5, #4]
    be36:	437a      	muls	r2, r7
    be38:	7061      	strb	r1, [r4, #1]
    be3a:	6261      	str	r1, [r4, #36]	; 0x24
    be3c:	6e61      	ldr	r1, [r4, #100]	; 0x64
    be3e:	546b      	strb	r3, [r5, r1]
    be40:	6972      	ldr	r2, [r6, #20]
    be42:	006d      	lsls	r5, r5, #1
    be44:	742e      	strb	r6, [r5, #16]
    be46:	7865      	ldrb	r5, [r4, #1]
    be48:	2e74      	cmp	r6, #116	; 0x74
    be4a:	4f50      	ldr	r7, [pc, #320]	; (0xbf8c)
    be4c:	4557      	cmp	r7, sl
    be4e:	5f52      	ldrsh	r2, [r2, r5]
    be50:	6553      	str	r3, [r2, #84]	; 0x54
    be52:	5874      	ldr	r4, [r6, r1]
    be54:	6174      	str	r4, [r6, #20]
    be56:	316c      	adds	r1, #108	; 0x6c
    be58:	6d36      	ldr	r6, [r6, #80]	; 0x50
    be5a:	7a68      	ldrb	r0, [r5, #9]
    be5c:	7254      	strb	r4, [r2, #9]
    be5e:	6d69      	ldr	r1, [r5, #84]	; 0x54
    be60:	2e00      	cmp	r6, #0
    be62:	6572      	str	r2, [r6, #84]	; 0x54
    be64:	2e6c      	cmp	r6, #108	; 0x6c
    be66:	6564      	str	r4, [r4, #84]	; 0x54
    be68:	7562      	strb	r2, [r4, #21]
    be6a:	5f67      	ldrsh	r7, [r4, r5]
    be6c:	6e69      	ldr	r1, [r5, #100]	; 0x64
    be6e:	6f66      	ldr	r6, [r4, #116]	; 0x74
    be70:	2e00      	cmp	r6, #0
    be72:	6564      	str	r4, [r4, #84]	; 0x54
    be74:	7562      	strb	r2, [r4, #21]
    be76:	5f67      	ldrsh	r7, [r4, r5]
    be78:	6261      	str	r1, [r4, #36]	; 0x24
    be7a:	7262      	strb	r2, [r4, #9]
    be7c:	7665      	strb	r5, [r4, #25]
    be7e:	2e00      	cmp	r6, #0
    be80:	6572      	str	r2, [r6, #84]	; 0x54
    be82:	2e6c      	cmp	r6, #108	; 0x6c
    be84:	6564      	str	r4, [r4, #84]	; 0x54
    be86:	7562      	strb	r2, [r4, #21]
    be88:	5f67      	ldrsh	r7, [r4, r5]
    be8a:	6f6c      	ldr	r4, [r5, #116]	; 0x74
    be8c:	0063      	lsls	r3, r4, #1
    be8e:	722e      	strb	r6, [r5, #8]
    be90:	6c65      	ldr	r5, [r4, #68]	; 0x44
    be92:	642e      	str	r6, [r5, #64]	; 0x40
    be94:	6265      	str	r5, [r4, #36]	; 0x24
    be96:	6775      	str	r5, [r6, #116]	; 0x74
    be98:	615f      	str	r7, [r3, #20]
    be9a:	6172      	str	r2, [r6, #20]
    be9c:	676e      	str	r6, [r5, #116]	; 0x74
    be9e:	7365      	strb	r5, [r4, #13]
    bea0:	2e00      	cmp	r6, #0
    bea2:	6572      	str	r2, [r6, #84]	; 0x54
    bea4:	2e6c      	cmp	r6, #108	; 0x6c
    bea6:	6564      	str	r4, [r4, #84]	; 0x54
    bea8:	7562      	strb	r2, [r4, #21]
    beaa:	5f67      	ldrsh	r7, [r4, r5]
    beac:	6172      	str	r2, [r6, #20]
    beae:	676e      	str	r6, [r5, #116]	; 0x74
    beb0:	7365      	strb	r5, [r4, #13]
    beb2:	2e00      	cmp	r6, #0
    beb4:	6572      	str	r2, [r6, #84]	; 0x54
    beb6:	2e6c      	cmp	r6, #108	; 0x6c
    beb8:	6564      	str	r4, [r4, #84]	; 0x54
    beba:	7562      	strb	r2, [r4, #21]
    bebc:	5f67      	ldrsh	r7, [r4, r5]
    bebe:	696c      	ldr	r4, [r5, #20]
    bec0:	656e      	str	r6, [r5, #84]	; 0x54
    bec2:	2e00      	cmp	r6, #0
    bec4:	6564      	str	r4, [r4, #84]	; 0x54
    bec6:	7562      	strb	r2, [r4, #21]
    bec8:	5f67      	ldrsh	r7, [r4, r5]
    beca:	7473      	strb	r3, [r6, #17]
    becc:	0072      	lsls	r2, r6, #1
    bece:	632e      	str	r6, [r5, #48]	; 0x30
    bed0:	6d6f      	ldr	r7, [r5, #84]	; 0x54
    bed2:	656d      	str	r5, [r5, #84]	; 0x54
    bed4:	746e      	strb	r6, [r5, #17]
    bed6:	2e00      	cmp	r6, #0
    bed8:	6572      	str	r2, [r6, #84]	; 0x54
    beda:	2e6c      	cmp	r6, #108	; 0x6c
    bedc:	6564      	str	r4, [r4, #84]	; 0x54
    bede:	7562      	strb	r2, [r4, #21]
    bee0:	5f67      	ldrsh	r7, [r4, r5]
    bee2:	7266      	strb	r6, [r4, #9]
    bee4:	6d61      	ldr	r1, [r4, #84]	; 0x54
    bee6:	0065      	lsls	r5, r4, #1
    bee8:	412e      	asrs	r6, r5
    beea:	4d52      	ldr	r5, [pc, #328]	; (0xc034)
    beec:	612e      	str	r6, [r5, #16]
    beee:	7474      	strb	r4, [r6, #17]
    bef0:	6972      	ldr	r2, [r6, #20]
    bef2:	7562      	strb	r2, [r4, #21]
    bef4:	6574      	str	r4, [r6, #84]	; 0x54
    bef6:	0073      	lsls	r3, r6, #1
	...
    bf20:	001b      	movs	r3, r3
    bf22:	0000      	movs	r0, r0
    bf24:	0001      	movs	r1, r0
    bf26:	0000      	movs	r0, r0
    bf28:	0006      	movs	r6, r0
    bf2a:	0000      	movs	r0, r0
    bf2c:	0000      	movs	r0, r0
    bf2e:	0000      	movs	r0, r0
    bf30:	0034      	movs	r4, r6
	...
    bf3e:	0000      	movs	r0, r0
    bf40:	0002      	movs	r2, r0
    bf42:	0000      	movs	r0, r0
    bf44:	0000      	movs	r0, r0
    bf46:	0000      	movs	r0, r0
    bf48:	0021      	movs	r1, r4
    bf4a:	0000      	movs	r0, r0
    bf4c:	0001      	movs	r1, r0
    bf4e:	0000      	movs	r0, r0
    bf50:	0003      	movs	r3, r0
    bf52:	0000      	movs	r0, r0
    bf54:	0000      	movs	r0, r0
    bf56:	0000      	movs	r0, r0
    bf58:	0034      	movs	r4, r6
	...
    bf66:	0000      	movs	r0, r0
    bf68:	0001      	movs	r1, r0
    bf6a:	0000      	movs	r0, r0
    bf6c:	0000      	movs	r0, r0
    bf6e:	0000      	movs	r0, r0
    bf70:	0027      	movs	r7, r4
    bf72:	0000      	movs	r0, r0
    bf74:	0008      	movs	r0, r1
    bf76:	0000      	movs	r0, r0
    bf78:	0003      	movs	r3, r0
    bf7a:	0000      	movs	r0, r0
    bf7c:	0000      	movs	r0, r0
    bf7e:	0000      	movs	r0, r0
    bf80:	0034      	movs	r4, r6
	...
    bf8e:	0000      	movs	r0, r0
    bf90:	0001      	movs	r1, r0
    bf92:	0000      	movs	r0, r0
    bf94:	0000      	movs	r0, r0
    bf96:	0000      	movs	r0, r0
    bf98:	0030      	movs	r0, r6
    bf9a:	0000      	movs	r0, r0
    bf9c:	0001      	movs	r1, r0
    bf9e:	0000      	movs	r0, r0
    bfa0:	0006      	movs	r6, r0
    bfa2:	0000      	movs	r0, r0
    bfa4:	0000      	movs	r0, r0
    bfa6:	0000      	movs	r0, r0
    bfa8:	0034      	movs	r4, r6
    bfaa:	0000      	movs	r0, r0
    bfac:	008c      	lsls	r4, r1, #2
	...
    bfb6:	0000      	movs	r0, r0
    bfb8:	0004      	movs	r4, r0
    bfba:	0000      	movs	r0, r0
    bfbc:	0000      	movs	r0, r0
    bfbe:	0000      	movs	r0, r0
    bfc0:	002c      	movs	r4, r5
    bfc2:	0000      	movs	r0, r0
    bfc4:	0009      	movs	r1, r1
    bfc6:	0000      	movs	r0, r0
    bfc8:	0040      	lsls	r0, r0, #1
    bfca:	0000      	movs	r0, r0
    bfcc:	0000      	movs	r0, r0
    bfce:	0000      	movs	r0, r0
    bfd0:	8ca0      	ldrh	r0, [r4, #36]	; 0x24
    bfd2:	0000      	movs	r0, r0
    bfd4:	0010      	movs	r0, r2
    bfd6:	0000      	movs	r0, r0
    bfd8:	0027      	movs	r7, r4
    bfda:	0000      	movs	r0, r0
    bfdc:	0004      	movs	r4, r0
    bfde:	0000      	movs	r0, r0
    bfe0:	0004      	movs	r4, r0
    bfe2:	0000      	movs	r0, r0
    bfe4:	0008      	movs	r0, r1
    bfe6:	0000      	movs	r0, r0
    bfe8:	004a      	lsls	r2, r1, #1
    bfea:	0000      	movs	r0, r0
    bfec:	0001      	movs	r1, r0
    bfee:	0000      	movs	r0, r0
    bff0:	0006      	movs	r6, r0
    bff2:	0000      	movs	r0, r0
    bff4:	0000      	movs	r0, r0
    bff6:	0000      	movs	r0, r0
    bff8:	00c0      	lsls	r0, r0, #3
    bffa:	0000      	movs	r0, r0
    bffc:	000c      	movs	r4, r1
	...
    c006:	0000      	movs	r0, r0
    c008:	0004      	movs	r4, r0
    c00a:	0000      	movs	r0, r0
    c00c:	0000      	movs	r0, r0
    c00e:	0000      	movs	r0, r0
    c010:	006b      	lsls	r3, r5, #1
    c012:	0000      	movs	r0, r0
    c014:	0001      	movs	r1, r0
    c016:	0000      	movs	r0, r0
    c018:	0006      	movs	r6, r0
    c01a:	0000      	movs	r0, r0
    c01c:	0000      	movs	r0, r0
    c01e:	0000      	movs	r0, r0
    c020:	00cc      	lsls	r4, r1, #3
    c022:	0000      	movs	r0, r0
    c024:	00d0      	lsls	r0, r2, #3
	...
    c02e:	0000      	movs	r0, r0
    c030:	0004      	movs	r4, r0
    c032:	0000      	movs	r0, r0
    c034:	0000      	movs	r0, r0
    c036:	0000      	movs	r0, r0
    c038:	0067      	lsls	r7, r4, #1
    c03a:	0000      	movs	r0, r0
    c03c:	0009      	movs	r1, r1
    c03e:	0000      	movs	r0, r0
    c040:	0040      	lsls	r0, r0, #1
    c042:	0000      	movs	r0, r0
    c044:	0000      	movs	r0, r0
    c046:	0000      	movs	r0, r0
    c048:	8cb0      	ldrh	r0, [r6, #36]	; 0x24
    c04a:	0000      	movs	r0, r0
    c04c:	0010      	movs	r0, r2
    c04e:	0000      	movs	r0, r0
    c050:	0027      	movs	r7, r4
    c052:	0000      	movs	r0, r0
    c054:	0007      	movs	r7, r0
    c056:	0000      	movs	r0, r0
    c058:	0004      	movs	r4, r0
    c05a:	0000      	movs	r0, r0
    c05c:	0008      	movs	r0, r1
    c05e:	0000      	movs	r0, r0
    c060:	008a      	lsls	r2, r1, #2
    c062:	0000      	movs	r0, r0
    c064:	0001      	movs	r1, r0
    c066:	0000      	movs	r0, r0
    c068:	0006      	movs	r6, r0
    c06a:	0000      	movs	r0, r0
    c06c:	0000      	movs	r0, r0
    c06e:	0000      	movs	r0, r0
    c070:	01a0      	lsls	r0, r4, #6
    c072:	0000      	movs	r0, r0
    c074:	0148      	lsls	r0, r1, #5
	...
    c07e:	0000      	movs	r0, r0
    c080:	0008      	movs	r0, r1
    c082:	0000      	movs	r0, r0
    c084:	0000      	movs	r0, r0
    c086:	0000      	movs	r0, r0
    c088:	0086      	lsls	r6, r0, #2
    c08a:	0000      	movs	r0, r0
    c08c:	0009      	movs	r1, r1
    c08e:	0000      	movs	r0, r0
    c090:	0040      	lsls	r0, r0, #1
    c092:	0000      	movs	r0, r0
    c094:	0000      	movs	r0, r0
    c096:	0000      	movs	r0, r0
    c098:	8cc0      	ldrh	r0, [r0, #38]	; 0x26
    c09a:	0000      	movs	r0, r0
    c09c:	0010      	movs	r0, r2
    c09e:	0000      	movs	r0, r0
    c0a0:	0027      	movs	r7, r4
    c0a2:	0000      	movs	r0, r0
    c0a4:	0009      	movs	r1, r1
    c0a6:	0000      	movs	r0, r0
    c0a8:	0004      	movs	r4, r0
    c0aa:	0000      	movs	r0, r0
    c0ac:	0008      	movs	r0, r1
    c0ae:	0000      	movs	r0, r0
    c0b0:	00a9      	lsls	r1, r5, #2
    c0b2:	0000      	movs	r0, r0
    c0b4:	0001      	movs	r1, r0
    c0b6:	0000      	movs	r0, r0
    c0b8:	0006      	movs	r6, r0
    c0ba:	0000      	movs	r0, r0
    c0bc:	0000      	movs	r0, r0
    c0be:	0000      	movs	r0, r0
    c0c0:	02e8      	lsls	r0, r5, #11
    c0c2:	0000      	movs	r0, r0
    c0c4:	0174      	lsls	r4, r6, #5
	...
    c0ce:	0000      	movs	r0, r0
    c0d0:	0004      	movs	r4, r0
    c0d2:	0000      	movs	r0, r0
    c0d4:	0000      	movs	r0, r0
    c0d6:	0000      	movs	r0, r0
    c0d8:	00a5      	lsls	r5, r4, #2
    c0da:	0000      	movs	r0, r0
    c0dc:	0009      	movs	r1, r1
    c0de:	0000      	movs	r0, r0
    c0e0:	0040      	lsls	r0, r0, #1
    c0e2:	0000      	movs	r0, r0
    c0e4:	0000      	movs	r0, r0
    c0e6:	0000      	movs	r0, r0
    c0e8:	8cd0      	ldrh	r0, [r2, #38]	; 0x26
    c0ea:	0000      	movs	r0, r0
    c0ec:	0010      	movs	r0, r2
    c0ee:	0000      	movs	r0, r0
    c0f0:	0027      	movs	r7, r4
    c0f2:	0000      	movs	r0, r0
    c0f4:	000b      	movs	r3, r1
    c0f6:	0000      	movs	r0, r0
    c0f8:	0004      	movs	r4, r0
    c0fa:	0000      	movs	r0, r0
    c0fc:	0008      	movs	r0, r1
    c0fe:	0000      	movs	r0, r0
    c100:	00c8      	lsls	r0, r1, #3
    c102:	0000      	movs	r0, r0
    c104:	0001      	movs	r1, r0
    c106:	0000      	movs	r0, r0
    c108:	0006      	movs	r6, r0
    c10a:	0000      	movs	r0, r0
    c10c:	0000      	movs	r0, r0
    c10e:	0000      	movs	r0, r0
    c110:	045c      	lsls	r4, r3, #17
    c112:	0000      	movs	r0, r0
    c114:	001c      	movs	r4, r3
	...
    c11e:	0000      	movs	r0, r0
    c120:	0004      	movs	r4, r0
    c122:	0000      	movs	r0, r0
    c124:	0000      	movs	r0, r0
    c126:	0000      	movs	r0, r0
    c128:	00df      	lsls	r7, r3, #3
    c12a:	0000      	movs	r0, r0
    c12c:	0001      	movs	r1, r0
    c12e:	0000      	movs	r0, r0
    c130:	0006      	movs	r6, r0
    c132:	0000      	movs	r0, r0
    c134:	0000      	movs	r0, r0
    c136:	0000      	movs	r0, r0
    c138:	0478      	lsls	r0, r7, #17
    c13a:	0000      	movs	r0, r0
    c13c:	0006      	movs	r6, r0
	...
    c146:	0000      	movs	r0, r0
    c148:	0002      	movs	r2, r0
    c14a:	0000      	movs	r0, r0
    c14c:	0000      	movs	r0, r0
    c14e:	0000      	movs	r0, r0
    c150:	00f9      	lsls	r1, r7, #3
    c152:	0000      	movs	r0, r0
    c154:	0001      	movs	r1, r0
    c156:	0000      	movs	r0, r0
    c158:	0006      	movs	r6, r0
    c15a:	0000      	movs	r0, r0
    c15c:	0000      	movs	r0, r0
    c15e:	0000      	movs	r0, r0
    c160:	0480      	lsls	r0, r0, #18
    c162:	0000      	movs	r0, r0
    c164:	00c0      	lsls	r0, r0, #3
	...
    c16e:	0000      	movs	r0, r0
    c170:	0004      	movs	r4, r0
    c172:	0000      	movs	r0, r0
    c174:	0000      	movs	r0, r0
    c176:	0000      	movs	r0, r0
    c178:	011a      	lsls	r2, r3, #4
    c17a:	0000      	movs	r0, r0
    c17c:	0001      	movs	r1, r0
    c17e:	0000      	movs	r0, r0
    c180:	0006      	movs	r6, r0
    c182:	0000      	movs	r0, r0
    c184:	0000      	movs	r0, r0
    c186:	0000      	movs	r0, r0
    c188:	0540      	lsls	r0, r0, #21
    c18a:	0000      	movs	r0, r0
    c18c:	0028      	movs	r0, r5
	...
    c196:	0000      	movs	r0, r0
    c198:	0004      	movs	r4, r0
    c19a:	0000      	movs	r0, r0
    c19c:	0000      	movs	r0, r0
    c19e:	0000      	movs	r0, r0
    c1a0:	0116      	lsls	r6, r2, #4
    c1a2:	0000      	movs	r0, r0
    c1a4:	0009      	movs	r1, r1
    c1a6:	0000      	movs	r0, r0
    c1a8:	0040      	lsls	r0, r0, #1
    c1aa:	0000      	movs	r0, r0
    c1ac:	0000      	movs	r0, r0
    c1ae:	0000      	movs	r0, r0
    c1b0:	8ce0      	ldrh	r0, [r4, #38]	; 0x26
    c1b2:	0000      	movs	r0, r0
    c1b4:	0008      	movs	r0, r1
    c1b6:	0000      	movs	r0, r0
    c1b8:	0027      	movs	r7, r4
    c1ba:	0000      	movs	r0, r0
    c1bc:	0010      	movs	r0, r2
    c1be:	0000      	movs	r0, r0
    c1c0:	0004      	movs	r4, r0
    c1c2:	0000      	movs	r0, r0
    c1c4:	0008      	movs	r0, r1
    c1c6:	0000      	movs	r0, r0
    c1c8:	0138      	lsls	r0, r7, #4
    c1ca:	0000      	movs	r0, r0
    c1cc:	0001      	movs	r1, r0
    c1ce:	0000      	movs	r0, r0
    c1d0:	0006      	movs	r6, r0
    c1d2:	0000      	movs	r0, r0
    c1d4:	0000      	movs	r0, r0
    c1d6:	0000      	movs	r0, r0
    c1d8:	0568      	lsls	r0, r5, #21
    c1da:	0000      	movs	r0, r0
    c1dc:	0014      	movs	r4, r2
	...
    c1e6:	0000      	movs	r0, r0
    c1e8:	0004      	movs	r4, r0
    c1ea:	0000      	movs	r0, r0
    c1ec:	0000      	movs	r0, r0
    c1ee:	0000      	movs	r0, r0
    c1f0:	015a      	lsls	r2, r3, #5
    c1f2:	0000      	movs	r0, r0
    c1f4:	0001      	movs	r1, r0
    c1f6:	0000      	movs	r0, r0
    c1f8:	0006      	movs	r6, r0
    c1fa:	0000      	movs	r0, r0
    c1fc:	0000      	movs	r0, r0
    c1fe:	0000      	movs	r0, r0
    c200:	057c      	lsls	r4, r7, #21
    c202:	0000      	movs	r0, r0
    c204:	0030      	movs	r0, r6
	...
    c20e:	0000      	movs	r0, r0
    c210:	0004      	movs	r4, r0
    c212:	0000      	movs	r0, r0
    c214:	0000      	movs	r0, r0
    c216:	0000      	movs	r0, r0
    c218:	017a      	lsls	r2, r7, #5
    c21a:	0000      	movs	r0, r0
    c21c:	0001      	movs	r1, r0
    c21e:	0000      	movs	r0, r0
    c220:	0006      	movs	r6, r0
    c222:	0000      	movs	r0, r0
    c224:	0000      	movs	r0, r0
    c226:	0000      	movs	r0, r0
    c228:	05ac      	lsls	r4, r5, #22
    c22a:	0000      	movs	r0, r0
    c22c:	0024      	movs	r4, r4
	...
    c236:	0000      	movs	r0, r0
    c238:	0004      	movs	r4, r0
    c23a:	0000      	movs	r0, r0
    c23c:	0000      	movs	r0, r0
    c23e:	0000      	movs	r0, r0
    c240:	0176      	lsls	r6, r6, #5
    c242:	0000      	movs	r0, r0
    c244:	0009      	movs	r1, r1
    c246:	0000      	movs	r0, r0
    c248:	0040      	lsls	r0, r0, #1
    c24a:	0000      	movs	r0, r0
    c24c:	0000      	movs	r0, r0
    c24e:	0000      	movs	r0, r0
    c250:	8ce8      	ldrh	r0, [r5, #38]	; 0x26
    c252:	0000      	movs	r0, r0
    c254:	0008      	movs	r0, r1
    c256:	0000      	movs	r0, r0
    c258:	0027      	movs	r7, r4
    c25a:	0000      	movs	r0, r0
    c25c:	0014      	movs	r4, r2
    c25e:	0000      	movs	r0, r0
    c260:	0004      	movs	r4, r0
    c262:	0000      	movs	r0, r0
    c264:	0008      	movs	r0, r1
    c266:	0000      	movs	r0, r0
    c268:	019c      	lsls	r4, r3, #6
    c26a:	0000      	movs	r0, r0
    c26c:	0001      	movs	r1, r0
    c26e:	0000      	movs	r0, r0
    c270:	0006      	movs	r6, r0
    c272:	0000      	movs	r0, r0
    c274:	0000      	movs	r0, r0
    c276:	0000      	movs	r0, r0
    c278:	05d0      	lsls	r0, r2, #23
    c27a:	0000      	movs	r0, r0
    c27c:	0020      	movs	r0, r4
	...
    c286:	0000      	movs	r0, r0
    c288:	0004      	movs	r4, r0
    c28a:	0000      	movs	r0, r0
    c28c:	0000      	movs	r0, r0
    c28e:	0000      	movs	r0, r0
    c290:	01bd      	lsls	r5, r7, #6
    c292:	0000      	movs	r0, r0
    c294:	0001      	movs	r1, r0
	...
    c29e:	0000      	movs	r0, r0
    c2a0:	05f0      	lsls	r0, r6, #23
    c2a2:	0000      	movs	r0, r0
    c2a4:	2ffc      	cmp	r7, #252	; 0xfc
	...
    c2ae:	0000      	movs	r0, r0
    c2b0:	0001      	movs	r1, r0
    c2b2:	0000      	movs	r0, r0
    c2b4:	0000      	movs	r0, r0
    c2b6:	0000      	movs	r0, r0
    c2b8:	01b9      	lsls	r1, r7, #6
    c2ba:	0000      	movs	r0, r0
    c2bc:	0009      	movs	r1, r1
    c2be:	0000      	movs	r0, r0
    c2c0:	0040      	lsls	r0, r0, #1
    c2c2:	0000      	movs	r0, r0
    c2c4:	0000      	movs	r0, r0
    c2c6:	0000      	movs	r0, r0
    c2c8:	8cf0      	ldrh	r0, [r6, #38]	; 0x26
    c2ca:	0000      	movs	r0, r0
    c2cc:	2308      	movs	r3, #8
    c2ce:	0000      	movs	r0, r0
    c2d0:	0027      	movs	r7, r4
    c2d2:	0000      	movs	r0, r0
    c2d4:	0017      	movs	r7, r2
    c2d6:	0000      	movs	r0, r0
    c2d8:	0004      	movs	r4, r0
    c2da:	0000      	movs	r0, r0
    c2dc:	0008      	movs	r0, r1
    c2de:	0000      	movs	r0, r0
    c2e0:	01c9      	lsls	r1, r1, #7
    c2e2:	0000      	movs	r0, r0
    c2e4:	0001      	movs	r1, r0
	...
    c2ee:	0000      	movs	r0, r0
    c2f0:	35ec      	adds	r5, #236	; 0xec
    c2f2:	0000      	movs	r0, r0
    c2f4:	0441      	lsls	r1, r0, #17
	...
    c2fe:	0000      	movs	r0, r0
    c300:	0001      	movs	r1, r0
    c302:	0000      	movs	r0, r0
    c304:	0000      	movs	r0, r0
    c306:	0000      	movs	r0, r0
    c308:	01db      	lsls	r3, r3, #7
    c30a:	0000      	movs	r0, r0
    c30c:	0001      	movs	r1, r0
	...
    c316:	0000      	movs	r0, r0
    c318:	3a2d      	subs	r2, #45	; 0x2d
    c31a:	0000      	movs	r0, r0
    c31c:	0a55      	lsrs	r5, r2, #9
	...
    c326:	0000      	movs	r0, r0
    c328:	0001      	movs	r1, r0
    c32a:	0000      	movs	r0, r0
    c32c:	0000      	movs	r0, r0
    c32e:	0000      	movs	r0, r0
    c330:	01d7      	lsls	r7, r2, #7
    c332:	0000      	movs	r0, r0
    c334:	0009      	movs	r1, r1
    c336:	0000      	movs	r0, r0
    c338:	0040      	lsls	r0, r0, #1
    c33a:	0000      	movs	r0, r0
    c33c:	0000      	movs	r0, r0
    c33e:	0000      	movs	r0, r0
    c340:	aff8      	add	r7, sp, #992	; 0x3e0
    c342:	0000      	movs	r0, r0
    c344:	0938      	lsrs	r0, r7, #4
    c346:	0000      	movs	r0, r0
    c348:	0027      	movs	r7, r4
    c34a:	0000      	movs	r0, r0
    c34c:	001a      	movs	r2, r3
    c34e:	0000      	movs	r0, r0
    c350:	0004      	movs	r4, r0
    c352:	0000      	movs	r0, r0
    c354:	0008      	movs	r0, r1
    c356:	0000      	movs	r0, r0
    c358:	01ea      	lsls	r2, r5, #7
    c35a:	0000      	movs	r0, r0
    c35c:	0001      	movs	r1, r0
	...
    c366:	0000      	movs	r0, r0
    c368:	4482      	add	sl, r0
    c36a:	0000      	movs	r0, r0
    c36c:	0080      	lsls	r0, r0, #2
	...
    c376:	0000      	movs	r0, r0
    c378:	0001      	movs	r1, r0
    c37a:	0000      	movs	r0, r0
    c37c:	0000      	movs	r0, r0
    c37e:	0000      	movs	r0, r0
    c380:	01e6      	lsls	r6, r4, #7
    c382:	0000      	movs	r0, r0
    c384:	0009      	movs	r1, r1
    c386:	0000      	movs	r0, r0
    c388:	0040      	lsls	r0, r0, #1
    c38a:	0000      	movs	r0, r0
    c38c:	0000      	movs	r0, r0
    c38e:	0000      	movs	r0, r0
    c390:	b930      	cbnz	r0, 0xc3a0
    c392:	0000      	movs	r0, r0
    c394:	0070      	lsls	r0, r6, #1
    c396:	0000      	movs	r0, r0
    c398:	0027      	movs	r7, r4
    c39a:	0000      	movs	r0, r0
    c39c:	001c      	movs	r4, r3
    c39e:	0000      	movs	r0, r0
    c3a0:	0004      	movs	r4, r0
    c3a2:	0000      	movs	r0, r0
    c3a4:	0008      	movs	r0, r1
    c3a6:	0000      	movs	r0, r0
    c3a8:	01fd      	lsls	r5, r7, #7
    c3aa:	0000      	movs	r0, r0
    c3ac:	0001      	movs	r1, r0
	...
    c3b6:	0000      	movs	r0, r0
    c3b8:	4502      	cmp	r2, r0
    c3ba:	0000      	movs	r0, r0
    c3bc:	0110      	lsls	r0, r2, #4
	...
    c3c6:	0000      	movs	r0, r0
    c3c8:	0001      	movs	r1, r0
    c3ca:	0000      	movs	r0, r0
    c3cc:	0000      	movs	r0, r0
    c3ce:	0000      	movs	r0, r0
    c3d0:	01f9      	lsls	r1, r7, #7
    c3d2:	0000      	movs	r0, r0
    c3d4:	0009      	movs	r1, r1
    c3d6:	0000      	movs	r0, r0
    c3d8:	0040      	lsls	r0, r0, #1
    c3da:	0000      	movs	r0, r0
    c3dc:	0000      	movs	r0, r0
    c3de:	0000      	movs	r0, r0
    c3e0:	b9a0      	cbnz	r0, 0xc40c
    c3e2:	0000      	movs	r0, r0
    c3e4:	01d0      	lsls	r0, r2, #7
    c3e6:	0000      	movs	r0, r0
    c3e8:	0027      	movs	r7, r4
    c3ea:	0000      	movs	r0, r0
    c3ec:	001e      	movs	r6, r3
    c3ee:	0000      	movs	r0, r0
    c3f0:	0004      	movs	r4, r0
    c3f2:	0000      	movs	r0, r0
    c3f4:	0008      	movs	r0, r1
    c3f6:	0000      	movs	r0, r0
    c3f8:	020f      	lsls	r7, r1, #8
    c3fa:	0000      	movs	r0, r0
    c3fc:	0001      	movs	r1, r0
	...
    c406:	0000      	movs	r0, r0
    c408:	4612      	mov	r2, r2
    c40a:	0000      	movs	r0, r0
    c40c:	0580      	lsls	r0, r0, #22
	...
    c416:	0000      	movs	r0, r0
    c418:	0001      	movs	r1, r0
    c41a:	0000      	movs	r0, r0
    c41c:	0000      	movs	r0, r0
    c41e:	0000      	movs	r0, r0
    c420:	020b      	lsls	r3, r1, #8
    c422:	0000      	movs	r0, r0
    c424:	0009      	movs	r1, r1
    c426:	0000      	movs	r0, r0
    c428:	0040      	lsls	r0, r0, #1
    c42a:	0000      	movs	r0, r0
    c42c:	0000      	movs	r0, r0
    c42e:	0000      	movs	r0, r0
    c430:	bb70      	cbnz	r0, 0xc490
    c432:	0000      	movs	r0, r0
    c434:	0068      	lsls	r0, r5, #1
    c436:	0000      	movs	r0, r0
    c438:	0027      	movs	r7, r4
    c43a:	0000      	movs	r0, r0
    c43c:	0020      	movs	r0, r4
    c43e:	0000      	movs	r0, r0
    c440:	0004      	movs	r4, r0
    c442:	0000      	movs	r0, r0
    c444:	0008      	movs	r0, r1
    c446:	0000      	movs	r0, r0
    c448:	021b      	lsls	r3, r3, #8
    c44a:	0000      	movs	r0, r0
    c44c:	0001      	movs	r1, r0
    c44e:	0000      	movs	r0, r0
    c450:	0030      	movs	r0, r6
    c452:	0000      	movs	r0, r0
    c454:	0000      	movs	r0, r0
    c456:	0000      	movs	r0, r0
    c458:	4b92      	ldr	r3, [pc, #584]	; (0xc6a4)
    c45a:	0000      	movs	r0, r0
    c45c:	3945      	subs	r1, #69	; 0x45
	...
    c466:	0000      	movs	r0, r0
    c468:	0001      	movs	r1, r0
    c46a:	0000      	movs	r0, r0
    c46c:	0001      	movs	r1, r0
    c46e:	0000      	movs	r0, r0
    c470:	0226      	lsls	r6, r4, #8
    c472:	0000      	movs	r0, r0
    c474:	0001      	movs	r1, r0
    c476:	0000      	movs	r0, r0
    c478:	0030      	movs	r0, r6
    c47a:	0000      	movs	r0, r0
    c47c:	0000      	movs	r0, r0
    c47e:	0000      	movs	r0, r0
    c480:	84d7      	strh	r7, [r2, #38]	; 0x26
    c482:	0000      	movs	r0, r0
    c484:	0080      	lsls	r0, r0, #2
	...
    c48e:	0000      	movs	r0, r0
    c490:	0001      	movs	r1, r0
    c492:	0000      	movs	r0, r0
    c494:	0001      	movs	r1, r0
    c496:	0000      	movs	r0, r0
    c498:	0233      	lsls	r3, r6, #8
    c49a:	0000      	movs	r0, r0
    c49c:	0001      	movs	r1, r0
	...
    c4a6:	0000      	movs	r0, r0
    c4a8:	8558      	strh	r0, [r3, #42]	; 0x2a
    c4aa:	0000      	movs	r0, r0
    c4ac:	0154      	lsls	r4, r2, #5
	...
    c4b6:	0000      	movs	r0, r0
    c4b8:	0004      	movs	r4, r0
    c4ba:	0000      	movs	r0, r0
    c4bc:	0000      	movs	r0, r0
    c4be:	0000      	movs	r0, r0
    c4c0:	022f      	lsls	r7, r5, #8
    c4c2:	0000      	movs	r0, r0
    c4c4:	0009      	movs	r1, r1
    c4c6:	0000      	movs	r0, r0
    c4c8:	0040      	lsls	r0, r0, #1
    c4ca:	0000      	movs	r0, r0
    c4cc:	0000      	movs	r0, r0
    c4ce:	0000      	movs	r0, r0
    c4d0:	bbd8      	cbnz	r0, 0xc54a
    c4d2:	0000      	movs	r0, r0
    c4d4:	00d0      	lsls	r0, r2, #3
    c4d6:	0000      	movs	r0, r0
    c4d8:	0027      	movs	r7, r4
    c4da:	0000      	movs	r0, r0
    c4dc:	0024      	movs	r4, r4
    c4de:	0000      	movs	r0, r0
    c4e0:	0004      	movs	r4, r0
    c4e2:	0000      	movs	r0, r0
    c4e4:	0008      	movs	r0, r1
    c4e6:	0000      	movs	r0, r0
    c4e8:	0240      	lsls	r0, r0, #9
    c4ea:	0000      	movs	r0, r0
    c4ec:	0003      	movs	r3, r0
    c4ee:	7000      	strb	r0, [r0, #0]
	...
    c4f8:	86ac      	strh	r4, [r5, #52]	; 0x34
    c4fa:	0000      	movs	r0, r0
    c4fc:	003c      	movs	r4, r7
	...
    c506:	0000      	movs	r0, r0
    c508:	0001      	movs	r1, r0
    c50a:	0000      	movs	r0, r0
    c50c:	0000      	movs	r0, r0
    c50e:	0000      	movs	r0, r0
    c510:	0001      	movs	r1, r0
    c512:	0000      	movs	r0, r0
    c514:	0002      	movs	r2, r0
	...
    c51e:	0000      	movs	r0, r0
    c520:	86e8      	strh	r0, [r5, #54]	; 0x36
    c522:	0000      	movs	r0, r0
    c524:	0450      	lsls	r0, r2, #17
    c526:	0000      	movs	r0, r0
    c528:	0028      	movs	r0, r5
    c52a:	0000      	movs	r0, r0
    c52c:	0035      	movs	r5, r6
    c52e:	0000      	movs	r0, r0
    c530:	0004      	movs	r4, r0
    c532:	0000      	movs	r0, r0
    c534:	0010      	movs	r0, r2
    c536:	0000      	movs	r0, r0
    c538:	0009      	movs	r1, r1
    c53a:	0000      	movs	r0, r0
    c53c:	0003      	movs	r3, r0
	...
    c546:	0000      	movs	r0, r0
    c548:	8b38      	ldrh	r0, [r7, #24]
    c54a:	0000      	movs	r0, r0
    c54c:	0165      	lsls	r5, r4, #5
	...
    c556:	0000      	movs	r0, r0
    c558:	0001      	movs	r1, r0
    c55a:	0000      	movs	r0, r0
    c55c:	0000      	movs	r0, r0
    c55e:	0000      	movs	r0, r0
    c560:	0011      	movs	r1, r2
    c562:	0000      	movs	r0, r0
    c564:	0003      	movs	r3, r0
	...
    c56e:	0000      	movs	r0, r0
    c570:	bca8      	pop	{r3, r5, r7}
    c572:	0000      	movs	r0, r0
    c574:	0250      	lsls	r0, r2, #9
	...
    c57e:	0000      	movs	r0, r0
    c580:	0001      	movs	r1, r0
    c582:	0000      	movs	r0, r0
    c584:	0000      	movs	r0, r0
	...

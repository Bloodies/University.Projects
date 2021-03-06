{$asmmode intel}

// 28
// ������ N ᫮� �� M ᨬ����� � ������.
// ������� ����� ������⠬� ��㬥୮�� ���ᨢ� ⨯� char.
// �ணࠬ�� ����⠢��� ��ப� �� ��䠢���.
// �᫨ ᮢ������ ��ࢠ� �㪢�, ᫮�� ࠧ������� �� ��ன � �.�.

CONST
   N = 2; //��ப�
   M = 3; //ᨬ����
VAR
   mas: array [0..N, 0..M] of char;
   i,j: integer;
BEGIN
   mas[0,0] := 'a';
   mas[0,1] := 'a';
   mas[0,2] := 'a';
   mas[0,3] := 'd';

   mas[1,0] := 'd';
   mas[1,1] := 'a';
   mas[1,2] := 'a';
   mas[1,3] := 'b';

   mas[2,0] := 'a';
   mas[2,1] := 'a';
   mas[2,2] := 'a';
   mas[2,3] := 'c';
   ASM
      MOV CX, 0  //���稪
      MOV BX, 0  //BH - 㪠�뢠�� �� ��મ�, � ���ன �ᯮ������ �������஢���� ��ப�. BL - ������ ���ᨬ��쭮� ��ப�
      MOV EAX, 0 //�㤥� ��������� ᤢ�� � ���ᨢ�

      @firstcycle:
      PUSH CX    //����� � �⥪ ��-�� �� ������� ���稪 横��
      PUSH BX    //��।��� ��㬥��� �� ���祭��
      CALL @searchMAX
      PUSH BX    //��।��� ��㬥��� �� ���祭��
      CALL @moving
      POP CX     //�����頥� ⥪�騩 ���稪
      INC BH     //�� ���� ��ப� �뫠 �����஢���
      INC CL
      CMP CL, N
      JBE @firstcycle
      JMP @exit

      @searchMAX: //CL - ���稪 �� ᨬ����� � ��ப�
      MOV BX, [ESP+4]  //����砥� ��㬥�� �� �⥪�
      MOV CH, BH  // CH - ���稪 �� ��ப��. �� �ய�᪠�� 㦥 �����஢���� ��ப�
      MOV BL, BH  // � ᠬ��� ��砫� ��⠥�, �� ��ࢠ� ��ப� (�� �������஢����� ��ப) ���ᨬ��쭠�
      @cycleMAX:
      MOV AL, M   //�����뢠�� ᬥ饭�� ��� �।���������� ���ᨬ��쭮� ��ப�
      INC AL
      MUL BL
      ADD AL, CL
      MOV DH, mas[EAX] //� DH �࠭���� ᨬ��� �� �।���������� ���ᨬ��쭮� ��ப�
      MOV AL, M        //�����뢠�� ᬥ饭�� ��� ��ப�, � ���ன �㤥� �ࠢ������
      INC AL
      MUL CH
      ADD AL, CL
      MOV DL, mas[EAX] //� DL �࠭���� ᨬ��� �� ��ப�, � ���ன �ࠢ������
      CMP DH, DL       //�ࠢ������ ᨬ���� ��ப
      JB @nextStr      //�᫨ � ��य��������� ���ᨬ��쭮� ��ப� ᨬ��� �����, � �ࠢ������ � ᫥���饩 ��ப��
      JE @nextSymbol   //�᫨ ᨬ���� ࠢ��, � �ࠢ������ �� ᫥���饬� ᨬ����
      MOV BL, CH       //�᫨ ᨬ��� � �।���������� ����. ��ப� �����, � �����塞 ������ ���ᨬ���쭮� ��ப�
      JMP @nextStr
      @nextSymbol:     //�롨ࠥ� ᫥���騥 ᨬ����. �஢��塞 ��-�� �� ��諨 �� �।���
      INC CL
      CMP CL, M
      JBE @cycleMAX
      @nextStr:  //���室�� �� ᫥���騥 ��ப�. �஢��塞 �� ��室 �� �।���. ����塞 ���稪 �� ᨬ�����
      MOV CL, 0
      INC CH
      CMP CH, N
      JBE @cycleMAX
      RET 2  //�᫨ ��ॡࠫ� �� ��ப�, � �����頥��� �� ��楤��� � ���뢠�� ��㬥�� �� �⥪� (ᤢ����� ESP �� 2 ����)

      @moving:     //���塞 ���⠬� ���ᨬ����� ��ப� � ����� ��ப� �� �������஢�����
      MOV BX, [ESP+4]  //����砥� ��㬥��
      MOV AL, M        //����塞 ᬥ饭�� ��� ��ࢮ� �������஢����� ��ப�
      INC AL
      MUL BH
      MOVZX EDX, AX //�࠭�� ᬥ饭�� ��� ��ࢮ� �������஢����� ��ப�
      MOV AL, M     //����塞 ᬥ饭�� ��� ���ᨬ��쭮� ��ப�
      INC AL
      MUL BL
      MOV CL, 0 //��ᨬ����� ���稪
      @cycleMOV:
      MOVZX EDI, CL
      MOV CH, mas[EDX][EDI]     //���塞 ���⠬� ᨬ���� �� ��ப (᫮���� �������)
      XCHG CH, mas[EAX][EDI]
      MOV mas[EDX][EDI], CH
      INC CL
      CMP CL, M
      JBE @cycleMOV
      RET 2

      @exit:
   END;
   for i := 0 to N do
   begin
      for j := 0 to M do
         Write(mas[i,j]);
      Writeln();
   end;
   Readln();
END.

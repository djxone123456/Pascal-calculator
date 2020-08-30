program Pascal_calculator_basic_written_by_Nguyen_Peter_Vietnam;
uses crt;

const x1=1; y1=1;
      x2=79; y2=25;

type  str06 = string[6];
      str79 = string;

{main variables of the program}
var
 f,f1,f2,fd: text;
 y,m,n,a,x,c: word;
 b,k,chon,id,i,pass,p,pass1,phone,s,s1,cmd: string;
 ten,tenprog: array[1..100]of str06;
 solieu,solieu1,solieu2,solieu3,solieu4,tt,cd:array [1..100] of real;
 ask: char;
 max,min: real;

{Set up sound}
procedure CreatSound(h,t:word);
begin
  Sound(h);
  Delay(t);
  Nosound;
end;

procedure Save_docx;
begin
  assign(fd,cmd); rewrite(fd);
  writeln(fd,'*****PASCAL CALCULATOR 1.2*****');
  for y:=3 to a+2 do
    begin
       writeln(fd,'Name: ',ten[y]);
       writeln(fd,'A: ',solieu1[y]:0:2);
       writeln(fd,'B: ',solieu2[y]:0:2);
       writeln(fd,'C: ',solieu3[y]:0:2);
       writeln(fd,'D: ',solieu4[y]:0:2);
       writeln(fd,k,': ',cd[y]:0:2);
    end;
  close(fd);
end;

{using 'vekhung' to draw the frames}

procedure vekhung(x1,y1,x2,y2:word);
var z,a,b:word;
begin
 if (x1<>x2) and (y1<>y2) then
  begin
   a:=wherex; b:=wherey;

   if x1>x2 then
    begin 
     z:=x1; x1:=x2; x2:=z; 
    end;

   if y1>y2 then
    begin 
     z:=y1; y1:=y2; y2:=z; 
    end;

   gotoxy(x1,y1); write(#201);
   if x2-x1>1 then 
    for z:=1 to x2-x1-1 do 
      write(#205);
 
   gotoxy(x2,y1); 
   write(#187);
   gotoxy(x1,y2); 
   write(#200);

   if x2-x1>1 then 
     for z:=1 to x2-x1-1 do 
       write(#205);

   gotoxy(x2,y2); 
   write(#188);

   if y2-y1>1 then 
     for z:=1 to y2-y1-1 do 
       begin
         gotoxy(x1,z+y1); 
         write(#186); 
       end;

   if y2-y1>1 then 
     for z:=1 to y2-y1-1 do 
       begin
         gotoxy(x2,z+y1); 
         write(#186); 
       end;

  end;

  gotoxy(a,b);

end;

{using 'cangiua' to move the Title/ Name to the center}

procedure CanGiua(var s:string);  
var  i,n:integer;
  begin
    n:=length(s);
    n:=(80-n) div 2;
    for i:=1 to n do
      s:=' '+s;
  end;

{choose the language to use}
procedure choose_language;
begin
  s:='CHUONG TRINH BANG TINH PASCAL 1.2';
  CanGiua(s);

  gotoXY(1,9);
  write(s);

  GotoXY(25,11);
  writeln('Chon ngon ngu:/Choose your language:');{chon ngon ngu can thuc hien}

  GotoXY(25,13);
  writeln('1.TIENG VIET.(Nhan "V")');     {'V' means Vietnamese}

  GotoXY(25,14);
  writeln('2.ENGLISH.(Press "E")');      {'E' means English}

  GotoXY(25,16);
  write('Lua chon/Choose: ');readln(chon);

  TextBackground(15);
  TextColor(0);
end;

function find_email(phone:string):boolean; {if email doesn't have '@' character then the type isn't expected.}
 var   i:integer;
begin
  for i:=1 to length(phone) do
    if phone[i]='@' then
     begin
       find_email:=true;
       break;
     end
  else find_email:=false;
end;

procedure register;      {register written in English}
begin
 clrscr;
 writeln(s1);
 writeln('Register:');
 write('Username: '); readln(id);
 write('Password: '); readln(pass);
 write('Password: '); readln(pass1);
 write('Enter your email or phone number :'); readln(phone);

 while(pass<>pass1) do
  begin
   clrscr;
   writeln(s1);
   writeln('Passwords aren"t the same. ');
   write('Username: '); readln(id);
   write('Password: '); readln(pass);
   write('Password: '); readln(pass1);
   write('Enter your email:'); readln(phone);
  end;

 while((find_email(phone)=false)) do
  begin
   clrscr;
   writeln(s1);
   writeln('Type of email is wrong.Try again. ');
   write('Username: '); readln(id);
   write('Password: '); readln(pass);
   write('Password: '); readln(pass1);
   write('Enter your email:'); readln(phone);
  end;

 assign(f1,'A.OPG'); rewrite(f1);
 write(f1,id);
 close(f1);

 assign(f2,'B.OPG'); rewrite(f2);
 write(f2,pass);
 close(f2);

 assign(f,'C.OPG'); rewrite(f);
 write(f,phone);
 close(f);
end;

procedure dang_ky;       {register written in Vietnamese}
 begin
  writeln(s);
  writeln('Dang ky:');
  write('Ten tai khoan: '); readln(id);
  write('Mat khau: '); readln(pass);
  write('Nhap lai mat khau: '); readln(pass1);
  write('Nhap email:'); readln(phone);

  while(pass<>pass1) do
   begin
    clrscr;
    writeln(s);
    writeln('Mat khau khong trung nhau. ');
    write('Ten dang ky: '); readln(id);
    write('Mat khau: '); readln(pass);
    write('Nhap lai mat khau: '); readln(pass1);
    write('Nhap email:'); readln(phone);
   end;

  while((find_email(phone)=false)) do
   begin
    clrscr;
    writeln(s);
    writeln('Email hoac so dien thoai sai.Thu lai. ');
    write('Ten dang ky: '); readln(id);
    write('Mat khau: '); readln(pass);
    write('Nhap lai mat khau: '); readln(pass1);
    write('Nhap email hay SDT :'); readln(phone);
   end;

  assign(f1,'A.OPG'); rewrite(f1);
  write(f1,id);
  close(f1);

  assign(f2,'B.OPG'); rewrite(f2);
  write(f2,pass);
  close(f2);

  assign(f,'C.OPG'); rewrite(f);
  write(f,phone);
  close(f);
end;

procedure vietnamese;    {the body written in Vietnamese}
 var loop : byte;
     i2 : integer;
 Begin
  clrscr;
  assign(f1,'A.OPG'); reset(f1);

  while not eof(f1) do
    read(f1,id);
  i:=id;
  close(f1);

  assign(f2,'B.OPG'); reset(f2);

  while not eof(f2)do
    read(f2,pass);

  p:=pass;
  close(f2);

  if (i='') and (p='') then
   begin
    dang_ky
   end
  else
   begin
    clrscr;
    writeln(s);
    writeln('Dang nhap:');
    write('Ten dang nhap: ') ; readln(id);
    write('Mat khau: '); readln(pass);

    while  (p<>pass) or (i<>id) do
     begin
	clrscr;
	writeln(s);
	writeln('Dang nhap:');
	writeln('Sai ten dang nhap hay mat khau,vui long dang nhap lai.');
	write('Ten dang nhap: ') ; readln(id);
	write('Mat khau: '); readln(pass);
     end;

     clrscr;
     writeln(s);
     writeln('Dang nhap thanh cong!');
     delay(1000);
   end;
  clrscr;

  loop := 0;

  for m:=1 to 100 do {bat dau khoi dong may chay tu 1 den 100%}
   begin
    GotoXY(30,11);
    writeln('BANG TINH PASCAL 1.2- 2019');

    GotoXY(33,13);
    write('KHOI DONG ',m,' % ...  ');

    inc(loop);
    if(loop = 1) then writeln('-');
    if(loop = 2) then writeln('\');
    if(loop = 3) then writeln('|');
    if(loop = 4) then
     begin
      writeln('/');
      loop := 0;
     end;

    writeln;
    writeln;

    for i2:= 0 to (m * 8 div 10) do
     begin
      gotoXY(0 + i2, 16);
      write(#219);
     end;

    if(m mod 5 = 0) then
     begin
      gotoXY(0 + m * 8 div 10, 16);
      write(#219);
     end;

    delay(80);
    Clrscr;
   end;
 
  delay(1000);
  GotoXY(35,11);
  writeln('BANG TINH');
  GotoXY(38,13);
  writeln('VIETNAM');
  GotoXY(3,22);
  writeln('(c) NGUYEN PETER 2020. CAP NHAT MOI NHAT: 19 Thang 6/ 2020. PHIEN BAN:1.2');
  CreatSound(861,300);
  CreatSound(967,300);
  CreatSound(542,300);
  CreatSound(609,300);
  CreatSound(645,600);

  clrscr;
  writeln(s);
  write('So dong can thuc hien (<21):');    readln(a);

  while (a>20) do
   begin
    clrscr;
    writeln('So dong qua han dinh.');
    write('Vui long nhap lai: ');
    readln(a);
   end;

  clrscr;

  write(s);

  vekhung(x1,y1+2,13,y2);
  vekhung(13,y1+2,26,y2);
  vekhung(26,y1+2,39,y2);
  vekhung(39,y1+2,53,y2);
  vekhung(53,y1+2,66,y2);
  vekhung(66,y1+2,x2,y2);
  vekhung(x1,y1+2,x2,y2);

  GotoXY(2,4);
  writeln('Ten');
  GotoXY(19,4);
  writeln('A');
  GotoXY(32,4);
  writeln('B');
  GotoXY(45,4);
  writeln('C');
  GotoXY(60,4);
  writeln('D');

  for y:=3 to a+2 do
   begin
    GotoXY(2,y+2);
    write(y-2,'. ');
    readln(ten[y]);
   end;

  GotoXY(70,4);
  readln(k);

  for y:=3 to a+2 do
   begin
    GotoXY(15,y+2);
    readln(solieu[y]);
   end;

  for y:=3 to a+2 do
   begin
    GotoXY(28,y+2);
    readln(solieu2[y]);
   end;

  for y:=3 to a+2 do
   begin
    GotoXY(41,y+2);
    readln(solieu3[y]);
   end;

  for y:=3 to a+2 do
   begin
    GotoXY(55,y+2);
    readln(solieu4[y]);
   end;

  if (k='SUM') or (k='TONG') then
   for y:=3 to a+2 do
    begin
     GotoXY(68,y+2);
     cd[y]:=solieu[y]+solieu2[y]+solieu3[y]+solieu4[y];
     write(cd[y]:0:2);
    end
    else

     if (k='AVERAGE') or (k='TRUNG BINH') then
       for y:=3 to a+2 do
         begin
           GotoXY(68,y+2);
           cd[y]:=(solieu[y]+solieu2[y]+solieu3[y]+solieu4[y])/4;
           write(cd[y]:0:2);
         end
      else

        if (k='AVESUB') or(k='TB MON') then (* AVESUB (AVERAGE SUBJECT) la cong thuc tinh trung binh mon hoc*)
            for y:=3 to a+2 do
              begin
                GotoXY(68,y+2);
                cd[y]:=(solieu[y]+solieu2[y]+solieu3[y]*2+solieu4[y]*3)/7;
                write(cd[y]:0:2);
              end
       else

        if ((k='MINUS') or(k='TRU')) then
          for y:=3 to a+2 do
            begin
              GotoXY(68,y+2);
              cd[y]:=solieu[y]+solieu2[y]-solieu3[y]-solieu4[y];
              write(cd[y]:0:2);
            end
        else

          if (k='MAX') then
            for y:=3 to a+2 do
              begin
                GotoXY(68,y+2);
                max:=solieu1[y];
                if(solieu2[y]>max) then max:=solieu2[y];
                if(solieu3[y]>max) then max:=solieu3[y];
                if(solieu4[y]>max) then max:=solieu4[y];
                write(max:0:2);
              end
        else
          if (k='MIN') then
            for y:=3 to a+2 do
              begin
                GotoXY(68,y+2);
                min:=solieu1[y];
                if(solieu2[y]<min) then min:=solieu2[y];
                if(solieu3[y]<min) then min:=solieu3[y];
                if(solieu4[y]<min) then min:=solieu4[y];
                write(min:0:2);
              end
        else
          for y:=3 to a+2 do
             begin
               GotoXY(68,y+2);
               readln(tt[y]);
              end;
   readln;

   clrscr;
   writeln(s);
   writeln;

   {Save file}
   write('Ban co muon luu file nay khong? (Y/N): '); readln(ask);
   if(ask='Y')or (ask='y') then
     begin
        write('Duong dan file (Vi du : "C:\Calc.TXT") : '); readln(cmd);
        save_docx;
        writeln('CHUONG TRINH DEN DAY KET THUC...');
        delay(1000);
        Write('VUI LONG NHAN ENTER DE THOAT.');
     end
      else
        begin
           writeln('CHUONG TRINH DEN DAY KET THUC...');
           delay(1000);
           Write('VUI LONG NHAN ENTER DE THOAT.');
        end;
End;

procedure english;   {the body written in English}
var loop : byte;
    i2 : integer;
Begin
 s1:='PASCAL CALCULATOR 1.2';
 CanGiua(s1);
 clrscr;

 assign(f1,'A.OPG'); reset(f1);
 while not eof(f1) do
   read(f1,id);
 i:=id;
 close(f1);

 assign(f2,'B.OPG'); reset(f2);
 while not eof(f2)do
  read(f2,pass);
 p:=pass;
 close(f2);

 if (i='') and (p='') then
  begin
   register
  end
 else
  begin
   writeln(s1);
   writeln('Sign in');
   write('Username: ') ; readln(id);
   write('Password: '); readln(pass);

   while  (p<>pass) or (i<>id) do
    begin
     clrscr;
     writeln(s1);
     pass:=''; id:='';

     writeln('Sign in');
     writeln('You have entered the wrong password or username.');
     writeln('Try again:');
     write('Username: ') ; readln(id);
     write('Password: '); readln(pass);
    end;
  end;

 clrscr;
 writeln(s1);
 write('                  Successful login !');
 delay(2000);

 clrscr;

 loop := 0;
 for m:=1 to 100 do {Setup from 1 to 100%}
  begin
   GotoXY(30,11);
   writeln('PASCAL CALCULATOR 1.2- 2019');
   GotoXY(33,13);
   write('STARTING ',m,' % ...  ');

   inc(loop);
   if(loop = 1) then writeln('-');
   if(loop = 2) then writeln('\');
   if(loop = 3) then writeln('|');
   if(loop = 4) then
     begin
      writeln('/');
      loop := 0;
     end;

    writeln;
    writeln;

    for i2:= 0 to (m * 8 div 10) do
     begin
      gotoXY(0 + i2, 16);
      write(#219);
     end;

    if(m mod 5 = 0) then
     begin
      gotoXY(0 + m * 8 div 10, 16);
      write(#219);
     end;

   delay(80);
   clrscr;
  end;

 delay(1000);
 GotoXY(35,11);
 writeln('CALCULATOR');
 GotoXY(38,13);
 writeln('MADE FROM VIETNAM');
 GotoXY(3,22);
 writeln('(c) NGUYEN PETER 2020 . LATEST UPDATE: 19 Jun 2020. VERSION:1.2');
 CreatSound(861,300);
 CreatSound(967,300);
 CreatSound(542,300);
 CreatSound(609,300);
 CreatSound(645,600);
 delay(2000);

 clrscr;
 writeln(s1);
 write('How many lines do you want to do (<21):');    readln(a);
 while (a>18) do
  begin
   clrscr;
   writeln('Over the limit line.');
   write('Try again: ');
   readln(a);
  end;

 clrscr;
 write(s1);
 vekhung(x1,y1+2,13,y2);
 vekhung(13,y1+2,26,y2);
 vekhung(26,y1+2,39,y2);
 vekhung(39,y1+2,53,y2);
 vekhung(53,y1+2,66,y2);
 vekhung(66,y1+2,x2,y2);
 vekhung(x1,y1+2,x2,y2);

 write(s1);
 GotoXY(2,4);
 writeln('Name');
 GotoXY(19,4);
 writeln('A');
 GotoXY(32,4);
 writeln('B');
 GotoXY(45,4);
 writeln('C');
 GotoXY(60,4);
 writeln('D');

 for y:=3 to a+2 do
   begin
    GotoXY(2,y+2);
    write(y-2,'. ');
    readln(ten[y]);
   end;

  GotoXY(70,4);
  readln(k);

  for y:=3 to a+2 do
   begin
    GotoXY(15,y+2);
    readln(solieu[y]);
   end;

  for y:=3 to a+2 do
   begin
    GotoXY(28,y+2);
    readln(solieu2[y]);
   end;

  for y:=3 to a+2 do
   begin
    GotoXY(41,y+2);
    readln(solieu3[y]);
   end;

  for y:=3 to a+2 do
   begin
    GotoXY(55,y+2);
    readln(solieu4[y]);
   end;

  if (k='SUM') or (k='TONG') then
   for y:=3 to a+2 do
    begin
     GotoXY(68,y+2);
     cd[y]:=solieu[y]+solieu2[y]+solieu3[y]+solieu4[y];
     write(cd[y]:0:2);
    end
    else

     if (k='AVERAGE') or (k='TRUNG BINH') then
       for y:=3 to a+2 do
         begin
           GotoXY(68,y+2);
           cd[y]:=(solieu[y]+solieu2[y]+solieu3[y]+solieu4[y])/4;
           write(cd[y]:0:2);
         end
      else

        if (k='AVESUB') or(k='TB MON') then (* AVESUB (AVERAGE SUBJECT) *)
            for y:=3 to a+2 do
              begin
                GotoXY(68,y+2);
                cd[y]:=(solieu[y]+solieu2[y]+solieu3[y]*2+solieu4[y]*3)/7;
                write(cd[y]:0:2);
              end
       else

        if ((k='MINUS') or(k='TRU')) then
          for y:=3 to a+2 do
            begin
              GotoXY(68,y+2);
              cd[y]:=solieu[y]+solieu2[y]-solieu3[y]-solieu4[y];
              write(cd[y]:0:2);
            end
        else

          if (k='MAX') then
            for y:=3 to a+2 do
              begin
                GotoXY(68,y+2);
                max:=solieu1[y];
                if(solieu2[y]>max) then max:=solieu2[y];
                if(solieu3[y]>max) then max:=solieu3[y];
                if(solieu4[y]>max) then max:=solieu4[y];
                write(max:0:2);
              end
        else
          if (k='MIN') then
            for y:=3 to a+2 do
              begin
                GotoXY(68,y+2);
                min:=solieu1[y];
                if(solieu2[y]<min) then min:=solieu2[y];
                if(solieu3[y]<min) then min:=solieu3[y];
                if(solieu4[y]<min) then min:=solieu4[y];
                write(min:0:2);
              end
        else
          for y:=3 to a+2 do
             begin
               GotoXY(68,y+2);
               readln(tt[y]);
              end;
  readln;

  clrscr;
  writeln(s1);
  writeln;

  write('Do you want to save this file? (Y/N): '); readln(ask);
  if(ask='Y')or (ask='y') then
   begin
    write('Path of file (Ex : "C:\Calc.TXT") : '); readln(cmd);
    save_docx;
    writeln('End of the program...');
    delay(1000);
    Write('Please press Enter to exit.');
   end
  else

   begin
    writeln('End of the program...');
    delay(1000);
    Write('Please press Enter to exit.');
   end;
End;

BEGIN {MAIN}
  clrscr;{xoa man hinh}

  choose_language;
  if (chon='V') or (chon='v') or (chon='1') then
   vietnamese
  else
   if (chon='E') or (chon='e') or (chon='2') then
    english
  else
    begin
      KeyPressed;
    end;
  readln
END.

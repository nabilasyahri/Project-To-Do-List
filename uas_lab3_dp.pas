program tdl;
uses crt;

type
    task = record
        nama: string[100];
        jam, menit: integer;
        statusz: boolean;
    end;

var
    tasks: array[1..10] of task;
    jumlah: integer;            

procedure tambah(var list: array of task; var jumlah: integer);
var
    baru: task;
begin
    if jumlah < 10 then
    begin
        with baru do 
        begin
            write('Masukkan nama kegiatan: ');
            readln(nama);
            writeln('Kapan kegiatan ingin dilakukan?: ');
            write ('Masukkan jam(00-23): ');
            readln(jam);

            write('Masukkan menit(00-59): ');
            readln(menit);
            
            statusz:= false;  { kegiatan baru belum selesaaii }
            jumlah := jumlah + 1;
            list[jumlah] := baru;

             if (jam > 23) then
            begin
                writeln ('Jam tidak valid');
            end;
              
            if (menit > 59) then
            begin
                writeln ('Menit tidak valid ');
            end;
            if (jam <= 23) and (menit <= 59) then
            begin
            writeln('Kegiatan berhasil ditambahkan!');
            end

        end;
    end
    else
        writeln('Daftar penuh!! ><');
end;

procedure tampil(const list: array of task; jumlah: integer);
var
    i: integer;
begin
    writeln('Daftar kegiatan:');

    if jumlah = 0 then
        writeln('Tidak ada kegiatan.')
    else
        for i := 1 to jumlah do
        begin
            with list[i] do 
            begin
                 if (jam <= 23) and (menit <= 59) then
                begin

                writeln(i, '. ', nama);
               
                if (menit < 10) and (jam < 10) then 
                begin
                writeln('   Waktu: 0', jam, ':0', menit)
                end
                else if (menit < 10) and (jam >= 10) then 
                    begin
                        writeln('   Waktu: ', jam, ':0', menit)
                end
                else if (menit >= 10) and (jam < 10) then 
                begin
                writeln('   Waktu: 0', jam, ':', menit);
                end;
                
            
                if statusz then
                    writeln('   Status: Selesai')
                else
                    writeln('   Status: Belum selesai')
                end
                else
                writeln ('Tidak ada kegiatan');
            end;
        end;
end;

procedure tandai(var list: array of task; jumlah: integer);
var
    nomor: integer;
begin
    write('Masukkan nomor kegiatan yang ingin ditandai sudah selesai: ');
    readln(nomor);

    if (nomor >= 1) and (nomor <= jumlah) then
    begin
        with list[nomor] do
        begin
            statusz := true;
            writeln('Kegiatan "', nama, '" telah ditandai sudah selesai.');
        end;
    end
    else
        writeln('Nomor tidak valid!');
end;

var
    nama : string;
    n : integer;

begin
    clrscr;

    writeln('Selamat datang! ><');
    write('Masukkan nama Anda: ');
    readln(nama);
    writeln;

    jumlah := 0;  
    
    repeat

        writeln ('-------------------Program To-Do-List-------------------');
        writeln ('Haloo ', nama, ', apa yang ingin anda lakukan hari ini?');
        writeln ('No.   Fitur-fitur:');
        writeln ('1.    Tambah kegiatan');
        writeln ('2.    Tampilkan semua kegiatan');
        writeln ('3.    Tandai kegiatan selesai');
        writeln ('4.    Keluar');
        writeln;
        write ('Masukkan nomor untuk mengaktifkan fitur (1-4): ');
        readln(n);

        case n of
        1: tambah   (tasks, jumlah);
        2: tampil   (tasks, jumlah);
        3: tandai   (tasks, jumlah);
        4: writeln  ('Selamat beraktivitas! Semoga hari Anda seruu ^_^');
        else
        writeln('Pilihan tidak valid. Silakan coba lagi.');
        end;
    until n = 4;
end.

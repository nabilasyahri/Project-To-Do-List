program tdl;
uses crt;

type
    task = record
        nama: string[100];
        desk: string[200];
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
            write('Kapan kegiatan ingin dilakukan? (00:00-23:00): ');
            readln(desk);
            statusz:= false;  { kegiatan baru belum selesaaii }
            jumlah := jumlah + 1;
            list[jumlah] := baru;
            writeln('Kegiatan berhasil ditambahkan!');
        end;
    end
    else
        writeln('Daftar penuh!! >__<');
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
                writeln(i, '. ', nama);
                writeln('   Waktu: ', desk);

                if statusz then
                    writeln('   Status: Selesai')
                else
                    writeln('   Status: Belum selesai');
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

    writeln('Selamat datang! >__<');
    write('Masukkan nama Anda: ');
    readln(nama);

    jumlah := 0;  
    
    repeat
        writeln('----------Program To-Do List---------');
        writeln('Haloo ', nama, ', apa yang ingin anda lakukan?');
        writeln('Fitur-fitur:');
        writeln('1. Tambah kegiatan');
        writeln('2. Tampilkan semua kegiatan');
        writeln('3. Tandai kegiatan selesai');
        writeln('4. Keluar');
        write('Masukkan nomor (1-4): ');
        readln(n);

        case n of
        1: tambah(tasks, jumlah);
        2: tampil(tasks, jumlah);
        3: tandai(tasks, jumlah);
        4: writeln('Selamat beraktivitas! Semoga hari Anda seruu ^___^');
        else
        writeln('Pilihan tidak valid. Silakan coba lagi.');
        end;
    until n = 4;
end.
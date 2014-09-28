unit uHistoryGen;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, uMemoControl, uFControl, uLabeledFControl,
    uCharControl, Buttons, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
    pFIBDataSet;

type
    TfmHistoryGen = class(TForm)
        DBUser: TqFCharControl;
        DBPassword: TqFCharControl;
        Tables: TqFMemoControl;
        SaveDialog1: TSaveDialog;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DB: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        DefaultTransaction: TpFIBTransaction;
        FieldsDS: TpFIBDataSet;
        ConnectionString: TqFCharControl;
    SQLListBox: TListBox;
        procedure OkButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    fmHistoryGen: TfmHistoryGen;

implementation

{$R *.dfm}

uses qFTools;

procedure TfmHistoryGen.OkButtonClick(Sender: TObject);
var
    i: Integer;
    table_name, hst_table_name, fields, old_fields, new_fields, trigSQL: string;
    SQL: string;
    f: TextFile;
begin
    DB.Connected := False;
    DB.DBName := ConnectionString.Value;
    DB.ConnectParams.UserName := DBUser.Value;
    DB.ConnectParams.Password := DBPassword.Value;
    DB.Connected := True;

    for i := 0 to Tables.Memo.Lines.Count - 1 do
    begin
        table_name := Tables.Memo.Lines[i];
        FieldsDS.Close;
        FieldsDS.ParamByName('Table_Name').AsString := table_name;
        FieldsDS.Open;

            // history table
        hst_table_name := Copy(table_name + '_HST', 0, 31);

        SQL := SQL + 'CREATE TABLE ' + hst_table_name + '('#13#10 +
            '   Id_Hst Tkey16 NOT NULL,'#13#10 +
            '   User_Fio_Hst Tvarchar255,'#13#10 +
            '   Date_Time_Hst Ttimestamp,'#13#10 +
            '   Action_Hst Tvarchar20,'#13#10 +
            '   Id_History_Info_Hst Tkey16_Maynull,'#13#10;

        fields := '';
        old_fields := '';
        new_fields := '';
        FieldsDS.First;
        while not FieldsDS.Eof do
        begin
            SQL := SQL + '   ' + FieldsDS['RDB$Field_Name'] + ' ' + FieldsDS['RDB$Field_Source'];
            fields := fields + '   ' + FieldsDS['RDB$Field_Name'];
            old_fields := old_fields + '    OLD.' + FieldsDS['RDB$Field_Name'];
            new_fields := new_fields + '    NEW.' + FieldsDS['RDB$Field_Name'];
            FieldsDS.Next;
            if not FieldsDS.Eof then
            begin
                SQL := SQL + ',';
                fields := fields + ','#13#10;
                old_fields := old_fields + ','#13#10;
                new_fields := new_fields + ','#13#10;
            end;
            SQL := SQL + #13#10;
        end;
        SQL := SQL + ');'#13#10#13#10;

            // trigger
        trigSQL := SQLListBox.Items.Text;
        trigSQL := StringReplace(trigSQL, ':Table_Name', table_name, [rfReplaceAll]);
        trigSQL := StringReplace(trigSQL, ':Hst_Table_Name', hst_table_name, [rfReplaceAll]);
        trigSQL := StringReplace(trigSQL, ':Fields', fields, [rfReplaceAll]);
        trigSQL := StringReplace(trigSQL, ':Old_Fields', old_fields, [rfReplaceAll]);
        trigSQL := StringReplace(trigSQL, ':New_Fields', new_fields, [rfReplaceAll]);

        SQL := SQL + trigSQL;
    end;

    if SaveDialog1.Execute then
    begin
        AssignFile(f, SaveDialog1.FileName);
        Rewrite(f);
        Write(f, SQL);
        CloseFile(f);

        ShowMessage('Ok!');
    end;
end;

procedure TfmHistoryGen.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    qFAutoSaveIntoRegistry(Self);
end;

procedure TfmHistoryGen.FormCreate(Sender: TObject);
begin
    qFAutoLoadFromRegistry(Self);
end;

procedure TfmHistoryGen.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

end.

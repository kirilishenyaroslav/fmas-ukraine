unit PCardExportUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Buffer, SpCommon,
    PersonalCommon, Halcn6db, ComCtrls;

type
    TPCardExportForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label1: TLabel;
        AllPCardsQuery: TIBQuery;
        GetBufInfoQuery: TIBQuery;
        PCardProgress: TProgressBar;
        Label2: TLabel;
        Label3: TLabel;
        SysOptQuery: TIBQuery;
        SysOptQueryID_SERVER: TIntegerField;
        procedure OkButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    PCardExportForm: TPCardExportForm;

implementation

{$R *.dfm}

procedure TPCardExportForm.OkButtonClick(Sender: TObject);
var
    IdPbKey: Integer;
begin
    AllPCardsQuery.Transaction := PersonalCommon.ReadTransaction;
    SysOptQuery.Open;
    BufTran.Start;
    AllPCardsQuery.Open;
    AllPCardsQuery.FetchAll;
    AllPCardsQuery.First;
    PCardProgress.Position := 1;
    PCardProgress.Max := AllPCardsQuery.RecordCount;


    while (not AllPCardsQuery.Eof) do
    begin
        if (AllPcardsQuery['ID_PCARD'] - (allPcardsQuery['ID_PCARD'] div 100) * 100 = SysOptQuery['ID_SERVER'])
            or ((SysOptQuery['ID_SERVER'] = 12) and (AllPCardsQuery['ID_PCARD'] < 100)) or (Version = 2) then
        begin
            if (Version = 1) then
                IdPbKey := BufTran.AddRecord('Pep_Data', 'BUFF_PEP_DATA');

            if (Version = 2) then
                IdPbKey := BufTran.AddRecord('NPeople', 'BUFF_NPEOPLE');

            GetBufInfoQuery.Params.ParamValues['IdPcard'] :=
                AllPCardsQuery['ID_PCARD'];
            GetBufInfoQuery.Params.ParamValues['IdPbKey'] := IdPbKey;
            GetBufInfoQuery.Params.ParamValues['TUNION'] :=
                AllPCardsQuery['T_UNION'];
            GetBufInfoQuery.Params.ParamValues['INVALID'] :=
                AllPCardsQuery['INVALID'];
            GetBufInfoQuery.Params.ParamValues['PAR_IDMAN'] :=
                AllPCardsQuery['ID_MAN']; ;
            GetBufInfoQuery.Params.ParamValues['PAR_TN'] :=
                AllPCardsQuery['TN']; ;
            GetBufInfoQuery.Params.ParamValues['RAZR'] :=
                AllPCardsQuery['RAZRAYD']; ;

            if (Version = 1) then
                GetBufInfoQuery.Params.ParamValues['Act'] := 4;
            if (Version = 2) then
            begin
                GetBufInfoQuery.Params.ParamValues['Act'] := 1;
                GetBufInfoQuery.Params.ParamValues['PAR_VERSION'] := 2;
            end;



            Label3.Caption := IntToStr(AllPCardsQuery['TN']);
            try
                ExecQuery(GetBufInfoQuery);
                if (Version = 1) then
                    WriteToDbf('Pep_data', 'BUFF_PEP_DATA', IdPbKey);
                if (Version = 2) then
                    WriteToDbf('NPeople', 'BUFF_NPEOPLE', IdPbKey);


            except on E: Exception do
                begin
                    MessageDlg('Виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
                    BufTran.Rollback;
                    Exit;
                end;
            end;
        end;
        Application.ProcessMessages;
        PCardProgress.StepBy(1);
        AllPCardsQuery.Next;


    end;
    BufTran.Commit;
    Close;

end;

procedure TPCardExportForm.FormCreate(Sender: TObject);
begin
    SysOptQuery.Transaction := PersonalCommon.ReadTransaction;
    GetBufInfoQuery.Transaction := BufferTransaction;
end;

procedure TPCardExportForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

end.

{*******************************************************************************
* uAsupReportCard                                                              *
*                                                                              *
* Главный модуль отчета по личным карточкам                                    *
* Copyright © 2004-2005, Пашенко Г.В.                                          *
* Донецкий Национальный Университет                                            *
*******************************************************************************}

unit uAsupReportCard;

interface

uses uCommonSp,dmAsupReportCard,IBase,Forms,DB,Variants;

type
    TAsupReportCard=class(TSprav)
    private
        DataModule: TAsupReportCardDM;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;


function CreateSprav:TSprav;stdcall;
exports CreateSprav;

implementation

uses SysUtils,NagScreenUnit,Messages,Dialogs;


function CreateSprav: TSprav;
begin
    Result := TAsupReportCard.Create;
end;

constructor TAsupReportCard.Create;
begin
    inherited Create;
    DataModule:=TAsupReportCardDM.Create(Application.MainForm);
    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    PrepareMemoryDatasets;
end;

destructor TAsupReportCard.Destroy;
begin

    inherited Destroy;
    DataModule.Free;

end;

procedure TAsupReportCard.Show;
var j:integer;
    key,value,str:string;
    f:textfile;
    hnd: Integer;
    DesignReport: boolean;

procedure BeginLoadData;
begin
    NagScreen := TNagScreen.Create(nil);
    NagScreen.Show;
    NagScreen.SetStatusText('Формується звіт...');
end;

procedure EndLoadData;
begin
    NagScreen.Free;    
end;

begin

    with DataModule do
    begin
        if DB.Connected then
            DB.Connected:=False;
        hnd:=Input['DBHandle'];
        DB.Handle:=TISC_DB_HANDLE(hnd);
       // DB.Connected:=True;
    end;

    if VarIsNull(Input['DesignReport']) then DesignReport:=False
     else DesignReport:=Input['DesignReport'];

     BeginLoadData;
        DataModule.CardDataSet.Close;
        DataModule.CardDataSet.ParamByName('id_pcard').Value:=Input['ID_pcard'];
        DataModule.CardDataSet.Open;
        {регалии}
        DataModule.RegardDataSet.Close;
        DataModule.RegardDataSet.ParamByName('id_pcard').Value:=Input['ID_pcard'];
        DataModule.RegardDataSet.Open;

        {стаж}
        DataModule.StajDataSet.Close;
        DataModule.StajDataSet.ParamByName('id_pcard').Value:=Input['ID_pcard'];
        DataModule.StajDataSet.Open;

        {назначения}
        DataModule.MovingsDataSet.Close;
        DataModule.MovingsDataSet.ParamByName('id_pcard').Value:=Input['ID_pcard'];
        DataModule.MovingsDataSet.Open;

        {отпуск}
        DataModule.HolydaysDataSet.Close;
        DataModule.HolydaysDataSet.ParamByName('id_pcard').Value:=Input['ID_pcard'];
        DataModule.HolydaysDataSet.Open;

        EndLoadData;
        {показываем отчет}
        DataModule.Report.LoadFromFile('.\Reports\ASUP\AsupReportCard.fr3');
        assignfile(f,'ASUP/card.ini');
        reset(f);
        while not eof(f) do
        begin
            readln(f,str);
            j:=0;
            repeat
                j:=j+1;
            until ((j>length(str)) or (str[j]='='));
            if j<=length(str) then
            begin
                key := Copy(str,0,j-1);
                value := Copy(str,j+1,length(str));
                DataModule.Report.Variables[key] := QuotedStr(value);
            end
            else DataModule.Report.Variables[key] := QuotedStr('');
        end;
        closefile(f);

        if DesignReport then
         DataModule.Report.DesignReport
        else
         DataModule.Report.ShowReport;
end;
end.

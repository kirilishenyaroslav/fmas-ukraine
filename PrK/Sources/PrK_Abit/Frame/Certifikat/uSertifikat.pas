unit uSertifikat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxDockControl, dxDockPanel, ExtCtrls,
  FIBDataSet, pFIBDataSet, cxMaskEdit, cxTextEdit, cxCurrencyEdit,
  FIBQuery, pFIBQuery, RxMemDS, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IniFiles;

type
  TFrameSertifikat = class(TFrame)
    cxGridSertifikat: TcxGrid;
    cxGridSertifikatDBVCertifikat: TcxGridDBTableView;
    cxGridSertifikatDBVSertifikat_NOMER: TcxGridDBColumn;
    cxGridSertifikatDBVSertifikat_PIN: TcxGridDBColumn;
    cxGridSertifikatLevel1: TcxGridLevel;
    DSetSertifikat: TpFIBDataSet;
    DSetMarks: TpFIBDataSet;
    DSourceSertifikat: TDataSource;
    DSourceMarks: TDataSource;
    cxGridViewMarks: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGridMarks: TcxGrid;
    cxGridViewMarks_PREDMET: TcxGridDBColumn;
    pFIBQuery: TpFIBQuery;
    RxMemoryDataOcenka: TRxMemoryData;
    DSourcePredmetOcenka: TDataSource;
    cxGridViewMarks_OCENKA: TcxGridDBColumn;
    RxMemoryDataOcenkaID_SP_PREDM_SERT: TIntegerField;
    RxMemoryDataOcenkaNAME_PREDM: TStringField;
    RxMemoryDataOcenkaOCENKA: TCurrencyField;
    cxGridSertifikatDBVSertifikat_YEAR: TcxGridDBColumn;
    IdHTTP1: TIdHTTP;
    procedure DSetMarksAfterOpen(DataSet: TDataSet);
    procedure DSetSertifikatAfterOpen(DataSet: TDataSet);
  private
    DELang: Integer;
    { Private declarations }
  public
    procedure InicCaptionFrame;
    procedure SetInitData;
    procedure AddSertifikat;
    procedure EditSertifikat;
    procedure DelSertifikat;
    procedure ViewSertifikat;
    procedure ChangeMark(mark: Single);
    procedure CheckMarks;
  end;

implementation
uses uPRK_DT_ABIT, uConstants, uEditSertifikat, uPrK_Resources;

function inc_ex(var i:integer):Integer;
begin
    Inc(i);
    Result:=i;
end;

{$R *.dfm}

procedure TFrameSertifikat.InicCaptionFrame;
begin
    DELang                                      := TFormPRK_DT_ABIT(self.Owner).IndLangAbit;
    cxGridSertifikatDBVSertifikat_NOMER.Caption := nLabelSertifikatNumber[DELang];
    cxGridSertifikatDBVSertifikat_PIN.Caption   := nLabelSertifikatPIN[DELang];
    cxGridSertifikatDBVSertifikat_YEAR.Caption  := nLabelSertifikatYEAR[DELang];
    cxGridViewMarks_Predmet.Caption             := nLabelSertifikatPredmet[DELang];
    cxGridViewMarks_OCENKA.Caption              := nLabelSertifikatMark[DELang];
end;

procedure TFrameSertifikat.SetInitData;
var
  SystemIni: TIniFile;
begin
    DELang                              :=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;

    DSetSertifikat.Active               := false;
    DSetSertifikat.Database             := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DSetSertifikat.Transaction          := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DSetSertifikat.SelectSQL.Clear;
    DSetSertifikat.SQLs.SelectSQL.Text  := 'select * from PRK_DT_SERTIFIKAT_SEL(:id_man)';
    DSetSertifikat.ParamByName('id_man').AsInt64 := TFormPRK_DT_ABIT(Self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
    DSetSertifikat.Open;
    DSetSertifikat.FetchAll;
    DSetSertifikat.First;

    DSetMarks.Active                    := false;
    DSetMarks.Database                  := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DSetMarks.Transaction               := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DSetMarks.SelectSQL.Clear;
    DSetMarks.SQLs.SelectSQL.Text       := 'select * from PRK_DT_SERTIFIKAT_OCENKA_SEL(?ID_DT_SERTIFIKAT)';
    DSetMarks.Open;
    DSetMarks.FetchAll;
    DSetMarks.First;

    pFIBQuery.Database                  := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    pFIBQuery.Transaction               := TFormPRK_DT_ABIT(self.Owner).TransactionWritePrK_ABIT;

    SystemIni := TIniFile.Create(GetCurrentDir + '\config.ini');
    IdHTTP1.ProxyParams.ProxyUsername   := SystemIni.ReadString ('PROXY', 'UserName', '');
    IdHTTP1.ProxyParams.ProxyPassword   := SystemIni.ReadString ('PROXY', 'UserPassword', '');
    IdHTTP1.ProxyParams.ProxyServer     := SystemIni.ReadString ('PROXY', 'Server', '');
    IdHTTP1.ProxyParams.ProxyPort       := SystemIni.ReadInteger('PROXY', 'Port', 0);
    if (IdHTTP1.ProxyParams.ProxyUsername='') or (IdHTTP1.ProxyParams.ProxyPassword='')
    then begin
        IdHTTP1.ProxyParams.ProxyUsername:='';
        IdHTTP1.ProxyParams.ProxyPassword:='';
    end;
    IdHTTP1.ProxyParams.BasicAuthentication:=true;
end;

procedure TFrameSertifikat.AddSertifikat;
var
  T :TfrmEditSertifikat;
  d :Int64;
begin
    if not DSetSertifikat.IsEmpty
    then d := DSetSertifikat.FBN('ID_DT_SERTIFIKAT').AsInteger
    else d := -1;
    T := TfrmEditSertifikat.Create(self);
    T.Caption := nFormKlassSpravEdit_Add[DELang];
    if T.ShowModal=mrOK
    then begin
        try
            pFIBQuery.Transaction.StartTransaction;
            pFIBQuery.SQL.Text:='execute procedure PRK_DT_SERTIFIKAT_ADD(:ID_MAN,:NOMER,:PIN,:YEAR)';
            pFIBQuery.ParamByName('ID_MAN').AsInt64 := TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
            pFIBQuery.ParamByName('NOMER').AsString := T.cxMaskEditNOMER.Text;
            pFIBQuery.ParamByName('PIN').AsString   := T.cxMaskEditPIN.Text;
            pFIBQuery.ParamByName('YEAR').AsString := T.cxMaskEditYEAR.Text;
            pFIBQuery.ExecProc;
            d := pFIBQuery.FldByName['id_out'].AsInt64;
            pFIBQuery.Transaction.Commit;
        except on E:exception do begin
            pFIBQuery.Transaction.Rollback;
            MessageBox(Handle,Pchar(nMsgErrorTransaction[DELang]+chr(13)+
                            nMsgTryAgain[DELang]+nMsgOr[DELang]+nMsgToAdmin[DELang]+chr(13)+
                            e.Message),Pchar(nMsgBoxTitle[DELang]),MB_OK or MB_ICONWARNING);
            end;
        end;
        DSetSertifikat.CloseOpen(True);
        if not DSetSertifikat.IsEmpty
        then DSetSertifikat.Locate('ID_DT_SERTIFIKAT',d,[]);
        DSetMarks.Close;
        DSetMarks.Open;
    end;
    T.Free;
    T:=nil;
end;

procedure TFrameSertifikat.EditSertifikat;
var
  d :Int64;
  T :TfrmEditSertifikat;
begin
    if DSetSertifikat.IsEmpty
    then Exit;
    d := DSetSertifikat.FBN('ID_DT_SERTIFIKAT').AsInteger;
    T := TfrmEditSertifikat.Create(self);
    T.Caption := nFormKlassSpravEdit_Change[DELang];
    T.cxMaskEditNOMER.Text  := DSetSertifikat.FBN('nomer').AsString;
    T.cxMaskEditPIN.Text    := DSetSertifikat.FBN('pin').AsString;
    T.cxMaskEditYEAR.Text   := DSetSertifikat.FBN('syear').AsString;
    if T.ShowModal=mrOK
    then begin
        try
            pFIBQuery.Transaction.StartTransaction;
            pFIBQuery.SQL.Text:='execute procedure PRK_DT_SERTIFIKAT_CHNGE(:id_cert,:ID_MAN,:NOMER,:PIN,:YEAR)';
            pFIBQuery.ParamByName('id_cert').AsInt64:=DSetSertifikat.FBN('ID_DT_SERTIFIKAT').AsInteger;
            pFIBQuery.ParamByName('ID_MAN').AsInt64:=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
            pFIBQuery.ParamByName('NOMER').AsString:=T.cxMaskEditNOMER.Text;
            pFIBQuery.ParamByName('PIN').AsString:=T.cxMaskEditPIN.Text;
            pFIBQuery.ParamByName('YEAR').AsString := T.cxMaskEditYEAR.Text;
            pFIBQuery.ExecProc;
            pFIBQuery.Transaction.Commit;
        except on E:exception do begin
            pFIBQuery.Transaction.Rollback;
            MessageBox(Handle,Pchar(nMsgErrorTransaction[DELang]+chr(13)+
                            nMsgTryAgain[DELang]+nMsgOr[DELang]+nMsgToAdmin[DELang]+chr(13)+
                            e.Message),Pchar(nMsgBoxTitle[DELang]),MB_OK or MB_ICONWARNING);
            end;
        end;
        DSetSertifikat.CloseOpen(True);
        DSetSertifikat.Locate('ID_DT_SERTIFIKAT',d,[]);
        DSetMarks.Close;
        DSetMarks.Open;
    end;
    T.Free;
    T:=nil;
end;

procedure TFrameSertifikat.DelSertifikat;
begin
    if DSetSertifikat.IsEmpty
    then Exit;
    if prkMessageDlg(nMsgBoxTitle[DELang],nMsgDel[DELang], mtInformation,mbOKCancel,DELang)=mrOK
    then try
        pFIBQuery.Transaction.StartTransaction;
        pFIBQuery.SQL.Text:='execute procedure PRK_DT_SERTIFIKAT_DEL(:id_cert)';
        pFIBQuery.ParamByName('id_cert').AsInt64:=DSetSertifikat.FBN('ID_DT_SERTIFIKAT').AsInteger;
        pFIBQuery.ExecProc;
        pFIBQuery.Transaction.Commit;
        except on E:exception do begin
            pFIBQuery.Transaction.Rollback;
            MessageBox(Handle,Pchar(nMsgErrorTransaction[DELang]+chr(13)+
                            nMsgTryAgain[DELang]+nMsgOr[DELang]+nMsgToAdmin[DELang]+chr(13)+
                            e.Message),Pchar(nMsgBoxTitle[DELang]),MB_OK or MB_ICONWARNING);
            end;
        end;
    DSetSertifikat.CloseOpen(True);
    DSetMarks.Close;
    DSetMarks.Open;
end;

procedure TFrameSertifikat.ViewSertifikat;
var
  T :TfrmEditSertifikat;
begin
    if not DSetSertifikat.IsEmpty
    then begin
        T := TfrmEditSertifikat.Create(self);
        T.Caption := nFormKlassSpravEdit_View[DELang];
        T.cxMaskEditNOMER.Text    := DSetSertifikat.FBN('nomer').AsString;
        T.cxMaskEditPIN.Text      := DSetSertifikat.FBN('pin').AsString;
        T.cxMaskEditYEAR.Text     := DSetSertifikat.FBN('syear').AsString;
        T.cxMaskEditNOMER.Properties.ReadOnly := True;
        T.cxMaskEditPIN.Properties.ReadOnly   := True;
        T.cxMaskEditYEAR.Properties.ReadOnly  := True;
        T.ShowModal;
        T.Free;
        T:=nil;
    end;
end;

procedure TFrameSertifikat.DSetMarksAfterOpen(DataSet: TDataSet);
begin
    RxMemoryDataOcenka.Close;
    RxMemoryDataOcenka.Open;
    RxMemoryDataOcenka.LoadFromDataSet(DSetMarks,0,lmCopy);
end;

procedure TFrameSertifikat.ChangeMark(mark: Single);
var
  d,e: Int64;
begin
    d := DSetSertifikat.FBN('ID_DT_SERTIFIKAT').AsInteger;
    e := RxMemoryDataOcenka['id_sp_predm_sert'];
    try
        pFIBQuery.Transaction.StartTransaction;
        pFIBQuery.SQL.Text:='execute procedure PRK_DT_SERTIFIKAT_OCENKA_CHANGE(:ID_DT_SERTIFIKAT,:id_sp_predm_sert,:mark)';
        pFIBQuery.ParamByName('ID_DT_SERTIFIKAT').AsInt64 := DSetSertifikat.FBN('ID_DT_SERTIFIKAT').AsInteger;
        pFIBQuery.ParamByName('id_sp_predm_sert').AsInt64 := RxMemoryDataOcenka['id_sp_predm_sert'];
        pFIBQuery.ParamByName('mark').AsCurrency          := mark;
        pFIBQuery.ExecProc;
        pFIBQuery.Transaction.Commit;
    except on E:exception do begin
        pFIBQuery.Transaction.Rollback;
        MessageBox(Handle,Pchar(nMsgErrorTransaction[DELang]+chr(13)+
                        nMsgTryAgain[DELang]+nMsgOr[DELang]+nMsgToAdmin[DELang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[DELang]),MB_OK or MB_ICONWARNING);
        Exit;
        end;
    end;
    DSetMarks.Close;
    DSetMarks.Open;
    if not DSetSertifikat.IsEmpty
    then DSetSertifikat.Locate('ID_DT_SERTIFIKAT',d,[]);
    RxMemoryDataOcenka.Locate('id_sp_predm_sert',e,[]);
end;

procedure TFrameSertifikat.DSetSertifikatAfterOpen(DataSet: TDataSet);
begin
    cxGridMarks.Enabled := not DSetSertifikat.IsEmpty;
end;

procedure TFrameSertifikat.CheckMarks;
var
  ask,answer,fio,str,n:String;
  i,poc,reccnt:Integer;
  marks:array of string[3];
begin
    reccnt:=DSetMarks.RecordCount;
    SetLength(marks,reccnt+1);
    ask:='http://www.registertp.com.ua/zno_vnz_check.php?Year=' +DSetSertifikat.FBN('SYEAR').AsString+
                                                    '&CertNum=' +DSetSertifikat.FBN('NOMER').AsString+
                                                    '&PIN='     +DSetSertifikat.FBN('PIN').AsString;
    answer:=IdHTTP1.Get(ask);
    if answer[1]<>'E'          // ERROR: .....
    then begin
        fio:=Copy(answer,6,Pos(';',answer)-6);
        poc:=Pos(';'+DSetSertifikat.FBN('PIN').AsString+';',answer)+Length(DSetSertifikat.FBN('PIN').AsString)+2;
        str:=Copy(answer,poc,Length(answer)-poc+1);
        i:=1;
        while i < Length(str) do
        begin
            if str[i]<>';'
            then begin
                n:=str[i];
                if str[i+1]<>';'
                then n:=n+str[inc_ex(i)];
                poc:=StrToInt(n);
                Inc(i);
                n:=str[inc_ex(i)]+str[inc_ex(i)]+str[inc_ex(i)];
                if poc>reccnt
                then begin
                    MessageBox(Handle,PChar(IntToStr(poc)+' Такого номера предмета не існує.'),   //PChar(uConstants.nMsgWrongSubjectNumber[DELang])
                       PChar(nMsgBoxTitle[DELang]),MB_OK or MB_ICONWARNING);
                    Exit;
                end;
                marks[poc]:=n;
            end;
            Inc(i);
        end;
    end else begin
        MessageBox(Handle,PChar('ПОМИЛКА.'+chr(13)+answer),PChar(nMsgBoxTitle[DELang]),MB_OK or MB_ICONWARNING);
    end;

    answer:='';
    for i:=1 to reccnt do
        answer:=answer+inttostr(i)+' '''+marks[i]+''''+#13;
    ShowMessage(answer);
end;

end.

unit uReqCertificate;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, RxMemDS, uCommonSp, uFormControl, Buttons, Grids, Spin,
    StdCtrls, SpComboBox, DBGrids, ExtCtrls, Mask, CheckEditUnit, ComCtrls,
    uFControl, uLabeledFControl, uSpravControl, uDateControl, uEnumControl,
    uCharControl, uIntControl, uBoolControl, FIBDatabase, pFIBDatabase,
    FIBDataSet, pFIBDataSet, ibase, uSelectForm, uFloatControl,
    ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
    cxControls, cxGridCustomView, cxGrid, uActionControl, uLogicCheck,
    uSimpleCheck, qFTools, fmReqCertificateUnit;

type
    TPochasFact = class(TSprav)
    private
        //IsConnected: Boolean;
        Form: TfmReqCertificate;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TPochasFact.Create;
end;

constructor TPochasFact.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('SpMode', ftInteger);

end;

destructor TPochasFact.Destroy;
begin
    inherited Destroy;
end;

procedure TPochasFact.Show;
var
    hnd: Integer;
begin
    Form := TfmReqCertificate.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    Form.CertSet.Close;
    Form.CertSet.SQLs.SelectSQL.Text := 'select * from UP_DT_REQ_CERTIFICATE_SELECT';
    Form.CertSet.Open;
    Form.LevelSet.Close;
    Form.LevelSet.SQLs.SelectSQL.Text:='SELECT * FROM UP_DT_REQ_CERT_LEV_SEL(:ID_REQ_CERT)';
    Form.LevelSet.ParamByName('ID_REQ_CERT').AsInteger:=form.id_req;
    Form.LevelSet.Open;
    Form.IniReports.Close;
    Form.IniReports.SQLs.SelectSQL.Text:='select actual_req_cert_shablon from asup_ini_reports';
    Form.IniReports.Open;
    //Form.cxTextEdit1.Text:=Form.CertSet.FieldByName('DATE_SYS_CREATE').AsString;

    if Input['SpMode'] = 1 then begin
        form.ShowModal;
        form.Free;
    end;

    if Input['SpMode'] = 2 then begin
        form.FormStyle := fsMDIChild;
        Form.WindowState := wsMaximized;
    end;
end;



end.

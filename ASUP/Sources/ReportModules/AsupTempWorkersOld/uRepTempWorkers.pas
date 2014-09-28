{***************************************************************
* uRepTempWorkers.				                               		   *
*		                                         								   *
* Описує процедуру ShowfmTempWorkers, для                      *
* виклику форми Тимчасово прийняті працівники     		         *
* Copyright © DonNU 2007, Автор: Pidko Eugeniy  						   *
***************************************************************}


unit uRepTempWorkers;

interface
uses
    uCommonSp, uAsupTempWorkers, Windows, Messages, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Mask, ToolEdit, RXDBCtrl, XPMan, ComCtrls, Buttons,
    cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters,
    cxButtons, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
    FIBQuery, pFIBQuery, pFIBStoredProc, frxClass, frxDBSet, frxCross,
    frxChart, frxOLE, frxRich, frxDMPExport, frxGZip, frxExportPDF,
    frxExportImage, IB_Intf, Menus, ExtCtrls, ibase, pFIBProps, IBBlobFilter, fib, pFIBEventLists, IB_Externals, frxExportRTF, {qFTools,} frxExportXML, frxExportXLS, frxExportHTML,
    frxExportTXT;

type
    TRepTempWorkers = class(TSprav)
    private
        DataModule: TfmTempWorkers;
        IsConnected: Boolean;
        procedure FillParams;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;
        procedure GetInfo; override;
        function Exists: boolean; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;
procedure ShowfmTempWorkers(Handle: TISC_DB_HANDLE);

implementation
uses Variants, SysUtils;

function CreateSprav: TSprav;
begin
    Result := TRepTempWorkers.Create;
end;

constructor TRepTempWorkers.Create;
begin
    inherited Create;
        // создание входных/выходных полей
    Input.FieldDefs.Add('Root_Department', ftInteger);
    Input.FieldDefs.Add('Id_Property', ftInteger);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('AllowEdit', ftBoolean);
    Input.FieldDefs.Add('Show_Properties', ftBoolean);
    //Input.FieldDefs.Add('DB_Handle', ftInteger);
        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TRepTempWorkers.Destroy;
begin
    inherited Destroy;
    if IsConnected then
    begin
        DataModule.pFIBTransaction1.Active := False;
    end;
    DataModule.Free;
end;

procedure TRepTempWorkers.Show;
var
    fmTempWorkers: TfmTempWorkers;
    hnd : Integer;
begin
    fmTempWorkers := TfmTempWorkers.Create(Application.MainForm);
    if (Input['ShowStyle'] = 0) or (Input['Select'] > 0) then
    begin
        with fmTempWorkers do
        try
            if pFIBDatabase1.Connected then
                pFIBDatabase1.Connected := False;
            hnd := Input['DBHandle'];

            pFIBDatabase1.Handle := TISC_DB_HANDLE(hnd);
            FillParams;
            IsConnected := True;

            fmTempWorkers.pFIBDatabase1.Connected := True;
            fmTempWorkers.pFIBDataSet1.Active := True;
            fmTempWorkers.id_department := fmTempWorkers.pFIBDataSet1LOCAL_DEPARTMENT.Value; ;
            fmTempWorkers.SP.Transaction.StartTransaction;
            fmTempWorkers.SP.StoredProcName := 'ASUP_GET_DEP_NAME';
            fmTempWorkers.SP.Prepare;
            fmTempWorkers.SP.ParamByName('ID_DEP').Value := fmTempWorkers.pFIBDataSet1LOCAL_DEPARTMENT.Value;
            fmTempWorkers.SP.ExecProc;
            fmTempWorkers.SP.Transaction.Commit;
            fmTempWorkers.cxTextEdit1.Text := fmTempWorkers.SP.FldByName['NAME_DEP'].AsString;
            fmTempWorkers.DateEnd.Date := Date() + 60;
            //id_department:=fmTempWorkers.pFIBDataSet1LOCAL_DEPARTMENT.Value;;

        except on E: Exception
            do
            begin
                ShowMessage('Виникла помилка: !' + e.Message);
                fmTempWorkers.SP.Transaction.Rollback;
                fmTempWorkers.cxTextEdit1.Text := '';
            end;
        end;

        fmTempWorkers.ShowModal;
        fmTempWorkers.Free;
    end
    else
    begin
        fmTempWorkers.FormStyle := fsMDIChild;
        fmTempWorkers.WindowState := wsMaximized;
    end;
end;


procedure TRepTempWorkers.FillParams;
begin
    Input.Edit;
    if VarIsNull(Input['Actual_Date']) then
        Input['Actual_Date'] := Date;

    if VarIsNull(Input['AllowEdit']) then
        Input['AllowEdit'] := False;

    if VarIsNull(Input['ShowStyle']) then
        Input['ShowStyle'] := 0;

    if VarIsNull(Input['Select']) then
        Input['Select'] := 1;

    if VarIsNull(Input['Id_Property']) or VarIsEmpty(Input['Id_Property']) then
        Input['Id_Property'] := -1;

    if VarIsNull(Input['Show_Properties']) then
        Input['Show_Properties'] := True;

    Input.Post;
end;

procedure ShowfmTempWorkers(Handle: TISC_DB_HANDLE);

begin

end;

function TRepTempWorkers.Exists: boolean;
begin
    Result := True;
end;

procedure TRepTempWorkers.GetInfo;
begin
end;

end.


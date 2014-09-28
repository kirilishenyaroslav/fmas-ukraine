unit uStajBonusOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, uCommonSp, uFormControl, Buttons, Grids, Spin,
  StdCtrls, DBGrids, ExtCtrls, Mask, CheckEditUnit, ComCtrls,
  uFControl, uLabeledFControl, uSpravControl, uDateControl, uEnumControl,
  uCharControl, uIntControl, uBoolControl, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, ibase, uSelectForm, uFloatControl,
  ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, uActionControl, uLogicCheck,
  uSimpleCheck, qFTools, uStajBonusOrderForm;

type

    TMassHolidayOrder = class(TSprav)
    private
        IsConnected: Boolean;
        Form: TfmMassStajOrder;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

    function CreateSprav: TSprav;stdcall;
    exports CreateSprav;

implementation

uses dmStajBonusOrder;

function CreateSprav: TSprav;
begin
    Result := TMassHolidayOrder.Create;
end;

constructor TMassHolidayOrder.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_Order_Type', ftInteger);
    Input.FieldDefs.Add('Id_Order', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('SpMode', ftInteger);
    Input.FieldDefs.Add('Num_Item', ftInteger);
    Input.FieldDefs.Add('Sub_Item', ftInteger);
    Input.FieldDefs.Add('Id_Order_Group', ftInteger);
    Input.FieldDefs.Add('Intro', ftString, 4096);
    Input.FieldDefs.Add('Note_Order', ftString, 255);
    Input.FieldDefs.Add('Num_Order', ftString, 10);

    Output.FieldDefs.Add('New_Id_Order', ftInteger);
end;

destructor TMassHolidayOrder.Destroy;
begin
    inherited Destroy;
end;

procedure TMassHolidayOrder.Show;
var
    hnd : Integer;
    {Mode : TFormMode;}
    Str : String;
begin
        // DataModule prepare
    DMstaj := TDMstaj.Create(Application.MainForm);

    DMstaj.LocalReadTransaction.Active := False;
    DMstaj.LocalWriteTransaction.Active := False;

    hnd := Input['DBHANDLE'];
    dmstaj.Num_item:=Input['NUM_ITEM'];

    if DMstaj.LocalDatabase.Connected
    then begin
              DMstaj.LocalDatabase.Close;
    end;

    DMstaj.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    // Form prepare
    Form := TfmMassStajOrder.Create(Application.MainForm);

    {case Input['SpMode'] of
        1 : Mode := fmAdd;
        2 : Mode := fmModify;
        3 : Mode := fmInfo;
    end;}

    DMstaj.IDOrder   := Input['Id_Order'];
    DMstaj.DateOrder := Input['Date_Order'];


    if DMstaj.IdOrder = -1
    then begin

    if Dmstaj.LocalWriteTransaction.Active
    then begin
              Dmstaj.LocalWriteTransaction.Rollback;
    end;

    Dmstaj.LocalWriteTransaction.StartTransaction;

    try
        if VarIsNull(Input['INTRO'])
        then
            Str := ''
        else
            Str := Input['INTRO'];



        Dmstaj.WorkQuery.Close;
        Dmstaj.WorkQuery.SelectSQL.Text := 'SELECT ID_ORDER FROM ASUP_INSERT_ORDER ('
                                        + IntToStr(Input['ID_ORDER_TYPE']) + ','
                                        + IntToStr(Input['NUM_ITEM']) + ','
                                        + IntToStr(Input['SUB_ITEM']) + ','
                                        + IntToStr(Input['ID_ORDER_GROUP']) + ','
                                        + QuotedStr(Str) + ')';
        Dmstaj.WorkQuery.Open;
        Dmstaj.IdOrder := Dmstaj.WorkQuery['ID_ORDER'];


        except on E:Exception do begin
                Dmstaj.LocalWriteTransaction.Rollback;
                Form.Free;
                Dmstaj.Free;
                qFErrorDialog('Виникла помилка при додаванні наказу:"' + E.message + '"');
                exit;
            end;
        end;

        Dmstaj.LocalWriteTransaction.Commit;
    end;

    Dmstaj.ReportDataDataSet.SelectSQL.Text:=' SELECT * FROM ASUP_STAJ_BONUS_GET_DATA('+IntToStr(Dmstaj.IdOrder)+','+''''+DateToStr(DMstaj.DateOrder)+''''+')';
    Form.ReportDataView.BeginUpdate;
    dmstaj.ReportDataDataSet.Open;
    if dmstaj.ReportDataDataSet.RecordCount>0
    then Form.RecalcButton.Enabled:=false;
    Form.ReportDataView.ViewData.Expand(true);
    Form.ReportDataView.EndUpdate;

    Form.ShowModal;

    if DMstaj.IdOrder <> -1 then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Order'] := DMstaj.IdOrder;
        Output.Post;
    end;

    Form.Free;
    Dmstaj.Free;
end;

end.

unit uHolidaySovmestOrder;

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
  uSimpleCheck, qFTools, uHolidaySovmestOrderForm, uShtatUtils,
  dmHolidaySovmestOrder;

type

    TMassHolidayOrder = class(TSprav)
    private
        IsConnected: Boolean;
        Form: TfmMassHolidayOrder;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

    function CreateSprav: TSprav;stdcall;
    exports CreateSprav;

implementation

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
    Mode : TFormMode;
    Str : String;
begin
        // DataModule prepare
    DM := TDM.Create(Application.MainForm);

    DM.LocalReadTransaction.Active := False;
    DM.LocalWriteTransaction.Active := False;

    hnd := Input['DBHANDLE'];

    if DM.LocalDatabase.Connected then
        DM.LocalDatabase.Close;

    DM.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

        // Form prepare
    Form := TfmMassHolidayOrder.Create(Application.MainForm);

    case Input['SpMode'] of
        1 : Mode := fmAdd;
        2 : Mode := fmModify;
        3 : Mode := fmInfo;
    end;

    DM.IDOrder := Input['Id_Order'];
    DM.DateOrder := Input['Date_Order'];


    if DM.IdOrder = -1 then begin

        if Dm.LocalWriteTransaction.Active then
            Dm.LocalWriteTransaction.Rollback;

        Dm.LocalWriteTransaction.StartTransaction;

        try
            if VarIsNull(Input['INTRO']) then
                Str := ''
            else
                Str := Input['INTRO'];

            Dm.WorkQuery.Close;
            Dm.WorkQuery.SelectSQL.Text := 'SELECT ID_ORDER FROM ASUP_INSERT_ORDER ('
                                            + IntToStr(Input['ID_ORDER_TYPE']) + ','
                                            + IntToStr(Input['NUM_ITEM']) + ','
                                            + IntToStr(Input['SUB_ITEM']) + ','
                                            + IntToStr(Input['ID_ORDER_GROUP']) + ','
                                            + QuotedStr(Str) + ')';
            Dm.WorkQuery.Open;

            Dm.IdOrder := Dm.WorkQuery['ID_ORDER'];

        except on E:Exception do begin
                Dm.LocalWriteTransaction.Rollback;
                Form.Free;
                Dm.Free;
                qFErrorDialog('Виникла помилка при додаванні наказу:"' + E.message + '"');
                exit;
            end;
        end;

        Dm.LocalWriteTransaction.Commit;
    end;

    Dm.ResultQuery.Close;
    Dm.ResultQuery.ParamByName('ID_ORDER').AsInteger := DM.IDOrder;
    Dm.ResultQuery.Open;

    Form.fmSearch.Prepare(DM.ResultQuery);
    Form.ShowModal;

    if DM.IdOrder <> -1 then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Order'] := DM.IdOrder;
        Output.Post;
    end;

    Form.Free;
    Dm.Free;
end;

end.

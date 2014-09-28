unit uHolidayOrder;

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
    uSimpleCheck, qFTools, uHolidayOrderForm;

type
    THolidayOrder = class(TSprav)
    private
        IsConnected : Boolean;
        Form : TfmHolidayOrder;
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
    Result := THolidayOrder.Create;
end;

constructor THolidayOrder.Create;
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

    Output.FieldDefs.Add('New_Id_Order', ftInteger);
end;

destructor THolidayOrder.Destroy;
begin
    inherited Destroy;
end;

procedure THolidayOrder.Show;
var
    hnd: Integer;
    Mode: TFormMode;
begin
    Form := TfmHolidayOrder.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    case Input['SpMode'] of
        1: Mode := fmAdd;
        2: Mode := fmModify;
        3: Mode := fmInfo;
    end;

    //Form.dmShtatUtils := TdmShtatUtils.Create(Form, Integer(Form.LocalDatabase.Handle), Input['Date_Order']);

    fmHolidayOrder := Form;

    Form.IdOrder.Value := Input['Id_Order'];
    Form.DateOrder.Value := Input['Date_Order'];

    if Mode = fmAdd then
        Form.IdManHoliday.Value := -1
    else begin
        Form.GetIdManHolidayQuery.Close;
        Form.GetIdManHolidayQuery.ParamByName('ID_ORDER').AsInteger := Input['Id_Order'];
        Form.GetIdManHolidayQuery.Open;

        Form.IdManHoliday.Value := Form.GetIdManHolidayQueryID_MAN_HOLIDAY.Value;
    end;

    Form.IdOrderType.Value := Input['Id_Order_Type'];
    Form.NumItem.Value  := Input['Num_Item'];
    Form.SubItem.Value := Input['Sub_Item'];
    Form.IdOrderGroup.Value := Input['Id_Order_Group'];
    Form.Intro.Value := Input['Intro'];

    Form.FormControl.Prepare(Form.LocalDatabase, Mode, Form.IdManHoliday.Value, 0);

    Form.ShowModal;

    if not VarIsNull(Form.IdOrder.Value) then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Order'] := Form.IdOrder.Value;
        Output.Post;
    end;

    Form.Free;
end;


end.

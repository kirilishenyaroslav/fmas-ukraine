unit UP_uCertificatePage;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TpcMovingsPage = class(TSprav)
    private

    public
        constructor Create;
        function GetFrame: TFrame; override;
       // procedure Show; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils,  UP_uCertificateFrame;

function CreateSprav: TSprav;
begin
    Result := TpcMovingsPage.Create;
end;

constructor TpcMovingsPage.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    Input.FieldDefs.Add('Modify', ftInteger);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('Select_Type',ftInteger);
    //Input.FieldDefs.Add('SpMode', ftInteger);

    // подготовить параметры
    PrepareMemoryDatasets;
end;

function TpcMovingsPage.GetFrame: TFrame;
begin
     Result := TfmCertificatePage.Create(Application.MainForm,
                                          TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                                          Input['Id_PCard'],
                                          0,
                                          Input['modify']);
end;
 {procedure TpcMovingsPage.show;
 var hdd:Integer;
 frm:TfmCertificatePage;
 begin
   frm:=TfmCertificatePage.Create(Application.MainForm,
                                  TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                                  Input['Id_PCard'],
                                  0,
                                  Input['modify']);
   if Input['SpMode'] = 1 then begin
       // frm.Showmodal;
        frm.Free;
    end;

    if Input['SpMode'] = 2 then begin
       // frm.FormStyle := fsMDIChild;
       // frm.WindowState := wsMaximized;
    end;
end;  }

end.

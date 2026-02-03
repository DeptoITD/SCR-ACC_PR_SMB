# \\192.168.1.150
# net use * /delete /yes

# === ACLs ===
# === Usuarios ===
# IND_A
# IND_B
# IND_E
# IND_G
# IND_H
# IND_YTP

------------------------------------------------------------------------------------------------------------------------------------------------------------------

# IND_A
# Rutas de los proyectos
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/1288_UDQ
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/1932_ESSA
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/2386_IGC
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/2572_CMM
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/3214_140
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/3772_CBA
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/4207_SPC
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/4374_CRA
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/4533_SAS


# Rutas 01_WIP
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/1288_UDQ/01_WIP
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/1932_ESSA/01_WIP
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/2386_IGC/01_WIP
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/2572_CMM/01_WIP
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/3214_140/01_WIP
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/3772_CBA/01_WIP
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/4207_SPC/01_WIP
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/4374_CRA/01_WIP
setfacl -m u:IND_A:rx /srv/samba/02_Proyectos/4533_SAS/01_WIP

# Especialidades 1288_UDQ
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/A_ARQ
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/A_ARQ
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/B_BIM
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/B_BIM
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/D_DET
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/D_DET
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/E_EST
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/E_EST
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/F_PCI
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/F_PCI
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/G_GEN
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/G_GEN
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/H_HID
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/H_HID
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/I_GAS
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/I_GAS
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/L_ELE
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/L_ELE
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/M_MEC
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/M_MEC
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/T_TEL
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/T_TEL
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YAC_ACU
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YAC_ACU
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YIL_ILU
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YSC_SyC
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YSC_SyC
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YTP_TOP

# Especialidades 1932_ESSA
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP/A_ARQ
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP/A_ARQ
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/B_BIM
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/B_BIM
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/E_EST
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/E_EST
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/F_PCI
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/F_PCI
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/H_HID
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/H_HID
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/L_ELE
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/L_ELE
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/M_MEC
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/M_MEC
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/YTP_TOP

# Especialidades 2386_IGC
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP/A_ARQ
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP/A_ARQ
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/B_BIM
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/B_BIM
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/D_DET
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/D_DET
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/E_EST
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/E_EST
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/F_PCI
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/F_PCI
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/H_HID
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/H_HID
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/I_GAS
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/I_GAS
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/L_ELE
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/L_ELE
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/M_MEC
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/M_MEC
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/T_TEL
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/T_TEL
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/YIL_ILU

# Especialidades 2572_CMM
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/A_ARQ
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/A_ARQ
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/B_BIM
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/B_BIM
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/E_EST
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/E_EST
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/O_LEV
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/O_LEV
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/YIL_ILU
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/YTP_TOP

# Especialidades 3214_140
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/3214_140/01_WIP/A_ARQ
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/3214_140/01_WIP/A_ARQ
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3214_140/01_WIP/B_BIM
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3214_140/01_WIP/B_BIM
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/3214_140/01_WIP/O_LEV
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/3214_140/01_WIP/O_LEV

# Especialidades 4207_SPC
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/4207_SPC/01_WIP/A_ARQ
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/4207_SPC/01_WIP/A_ARQ
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/B_BIM
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/B_BIM
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/E_EST
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/E_EST
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/F_PCI
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/F_PCI
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/G_GEN
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/G_GEN
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/H_HID
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/H_HID
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/I_GAS
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/I_GAS
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/L_ELE
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/L_ELE
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/M_MEC
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/M_MEC
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/T_TEL
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/T_TEL
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/YGE_GEO
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/YGE_GEO
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/YIL_ILU
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/SPC/01_WIP/YTP_TOP

# Especialidades 3772_CBA
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP/A_ARQ
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP/A_ARQ
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/B_BIM
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/B_BIM
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/E_EST
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/E_EST
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/F_RCI
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/F_RCI
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/G_GEN
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/G_GEN
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/H_HID
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/H_HID
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/I_GAS
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/I_GAS
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP/O_LEV
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP/O_LEV
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/R_REC
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/R_REC
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/T_TEL
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/T_TEL
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YAC_ACU
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YAC_ACU
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YBI_BIO
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YBI_BIO
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YIL_ILU


# Especialidades 4374_CRA
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/A_ARQ
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/A_ARQ
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/B_BIM
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/B_BIM
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/E_EST
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/E_EST
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/F_RCI
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/F_RCI
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/G_PMO
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/G_PMO
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/H_HID
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/H_HID
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/L_ELE
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/L_ELE
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/O_LEV
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/O_LEV
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/R_REC
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/R_REC
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/T_TEL
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/T_TEL
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/YGE_GEO
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/YGE_GEO
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/YIL_ILU
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/YTP_TOP

# Especialidades 4533_SAS
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/A_ARQ
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/A_ARQ
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/B_BIM
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/B_BIM
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/E_EST
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/E_EST
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/F_RCI
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/F_RCI
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/G_PMO
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/G_PMO
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/H_HID
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/H_HID
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/L_ELE
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/L_ELE
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/O_LEV
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/O_LEV
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/R_REC
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/R_REC
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/T_TEL
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/T_TEL
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YGE_GEO
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YGE_GEO
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YIL_ILU
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPA_PAT
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPA_PAT
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPM_PTR
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPM_PTR
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YSC_SyC
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YSC_SyC
setfacl -R -m u:IND_A:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_A:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YTP_TOP
setfacl -R -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YVU_VUL
setfacl -R -d -m u:IND_A:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YVU_VUL


------------------------------------------------------------------------------------------------------------------------------------------------------------------
# IND_B
# Rutas de los proyectos
setfacl -m u:IND_B:rx /srv/samba/02_Proyectos/1288_UDQ
setfacl -m u:IND_B:rx /srv/samba/02_Proyectos/1932_ESSA
setfacl -m u:IND_B:rx /srv/samba/02_Proyectos/2386_IGC
setfacl -m u:IND_B:rx /srv/samba/02_Proyectos/2572_CMM
setfacl -m u:IND_B:rx /srv/samba/02_Proyectos/3214_140
setfacl -m u:IND_B:rx /srv/samba/02_Proyectos/3772_CBA
setfacl -m u:IND_B:rx /srv/samba/02_Proyectos/4207_SPC
setfacl -m u:IND_B:rx /srv/samba/02_Proyectos/4374_CRA
setfacl -m u:IND_B:rx /srv/samba/02_Proyectos/4533_SAS

# Rutas 01_WIP
setfacl -R -m u:IND_B:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP
setfacl -R -d -m u:IND_B:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP

setfacl -R -m u:IND_B:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP
setfacl -R -d -m u:IND_B:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP

setfacl -R -m u:IND_B:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP
setfacl -R -d -m u:IND_B:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP

setfacl -R -m u:IND_B:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP
setfacl -R -d -m u:IND_B:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP

setfacl -R -m u:IND_B:rwx /srv/samba/02_Proyectos/3214_140/01_WIP
setfacl -R -d -m u:IND_B:rwx /srv/samba/02_Proyectos/3214_140/01_WIP

setfacl -R -m u:IND_B:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP
setfacl -R -d -m u:IND_B:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP

setfacl -R -m u:IND_B:rwx /srv/samba/02_Proyectos/4207_SPC/01_WIP
setfacl -R -d -m u:IND_B:rwx /srv/samba/02_Proyectos/4207_SPC/01_WIP

setfacl -R -m u:IND_B:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP
setfacl -R -d -m u:IND_B:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP


setfacl -R -m u:IND_B:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP
setfacl -R -d -m u:IND_B:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP


#No aplican permisos por especialidad por proyecto, el acceso es al proyecto completo.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# IND_E
# Rutas de los proyectos
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/1288_UDQ
setfacl -m u:IND_Erx /srv/samba/02_Proyectos/1932_ESSA
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/2386_IGC
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/2572_CMM
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/3214_140
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/3772_CBA
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/4207_SPC
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/4374_CRA
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/4533_SAS

# Rutas 01_WIP
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/1288_UDQ/01_WIP
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/1932_ESSA/01_WIP
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/2386_IGC/01_WIP
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/2572_CMM/01_WIP
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/3214_140/01_WIP
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/3772_CBA/01_WIP
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/4207_SPC/01_WIP
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/4374_CRA/01_WIP
setfacl -m u:IND_E:rx /srv/samba/02_Proyectos/4533_SAS/01_WIP

# Especialidades 1288_UDQ
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/A_ARQ
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/A_ARQ
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/B_BIM
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/B_BIM
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/D_DET
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/D_DET
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/E_EST
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/E_EST
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/F_PCI
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/F_PCI
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/G_GEN
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/G_GEN
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/H_HID
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/H_HID
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/I_GAS
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/I_GAS
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/L_ELE
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/L_ELE
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/M_MEC
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/M_MEC
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/T_TEL
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/T_TEL
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YAC_ACU
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YAC_ACU
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YIL_ILU
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YSC_SyC
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YSC_SyC
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YTP_TOP

# Especialidades 1932_ESSA
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/A_ARQ
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/A_ARQ
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/B_BIM
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/B_BIM
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP/E_EST
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP/E_EST
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/F_PCI
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/F_PCI
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/H_HID
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/H_HID
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/L_ELE
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/L_ELE
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/M_MEC
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/M_MEC
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/YTP_TOP

# Especialidades 2386_IGC
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP/A_ARQ
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP/A_ARQ
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/B_BIM
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/B_BIM
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/D_DET
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/D_DET
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP/E_EST
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP/E_EST
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/F_PCI
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/F_PCI
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/H_HID
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/H_HID
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/I_GAS
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/I_GAS
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/L_ELE
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/L_ELE
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/M_MEC
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/M_MEC
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/T_TEL
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/T_TEL
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/YIL_ILU

# Especialidades 2572_CMM
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/A_ARQ
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/A_ARQ
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/B_BIM
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/B_BIM
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/E_EST
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/E_EST
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/O_LEV
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/O_LEV
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/YIL_ILU
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/YTP_TOP

# Especialidades 3214_140
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3214_140/01_WIP/A_ARQ
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3214_140/01_WIP/A_ARQ
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3214_140/01_WIP/B_BIM
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3214_140/01_WIP/B_BIM
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/3214_140/01_WIP/O_LEV
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/3214_140/01_WIP/O_LEV

# Especialidades 4207_SPC
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/A_ARQ
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/A_ARQ
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/B_BIM
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/B_BIM
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/4207_SPC/01_WIP/E_EST
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/4207_SPC/01_WIP/E_EST
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/F_RCI
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/F_RCI
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/G_GEN
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/G_GEN
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/H_HID
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/H_HID
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/I_GAS
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/I_GAS
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/L_ELE
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/L_ELE
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/R_REC
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/R_REC
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/T_TEL
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/T_TEL
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/YAC_ACU
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/YAC_ACU
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/YBI_BIO
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/YBI_BIO
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/YGE_GEO
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/YGE_GEO
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/YIL_ILU
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4207_SPC/01_WIP/YTP_TOP

# Especialidades 3772_CBA
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/A_ARQ
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/A_ARQ
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/B_BIM
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/B_BIM
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP/E_EST
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP/E_EST
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/F_RCI
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/F_RCI
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/G_GEN
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/G_GEN
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/H_HID
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/H_HID
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/I_GAS
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/I_GAS
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/L_ELE
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/L_ELE
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/R_REC
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/R_REC
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/T_TEL
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/T_TEL
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YAC_ACU
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YAC_ACU
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YBI_BIO
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YBI_BIO
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YIL_ILU

# Especialidades 4374_CRA
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/A_ARQ
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/A_ARQ
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/B_BIM
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/B_BIM
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/E_EST
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/E_EST
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/F_RCI
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/F_RCI
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/G_PMO
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/G_PMO
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/H_HID
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/H_HID
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/L_ELE
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/L_ELE
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/O_LEV
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/O_LEV
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/R_REC
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/R_REC
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/T_TEL
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/T_TEL
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/YGE_GEO
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/YGE_GEO
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/YIL_ILU
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/YTP_TOP

# Especialidades 4533_SAS
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/A_ARQ
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/A_ARQ
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/B_BIM
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/B_BIM
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/E_EST
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/E_EST
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/F_RCI
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/F_RCI
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/G_PMO
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/G_PMO
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/H_HID
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/H_HID
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/L_ELE
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/L_ELE
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/O_LEV
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/O_LEV
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/R_REC
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/R_REC
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/T_TEL
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/T_TEL
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YGE_GEO
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YGE_GEO
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YIL_ILU
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPA_PAT
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPA_PAT
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPM_PTR
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPM_PTR
setfacl -R -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YSC_SyC
setfacl -R -d -m u:IND_E:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YSC_SyC
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YTP_TOP
setfacl -R -m u:IND_E:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YVU_VUL
setfacl -R -d -m u:IND_E:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YVU_VUL

------------------------------------------------------------------------------------------------------------------------------------------------------------------
# IND_YTP
# Rutas de los proyectos
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/1288_UDQ
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/1932_ESSA
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/2386_IGC
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/2572_CMM
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/3214_140
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/3772_CBA
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/4207_SPC
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/4374_CRA
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/4533_SAS

# Rutas 01_WIP
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/1288_UDQ/01_WIP
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/1932_ESSA/01_WIP
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/2386_IGC/01_WIP
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/2572_CMM/01_WIP
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/3214_140/01_WIP
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/3772_CBA/01_WIP
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/4207_SPC/01_WIP
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/4374_CRA/01_WIP
setfacl -m u:IND_YTP:rx /srv/samba/02_Proyectos/4533_SAS/01_WIP

# Especialidades 1288_UDQ
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/A_ARQ
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/A_ARQ
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/B_BIM
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/B_BIM
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/D_DET
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/D_DET
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/E_EST
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/E_EST
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/F_PCI
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/F_PCI
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/G_GEN
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/G_GEN
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/H_HID
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/H_HID
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/I_GAS
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/I_GAS
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/L_ELE
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/L_ELE
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/M_MEC
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/M_MEC
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/T_TEL
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/T_TEL
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YAC_ACU
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YAC_ACU
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YIL_ILU
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YSC_SyC
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YSC_SyC
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1288_UDQ/01_WIP/YTP_TOP

# Especialidades 1932_ESSA
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP/A_ARQ
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP/A_ARQ
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/B_BIM
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/B_BIM
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP/E_EST
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP/E_EST
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/F_PCI
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/F_PCI
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/H_HID
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/H_HID
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/L_ELE
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/L_ELE
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/M_MEC
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/1932_ESSA/01_WIP/M_MEC
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/1932_ESSA/01_WIP/YTP_TOP

# Especialidades 2386_IGC
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP/A_ARQ
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP/A_ARQ
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/B_BIM
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/B_BIM
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/D_DET
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/D_DET
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP/E_EST
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2386_IGC/01_WIP/E_EST
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/F_PCI
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/F_PCI
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/H_HID
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/H_HID
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/I_GAS
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/I_GAS
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/L_ELE
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/L_ELE
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/M_MEC
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/M_MEC
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/T_TEL
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/T_TEL
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2386_IGC/01_WIP/YIL_ILU

# Especialidades 2572_CMM
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/A_ARQ
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/A_ARQ
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/B_BIM
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/B_BIM
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/E_EST
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/E_EST
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/O_LEV
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/O_LEV
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/2572_CMM/01_WIP/YIL_ILU
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/2572_CMM/01_WIP/YTP_TOP

# Especialidades 3214_140
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/3214_140/01_WIP/A_ARQ
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/3214_140/01_WIP/A_ARQ
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3214_140/01_WIP/B_BIM
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3214_140/01_WIP/B_BIM
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/3214_140/01_WIP/O_LEV
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/3214_140/01_WIP/O_LEV

# Especialidades SPC
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/A_ARQ
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/A_ARQ
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/B_BIM
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/B_BIM
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/E_EST
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/E_EST
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/F_PCI
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/F_PCI
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/G_GEN
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/G_GEN
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/H_HID
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/H_HID
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/I_GAS
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/I_GAS
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/L_ELE
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/L_ELE
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/M_MEC
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/M_MEC
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/T_TEL
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/T_TEL
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/SPC/01_WIP/YGE_GEO
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/SPC/01_WIP/YGE_GEO
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/SPC/01_WIP/YIL_ILU
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/SPC/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/SPC/01_WIP/YTP_TOP

# Especialidades 3772_CBA
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP/A_ARQ
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP/A_ARQ
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/B_BIM
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/B_BIM
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP/E_EST
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/3772_CBA/01_WIP/E_EST
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/F_RCI
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/F_RCI
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/G_GEN
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/G_GEN
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/H_HID
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/H_HID
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/I_GAS
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/I_GAS
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/L_ELE
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/L_ELE
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/R_REC
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/R_REC
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/T_TEL
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/T_TEL
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YAC_ACU
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YAC_ACU
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YBI_BIO
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YBI_BIO
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/3772_CBA/01_WIP/YIL_ILU



# Especialidades 4374_CRA
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/A_ARQ
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/A_ARQ
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/B_BIM
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/B_BIM
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/E_EST
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/E_EST
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/F_RCI
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/F_RCI
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/G_PMO
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/G_PMO
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/H_HID
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/H_HID
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/L_ELE
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/L_ELE
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/O_LEV
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/O_LEV
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/R_REC
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/R_REC
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/T_TEL
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/T_TEL
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4374_CRA/01_WIP/YIL_ILU
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/YGE_GEO
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/YGE_GEO
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4374_CRA/01_WIP/YTP_TOP

# Especialidades 4533_SAS
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/A_ARQ
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/A_ARQ
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/B_BIM
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/B_BIM
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/E_EST
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/E_EST
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/F_RCI
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/F_RCI
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/G_PMO
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/G_PMO
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/H_HID
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/H_HID
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/L_ELE
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/L_ELE
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/O_LEV
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/O_LEV
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/R_REC
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/R_REC
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/T_TEL
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/T_TEL
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YGE_GEO
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YGE_GEO
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YIL_ILU
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YIL_ILU
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPA_PAT
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPA_PAT
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPM_PTR
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YPM_PTR
setfacl -R -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YSC_SyC
setfacl -R -d -m u:IND_YTP:r-x /srv/samba/02_Proyectos/4533_SAS/01_WIP/YSC_SyC
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YTP_TOP
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YTP_TOP
setfacl -R -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YVU_VUL
setfacl -R -d -m u:IND_YTP:rwx /srv/samba/02_Proyectos/4533_SAS/01_WIP/YVU_VUL
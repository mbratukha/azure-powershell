﻿# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.SYNOPSIS
Tests checking API to list available delegations.
#>
function Test-GetAvailableDelegationsList
{
    $location = Get-ProviderLocation ResourceManagement
    # TODO: replace with Normalize-Location after PR is merged: https://github.com/Azure/azure-powershell-common/pull/90
    $location = $location.ToLower() -replace '[^a-z0-9]'
    try
    {
        $results = Get-AzAvailableServiceDelegation -Location $location;
        Assert-NotNull $results;
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

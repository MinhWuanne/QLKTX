const apiUrl = 'http://localhost/API_MVC/api.php';

async function getAllUsers() {
    try {
        const response = await fetch(apiUrl);
        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`HTTP error! Status: ${response.status}, Response: ${errorText}`);
        }
        const users = await response.json();
        document.getElementById('all-users').innerText = JSON.stringify(users, null, 2);
    } catch (error) {
        console.error('Error fetching users:', error);
    }
}

async function getUserById() {
    const userId = document.getElementById('get-user-id').value;
    if (!userId) {
        alert('Please enter a User ID');
        return;
    }
    try {
        const response = await fetch(`${apiUrl}/${userId}`);
        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`HTTP error! Status: ${response.status}, Response: ${errorText}`);
        }
        const user = await response.json();
        document.getElementById('user-details').innerText = JSON.stringify(user, null, 2);
    } catch (error) {
        console.error('Error fetching user:', error);
    }
}

async function createUser() {
    const userForm = {
        image_path: document.getElementById('create-user-image-path').value,
        MSV: document.getElementById('create-user-msv').value,
        name: document.getElementById('create-user-name').value,
        birthday: document.getElementById('create-user-birthday').value,
        sex: document.getElementById('create-user-sex').value,
        phoneNumber: document.getElementById('create-user-phone-number').value,
        class: document.getElementById('create-user-class').value
    };

    if (Object.values(userForm).some(v => !v)) {
        alert('Please enter all required fields');
        return;
    }

    try {
        const response = await fetch(apiUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(userForm)
        });
        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`HTTP error! Status: ${response.status}, Response: ${errorText}`);
        }
        const result = await response.json();
        alert(`Student added successfully`);
    } catch (error) {
        console.error('Error creating student:', error);
    }
}

async function updateUser() {
    const userForm = {
        id: document.getElementById('update-user-id').value,
        image_path: document.getElementById('update-user-image-path').value,
        MSV: document.getElementById('update-user-msv').value,
        name: document.getElementById('update-user-name').value,
        birthday: document.getElementById('update-user-birthday').value,
        sex: document.getElementById('update-user-sex').value,
        phoneNumber: document.getElementById('update-user-phone-number').value,
        class: document.getElementById('update-user-class').value
    };

    if (Object.values(userForm).some(v => !v)) {
        alert('Please enter all required fields');
        return;
    }

    try {
        const response = await fetch(`${apiUrl}/${userForm.id}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(userForm)
        });
        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`HTTP error! Status: ${response.status}, Response: ${errorText}`);
        }
        const result = await response.json();
        alert(`Student updated successfully`);
    } catch (error) {
        console.error('Error updating student:', error);
    }
}

async function deleteUser() {
    const userId = document.getElementById('delete-user-id').value;
    if (!userId) {
        alert('Please enter a User ID');
        return;
    }
    try {
        const response = await fetch(`${apiUrl}/${userId}`, {
            method: 'DELETE'
        });
        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`HTTP error! Status: ${response.status}, Response: ${errorText}`);
        }
        const result = await response.json();
        alert(`Student deleted successfully`);
    } catch (error) {
        console.error('Error deleting student:', error);
    }
}
